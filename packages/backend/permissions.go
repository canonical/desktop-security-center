package main
import (
    pb "github.com/canonical/desktop-security-center/packages/proto"
    epb "google.golang.org/protobuf/types/known/emptypb"
    wpb "google.golang.org/protobuf/types/known/wrapperspb"
    "context"
    "github.com/tidwall/gjson"
    "net"
    "io"
    "bytes"
    "log"
    "fmt"
    "net/http"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

const (
  rulesApi = "http://localhost/v2/interfaces/requests/rules"
  confApi = "http://localhost/v2/snaps/system/conf"
  removeBody = `{"action":"remove"}`
  sep = ":"
)
var empty = new(epb.Empty)
var snapPathId = map[string]string{}
var authHeader = map[string]string{"X-Allow-Interaction": "true"}

type PermissionServer struct {
    pb.UnimplementedPermissionServer
    client *http.Client
}

func NewPermissionServer() (*PermissionServer, error) {
    /* Copy paste from https://stackoverflow.com/a/59665098 */
    c := &http.Client{
        Transport: &http.Transport{
            DialContext: func(ctx context.Context, network, addr string) (net.Conn, error) {
                return (&net.Dialer{}).DialContext(ctx, "unix", "/run/snapd.socket")
            },
        },
    }
    s := &PermissionServer{
        client: c,
    }
    return s, nil
}

func makeRestReq(client *http.Client, kind string, headers map[string]string, where string, reqBody io.Reader) (string, error) {
    req, err := http.NewRequest(kind, where, reqBody)
    if err != nil {
        log.Printf("Couldn't create %s request to %s.", kind, where)
        return "", err
    }
    for k, val := range headers {
        req.Header.Add(k, val)
    }
    res, err := client.Do(req)
    if err != nil {
        log.Printf("Couldn't send %s request to %s.", kind, where)
        return "", err
    }
    defer res.Body.Close()
    /* Do we need this? The JSON should have the status code
    if res.StatusCode != http.StatusOK {
        return "", fmt.Errorf("Rest request to %s gave code %d.", where, res.StatusCode)
    }
    */
    resBody, err := io.ReadAll(res.Body)
    if err != nil {
        log.Printf("Couldn't read response from %s request to %s.", kind, where)
        return "", err
    }
    return string(resBody), nil
}

/* The front-end wants paths mapped to the snaps that have permission to write
 * to them. It may ask "us", the back-end, to revoke such snap-path permission,
 * but to do that we need to give the permission ID to the Snapd API.
 * As such, we keep a map({snap}:{path})->id for ourselves and hand a
 * map(path)->snaps to the front-end.
 */
func getSnapPathIdMaps(client *http.Client) (map[string][]string, error) {
    o, err := makeRestReq(client, "GET", nil, rulesApi, nil)
    if err != nil {
        return nil, err
    }
    if !gjson.Valid(o) {
        log.Printf("Invalid Json: >%s<", o)
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    pathSnaps := make(map[string][]string)
    snapAr := gjson.Get(o, "result.#(interface=\"home\")#.snap").Array()
    pathAr := gjson.Get(o, "result.#(interface=\"home\")#.path-pattern").Array()
    idAr := gjson.Get(o, "result.#(interface=\"home\")#.id").Array()
    for idx, path := range pathAr {
        snap := snapAr[idx].String()
        path := path.String()
        id := idAr[idx].String()
        pathSnaps[path] = append(pathSnaps[path], snap)
        snapPathId[snap + sep + path] = id
    }
    return pathSnaps, nil
}

func enableAppPermissions(client *http.Client, enable bool) error {
    var body string
    if enable {
        body = fmt.Sprintf(`{"experimental.apparmor-prompting":%s}`, "true")
    } else {
        body = fmt.Sprintf(`{"experimental.apparmor-prompting":%s}`, "false")
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
    if !gjson.Valid(o) {
        log.Printf("Invalid Json: >%s<", o)
        return status.Errorf(codes.Internal, "Invalid Json")
    }
    return nil
}

/* This returns 'snap get system experimental.apparmor-prompting' */
func (s *PermissionServer) IsAppPermissionsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", authHeader, confApi, nil)
    if err != nil {
        return nil, err
    }
    if !gjson.Valid(o) {
        log.Printf("Invalid Json: >%s<", o)
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    enabled := gjson.Get(o, "result.experimental.apparmor-prompting").Bool()
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
    if !gjson.Valid(o) {
        log.Printf("Invalid Json: >%s<", o)
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    return wpb.Bool(gjson.Get(o, "result.#").Uint() > 0), nil
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
    _, err := makeRestReq(
        s.client,
        "POST",
        authHeader,
        rulesApi + "/" + id,
        bytes.NewReader([]byte(removeBody)),
    )
    return empty, err
}

/* List all permissions to personal directories */
func (s *PermissionServer) ListPersonalFoldersPermissions(ctx context.Context, _ *epb.Empty) (*pb.ListOfPersionalFolderRules, error) {
    pathSnaps, _ := getSnapPathIdMaps(s.client)

    /* This is just juggling Protobuf, nothing substantially interesting */
    pathSnapsGrpc := make(map[string]*pb.Array)
    for i, p := range pathSnaps {
        pathSnapsGrpc[i] = &pb.Array{E: p}
    }

    return &pb.ListOfPersionalFolderRules{Pathsnaps: pathSnapsGrpc}, nil
}
