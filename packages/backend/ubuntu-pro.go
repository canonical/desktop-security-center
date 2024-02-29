package main
import (
    "os/exec"
    "log"
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

type ExecCommand func(string, ...string) *exec.Cmd
type ProServer struct {
    pb.UnimplementedProServer
    conn             *dbus.Conn
    apps             dbus.BusObject
    infra            dbus.BusObject
    livepatch        dbus.BusObject
    fips             dbus.BusObject
    usg              dbus.BusObject
    manager          dbus.BusObject
    reqId            string
    execer           ExecCommand
}

func NewProServer(conn *dbus.Conn) (*ProServer, error) {
    s := &ProServer{
        conn: conn,
        execer: exec.Command,
    }

    s.infra = conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Services/esm_2dinfra",
    )
    err := s.infra.Call("org.freedesktop.DBus.Peer.Ping", 0).Err
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to ping DBus ESM-Infra object")
    }

    s.apps = conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Services/esm_2dapps",
    )
    err = s.apps.Call("org.freedesktop.DBus.Peer.Ping", 0).Err
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to ping DBus ESM-Apps object")
    }

    s.livepatch = conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Services/livepatch",
    )
    err = s.livepatch.Call("org.freedesktop.DBus.Peer.Ping", 0).Err
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to ping DBus ESM-Apps object")
    }

    s.fips = conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Services/fips",
    )
    err = s.fips.Call("org.freedesktop.DBus.Peer.Ping", 0).Err
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to ping DBus FIPS object")
    }

    s.usg = conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Services/usg",
    )
    err = s.usg.Call("org.freedesktop.DBus.Peer.Ping", 0).Err
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to ping DBus USG object")
    }

    s.manager = conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Manager",
    )
    err = s.manager.Call("org.freedesktop.DBus.Peer.Ping", 0).Err
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to ping DBus Manager object")
    }

    return s, nil
}

func (s *ProServer) isServiceEnabled(obj dbus.BusObject) (bool, error) {
    /* Although it is pointless to call isServiceEnabled if the machine is
     * unattached, we shouldn't assume the front-end knows this detail of the
     * Ubuntu Pro functionality.
     * Thus, if the front-end calls this function, we need to check if it is
     * attached lest the Get is attempted on a inexisting object. */
    isAttached, err := s.isAttached()
    if err != nil {
        return false, err
    }
    if !isAttached {
        return false, nil
    }

    status, err := obj.GetProperty("com.canonical.UbuntuAdvantage.Service.Status")
    if err != nil {
        log.Println(obj.Path(), err)
        return false, err
    }
    return status.Value().(string) == "enabled", nil
}

func (s *ProServer) isAttached() (bool, error) {
    isAttached, err := s.manager.GetProperty("com.canonical.UbuntuAdvantage.Manager.Attached")
    if err != nil {
        log.Println(err)
        return false, status.Errorf(codes.Internal, "%v", err)
    }
    return isAttached.Value().(bool), nil
}

/* Determines if system is attached to Ubuntu Pro. */
func (s *ProServer) IsMachineProAttached(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    isAttached, err := s.isAttached()
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(isAttached), err
}

/* Determines if the USG service of Ubuntu Pro is enabled. */
func (s *ProServer) IsUsgEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := s.isServiceEnabled(s.usg)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

/* Determines if the FIPS service of Ubuntu Pro is enabled. */
func (s *ProServer) IsFipsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := s.isServiceEnabled(s.fips)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

/* Determines if the ESM Infra service of Ubuntu Pro is enabled. */
func (s *ProServer) IsEsmInfraEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := s.isServiceEnabled(s.infra)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

/* Determines if the ESM Apps service of Ubuntu Pro is enabled. */
func (s *ProServer) IsEsmAppsEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := s.isServiceEnabled(s.apps)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

/* Determines if the Livepatch service of Ubuntu Pro is enabled. */
func (s *ProServer) IsKernelLivePatchEnabled(ctx context.Context, _ *epb.Empty) (*wpb.BoolValue, error) {
    enabled, err := s.isServiceEnabled(s.livepatch)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return wpb.Bool(enabled), nil
}

func enableService(obj dbus.BusObject, able string) error {
    call := obj.Call(
        "com.canonical.UbuntuAdvantage.Service." + able,
        dbus.FlagAllowInteractiveAuthorization,
    )
    if call.Err != nil {
        log.Println(obj.Path(), call.Err)
        return call.Err
    }
    return nil
}

