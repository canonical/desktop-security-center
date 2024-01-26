package main
import (
    "os/exec"
    "context"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
    pb "github.com/canonical/desktop-security-center/packages/proto"
    "google.golang.org/protobuf/types/known/emptypb"
    "github.com/tidwall/gjson"
)

func (s *ProServer) IsMachineProAttached(ctx context.Context, _ *emptypb.Empty) (*pb.Boolean, error) {
    cmd := exec.Command("pro", "api", "u.pro.status.is_attached.v1")
    out, err := cmd.Output()
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "couldn't query Pro status")
    }
    val := gjson.Get(string(out), "data.attributes.is_attached")
    return &pb.Boolean{ Ret: val.Bool() }, nil
}
