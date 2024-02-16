package main

import (
    "testing"
    "context"
    //epb "google.golang.org/protobuf/types/known/emptypb"
    "github.com/canonical/desktop-security-center/packages/testtools/testutils"
    "fmt"
    "os"
    "github.com/godbus/dbus/v5"
	"github.com/godbus/dbus/v5/introspect"
    pb "github.com/canonical/desktop-security-center/packages/proto"
)

func TestAttachProToMachine(t *testing.T) {
	t.Cleanup(testutils.StartLocalSystemBus())

    ctx := context.Background()
    conn := testutils.NewDbusConn(t)

    manager, err := NewServerManager(ctx, conn)
    if err != nil {
        t.Fatal("Couldn't get a manager", err)
    }

    req := new(pb.AttachRequest)
    req.Token = "incorrect"
    _, err = manager.proServer.AttachProToMachine(ctx, req)
    if err == nil {
         t.Fatal("I expected error for incorrect token, but didn't get one.")
    }
    
    req.Token = "correct"
    _, err = manager.proServer.AttachProToMachine(ctx, req)
    if err != nil {
         t.Fatal("I expected no error for a correct token, got ", err)
    }

    _, err = manager.proServer.IsMachineProAttached(ctx, nil)
    isAttached, err := manager.proServer.IsMachineProAttached(ctx, nil)
    fmt.Println(isAttached)
}

func TestMain(m *testing.M){
    defer testutils.StartLocalSystemBus()()
    fmt.Println(os.Getenv("DBUS_SYSTEM_BUS_ADDRESS"))

	conn, err := testutils.GetSystemBusConnection()
	if err != nil {
        fmt.Println(err)
		os.Exit(7)
	}

    if er := ExportAttachMock(conn); er != nil {
        fmt.Println(er)
        os.Exit(8)
    }
    m.Run()
}

/*Mocking, consult https://github.com/canonical/ubuntu-desktop-provision/blob/main/provd/internal/testutils/accounts_mock.go#L61 for example*/
type prodbus struct{}

func (a prodbus) Ping() *dbus.Error {
	return nil
}

func (a prodbus) Attach(token string) (*dbus.Error) {
	if token != "correct" {
		return dbus.NewError("com.canonical.UbuntuAdvantage.Error.AttachError", []interface{}{"error requested in AttachError mocked method. Argument: " + token})
	}
	return nil
}

func (a prodbus) Dettach() (*dbus.Error) {

	return nil
}

func ExportAttachMock(conn *dbus.Conn) error {
    a := prodbus{}
    mock:=fmt.Sprintf(`
    <node name="/">
      <interface name='com.canonical.UbuntuAdvantage.Manager'>
        <method name='Attach'>
          <arg type='s' name='token' direction='in'/>
        </method>
        <method name='Detach'/>
        <property name='Attached' type='b' access='read'/>
      </interface>

      <interface name="org.freedesktop.DBus.Properties">
          <method name="Get">
              <arg name="interface" direction="in" type="s"/>
              <arg name="property" direction="in" type="s"/>
              <arg name="value" direction="out" type="v"/>
          </method>
      </interface>
    %s</node>
    `, introspect.IntrospectDataString)
    if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "com.canonical.UbuntuAdvantage.Manager"); err != nil {
        return fmt.Errorf("could not export  mock: %w", err)
    }
    if err := conn.Export(introspect.Introspectable(mock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "org.freedesktop.DBus.Introspectable"); err != nil {
        return fmt.Errorf("could not export introspectable for accounts mock: %w", err)
    }
		if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "com.canonical.UbuntuAdvantage.Manager"); err != nil {
			return fmt.Errorf("could not export DBus Properties mock: %w", err)
		}

	reply, err := conn.RequestName("com.canonical.UbuntuAdvantage", dbus.NameFlagDoNotQueue)
	if err != nil {
		return fmt.Errorf("failed to acquire account name on local system bus: %w", err)
	}
	if reply != dbus.RequestNameReplyPrimaryOwner {
		return fmt.Errorf("failed to acquire account name on local system bus: name is already taken")
	}

    return nil
    
}

    /*
	t.Parallel()

	tests := map[string]struct {
		locale       string
		emptyRequest bool

		wantError bool
	}{
		// Success case
		"Successcully sets a valid locale": {locale: "en_US.UTF-8"},

		// Error cases
		"Error on empty request":                {emptyRequest: true, wantError: true},
		"Error when locale is empty":            {locale: "", wantError: true},
		"Error when SetLocale returns an error": {locale: "locale_error", wantError: true},
		"Error on invalid locale":               {locale: "bad_locale", wantError: true},
        
	}
	for name, tc := range tests {
		tc := tc
		t.Run(name, func(t *testing.T) {
			t.Parallel()
			t.Cleanup(testutils.StartLocalSystemBus())

			client := newLocaleClient(t)

			var req *pb.SetLocaleRequest
			if !tc.emptyRequest {
				req = &pb.SetLocaleRequest{Locale: tc.locale}
			} else {
				req = nil
			}

			got, err := client.SetLocale(context.Background(), req)
			if tc.wantError {
				require.Error(t, err, "SetLocale should have returned an error, but did not")
				return
			}
			require.NoError(t, err, "SetLocale should not return an error, but did")
			require.NotNil(t, got, "SetLocale should return an empty not nil response when not in error")
		})
	}
}



func TestMain(m *testing.M) {
	testutils.InstallUpdateFlag()
	flag.Parse()

	defer testutils.StartLocalSystemBus()()

	conn, err := testutils.GetSystemBusConnection()

	if err != nil {
		slog.Error(fmt.Sprintf("Could not get system bus connection: %v", err))
		os.Exit(1)
	}

	err = testutils.ExportLocaleMock(conn)
	if err != nil {
		slog.Error(fmt.Sprintf("Could not export locale mock: %v", err))
		os.Exit(1)
	}

	m.Run()
}
*/
