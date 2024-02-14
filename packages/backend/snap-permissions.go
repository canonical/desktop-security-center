package main
import (
    pb "github.com/canonical/desktop-security-center/packages/proto"
    epb "google.golang.org/protobuf/types/known/emptypb"
    wpb "google.golang.org/protobuf/types/known/wrapperspb"
    "context"
    //"github.com/tidwall/gjson"
    "os/exec"
    "net"
    "net/http"
    "net/http/httputil"
)

type PermissionServer struct {
    pb.UnimplementedPermissionServer
    client *http.Client
}

/* Copy paste from https://stackoverflow.com/a/59665098 */
func makeRestReq(client *http.Client, where string) ([]byte, error) {
    req, _ := http.NewRequest("GET", where, nil)

    res, err := client.Do(req)
    if err != nil {
        return nil, err
    }

    b, err := httputil.DumpResponse(res, true)
    if err != nil {
        return nil, err
    }
    return b, nil
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
    /* Just a draft. An API in snapd will be created to get this so we don't
     * need to exec. */
    cmd := exec.Command("snap", "get", "system", "experimental.apparmor-prompting")
    out, err := cmd.Output()
    if err != nil {
        return nil, err
    }
    ret := string(out) == "true"
    return wpb.Bool(ret), nil
}

func (s *PermissionServer) EnableAppPermissions(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    /* Just a draft. An API in snapd will be created to get this so we don't
     * need to exec. */
    cmd := exec.Command("snap", "set", "system", "experimental.apparmor-prompting=true")
    _, err := cmd.Output()
    if err != nil {
        return nil, err
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
    _, err := makeRestReq(s.client, "http://localhost/v2/interfaces/prompting/rules")
    if err != nil {
        return nil, err
    }
    return wpb.Bool(true), nil
}

func (s *PermissionServer) ListPersonalFoldersPermissions(ctx context.Context, _ *epb.Empty) (*pb.ListOfPersionalFolderRules, error) {
    r, err := makeRestReq(s.client, "http://localhost/v2/interfaces/prompting/rules")
    if err != nil {
        return nil, err
    }
    return &pb.ListOfPersionalFolderRules{Foo: string(r)}, nil
}
