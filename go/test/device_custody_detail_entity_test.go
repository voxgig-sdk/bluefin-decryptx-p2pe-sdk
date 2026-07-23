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

func TestDeviceCustodyDetailEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.DeviceCustodyDetail(nil)
		if ent == nil {
			t.Fatal("expected non-nil DeviceCustodyDetailEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := device_custody_detailBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "device_custody_detail." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		deviceCustodyDetailRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.device_custody_detail", setup.data)))
		var deviceCustodyDetailRef01Data map[string]any
		if len(deviceCustodyDetailRef01DataRaw) > 0 {
			deviceCustodyDetailRef01Data = core.ToMapAny(deviceCustodyDetailRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = deviceCustodyDetailRef01Data

		// LOAD
		deviceCustodyDetailRef01Ent := client.DeviceCustodyDetail(nil)
		deviceCustodyDetailRef01MatchDt0 := map[string]any{
			"id": deviceCustodyDetailRef01Data["id"],
		}
		deviceCustodyDetailRef01DataDt0Loaded, err := deviceCustodyDetailRef01Ent.Load(deviceCustodyDetailRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		deviceCustodyDetailRef01DataDt0LoadResult := core.ToMapAny(deviceCustodyDetailRef01DataDt0Loaded)
		if deviceCustodyDetailRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if deviceCustodyDetailRef01DataDt0LoadResult["id"] != deviceCustodyDetailRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func device_custody_detailBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "device_custody_detail", "DeviceCustodyDetailTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read device_custody_detail test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse device_custody_detail test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"device_custody_detail01", "device_custody_detail02", "device_custody_detail03", "device01", "device02", "device03", "device_type01", "serial_number01"},
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
	entidEnvRaw := os.Getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID": idmap,
		"BLUEFINDECRYPTXP_PE_TEST_LIVE":      "FALSE",
		"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN":   "FALSE",
		"BLUEFINDECRYPTXP_PE_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"])
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
