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
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
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

/* Determines if system is attached to Ubuntu Pro. */
func (s *ProServer) IsMachineProAttached(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    obj := conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Manager",
    )
    isAttached, err := obj.GetProperty("com.canonical.UbuntuAdvantage.Manager.Attached")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }

    return wpb.Bool(isAttached.Value().(bool)), nil
}

/* Determines if the ESM Infra service of Ubuntu Pro is enabled. */
func (s *ProServer) IsEsmInfraEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := isServiceEnabled("esm_2dinfra")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

/* Determines if the ESM Apps service of Ubuntu Pro is enabled. */
func (s *ProServer) IsEsmAppsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := isServiceEnabled("esm_2dapps")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

/* Determines if the Livepatch service of Ubuntu Pro is enabled. */
func (s *ProServer) IsKernelLivePatchEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := isServiceEnabled("livepatch")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
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

/* Enables Livepatch service of Ubuntu Pro. */
func (s *ProServer) EnableKernelLivePatch(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService("livepatch", "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables Livepatch service of Ubuntu Pro. */
func (s *ProServer) DisableKernelLivePatch(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService("livepatch", "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Enables ESM Apps service of Ubuntu Pro. */
func (s *ProServer) EnableEsmApps(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService("esm_2dapps", "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables ESM Apps service of Ubuntu Pro. */
func (s *ProServer) DisableEsmApps(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService("esm_2dapps", "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Enables ESM Infra service of Ubuntu Pro. */
func (s *ProServer) EnableInfra(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService("esm_2dinfra", "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables ESM Infra service of Ubuntu Pro. */
func (s *ProServer) DisableInfra(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService("esm_2dinfra", "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Waits until the user enters his PIN, retrieved via InitiateProMagicFlow, in
 * ubuntu.com/pro/attach (or whatever happens to be the appropriate URL at the
 * time of reading), retrieves and returns the attachment token. */
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

/* Initiates the Pro magic flow[1]. The PIN and its expiration time is returned.
 * The user is supposed to input the PIN at ubuntu.com/pro/attach (or whatever
 * happens to be the appropriate URL at the time of reading).
 * [1] https://canonical-ubuntu-pro-client.readthedocs-hosted.com/en/latest/references/api/#u-pro-attach-magic-initiate-v1
 */
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
    /* Let's not call this 'token' lest we confuse it with the other token
     * used for attaching Ubuntu Pro. This on the other hand is more of a
     * request identifier. */
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

/* Attaches the system to Ubuntu Pro given the token. If the user chose the
 * magic flow, the consumer is supposed to already have called both
 * InitiateProMagicFlow and WaitProMagicFlow. If the user supplied the token
 * directly, then the consumer is supposed to call this directly with it. */
func (s *ProServer) AttachProToMachine(ctx context.Context, req *pb.AttachRequest) (*epb.Empty, error) {
    return new(epb.Empty), attach(req.GetToken())
}
