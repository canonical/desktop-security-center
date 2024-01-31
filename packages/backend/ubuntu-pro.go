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
)

/* Only services with which the front-end deals have to be listed. */
var isServiceEnabled = map[string]bool {
    "esm-infra": false,
    "esm-apps": false,
    "livepatch": false,
}

/* Sets isServiceEnabled items to true if the corresponding service is enabled. */
func initializeServicesStatus() (error) {
    cmd := exec.Command("pro", "api", "u.pro.status.enabled_services.v1")
    out, err := cmd.Output()
    if err != nil {
        return status.Errorf(codes.NotFound, "couldn't query Pro services")
    }

    result := gjson.Get(string(out), "data.attributes.enabled_services.#.name")
    for _, val := range result.Value().([]interface{}) {
        isServiceEnabled[val.(string)] = true
    }

    return nil
}

func (s *ProServer) IsMachineProAttached(ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    cmd := exec.Command("pro", "api", "u.pro.status.is_attached.v1")
    out, err := cmd.Output()
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "couldn't query Pro status")
    }
    val := gjson.Get(string(out), "data.attributes.is_attached")
    return &pb.Boolean{ Ret: val.Bool() }, nil
}

func (s *ProServer) IsEsmInfraEnabled (ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    return &pb.Boolean{ Ret: isServiceEnabled["esm-infra"] }, nil
}

func (s *ProServer) IsEsmAppsEnabled (ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    return &pb.Boolean{ Ret: isServiceEnabled["esm-apps"] }, nil
}

func (s *ProServer) IsKernelLivePatchEnabled (ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    return &pb.Boolean{ Ret: isServiceEnabled["livepatch"] }, nil
}

func pollProInitiate (reqId string) {
    cmd := exec.Command("pro", "api", "u.pro.attach.magic.wait.v1", "--args", "magic_token=" + reqId)
    /* TODO log this error */
    out, _ := cmd.Output()
    outs := string(out)
    token := gjson.Get(outs, "data.attributes.cotract_token").String()
    attach(token)
}

func (s *ProServer) ProInitiate (ctx context.Context, _ *emptypb.Empty) (*pb.InitiateResponse, error) {
    cmd := exec.Command("pro", "api", "u.pro.attach.magic.initiate.v1")
    out, err := cmd.Output()
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "couldn't initiate Pro magic attachment")
    }
    outs := string(out)
    pin := gjson.Get(outs, "data.attributes.user_code").String()
    expires := gjson.Get(outs, "data.attributes.expires_in").Int()
    reqId := gjson.Get(outs, "data.attributes.token").String()
    go pollProInitiate(reqId)
    return &pb.InitiateResponse {
        Pin: pin,
        Expires: expires,
    }, nil
}

func attach(token string) error {
    conn, err := dbus.ConnectSystemBus()
    if err != nil {
        return err
    }
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
    return nil, attach(req.GetToken())
}
