package main

import (
    "testing"
    "context"
    epb "google.golang.org/protobuf/types/known/emptypb"
)

func TestIsKernelLivePatchEnabled(t *testing.T) {
    ctx := context.Background()
    manager, _ := NewServerManager(ctx)
    a, _ := manager.proServer.IsKernelLivePatchEnabled(ctx, new(epb.Empty))
    if a.GetValue() != false {
         t.Fatalf("Fatal")
    }
}
    /*
	t.Parallel()

	tests := map[string]struct {
		locale       string
		emptyRequest bool

		wantError bool
	}{
		// Success case
		"Successcully sets a valid locale": {locale: "en_US.UTF-8"},

		// Error cases
		"Error on empty request":                {emptyRequest: true, wantError: true},
		"Error when locale is empty":            {locale: "", wantError: true},
		"Error when SetLocale returns an error": {locale: "locale_error", wantError: true},
		"Error on invalid locale":               {locale: "bad_locale", wantError: true},
        
	}
	for name, tc := range tests {
		tc := tc
		t.Run(name, func(t *testing.T) {
			t.Parallel()
			t.Cleanup(testutils.StartLocalSystemBus())

			client := newLocaleClient(t)

			var req *pb.SetLocaleRequest
			if !tc.emptyRequest {
				req = &pb.SetLocaleRequest{Locale: tc.locale}
			} else {
				req = nil
			}

			got, err := client.SetLocale(context.Background(), req)
			if tc.wantError {
				require.Error(t, err, "SetLocale should have returned an error, but did not")
				return
			}
			require.NoError(t, err, "SetLocale should not return an error, but did")
			require.NotNil(t, got, "SetLocale should return an empty not nil response when not in error")
		})
	}
}



func TestMain(m *testing.M) {
	testutils.InstallUpdateFlag()
	flag.Parse()

	defer testutils.StartLocalSystemBus()()

	conn, err := testutils.GetSystemBusConnection()

	if err != nil {
		slog.Error(fmt.Sprintf("Could not get system bus connection: %v", err))
		os.Exit(1)
	}

	err = testutils.ExportLocaleMock(conn)
	if err != nil {
		slog.Error(fmt.Sprintf("Could not export locale mock: %v", err))
		os.Exit(1)
	}

	m.Run()
}
*/
