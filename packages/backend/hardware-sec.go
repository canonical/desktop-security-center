package main
import (
    "strings"
    "os/exec"
    "context"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
    pb "github.com/canonical/desktop-security-center/packages/proto"
    "google.golang.org/protobuf/types/known/emptypb"
)

func (s *HardwareServer) IsSecureBootEnabled(ctx context.Context, _ *emptypb.Empty) (*pb.IsSecureBootEnabledResponse, error) {
    cmd := exec.Command("mokutil", "--sb-state")
    out, err := cmd.Output()
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "couldn't execute mokutil")
    }
    out_s := string(out)
    if strings.Contains(out_s, "SecureBoot enabled") {
        return &pb.IsSecureBootEnabledResponse{ Enabled: true }, nil
    } else if strings.Contains(out_s, "SecureBoot disabled") {
        return &pb.IsSecureBootEnabledResponse{ Enabled: false }, nil
    } else {
        return nil, status.Errorf(codes.Internal, "unexpected mokutil output")
    }
}
