package main

import (
	"context"
	"testing"
	"fmt"
	pb "github.com/canonical/desktop-security-center/packages/proto"
	"github.com/canonical/desktop-security-center/packages/testutils"
	"github.com/godbus/dbus/v5"
	"github.com/godbus/dbus/v5/introspect"
    "github.com/stretchr/testify/require"
	"os"
	"os/exec"
)

type prodbus struct{}
const (
    waitJson = `{
              "_schema_version": "v1",
              "data": {
                "attributes": {
                  "contract_token": "%s"
                },
                "meta": {
                  "environment_vars": []
                },
                "type": "MagicAttachInitiate"
              },
              "errors": [%s],
              "result": "%s",
              "version": "30.1",
              "warnings": []
            }`
    initiateJson = `{
              "_schema_version": "v1",
              "data": {
                "attributes": {
                  "expires_in": %d,
                  "token": "%s",
                  "user_code": "%s"
                },
                "meta": {
                  "environment_vars": []
                },
                "type": "MagicAttachInitiate"
              },
              "errors": [%s],
              "result": "%s",
              "version": "30.1",
              "warnings": []
            }`
)

/* Variables for adjusting test results */
var getResponseEnabled string
var getResponseAttached string
var failEnable bool
var failDisable bool

var manager *Manager
var ctx context.Context

func TestWaitProMagicFlow(t *testing.T) {
    cases := []struct {
        name string
        errors string
        contract string
        result string
        wantError bool
    }{
        {
            name: "Confirmed contract",
            contract: "Ca1xQ10aB9Xpp",
            result: "success",
        },
        {
            name: "Invalid response, broken JSON",
            wantError: true,
            contract: ",\"\"{{{",
            result: "success",
        },
        {
            name: "Invalid response, has failure",
            wantError: true,
            result: "failure",
            errors: `{
                        "msg": "Failed to connect to authentication server",
                        "code": "connectivity-error",
                        "meta": {}
                     }`,
        },
    }
    for _, tc := range cases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
            execMocker := func(name string, arg ...string) *exec.Cmd {
                ret := fmt.Sprintf(waitJson, tc.contract, tc.errors, tc.result)
                return exec.Command("printf", "%s", ret)
            }
            manager.proServer.execer = execMocker
            r, err := manager.proServer.WaitProMagicFlow(ctx, nil)
            if tc.wantError {
                require.Error(t, err, "Expected error, got nothing.")
            }
            if !tc.wantError {
                require.NoErrorf(t, err, "Expected no error, got %w", err)
                got := r.GetToken()
                want := tc.contract
                require.Equalf(t, want, got, "Expected token %s, got %s", want, got)
            }
        })
    }
}

func TestInitiateProMagicFlow(t *testing.T) {
    cases := []struct {
        name string
        pin string
        expiresIn int64
        errors string
        reqId string
        result string
        wantError bool
    }{
        {
            name: "Valid request",
            pin: "89T4SR",
            expiresIn: 600,
            reqId: "Ca1xQ10aB9Xpp",
            result: "success",
        },
        {
            name: "Invalid response, broken JSON",
            wantError: true,
            pin: ",\"\"{{{",
            result: "success",
        },
        {
            name: "Invalid response, has failure",
            wantError: true,
            result: "failure",
            errors: `{
                        "msg": "Failed to connect to authentication server",
                        "code": "connectivity-error",
                        "meta": {}
                     }`,
        },
    }


    for _, tc := range cases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
            execMocker := func(name string, arg ...string) *exec.Cmd {
                ret := fmt.Sprintf(initiateJson, tc.expiresIn, tc.reqId, tc.pin, tc.errors, tc.result)
                return exec.Command("printf", "%s", ret)
            }

            manager.proServer.execer = execMocker
            r, err := manager.proServer.InitiateProMagicFlow(ctx, nil)
            if tc.wantError {
                require.Error(t, err, "Expected error, got nothing.")
            }
            if !tc.wantError {
                require.NoErrorf(t, err, "Expect no error, got %w", err)
                wantPin := tc.pin
                wantExpiresIn := tc.expiresIn
                gotPin := r.GetPin()
                gotExpiresIn := r.GetExpiresIn()
                require.Equalf(t, wantPin, gotPin, "Expected pin %s, got %s",
                               wantPin, gotPin)
                require.Equalf(t, wantExpiresIn, gotExpiresIn,
                               "Expected expiresIn %s, got %s",
                               wantExpiresIn, gotExpiresIn)
            }
        })
    }
}

