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
    "/home/ubuntu/.config/fobar": []string{"hello"},
    "/home/ubuntu/Documents/fobar": []string{"hello"},
}
const doError = "Do error requested"

type ClientMock struct {
    wantDoError bool
    wantApiError bool
    isEnabled bool
}
func (c *ClientMock) Do(req *http.Request) (*http.Response, error) {
    if c.wantDoError {
        return &http.Response{}, fmt.Errorf(doError)
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
        if /*c.wantApiError*/false {
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
        wantDoError  bool
    }{
        {
            name: "valid response",
            wantDoError: false,
        },
        {
            name: "invalid response",
            wantDoError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantDoError: tc.wantDoError,
            }
            var err error
            switch toggleTo {
            case true:
                _, err = NewPermissionServer(client).EnableAppPermissions(ctx, nil)
            case false:
                _, err = NewPermissionServer(client).DisableAppPermissions(ctx, nil)
            }
            if tc.wantDoError {
                require.ErrorContains(t, err, doError)
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
        wantDoError  bool
        isEnabled  bool
    }{
        {
            name: "yes",
            isEnabled: true,
            wantDoError: false,
        },
        {
            name: "no",
            isEnabled: false,
            wantDoError: false,
        },
        {
            name: "error",
            wantDoError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantDoError: tc.wantDoError,
                isEnabled: tc.isEnabled,
            }
            r, err := NewPermissionServer(client).IsAppPermissionsEnabled(ctx, nil)
            if tc.wantDoError {
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
        wantDoError  bool
        isEnabled  bool
    }{
        {
            name: "yes",
            isEnabled: true,
            wantDoError: false,
        },
        {
            name: "no",
            isEnabled: false,
            wantDoError: false,
        },
        {
            name: "error",
            wantDoError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantDoError: tc.wantDoError,
                isEnabled: tc.isEnabled,
            }
            var err error
            r, err := NewPermissionServer(client).AreCustomRulesApplied(ctx, nil)
            if tc.wantDoError {
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
        wantDoError  bool
        isEnabled  bool
    }{
        {
            name: "yes",
            isEnabled: true,
            wantDoError: false,
        },
        {
            name: "error",
            wantDoError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantDoError: tc.wantDoError,
                isEnabled: tc.isEnabled,
            }
            var err error
            r, err := NewPermissionServer(client).ListPersonalFoldersPermissions(ctx, nil)
            if tc.wantDoError {
                fmt.Println(">>>", err)
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
        wantDoError  bool
        isEnabled  bool
        wantApiError bool
    }{
        {
            name: "Good",
            isEnabled: true,
            wantDoError: false,
            wantApiError: false,
        },
        {
            name: "Not found",
            isEnabled: true,
            wantDoError: false,
            wantApiError: true,
        },
        {
            name: "Unknown error",
            wantDoError: true,
        },
    }
    for i := range tt {
        tc := tt[i]
        t.Run(tc.name, func(t *testing.T) {
            t.Parallel()
            client := &ClientMock{
                wantDoError: tc.wantDoError,
                wantApiError: tc.wantApiError,
                isEnabled: tc.isEnabled,
            }
            req := &pb.RemoveAppPermissionRequest{
                Removepath: "/home/ubuntu/.foo",
                Removesnap: "hello",
            }
            _, err := NewPermissionServer(client).RemoveAppPermission(ctx, req)
            if tc.wantDoError {
                require.Error(t, err)
            } else if /*tc.wantApiError*/false {
                require.ErrorContains(t, err, "gave code")
            } else {
                require.NoError(t, err)
            }
        })
    }
}
