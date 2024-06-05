package main

import (
	"testing"
	"fmt"
    "github.com/stretchr/testify/require"
    "net/http"
    "strings"
    "io"
)

type ClientMock struct {
    wantError bool
}
func (c *ClientMock) Do(req *http.Request) (*http.Response, error) {
    if c.wantError {
        return &http.Response{}, fmt.Errorf("Error")
    }
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

func testToggleAppPermissions(t *testing.T, enable bool) {
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
                client := &ClientMock{wantError: tc.wantError}
                var err error
                if enable {
                    _, err = NewPermissionServer(client).EnableAppPermissions(ctx, nil)
                } else {
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
