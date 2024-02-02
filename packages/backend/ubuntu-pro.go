package main
import (
    "os/exec"
    "context"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
    pb "github.com/canonical/desktop-security-center/packages/proto"
    "google.golang.org/protobuf/types/known/emptypb"
    "github.com/tidwall/gjson"
    "github.com/godbus/dbus/v5"
    "log"
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

func (s *ProServer) IsMachineProAttached(ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    obj := conn.Object(
        "com.canonical.UbuntuAdvantage",
        "/com/canonical/UbuntuAdvantage/Manager",
    )
    isAttached, err := obj.GetProperty("com.canonical.UbuntuAdvantage.Manager.Attached")
    if err != nil {
        return nil, err
    }

    return &pb.Boolean{ Ret: isAttached.Value().(bool) }, nil
}

func (s *ProServer) IsEsmInfraEnabled (ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    enabled, err := isServiceEnabled("esm_2dinfra")
    return &pb.Boolean{ Ret: enabled }, err
}

func (s *ProServer) IsEsmAppsEnabled (ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    enabled, err := isServiceEnabled("esm_2dapps")
    return &pb.Boolean{ Ret: enabled }, err
}

func (s *ProServer) IsKernelLivePatchEnabled (ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    enabled, err := isServiceEnabled("livepatch")
    return &pb.Boolean{ Ret: enabled }, err
}

var dbusServices map[dbus.ObjectPath]map[string]map[string]dbus.Variant
func connectToSystemBus() error {
    var err error
    conn, err = dbus.ConnectSystemBus()
    return err
}

func enableService(basename string, able string) error {
    /* XXX: Would this be better? Can the paths change?

    nameToPath := make(map[string]dbus.ObjectPath)
    bus := conn.Object("com.canonical.UbuntuAdvantage", "/")
    err = bus.Call("org.freedesktop.DBus.ObjectManager.GetManagedObjects", 0).Store(&dbusServices)
    if err != nil {
        return err
    }
    for pat, properties := range dbusServices {
        path := string(pat)
        if strings.HasPrefix(path, "/com/canonical/UbuntuAdvantage/Services/") {
            idx := properties["com.canonical.UbuntuAdvantage.Service"]["Name"].String()
            nameToPath[idx] = pat
        }
    }
    obj := conn.Object("com.canonical.UbuntuAdvantage", nameToPath[arag])

    */

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

func (s *ProServer) EnableKernelLivePatch (ctx context.Context, _ *emptypb.Empty) (*emptypb.Empty, error) {
    return new(emptypb.Empty), enableService("livepatch", "Enable")
}

func (s *ProServer) DisableKernelLivePatch (ctx context.Context, _ *emptypb.Empty) (*emptypb.Empty, error) {
    return new(emptypb.Empty), enableService("livepatch", "Disable")
}

func (s *ProServer) EnableEsmApps (ctx context.Context, _ *emptypb.Empty) (*emptypb.Empty, error) {
    return new(emptypb.Empty), enableService("esm_2dapps", "Enable")
}

func (s *ProServer) DisableEsmApps (ctx context.Context, _ *emptypb.Empty) (*emptypb.Empty, error) {
    return new(emptypb.Empty), enableService("esm_2dapps", "Disable")
}

func (s *ProServer) EnableInfra (ctx context.Context, _ *emptypb.Empty) (*emptypb.Empty, error) {
    return new(emptypb.Empty), enableService("esm_2dinfra", "Enable")
}

func (s *ProServer) DisableInfra (ctx context.Context, _ *emptypb.Empty) (*emptypb.Empty, error) {
    return new(emptypb.Empty), enableService("esm_2dinfra", "Disable")
}

func (s *ProServer) WaitProMagicFlow(ctx context.Context, _ *emptypb.Empty) (*pb.WaitResponse, error) {
    cmd := exec.Command("pro", "api", "u.pro.attach.magic.wait.v1", "--args", "magic_token=" + reqId)
    out, err := cmd.Output()
    if err != nil {
        log.Println("Couldn't wait for magic attachment")
        return nil, err
    }
    outs := string(out)
    if err = collectProApiErrors(outs); err != nil {
        log.Println(err)
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
        return status.Errorf(codes.Unknown, errorCodes)
    }
    return nil
}

func (s *ProServer) InitiateProMagicFlow (ctx context.Context, _ *emptypb.Empty) (*pb.InitiateResponse, error) {
    cmd := exec.Command("pro", "api", "u.pro.attach.magic.initiate.v1")
    out, err := cmd.Output()
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "couldn't initiate Pro magic attachment")
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

func (s *ProServer) AttachProToMachine (ctx context.Context, req *pb.AttachRequest) (*emptypb.Empty, error) {
    return new(emptypb.Empty), attach(req.GetToken())
}
