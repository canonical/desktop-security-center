package main
import (
    "github.com/coreos/go-systemd/activation"
    "google.golang.org/grpc"
    "context"
    pb "github.com/canonical/desktop-security-center/packages/proto"
    "github.com/godbus/dbus/v5"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

type HardwareServer struct{pb.UnimplementedHardwareServer}

type Manager struct {
    userService   *ProServer
    conn          *dbus.Conn
}

func NewProServerManager(ctx context.Context) (*Manager, error) {
    conn, err := dbus.ConnectSystemBus()
    if err != nil {
        return nil, status.Errorf(codes.Internal, "Failed to connect to system bus: %s", err)
    }

    userService, err := NewProServer(conn)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "failed to create user service: %s", err)
    }

    return &Manager{
        userService:    userService,
        conn:           conn,
    }, nil
}

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
    sss, err := NewProServerManager(ctx)
    if err != nil {
        panic(err)
    }
    pb.RegisterProServer(grpcServer, sss.userService)
    grpcServer.Serve(listeners[0])
}

func main() {
    ctx := context.Background()
    New(ctx)
}
