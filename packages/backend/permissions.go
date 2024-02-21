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


func (s *PermissionServer) IsAppPermissionsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", nil, "http://localhost/v2/snaps/system/conf", nil)
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
        "http://localhost/v2/snaps/system/conf",
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

func (s *PermissionServer) EnableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableAppPermissions(s.client, true)
    return new(epb.Empty), err
}

func (s *PermissionServer) DisableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableAppPermissions(s.client, false)
    return new(epb.Empty), err
}

func (s *PermissionServer) AreCustomRulesApplied(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    o, err := makeRestReq(s.client, "GET", nil, "http://localhost/v2/interfaces/prompting/rules", nil)
    if err != nil {
        return nil, err
    }
    //if !gjson.Valid(o) {
    //    log.Println(o)
    //    return nil, status.Errorf(codes.Internal, "Invalid Json")
    //}
    return wpb.Bool(gjson.Get(o, "result.#.id").Exists()), nil
}

func (s *PermissionServer) ListPersonalFoldersPermissions(ctx context.Context, _ *epb.Empty) (*pb.ListOfPersionalFolderRules, error) {
    r, err := makeRestReq(s.client, "GET", nil, "http://localhost/v2/interfaces/prompting/rules", nil)
    if err != nil {
        return nil, err
    }
    return &pb.ListOfPersionalFolderRules{Foo: string(r)}, nil
}
