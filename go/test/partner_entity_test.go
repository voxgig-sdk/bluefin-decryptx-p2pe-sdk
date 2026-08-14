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

func TestPartnerEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.Partner(nil)
		if ent == nil {
			t.Fatal("expected non-nil PartnerEntity")
		}
	})

	// Feature #4: the entity Stream(action, ...) method runs the op pipeline and
	// returns a channel over result items. With the streaming feature active it
	// yields the feature's incremental output; otherwise it falls back to the
	// materialised list so Stream always yields.
	t.Run("stream", func(t *testing.T) {
		seed := map[string]any{
			"entity": map[string]any{
				"partner": map[string]any{
					"s1": map[string]any{"id": "s1"},
					"s2": map[string]any{"id": "s2"},
					"s3": map[string]any{"id": "s3"},
				},
			},
		}

		// Fallback: streaming inactive -> yields the materialised list items.
		base := sdk.TestSDK(seed, nil)
		var seen []any
		for item := range base.Partner(nil).Stream("list", nil, nil) {
			seen = append(seen, item)
		}
		if len(seen) != 3 {
			t.Fatalf("expected 3 streamed items, got %d", len(seen))
		}

		// Inbound: streaming active -> yields each item from the feature iterator.
		hasStreaming := false
		if fm, ok := core.SharedConfig()["feature"].(map[string]any); ok {
			_, hasStreaming = fm["streaming"]
		}
		if hasStreaming {
			streamSdk := sdk.TestSDK(seed, map[string]any{
				"feature": map[string]any{"streaming": map[string]any{"active": true}},
			})
			var got []any
			for item := range streamSdk.Partner(nil).Stream("list", nil, nil) {
				if sub, ok := item.([]any); ok {
					got = append(got, sub...)
				} else {
					got = append(got, item)
				}
			}
			if len(got) != 3 {
				t.Fatalf("expected 3 items via streaming feature, got %d", len(got))
			}
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := partnerBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create", "list", "load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "partner." + _op, _mode); _shouldSkip {
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
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		partnerRef01Ent := client.Partner(nil)
		partnerRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "partner"}, setup.data), "partner_ref01"))

		partnerRef01DataResult, err := partnerRef01Ent.Create(partnerRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		partnerRef01Data = core.ToMapAny(entityData(partnerRef01DataResult))
		if partnerRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}
		if partnerRef01Data["id"] == nil {
			t.Fatal("expected created entity to have an id")
		}

		// LIST
		partnerRef01Match := map[string]any{}

		partnerRef01ListResult, err := partnerRef01Ent.List(partnerRef01Match, nil)
		if err != nil {
			t.Fatalf("list failed: %v", err)
		}
		partnerRef01List, partnerRef01ListOk := partnerRef01ListResult.([]any)
		if !partnerRef01ListOk {
			t.Fatalf("expected list result to be an array, got %T", partnerRef01ListResult)
		}

		foundItem := vs.Select(entityListToData(partnerRef01List), map[string]any{"id": partnerRef01Data["id"]})
		if vs.IsEmpty(foundItem) {
			t.Fatal("expected to find created entity in list")
		}

		// LOAD
		partnerRef01MatchDt0 := map[string]any{
			"id": partnerRef01Data["id"],
		}
		partnerRef01DataDt0Loaded, err := partnerRef01Ent.Load(partnerRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		partnerRef01DataDt0LoadResult := core.ToMapAny(entityData(partnerRef01DataDt0Loaded))
		if partnerRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if partnerRef01DataDt0LoadResult["id"] != partnerRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func partnerBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "partner", "PartnerTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read partner test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse partner test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"partner01", "partner02", "partner03"},
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
	entidEnvRaw := os.Getenv("BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID": idmap,
		"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE":      "FALSE",
		"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN":   "FALSE",
		"BLUEFIN_DECRYPTX_P2PE_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_PARTNER_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["BLUEFIN_DECRYPTX_P2PE_APIKEY"],
			},
			extra,
		})
		client = sdk.NewBluefinDecryptxP2peSDK(core.ToMapAny(mergedOpts))
	}

	live := env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
