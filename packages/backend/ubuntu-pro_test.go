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

var ret string

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

    /* IsMachineProAttached */
    ret = "true"
    i, err := manager.proServer.IsMachineProAttached(ctx, nil)
    if i.GetValue() != true || err != nil {
        t.Fatal("")
    }

    ret = "false"
    i, err = manager.proServer.IsMachineProAttached(ctx, nil)
    if i.GetValue() != false || err != nil {
        t.Fatal("")
    }
    /* Hangs, why though? 
    fmt.Println(3)
    ret = "error"
    _, err = manager.proServer.IsMachineProAttached(ctx, nil)
    fmt.Println(4)
    if err != nil{
         t.Fatal("I expected error but got none")
    }
    */
    
    /* IsServiceEnabled */
    ret = "disabled"
    i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    if i.GetValue() != false || err != nil {
        t.Fatal(i.GetValue(), err)
    }
    i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    if i.GetValue() != false || err != nil {
        t.Fatal(i.GetValue(), err)
    }
    i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    if i.GetValue() != false || err != nil {
        t.Fatal(i.GetValue(), err)
    }

    ret = "enabled"
    i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    if i.GetValue() != true || err != nil {
        t.Fatal()
    }
    i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    if i.GetValue() != true || err != nil {
        t.Fatal()
    }
    i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    if i.GetValue() != true || err != nil {
        t.Fatal()
    }
    /* Hangs, why though?
    ret = "error"
    i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    if err != nil {
        t.Fatal("Ni;")
    }
    */
}

func (a prodbus) Get(interfaceName string, propertyName string) (interface{}, *dbus.Error) {
  defer fmt.Println("deferred", ret)
  switch ret {
  case "true": return true, nil
  case "false": return false, nil
  case "enabled": return "enabled", nil
  case "disabled": return "disabled", nil
  }
  return "", dbus.NewError("failed", []interface{}{"fooerror"})
}
func TestMain(m *testing.M){
    defer testutils.StartLocalSystemBus()()
    //For debugging with D-Feet
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

func ExportAttachMock(conn *dbus.Conn) error {
    a := prodbus{}
    servicesMock:=fmt.Sprintf(`
    <node name="/">
      <interface name='com.canonical.UbuntuAdvantage.Service'>
        <method name='Enable'/>
        <method name='Disable'/>
      </interface>
    %s</node>
    `, introspect.IntrospectDataString)
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
    if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/esm_2dapps"), "com.canonical.UbuntuAdvantage.Service"); err != nil {
        return fmt.Errorf("could not export  mock: %w", err)
    }
    if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/esm_2dinfra"), "com.canonical.UbuntuAdvantage.Service"); err != nil {
        return fmt.Errorf("could not export  mock: %w", err)
    }
    if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/livepatch"), "com.canonical.UbuntuAdvantage.Service"); err != nil {
        return fmt.Errorf("could not export  mock: %w", err)
    }

    if err := conn.Export(introspect.Introspectable(mock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "org.freedesktop.DBus.Introspectable"); err != nil {
        return fmt.Errorf("could not export introspectable for accounts mock: %w", err)
    }
	if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "org.freedesktop.DBus.Properties"); err != nil {
		return fmt.Errorf("could not export DBUS PROPERTIES mock: %w", err)
	}

    if err := conn.Export(introspect.Introspectable(servicesMock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/livepatch"), "org.freedesktop.DBus.Introspectable"); err != nil {
        return fmt.Errorf("could not export introspectable for accounts mock: %w", err)
    }
	if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/livepatch"), "org.freedesktop.DBus.Properties"); err != nil {
		return fmt.Errorf("could not export DBUS PROPERTIES mock: %w", err)
	}
    if err := conn.Export(introspect.Introspectable(servicesMock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/esm_2dinfra"), "org.freedesktop.DBus.Introspectable"); err != nil {
        return fmt.Errorf("could not export introspectable for accounts mock: %w", err)
    }
	if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/esm_2dinfra"), "org.freedesktop.DBus.Properties"); err != nil {
		return fmt.Errorf("could not export DBUS PROPERTIES mock: %w", err)
	}
    if err := conn.Export(introspect.Introspectable(servicesMock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/esm_2dapps"), "org.freedesktop.DBus.Introspectable"); err != nil {
        return fmt.Errorf("could not export introspectable for accounts mock: %w", err)
    }
	if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/esm_2dapps"), "org.freedesktop.DBus.Properties"); err != nil {
		return fmt.Errorf("could not export DBUS PROPERTIES mock: %w", err)
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
