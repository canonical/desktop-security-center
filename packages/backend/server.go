package main
import (
    "github.com/coreos/go-systemd/activation"
    "google.golang.org/grpc"
    "context"
    pb "github.com/canonical/desktop-security-center/packages/proto"
)

type HardwareServer struct{pb.UnimplementedHardwareServer}
type ProServer struct{pb.UnimplementedProServer}

func New(ctx context.Context)  {
 
    listeners, err := activation.Listeners()
    if err != nil {
        panic(err)
    }

    if len(listeners) != 1 {
        panic("Unexpected number of socket activation fds")
    }

    var opts []grpc.ServerOption
    grpcServer := grpc.NewServer(opts...)
    pb.RegisterHardwareServer(grpcServer, &HardwareServer{})
    pb.RegisterProServer(grpcServer, &ProServer{})
    grpcServer.Serve(listeners[0])
}

func main() {
    ctx := context.Background()

    connectToSystemBus()
    New(ctx)
}