/* Enables Livepatch service of Ubuntu Pro. */
func (s *ProServer) EnableKernelLivePatch(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.livepatch, "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables Livepatch service of Ubuntu Pro. */
func (s *ProServer) DisableKernelLivePatch(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.livepatch, "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Enables USG service of Ubuntu Pro. */
func (s *ProServer) EnableUsg(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.usg, "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables USG service of Ubuntu Pro. */
func (s *ProServer) DisableUsg(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.usg, "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Enables FIPS service of Ubuntu Pro. */
func (s *ProServer) EnableFips(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.fips, "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables FIPS service of Ubuntu Pro. */
func (s *ProServer) DisableFips(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.fips, "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Enables ESM Apps service of Ubuntu Pro. */
func (s *ProServer) EnableEsmApps(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.apps, "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables ESM Apps service of Ubuntu Pro. */
func (s *ProServer) DisableEsmApps(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.apps, "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Enables ESM Infra service of Ubuntu Pro. */
func (s *ProServer) EnableInfra(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.infra, "Enable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Disables ESM Infra service of Ubuntu Pro. */
func (s *ProServer) DisableInfra(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    err := enableService(s.infra, "Disable")
    if err != nil {
        return nil, status.Errorf(codes.Internal, "%v", err)
    }
    return new(epb.Empty), nil
}

/* Waits until the user enters his PIN, retrieved via InitiateProMagicFlow, in
 * ubuntu.com/pro/attach (or whatever happens to be the appropriate URL at the
 * time of reading), retrieves and returns the attachment token. */
func (s *ProServer) WaitProMagicFlow(ctx context.Context, _ *epb.Empty) (*pb.WaitResponse, error) {
    cmd := s.execer("pro", "api", "u.pro.attach.magic.wait.v1", "--args", "magic_token=" + s.reqId)
    out, execErr := cmd.Output()
    outs := string(out)
    if err := collectProApiErrors(outs, execErr); err != nil {
        log.Println(err)
        return nil, err
    }
    token := gjson.Get(outs, "data.attributes.contract_token").String()
    return &pb.WaitResponse{ Token: token }, nil
}

/* Extracts and returns errors from a Pro API call, if any. */
func collectProApiErrors(json string, execErr error) error {
    var errorCodes string
    if !gjson.Valid(json) {
        if execErr != nil {
            return execErr
        }
        return status.Errorf(codes.Internal, "Invalid Pro API response: %s", json)
    }
    if gjson.Get(json, "result").String() != "success" {
        for _, code := range gjson.Get(json, "errors.#.code").Array() {
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
    cmd := s.execer("pro", "api", "u.pro.attach.magic.initiate.v1")
    out, execErr := cmd.Output()
    outs := string(out)
    if err := collectProApiErrors(outs, execErr); err != nil {
        log.Println(err)
        return nil, err
    }
    pin := gjson.Get(outs, "data.attributes.user_code").String()
    expiresIn := gjson.Get(outs, "data.attributes.expires_in").Int()
    /* Let's not call this 'token' lest we confuse it with the other token
     * used for attaching Ubuntu Pro. This on the other hand is more of a
     * request identifier. */
    s.reqId = gjson.Get(outs, "data.attributes.token").String()
    return &pb.InitiateResponse {
        Pin: pin,
        ExpiresIn: expiresIn,
    }, nil
}

/* Attaches the system to Ubuntu Pro given the token. If the user chose the
 * magic flow, the consumer is supposed to already have called both
 * InitiateProMagicFlow and WaitProMagicFlow. If the user supplied the token
 * directly, then the consumer is supposed to call this directly with it. */
func (s *ProServer) AttachProToMachine(ctx context.Context, req *pb.AttachRequest) (*epb.Empty, error) {
    call := s.manager.Call(
        "com.canonical.UbuntuAdvantage.Manager.Attach",
        dbus.FlagAllowInteractiveAuthorization,
        req.GetToken(),
    )
    if call.Err != nil {
        log.Println(call.Err)
        return new(epb.Empty), call.Err
    }
    return new(epb.Empty), nil
}

/* Detaches the system from Ubuntu Pro. */
func (s *ProServer) DetachPro(ctx context.Context, _ *epb.Empty) (*epb.Empty, error) {
    call := s.manager.Call(
        "com.canonical.UbuntuAdvantage.Manager.Detach",
        dbus.FlagAllowInteractiveAuthorization,
    )
    if call.Err != nil {
        log.Println(call.Err)
        return nil, status.Errorf(codes.Internal, "Couldn't detach: %v", call.Err)
    }
    return new(epb.Empty), nil
}

/* Sets existance of Livepatch icon in system tray */
func (s *ProServer) ShowLivepatchTray(ctx context.Context, show *wpb.BoolValue) (*epb.Empty, error) {
    set := "false"
    if show.GetValue() {
        set = "true"
    }
    cmd := s.execer("gsettings", "set", "com.ubuntu.update-notifier",
                    "show-livepatch-status-icon", set)
    _, err := cmd.Output()
    if err != nil {
        log.Println(err)
        return nil, status.Errorf(codes.Internal, "Couldn't set gsettings: %v", err)
    }
    return new(epb.Empty), nil
}
