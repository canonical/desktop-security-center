package main
import (
    "os/exec"
    "context"
    "errors"
    pb "github.com/canonical/desktop-security-center/packages/proto"
    epb "google.golang.org/protobuf/types/known/emptypb"
    wpb "google.golang.org/protobuf/types/known/wrapperspb"
    "github.com/tidwall/gjson"
    "github.com/godbus/dbus/v5"
)

var conn *dbus.Conn
var reqId string

func isServiceEnabled(basename string) (bool, error) {
    obj := conn.Object(
        "com.canonical.UbuntuAdvantage",
        dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/" + basename),
    )
    status, err := obj.GetProperty("com.canonical.UbuntuAdvantage.Service.Status")
    if err != nil {
        return false, err
    }
    return status.Value().(string) == "enabled", nil
}

func (s *ProServer) IsMachineProAttached(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    obj := conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Manager",
    )
    isAttached, err := obj.GetProperty("com.canonical.UbuntuAdvantage.Manager.Attached")
    if err != nil {
        return nil, err
    }

    return wpb.Bool(isAttached.Value().(bool)), nil
}

func (s *ProServer) IsEsmInfraEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := isServiceEnabled("esm_2dinfra")
    return wpb.Bool(enabled), err
}

func (s *ProServer) IsEsmAppsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := isServiceEnabled("esm_2dapps")
    return wpb.Bool(enabled), err
}

func (s *ProServer) IsKernelLivePatchEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := isServiceEnabled("livepatch")
    return wpb.Bool(enabled), err
}

var dbusServices map[dbus.ObjectPath]map[string]map[string]dbus.Variant
func connectToSystemBus() error {
    var err error
    conn, err = dbus.ConnectSystemBus()
    return err
}

func enableService(basename string, able string) error {
    obj := conn.Object(
        "com.canonical.UbuntuAdvantage",
        dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/" + basename),
    )
    call := obj.Call(
        "com.canonical.UbuntuAdvantage.Service." + able,
        dbus.FlagAllowInteractiveAuthorization,
    )
    if call.Err != nil {
        return call.Err
    }
    return nil
}

func (s *ProServer) EnableKernelLivePatch(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    return new(epb.Empty), enableService("livepatch", "Enable")
}

func (s *ProServer) DisableKernelLivePatch(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    return new(epb.Empty), enableService("livepatch", "Disable")
}

func (s *ProServer) EnableEsmApps(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    return new(epb.Empty), enableService("esm_2dapps", "Enable")
}

func (s *ProServer) DisableEsmApps(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    return new(epb.Empty), enableService("esm_2dapps", "Disable")
}

func (s *ProServer) EnableInfra(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    return new(epb.Empty), enableService("esm_2dinfra", "Enable")
}

func (s *ProServer) DisableInfra(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    return new(epb.Empty), enableService("esm_2dinfra", "Disable")
}

func (s *ProServer) WaitProMagicFlow(ctx context.Context, _ *epb.Empty) (*pb.WaitResponse, error) {
    cmd := exec.Command("pro", "api", "u.pro.attach.magic.wait.v1", "--args", "magic_token=" + reqId)
    out, err := cmd.Output()
    if err != nil {
        return nil, err
    }
    outs := string(out)
    if err = collectProApiErrors(outs); err != nil {
        return nil, err
    }
    token := gjson.Get(outs, "data.attributes.contract_token").String()
    return &pb.WaitResponse{ Token: token }, nil
}

func collectProApiErrors(stdout string) error {
    var errorCodes string
    if gjson.Get(stdout, "result").String() != "success" {
        for _, code := range gjson.Get(stdout, "errors.#.code").Array() {
            errorCodes += code.String() + "\n"
        }
        return errors.New(errorCodes)
    }
    return nil
}

func (s *ProServer) InitiateProMagicFlow(ctx context.Context, _ *epb.Empty) (*pb.InitiateResponse, error) {
    cmd := exec.Command("pro", "api", "u.pro.attach.magic.initiate.v1")
    out, err := cmd.Output()
    if err != nil {
        return nil, err
    }
    outs := string(out)
    if err = collectProApiErrors(outs); err != nil {
        return nil, err
    }
    pin := gjson.Get(outs, "data.attributes.user_code").String()
    expiresIn := gjson.Get(outs, "data.attributes.expires_in").Int()
    reqId = gjson.Get(outs, "data.attributes.token").String()
    return &pb.InitiateResponse {
        Pin: pin,
        ExpiresIn: expiresIn,
    }, nil
}

func attach(token string) error {
    obj := conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Manager",
    )
    call := obj.Call(
        "com.canonical.UbuntuAdvantage.Manager.Attach",
        dbus.FlagAllowInteractiveAuthorization,
        token,
    )
    if call.Err != nil {
        return call.Err
    }
    return nil
}

func (s *ProServer) AttachProToMachine(ctx context.Context, req *pb.AttachRequest) (*epb.Empty, error) {
    return new(epb.Empty), attach(req.GetToken())
}
