package main
import (
	"github.com/coreos/go-systemd/activation"
    "os"
    "google.golang.org/grpc"
    "context"
    pb "github.com/canonical/desktop-security-center/packages/proto"
)

type HardwareServer struct{pb.UnimplementedHardwareServer}

func New(ctx context.Context)  {
 
	listeners, err := activation.Listeners()
	if err != nil {
		panic(err)
	}

	if len(listeners) != 1 {
		panic("Unexpected number of socket activation fds")
	}

    //var x = []byte{'c','a','t', '\n'}
    fo, err := os.Create("/tmp/c.txt")
    if err != nil {
        panic(err)
    }

    var opts []grpc.ServerOption
    grpcServer := grpc.NewServer(opts...)
    pb.RegisterHardwareServer(grpcServer, &HardwareServer{})

    //trash
    fo.WriteString("u\n")
    fo.WriteString(listeners[0].Addr().String())
    fo.WriteString("\n")
    grpcServer.Serve(listeners[0])
    fo.WriteString("END\n")
}

func main() {
	ctx := context.Background()
    New(ctx)
}
