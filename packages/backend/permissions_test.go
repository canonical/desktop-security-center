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
          "apparmor-prompting": true
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
)

type ClientMock struct {
    wantError bool
    testedFun Function
}
func (c *ClientMock) Do(req *http.Request) (*http.Response, error) {
    if c.wantError {
        return &http.Response{}, fmt.Errorf("Error")
    }

    switch c.testedFun {
    case IsAppPermissionsEnabled:
        return &http.Response{Body: io.NopCloser(strings.NewReader(appPermissionsEnabled))},
        nil
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
        testedFun Function
    }{
        {
            name: "yes",
            isEnabled: true,
            testedFun: IsAppPermissionsEnabled,
            wantError: false,
        },
        {
            name: "no",
            isEnabled: false,
            testedFun: IsAppPermissionsEnabled,
            wantError: false,
        },
        {
            name: "error",
            testedFun: IsAppPermissionsEnabled,
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
            }
            var err error
            _, err = NewPermissionServer(client).IsAppPermissionsEnabled(ctx, nil)
            if tc.wantError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
            }
        })
    }
}
