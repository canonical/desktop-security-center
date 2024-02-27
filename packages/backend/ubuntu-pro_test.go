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
    errorJson = `{
                   "msg": "Failed to connect to authentication server",
                   "code": "connectivity-error",
                   "meta": {}
                 }`
)

/* Variables for adjusting test results */
var getResponse string
var failEnable bool
var failDisable bool

var manager *Manager
var ctx context.Context

type mockProExec struct {
    wantError bool
    networkError bool
}

func (m *mockProExec) execInitiateMocker(_ string, _ ...string) *exec.Cmd {
    var ret string
    if m.wantError {
        if m.networkError {
            ret = fmt.Sprintf(initiateJson, 0, "", errorJson, "", "failure")
        } else {
            ret = fmt.Sprintf(initiateJson, 0, "", ",\"\"{{{", "", "success")
        }
    } else {
        ret = fmt.Sprintf(initiateJson, 600, "reqid", "89T4SR", "", "success")
    }
    return exec.Command("printf", "%s", ret)
}

func (m *mockProExec) execWaitMocker(_ string, _ ...string) *exec.Cmd {
    var ret string
    if m.wantError {
        if m.networkError {
            ret = fmt.Sprintf(waitJson, "", errorJson, "failure")
        } else {
            ret = fmt.Sprintf(waitJson, ",\"\"{{{", "", "success")
        }
    } else {
        ret = fmt.Sprintf(waitJson, "contracttoken", "", "success")
    }
    return exec.Command("printf", "%s", ret)
}

func TestWaitProMagicFlow(t *testing.T) {
    cases := []struct {
        name string
        networkError bool
        wantError bool
    }{
        {
            name: "Confirmed contract",
            networkError: false,
            wantError: false,
        },
        {
            name: "Invalid response, broken JSON",
            networkError: false,
            wantError: true,
        },
        {
            name: "Invalid response, API returned error",
            networkError: true,
            wantError: true,
        },
    }
    for _, tc := range cases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
            mocker := &mockProExec{
                wantError: tc.wantError,
                networkError: tc.networkError,
            }
            manager.proServer.execer = mocker.execWaitMocker
            r, err := manager.proServer.WaitProMagicFlow(ctx, nil)
            if tc.wantError {
                require.Error(t, err, "Expected error, got nothing.")
            }
            if !tc.wantError {
                require.NoErrorf(t, err, "Expected no error, got %w", err)
                got := r.GetToken()
                require.NotEmptyf(t, got, "Expected a token, got none")
            }
        })
    }
}

func TestInitiateProMagicFlow(t *testing.T) {
    cases := []struct {
        name string
        networkError bool
        wantError bool
    }{
        {
            name: "Valid request",
        },
        {
            name: "Invalid response, broken JSON",
            wantError: true,
        },
        {
            name: "Invalid response, API returned error",
            wantError: true,
            networkError: true,
        },
    }

    for _, tc := range cases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			t.Parallel()
            mocker := &mockProExec{
                wantError: tc.wantError,
                networkError: tc.networkError,
            }
            manager.proServer.execer = mocker.execInitiateMocker
            r, err := manager.proServer.InitiateProMagicFlow(ctx, nil)
            if tc.wantError {
                require.Error(t, err, "Expected error, got nothing.")
            }
            if !tc.wantError {
                require.NoErrorf(t, err, "Expect no error, got %w", err)
                gotPin := r.GetPin()
                gotExpiresIn := r.GetExpiresIn()
                require.NotEmpty(t, gotPin, "Expected pin, got nothing")
                require.NotEmpty(t, gotExpiresIn, "Expected expiresIn %s, got nothing")
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
	getResponse = "true"
	i, err := manager.proServer.IsMachineProAttached(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	getResponse = "false"
	i, err = manager.proServer.IsMachineProAttached(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	getResponse = "error"
	_, err = manager.proServer.IsMachineProAttached(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")
}


func TestIsServiceEnabled(t *testing.T) {
	getResponse = "disabled"
	i, err := manager.proServer.IsEsmInfraEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), false)

	getResponse = "enabled"
	i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
    require.NoError(t, err, err)
    require.Equal(t, i.GetValue(), true)

	getResponse = "error"
	i, err = manager.proServer.IsEsmInfraEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")

	i, err = manager.proServer.IsEsmAppsEnabled(ctx, nil)
    require.Error(t, err, "Expected error, got nothing")

	i, err = manager.proServer.IsKernelLivePatchEnabled(ctx, nil)
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
