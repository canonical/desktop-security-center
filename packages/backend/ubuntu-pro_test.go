package main

import (
	"context"
	"testing"
	//epb "google.golang.org/protobuf/types/known/emptypb"
	"fmt"
	pb "github.com/canonical/desktop-security-center/packages/proto"
	"github.com/canonical/desktop-security-center/packages/testtools/testutils"
	"github.com/godbus/dbus/v5"
	"github.com/godbus/dbus/v5/introspect"
	"os"
)

type prodbus struct{}

var getResponse string
var manager *Manager
var ctx context.Context

func TestAttachProToMachine(t *testing.T) {
	t.Cleanup(testutils.StartLocalSystemBus())

	req := new(pb.AttachRequest)
	req.Token = "incorrect"
	_, err := manager.proServer.AttachProToMachine(ctx, req)
	if err == nil {
		t.Fatal("I expected error for incorrect token, but didn't get one.")
	}

	req.Token = "correct"
	_, err = manager.proServer.AttachProToMachine(ctx, req)
	if err != nil {
		t.Fatal("I expected no error for a correct token, got ", err)
	}
}

func TestIsMachineProAttached(t *testing.T) {
	getResponse = "true"
	i, err := manager.proServer.IsMachineProAttached(ctx, nil)
	if i.GetValue() != true || err != nil {
		t.Fatal(i.GetValue(), err)
	}

	getResponse = "false"
	i, err = manager.proServer.IsMachineProAttached(ctx, nil)
	if i.GetValue() != false || err != nil {
		t.Fatal(i.GetValue(), err)
	}

	getResponse = "error"
	_, err = manager.proServer.IsMachineProAttached(ctx, nil)
	if err == nil {
		t.Fatal("I expected an error, but didn't get one")
	}
}

func TestIsServiceEnabled(t *testing.T) {
	getResponse = "disabled"
	i, err := manager.proServer.IsEsmInfraEnabled(ctx, nil)
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

	getResponse = "enabled"
	i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
	if i.GetValue() != true || err != nil {
		t.Fatal(i.GetValue(), err)
	}
	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
	if i.GetValue() != true || err != nil {
		t.Fatal(i.GetValue(), err)
	}
	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
	if i.GetValue() != true || err != nil {
		t.Fatal(i.GetValue(), err)
	}

	getResponse = "error"
	i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
	if err == nil {
		t.Fatal("I expected no error, but didn't get one")
	}
	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
	if err == nil {
		t.Fatal("I expected no error, but didn't get one")
	}
	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
	if err == nil {
		t.Fatal("I expected no error, but didn't get one")
	}
}

func (a prodbus) Get(interfaceName string, propertyName string) (interface{}, *dbus.Error) {
	switch getResponse {
	case "true":
		return true, nil
	case "false":
		return false, nil
	case "enabled":
		return "enabled", nil
	case "disabled":
		return "disabled", nil
	}
	return "", dbus.NewError(
		"com.canonical.UbuntuAdvantage.Error.GetError",
		[]interface{}{"error requested in Get mocked method."},
	)
}

func TestMain(m *testing.M) {
	defer testutils.StartLocalSystemBus()()
	//For debugging with D-Feet
	fmt.Println(os.Getenv("DBUS_SYSTEM_BUS_ADDRESS"))

	conn, err := testutils.GetSystemBusConnection()
	if err != nil {
		fmt.Println("Couldn't connect to bus: ", err)
		os.Exit(7)
	}

	if err = ExportAttachMock(conn); err != nil {
		fmt.Println("Couldn't export mocks:", err)
		os.Exit(8)
	}

	ctx = context.Background()
	manager, err = NewServerManager(ctx, conn)
	if err != nil {
		fmt.Println("Couldn't get a manager: ", err)
		os.Exit(9)
	}
	m.Run()
}

func (a prodbus) Attach(token string) *dbus.Error {
	if token != "correct" {
		return dbus.NewError(
			"com.canonical.UbuntuAdvantage.Error.AttachError",
			[]interface{}{"error requested in AttachError mocked method."},
		)
	}
	return nil
}

func ExportAttachMock(conn *dbus.Conn) error {
	a := prodbus{}
	servicesMock := fmt.Sprintf(`
    <node name="/">
      <interface name='com.canonical.UbuntuAdvantage.Service'>
        <method name='Enable'/>
        <method name='Disable'/>
      </interface>
    %s</node>
    `, introspect.IntrospectDataString)
	managerMock := fmt.Sprintf(`
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
	for _, val := range []string{
		"esm_2dapps",
		"esm_2dinfra",
		"livepatch",
	} {
		if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/"+val), "com.canonical.UbuntuAdvantage.Service"); err != nil {
			return fmt.Errorf("could not export service mock: %w", err)
		}
		if err := conn.Export(introspect.Introspectable(servicesMock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/"+val), "org.freedesktop.DBus.Introspectable"); err != nil {
			return fmt.Errorf("could not export introspectable for service mock: %w", err)
		}
		if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Services/"+val), "org.freedesktop.DBus.Properties"); err != nil {
			return fmt.Errorf("could not export Dbus properties mock: %w", err)
		}
	}

	if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "com.canonical.UbuntuAdvantage.Manager"); err != nil {
		return fmt.Errorf("could not export manager mock: %w", err)
	}
	if err := conn.Export(introspect.Introspectable(managerMock), dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "org.freedesktop.DBus.Introspectable"); err != nil {
		return fmt.Errorf("could not export introspectable for manager mock: %w", err)
	}
	if err := conn.Export(a, dbus.ObjectPath("/com/canonical/UbuntuAdvantage/Manager"), "org.freedesktop.DBus.Properties"); err != nil {
		return fmt.Errorf("could not export Dbus properties mock: %w", err)
	}

	reply, err := conn.RequestName("com.canonical.UbuntuAdvantage", dbus.NameFlagDoNotQueue)
	if err != nil {
		return fmt.Errorf("failed to acquire Ubuntu Advantage name on local system bus: %w", err)
	}
	if reply != dbus.RequestNameReplyPrimaryOwner {
		return fmt.Errorf("failed to acquire Ubuntu Advantage name on local system bus: name is already taken")
	}

	return nil
}
