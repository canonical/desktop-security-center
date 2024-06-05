package main

import (
	"testing"
	"fmt"
    "github.com/stretchr/testify/require"
    "net/http"
    "strings"
    "io"
)

const (
    appPermissionsEnabled = `
{
  "type": "sync",
  "status-code": 200,
  "status": "OK",
  "result":
    {
      "experimental":
        {
          "apparmor-prompting": %v
        }
    }
}
`
)

type Function int
const (
    DisableAppPermissions Function = iota
    EnableAppPermissions
    IsAppPermissionsEnabled
    AreCustomRulesApplied
    RemoveAppPermission
    ListOfPersionalFolderRules
)

type ClientMock struct {
    wantError bool
    isEnabled bool
    testedFun Function
}
func (c *ClientMock) Do(req *http.Request) (*http.Response, error) {
    if c.wantError {
        return &http.Response{}, fmt.Errorf("Error")
    }

    switch c.testedFun {
    case IsAppPermissionsEnabled:
        r := fmt.Sprintf(appPermissionsEnabled, c.isEnabled)
        return &http.Response{Body: io.NopCloser(strings.NewReader(r))}, nil
    case DisableAppPermissions:
        fallthrough
    case EnableAppPermissions:
        s, err := io.ReadAll(req.Body)
        if err != nil {
            return nil, fmt.Errorf("Error %w", err)
        }
        if string(s) == `{"experimental.apparmor-prompting":false}` ||
           string(s) == `{"experimental.apparmor-prompting":true}` {
            return &http.Response{ Body: io.NopCloser(strings.NewReader("{}"))}, nil
        } else {
            return &http.Response{}, fmt.Errorf("Error")
        }
    }
    panic("Not reached")
}

func testToggleAppPermissions(t *testing.T, f Function) {
    tt := []struct {
        name     string
        wantError  bool
        testedFun Function
    }{
        {
            name: "valid response",
            wantError: false,
            testedFun: f,
        },
        {
            name: "invalid response",
            wantError: true,
            testedFun: f,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantError: tc.wantError,
                testedFun: tc.testedFun,
            }
            var err error
            switch tc.testedFun {
            case EnableAppPermissions:
                _, err = NewPermissionServer(client).EnableAppPermissions(ctx, nil)
            case DisableAppPermissions:
                _, err = NewPermissionServer(client).DisableAppPermissions(ctx, nil)
            }
            if tc.wantError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
            }
        })
    }
}

func TestEnableAppPermissions(t *testing.T) {
    testToggleAppPermissions(t, EnableAppPermissions)
}
func TestDisableAppPermissions(t *testing.T) {
    testToggleAppPermissions(t, DisableAppPermissions)
}
func TestIsAppPermissionsEnabled(t *testing.T) {
    tt := []struct {
        name     string
        wantError  bool
        isEnabled  bool
    }{
        {
            name: "yes",
            isEnabled: true,
            wantError: false,
        },
        {
            name: "no",
            isEnabled: false,
            wantError: false,
        },
        {
            name: "error",
            wantError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantError: tc.wantError,
                testedFun: IsAppPermissionsEnabled,
                isEnabled: tc.isEnabled,
            }
            r, err := NewPermissionServer(client).IsAppPermissionsEnabled(ctx, nil)
            if tc.wantError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
                require.Equal(t, tc.isEnabled, r.GetValue())
            }
        })
    }
}
/*
func TestAreCustomRulesApplied(t *testing.T) {
    tt := []struct {
        name     string
        wantError  bool
        isEnabled  bool
    }{
        {
            name: "yes",
            isEnabled: true,
            wantError: false,
        },
        {
            name: "no",
            isEnabled: false,
            wantError: false,
        },
        {
            name: "error",
            wantError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantError: tc.wantError,
                testedFun: AreCustomRulesApplied,
            }
            var err error
            _, err = NewPermissionServer(client).AreCustomRulesApplied(ctx, nil)
            if tc.wantError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
            }
        })
    }
}
*/
