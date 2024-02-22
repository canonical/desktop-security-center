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
    "net/http/httputil"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

const (
  rulesApi = "http://localhost/v2/interfaces/requests/rules"
  confApi = "http://localhost/v2/snaps/system/conf"
  removeBody = `{"action":"remove"}`
  sep = ":"
)
var  snapPathId = map[string]string{}

type PermissionServer struct {
    pb.UnimplementedPermissionServer
    client *http.Client
}

func makeRestReq(client *http.Client, kind string, headers map[string]string, where string, body io.Reader) (string, error) {
    req, _ := http.NewRequest(kind, where, body)
    for k, val := range headers {
        req.Header.Add(k, val)
    }

    res, err := client.Do(req)
    if err != nil {
        return "", err
    }

    b, err := httputil.DumpResponse(res, true)
    if err != nil {
        return "", err
    }
    return string(b), nil
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

/* This returns 'snap get system experimental.apparmor-prompting' */
func (s *PermissionServer) IsAppPermissionsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", nil, confApi, nil)
    if err != nil {
        return nil, err
    }
    if !gjson.Valid(o) {
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    enabled := gjson.Get(o, "result.experimental.apparmor-prompting").Bool()
    return wpb.Bool(enabled), nil
}

func enableAppPermissions(client *http.Client, enable bool) error {
    var body string
    if enable {
        body = fmt.Sprintf(`{"experimental.apparmor-prompting":%s}`, "true")
    } else {
        body = fmt.Sprintf(`{"experimental.apparmor-prompting":%s}`, "false")
    }
    log.Println(body)
    o, err := makeRestReq(
        client,
        "PUT",
        nil,
        confApi,
        bytes.NewReader([]byte(body)),
    )
    if err != nil {
        return err
    }
    if !gjson.Valid(o) {
        log.Println(o)
        return status.Errorf(codes.Internal, "Invalid Json")
    }
    return nil
}

/* This does the equivalent of
 * snap set system experimental.apparmor-prompting=true
 */
func (s *PermissionServer) EnableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableAppPermissions(s.client, true)
    return new(epb.Empty), err
}

/* This does the equivalent of
 * snap set system experimental.apparmor-prompting=false
 */
func (s *PermissionServer) DisableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableAppPermissions(s.client, false)
    return new(epb.Empty), err
}

/* Determine if there is at least one Apparmor rule applied __for the user who
 * owns the backend process__
 */
func (s *PermissionServer) AreCustomRulesApplied(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", nil, rulesApi, nil)
    if err != nil {
        return nil, err
    }
    /* This is actually triggered when not found, why on earth though? Example:
     * {"type":"error","status-code":404,"status":"Not Found","result":{"message":"not found"}}
     * Looks like a valid Json, or?
    if !gjson.Valid(o) {
        log.Println(o)
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    */
    return wpb.Bool(gjson.Get(o, "result.#").Uint() > 0), nil
}

/* Remove access to the path for a given application */
func (s *PermissionServer) RemoveAppPermission(ctx context.Context, req *pb.RemoveAppPermissionRequest) (*epb.Empty, error) {
    snap := req.GetRemovesnap()
    path := req.GetRemovepath()
    if len(snapPathId) == 0 {getSnapPathIdMaps(s.client)}
    id := snapPathId[snap + sep + path] // TODO ccalculate this based on snap and path
    print(snap , path) // DELETEME
    o, err := makeRestReq(
        s.client,
        "POST",
        map[string]string{"X-Allow-Interaction": "true"},
        rulesApi + "/" + id,
        bytes.NewReader([]byte(removeBody)),
    )
    log.Println(o)
    log.Println(err)
    return nil, err
}

func getSnapPathIdMaps(client *http.Client) (map[string][]string, error) {
    o, err := makeRestReq(client, "GET", nil, rulesApi, nil)
    if err != nil {
        return nil, err
    }
    //if !gjson.Valid(o) {
    	log.Println(o)
      //  return nil, status.Errorf(codes.Internal, "Invalid Json")
    //}
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

/* List all permissions to personal directories */
func (s *PermissionServer) ListPersonalFoldersPermissions(ctx context.Context, _ *epb.Empty) (*pb.ListOfPersionalFolderRules, error) {
    pathSnaps, _ := getSnapPathIdMaps(s.client)
    log.Println(pathSnaps)

    /* This is just juggling Protobuf, nothing substantially interesting */
    pathSnapsGrpc := make(map[string]*pb.Array)
    for i, p := range pathSnaps {
        pathSnapsGrpc[i] = &pb.Array{E: p}
    }

    return &pb.ListOfPersionalFolderRules{Pathsnaps: pathSnapsGrpc}, nil
}
