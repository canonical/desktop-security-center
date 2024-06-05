package main
import (
    "github.com/coreos/go-systemd/activation"
    "google.golang.org/grpc"
    "context"
    "errors"
    "log"
    "net"
    "net/http"
    pb "github.com/canonical/desktop-security-center/packages/proto"
    "github.com/godbus/dbus/v5"
    "google.golang.org/grpc/codes"
    "google.golang.org/grpc/status"
)

type HardwareServer struct{pb.UnimplementedHardwareServer}

type Manager struct {
    proServer        *ProServer
    permissionServer *PermissionServer
    conn             *dbus.Conn
}

func NewServerManager (ctx context.Context, conns ...*dbus.Conn) (*Manager, error) {
    var conn *dbus.Conn
    var err error
    if len(conns) == 1 {
        /* Branch taken when testing. */
        conn = conns[0]
    } else {
        /* Branch taken in real executions, */
        conn, err = dbus.ConnectSystemBus()
        if err != nil {
            return nil, status.Errorf(codes.Internal, "Failed to connect to system bus: %s", err)
        }
    }

    proServer, err := NewProServer(conn)
    if err != nil {
        return nil, status.Errorf(codes.Internal, "Failed to create user service: %s", err)
    }

    c := &http.Client{
        Transport: &http.Transport{
            DialContext: func(ctx context.Context, network, addr string) (net.Conn, error) {
                return (&net.Dialer{}).DialContext(ctx, "unix", "/run/snapd.socket")
            },
        },
    }
    permissionServer := NewPermissionServer(c)

    return &Manager{
        proServer:        proServer,
        permissionServer: permissionServer,
        conn:             conn,
    }, nil
}

func New(ctx context.Context) error {
    listeners, err := activation.Listeners()
    if err != nil {
        return err
    }
    if len(listeners) != 1 {
        log.Printf("Expected only 1 listener, got %d.", len(listeners))
        return errors.New(`Unexpected number of socket activation file descriptors.
        Hint: If you trying to run the binary directly, you shouldn't.
        This service assumes that Systemd spawns it when a listener binds to the
        installed socket.`)
    }

    var opts []grpc.ServerOption
    grpcServer := grpc.NewServer(opts...)
    pb.RegisterHardwareServer(grpcServer, &HardwareServer{})
    manager, err := NewServerManager(ctx)
    if err != nil {
        return(err)
    }
    pb.RegisterProServer(grpcServer, manager.proServer)
    pb.RegisterPermissionServer(grpcServer, manager.permissionServer)
    grpcServer.Serve(listeners[0])
    return nil
}

func main() {
    ctx := context.Background()
    setUpLogging()
    err := New(ctx)
    if err != nil {
        log.Println(err)
    }
}

func setUpLogging() {
    log.SetFlags(log.LstdFlags | log.LUTC | log.Lshortfile)
}
