package main

import (
	"testing"
	"fmt"
    "github.com/stretchr/testify/require"
    "net/http"
    "strings"
    "io"
    "reflect"
    pb "github.com/canonical/desktop-security-center/packages/proto"
)


var listOfPersonalFoldersPerm = map[string][]string {
    "/home/ubuntu/.config/fobar": []string{"simple-notepad"},
    "/home/ubuntu/Documents/fobar": []string{"simple-notepad"},
}

type ClientMock struct {
    wantError bool
    wantApiError bool
    isEnabled bool
}
func (c *ClientMock) Do(req *http.Request) (*http.Response, error) {
    if c.wantError {
        return &http.Response{}, fmt.Errorf("Error requested")
    }

    url := req.URL.String()
    if url == confApi {
        switch req.Method {
        // DisableAppPermissions, EnableAppPermissions
        case "PUT":
            si, err := io.ReadAll(req.Body)
            s := string(si)
            if err != nil {
                return nil, fmt.Errorf("Malformed request body, %s. %w", s, err)
            }
            if s == fmt.Sprintf(promptBody, "false") ||
               s == fmt.Sprintf(promptBody, "true") {
                return &http.Response{
                   Body: io.NopCloser(strings.NewReader(enablePermissionsJson)),
               }, nil
            } else {
                return &http.Response{}, fmt.Errorf("Error")
            }
        // IsAppPermissionsEnabled
        case "GET":
            r := fmt.Sprintf(appPermissionsJson, c.isEnabled)
            return &http.Response{Body: io.NopCloser(strings.NewReader(r))}, nil
        }
    // ListPersonalFoldersPermissions, AreCustomRulesApplied
    } else if url == rulesApi && req.Method == "GET" {
        var r string
        if c.isEnabled {
            r = customRulesJson
        } else {
            r = noCustomRulesJson
        }
        return &http.Response{Body: io.NopCloser(strings.NewReader(r))}, nil
    // RemoveAppPermission
    } else if strings.HasPrefix(url, rulesApi) && req.Method == "POST" {
        if c.wantApiError {
            return &http.Response{Body: io.NopCloser(strings.NewReader(idNotFoundJson))}, nil
        } else {
            return &http.Response{Body: io.NopCloser(strings.NewReader(idRemoved))}, nil
        }
    }
    panic("Not reached")
}

func testToggleAppPermissions(t *testing.T, toggleTo bool) {
    tt := []struct {
        name     string
        wantError  bool
    }{
        {
            name: "valid response",
            wantError: false,
        },
        {
            name: "invalid response",
            wantError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantError: tc.wantError,
            }
            var err error
            switch toggleTo {
            case true:
                _, err = NewPermissionServer(client).EnableAppPermissions(ctx, nil)
            case false:
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
    testToggleAppPermissions(t, true)
}
func TestDisableAppPermissions(t *testing.T) {
    testToggleAppPermissions(t, false)
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
func TestRemoveAppPermission(t *testing.T) {
    tt := []struct {
        name     string
        wantError  bool
        isEnabled  bool
        wantApiError bool
    }{
        {
            name: "yes",
            isEnabled: true,
            wantError: false,
            wantApiError: false,
        },
        {
            name: "no",
            isEnabled: true,
            wantError: false,
            wantApiError: true,
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
                wantApiError: tc.wantApiError,
                isEnabled: tc.isEnabled,
            }
            req := &pb.RemoveAppPermissionRequest{
                Removepath: "/home/ubuntu/.foo",
                Removesnap: "hello",
            }
            _, err := NewPermissionServer(client).RemoveAppPermission(ctx, req)
            if tc.wantError || tc.wantApiError {
                require.Error(t, err)
            } else {
                require.NoError(t, err)
            }
        })
    }
}
