package main

import (
	"testing"
	"fmt"
    "github.com/stretchr/testify/require"
    "net/http"
    "strings"
    "io"
    "reflect"
)

const (
    appPermissionsJson = `
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
    customRulesJson = `
{"type":"sync","status-code":200,"status":"OK","result":[{"id":"C7JGESQZTWTSS===","timestamp":"2024-05-24T09:21:18.378444585Z","user":1000,"snap":"simple-notepad","interface":"home","constraints":{"path-pattern":"/home/ubuntu/.config/fobar","permissions":["read","write"]},"outcome":"allow","lifespan":"forever","expiration":"0001-01-01T00:00:00Z"},{"id":"C7JHBW7E7Q7PO===","timestamp":"2024-05-24T13:48:17.723465463Z","user":1000,"snap":"simple-notepad","interface":"home","constraints":{"path-pattern":"/home/ubuntu/Documents/fobar","permissions":["read","write"]},"outcome":"allow","lifespan":"forever","expiration":"0001-01-01T00:00:00Z"}]}
`
    noCustomRulesJson = `
{"type":"sync","status-code":200,"status":"OK","result":[]}
`
)

var listOfPersonalFoldersPerm = map[string][]string {
    "/home/ubuntu/.config/fobar": []string{"simple-notepad"},
    "/home/ubuntu/Documents/fobar": []string{"simple-notepad"},
}

type Function int
const (
    DisableAppPermissions Function = iota
    EnableAppPermissions
    IsAppPermissionsEnabled
    AreCustomRulesApplied
    RemoveAppPermission
    ListPersonalFoldersPermissions
)

type ClientMock struct {
    wantError bool
    isEnabled bool
    testedFun Function
}
func (c *ClientMock) Do(req *http.Request) (*http.Response, error) {
    if c.wantError {
        return &http.Response{}, fmt.Errorf("Error requested")
    }

    switch req.URL.String() {
    case confApi:
        switch req.Method {
        case "PUT":
            si, err := io.ReadAll(req.Body)
            s := string(si)
            if err != nil {
                return nil, fmt.Errorf("Malformed request body, %s. %w", s, err)
            }
            if s == fmt.Sprintf(promptBody, "false") ||
               s == fmt.Sprintf(promptBody, "true") {
                return &http.Response{
                   Body: io.NopCloser(strings.NewReader("{}")),
               }, nil
            } else {
                return &http.Response{}, fmt.Errorf("Error")
            }
        case "GET":
            r := fmt.Sprintf(appPermissionsJson, c.isEnabled)
            return &http.Response{Body: io.NopCloser(strings.NewReader(r))}, nil
        }
    case rulesApi:
        switch req.Method {
        case "PUT":
            fallthrough
        case "GET":
            var r string
            if c.isEnabled {
                r = customRulesJson
            } else {
                r = noCustomRulesJson
            }
            return &http.Response{Body: io.NopCloser(strings.NewReader(r))}, nil
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
                isEnabled: tc.isEnabled,
            }
            var err error
            r, err := NewPermissionServer(client).AreCustomRulesApplied(ctx, nil)
            if tc.wantError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
                require.Equal(t, tc.isEnabled, r.GetValue())
            }
        })
    }
}
func TestListPersonalFoldersPermissions(t *testing.T) {
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
                testedFun: ListPersonalFoldersPermissions,
                isEnabled: tc.isEnabled,
            }
            var err error
            r, err := NewPermissionServer(client).ListPersonalFoldersPermissions(ctx, nil)
            if tc.wantError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
                /* This is frustrating. GRPC converts our map[string][]string
                 * into a map[string]*__.Array. We cannot compare that AFAIK,
                 * so first we need to reencode that to map[string][]string
                 */
                m := make(map[string][]string)
                for idx, v := range(r.GetPathsnaps()) {
                    m[idx] = v.GetE()
                }
                require.True(t, reflect.DeepEqual(m, listOfPersonalFoldersPerm))
            }
        })
    }
}
