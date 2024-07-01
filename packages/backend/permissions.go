package main
import (
    pb "github.com/canonical/desktop-security-center/packages/proto"
    epb "google.golang.org/protobuf/types/known/emptypb"
    wpb "google.golang.org/protobuf/types/known/wrapperspb"
    "context"
    "io"
    "bytes"
    "log"
    "net/http"
    "fmt"
    "encoding/json"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

const (
  rulesApi = "http://localhost/v2/interfaces/requests/rules"
  confApi = "http://localhost/v2/snaps/system/conf"
  removeBody = `{"action":"remove"}`
  promptBody = `{"experimental.apparmor-prompting":%s}`
  sep = ":"
)
var empty = new(epb.Empty)
var snapPathId = map[string]string{}
var authHeader = map[string]string{"X-Allow-Interaction": "true"}

type HttpClient interface {
    Do(req *http.Request) (*http.Response, error)
}

type PermissionServer struct {
    pb.UnimplementedPermissionServer
    client HttpClient
}

func NewPermissionServer(c HttpClient) (*PermissionServer) {
    /* Copy paste from https://stackoverflow.com/a/59665098 */
    s := &PermissionServer{
        client: c,
    }
    return s
}

func makeRestReq(client HttpClient, kind string, headers map[string]string, where string, reqBody io.Reader) ([]byte, error) {
    var resBody []byte
    req, err := http.NewRequest(kind, where, reqBody)
    if err != nil {
        log.Printf("Couldn't create %s request to %s.", kind, where)
        return resBody, err
    }
    for k, val := range headers {
        req.Header.Add(k, val)
    }
    res, err := client.Do(req)
    if err != nil {
        log.Printf("Couldn't send %s request to %s.", kind, where)
        return resBody, err
    }
    defer res.Body.Close()
    resBody, err = io.ReadAll(res.Body)
    if err != nil {
        log.Printf("Couldn't read response from %s request to %s.", kind, where)
        return resBody, err
    }
    return resBody, nil
}

func badStatusCode(sc int) error {
    if sc < 200 || sc >= 300 {
        return status.Errorf(codes.Unknown, "API response gave code %d.", sc)
    }
    return nil
}

/* The front-end wants paths mapped to the snaps that have permission to write
 * to them. It may ask "us", the back-end, to revoke such snap-path permission,
 * but to do that we need to give the permission ID to the Snapd API.
 * As such, we keep a map({snap}:{path})->id for ourselves and hand a
 * map(path)->snaps to the front-end.
 */
func getSnapPathIdMaps(client HttpClient) (map[string][]string, error) {
    o, err := makeRestReq(client, "GET", nil, rulesApi, nil)
    if err != nil {
        return nil, err
    }
    var res snapdAPIResponse
    if err = json.Unmarshal(o, &res); err != nil {
        return nil, err
    }
    if err = badStatusCode(res.StatusCode); err != nil {
        return nil, err
    }
    pathSnaps := make(map[string][]string)
    for _, v := range(res.Result) {
        if v.Interface == "home" {
            path := v.Constraints.PathPattern
            pathSnaps[path] = append(pathSnaps[path], v.Snap)
            snapPathId[v.Snap + sep + path] = v.Id
        }
    }
    return pathSnaps, nil
}

func enableAppPermissions(client HttpClient, enable bool) error {
    var body string
    if enable {
        body = fmt.Sprintf(promptBody, "true")
    } else {
        body = fmt.Sprintf(promptBody, "false")
    }
    o, err := makeRestReq(
        client,
        "PUT",
        authHeader,
        confApi,
        bytes.NewReader([]byte(body)),
    )
    if err != nil {
        return err
    }
    var res confAPIResponse
    if err = json.Unmarshal(o, &res); err != nil {
        return err
    }
    if err = badStatusCode(res.StatusCode); err != nil {
        return err
    }
    return nil
}

/* This returns 'snap get system experimental.apparmor-prompting' */
func (s *PermissionServer) IsAppPermissionsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", authHeader, confApi, nil)
    if err != nil {
        return nil, err
    }
    var res confAPIResponse
    if err = json.Unmarshal(o, &res); err != nil {
        return nil, err
    }
    if err = badStatusCode(res.StatusCode); err != nil {
        return nil, err
    }
    enabled := res.Result.Experimental.ApparmorPrompting
    return wpb.Bool(enabled), nil
}

/* This does the equivalent of
 * snap set system experimental.apparmor-prompting=true
 */
func (s *PermissionServer) EnableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableAppPermissions(s.client, true)
    return empty, err
}

/* This does the equivalent of
 * snap set system experimental.apparmor-prompting=false
 */
func (s *PermissionServer) DisableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableAppPermissions(s.client, false)
    return empty, err
}

/* Determine if there is at least one Apparmor rule applied __for the user who
 * owns the backend process__
 */
func (s *PermissionServer) AreCustomRulesApplied(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", nil, rulesApi, nil)
    if err != nil {
        return nil, err
    }
    var res snapdAPIResponse
    if err = json.Unmarshal(o, &res); err != nil {
        return nil, err
    }
    if err = badStatusCode(res.StatusCode); err != nil {
        return nil, err
    }
    fmt.Println(res.Result)
    return wpb.Bool(len(res.Result) > 0), nil
}

/* Remove access to the path for a given application */
func (s *PermissionServer) RemoveAppPermission(ctx context.Context, req *pb.RemoveAppPermissionRequest) (*epb.Empty, error) {
    snap := req.GetRemovesnap()
    path := req.GetRemovepath()
    /* Use the cached map if it was already populated */
    if len(snapPathId) == 0 {
        _, err := getSnapPathIdMaps(s.client)
        if err != nil {
            return empty, err
        }
    }
    id := snapPathId[snap + sep + path]
    o, err := makeRestReq(
        s.client,
        "POST",
        authHeader,
        rulesApi + "/" + id,
        bytes.NewReader([]byte(removeBody)),
    )
    if err != nil {
        return empty, err
    }
    var res snapdAPIResponse
    if err = json.Unmarshal(o, &res); err != nil {
        return nil, err
    }
    if err = badStatusCode(res.StatusCode); err != nil {
        return nil, err
    }
    return empty, nil
}

/* List all permissions to personal directories */
func (s *PermissionServer) ListPersonalFoldersPermissions(ctx context.Context, _ *epb.Empty) (*pb.ListOfPersionalFolderRules, error) {
    pathSnaps, err := getSnapPathIdMaps(s.client)

    /* This is just juggling Protobuf, nothing substantially interesting */
    pathSnapsGrpc := make(map[string]*pb.Array)
    for i, p := range pathSnaps {
        pathSnapsGrpc[i] = &pb.Array{E: p}
    }

    return &pb.ListOfPersionalFolderRules{Pathsnaps: pathSnapsGrpc}, err
}
