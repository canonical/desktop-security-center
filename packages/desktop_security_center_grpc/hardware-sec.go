package main
import (
    "strings"
    "os/exec"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func IsSecureBootEnabled() (bool, error) {
    cmd := exec.Command("mokutil", "--sb-state")
    out, err := cmd.Output()
    if err != nil {
        return true, status.Errorf(codes.NotFound, "couldn't execute mokutil")
    }
    out_s := string(out)
    if strings.Contains(out_s, "SecureBoot enabled") {
        return true, nil
    } else if strings.Contains(out_s, "SecureBoot disabled") {
        return false, nil
    } else {
        return true, status.Errorf(codes.Internal, "unexpected mokutil output")
    }
}