func TestAttachProToMachine(t *testing.T) {
	t.Cleanup(testutils.StartLocalSystemBus())

	req := new(pb.AttachRequest)
	req.Token = "incorrect"
	_, err := manager.proServer.AttachProToMachine(ctx, req)
    require.Error(t, err, "Expected error for incorrect token, got nothing.")

	req.Token = "correct"
	_, err = manager.proServer.AttachProToMachine(ctx, req)
    require.NoErrorf(t, err, "Expected no error for correct token, got %w.", err)
}

func TestDisableService(t *testing.T) {
    failDisable = false
    _, err := manager.proServer.DisableEsmApps(ctx, nil)
    require.NoError(t, err, err)
    _, err = manager.proServer.DisableInfra(ctx, nil)
    require.NoError(t, err, err)
    _, err = manager.proServer.DisableKernelLivePatch(ctx, nil)
    require.NoError(t, err, err)

    failDisable = true
    _, err = manager.proServer.DisableEsmApps(ctx, nil)
    require.Error(t, err, "I expected an error, but didn't get one")
    _, err = manager.proServer.DisableInfra(ctx, nil)
    require.Error(t, err, "I expected an error, but didn't get one")
    _, err = manager.proServer.DisableKernelLivePatch(ctx, nil)
    require.Error(t, err, "I expected an error, but didn't get one")
}

func TestEnableService(t *testing.T) {
    failEnable = false
    _, err := manager.proServer.EnableEsmApps(ctx, nil)
    require.NoError(t, err, err)
    _, err = manager.proServer.EnableInfra(ctx, nil)
    require.NoError(t, err, err)
    _, err = manager.proServer.EnableKernelLivePatch(ctx, nil)
    require.NoError(t, err, err)

    failEnable = true
    _, err = manager.proServer.EnableEsmApps(ctx, nil)
    require.Error(t, err, "I expected an error, but didn't get one")
    _, err = manager.proServer.EnableInfra(ctx, nil)
    require.Error(t, err, "I expected an error, but didn't get one")
    _, err = manager.proServer.EnableKernelLivePatch(ctx, nil)
    require.Error(t, err, "I expected an error, but didn't get one")
}

func TestIsMachineProAttached(t *testing.T) {
	getResponseAttached = "true"
	i, err := manager.proServer.IsMachineProAttached(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	getResponseAttached = "false"
	i, err = manager.proServer.IsMachineProAttached(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	getResponseAttached = "error"
	_, err = manager.proServer.IsMachineProAttached(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")
}


func TestIsServiceEnabled(t *testing.T) {
	getResponseAttached = "true"
	getResponseEnabled = "disabled"
	i, err := manager.proServer.IsEsmInfraEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	i, err = manager.proServer.IsUsgEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	i, err = manager.proServer.IsFipsEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	getResponseEnabled = "enabled"
	i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	i, err = manager.proServer.IsUsgEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	i, err = manager.proServer.IsFipsEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	getResponseEnabled = "error"
	i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")

	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")

	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")

	i, err = manager.proServer.IsFipsEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")

	i, err = manager.proServer.IsUsgEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")
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

func (a prodbus) Get(interfaceName string, propertyName string) (interface{}, *dbus.Error) {
    switch propertyName {
    case "Attached":
        switch getResponseAttached {
        case "true":
            return true, nil
        case "false":
            return false, nil
        }
    case "Status":
        switch getResponseEnabled {
        case "enabled":
            return "enabled", nil
        case "disabled":
            return "disabled", nil
        }
    }
	return "", dbus.NewError(
		"com.canonical.UbuntuAdvantage.Error.GetError",
		[]interface{}{"error requested in Get mocked method."},
	)
}

func (a prodbus) Disable() *dbus.Error {
    if failDisable {
        return dbus.NewError(
            "com.canonical.UbuntuAdvantage.Error.DisableError",
            []interface{}{"error requested in Disable mocked method"},
        )
    }
    return nil
}

func (a prodbus) Enable() *dbus.Error {
    if failEnable {
        return dbus.NewError(
            "com.canonical.UbuntuAdvantage.Error.EnableError",
            []interface{}{"error requested in Enable mocked method"},
        )
    }
    return nil
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
        "fips",
        "usg",
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
