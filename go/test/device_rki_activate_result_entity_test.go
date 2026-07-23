package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go"
	"github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/core"

	vs "github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/utility/struct"
)

func TestDeviceRkiActivateResultEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.DeviceRkiActivateResult(nil)
		if ent == nil {
			t.Fatal("expected non-nil DeviceRkiActivateResultEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := device_rki_activate_resultBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "device_rki_activate_result." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		deviceRkiActivateResultRef01Ent := client.DeviceRkiActivateResult(nil)
		deviceRkiActivateResultRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "device_rki_activate_result"}, setup.data), "device_rki_activate_result_ref01"))

		deviceRkiActivateResultRef01DataResult, err := deviceRkiActivateResultRef01Ent.Create(deviceRkiActivateResultRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		deviceRkiActivateResultRef01Data = core.ToMapAny(deviceRkiActivateResultRef01DataResult)
		if deviceRkiActivateResultRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func device_rki_activate_resultBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "device_rki_activate_result", "DeviceRkiActivateResultTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read device_rki_activate_result test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse device_rki_activate_result test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"device_rki_activate_result01", "device_rki_activate_result02", "device_rki_activate_result03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID": idmap,
		"BLUEFINDECRYPTXP_PE_TEST_LIVE":      "FALSE",
		"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN":   "FALSE",
		"BLUEFINDECRYPTXP_PE_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["BLUEFINDECRYPTXP_PE_APIKEY"],
			},
			extra,
		})
		client = sdk.NewBluefinDecryptxP2peSDK(core.ToMapAny(mergedOpts))
	}

	live := env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
