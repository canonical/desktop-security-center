package main
import (
    pb "github.com/canonical/desktop-security-center/packages/proto"
    epb "google.golang.org/protobuf/types/known/emptypb"
    wpb "google.golang.org/protobuf/types/known/wrapperspb"
    "context"
    "github.com/tidwall/gjson"
    "os/exec"
    "net"
    "net/http"
    "net/http/httputil"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

type PermissionServer struct {
    pb.UnimplementedPermissionServer
    client *http.Client
}

func makeRestReq(client *http.Client, kind string, headers map[string]string, where string) (string, error) {
    if where == "http://localhost/v2/snaps/system/conf" {
        return `{"type":"sync","status-code":200,"status":"OK","result":{"experimental":{"apparmor-prompting":false},"refresh":{},"seed":{"loaded":true},"system":{"hostname":"prompting-hell","network":{},"timezone":"UTC"}}}`, nil
    }
    req, _ := http.NewRequest(kind, where, nil)
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
    o, err := makeRestReq(s.client, "GET", nil, "http://localhost/v2/snaps/system/conf")
    if err != nil {
        return nil, err
    }
    if !gjson.Valid(o) {
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    enabled := gjson.Get(o, "result.experimental.apparmor-prompting").Bool()
    return wpb.Bool(enabled), nil
}

func (s *PermissionServer) EnableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    /* Just a draft. An API in snapd will be created to get this so we don't
     * need to exec. */
    o, err := makeRestReq(
        s.client,
        "PUT",
        map[string]string{"experimental.apparmor-prompting": "false"},
        "http://localhost/v2/snaps/system/conf",
    )
    //cmd := exec.Command("snap", "set", "system", "experimental.apparmor-prompting=true")
    //_, err := cmd.Output()
    if err != nil {
        return nil, err
    }
    if !gjson.Valid(o) {
        return nil, status.Errorf(codes.Internal, "Invalid Json")
    }
    return new(epb.Empty), nil
}

func (s *PermissionServer) DisableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    /* Just a draft. An API in snapd will be created to get this so we don't
     * need to exec. */
    cmd := exec.Command("snap", "set", "system", "experimental.apparmor-prompting=false")
    _, err := cmd.Output()
    if err != nil {
        return nil, err
    }
    return new(epb.Empty), nil
}

func (s *PermissionServer) AreCustomRulesApplied(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    _, err := makeRestReq(s.client, "GET", nil, "http://localhost/v2/interfaces/prompting/rules")
    if err != nil {
        return nil, err
    }
    return wpb.Bool(true), nil
}

func (s *PermissionServer) ListPersonalFoldersPermissions(ctx context.Context, _ *epb.Empty) (*pb.ListOfPersionalFolderRules, error) {
    r, err := makeRestReq(s.client, "GET", nil, "http://localhost/v2/interfaces/prompting/rules")
    if err != nil {
        return nil, err
    }
    return &pb.ListOfPersionalFolderRules{Foo: string(r)}, nil
}
