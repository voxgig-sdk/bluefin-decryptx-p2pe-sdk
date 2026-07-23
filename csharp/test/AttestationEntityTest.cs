// attestation entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinDecryptxP2peSdk.Test;

public class AttestationEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinDecryptxP2peSDK.TestSDK(null, null);
        var ent = testsdk.Attestation();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = AttestationBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "list", "load" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "attestation." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var attestationRef01Ent = client.Attestation();
        var attestationRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "attestation")),
            "attestation_ref01"));

        var attestationRef01DataResult = attestationRef01Ent.Create(attestationRef01Data, null);
        attestationRef01Data = Helpers.ToMapAny(attestationRef01DataResult);
        Assert.True(attestationRef01Data != null, "expected create result to be a map");
        Assert.True(attestationRef01Data!["id"] != null, "expected created entity to have an id");

        // LIST
        var attestationRef01Match = new Dictionary<string, object?>();

        var attestationRef01ListResult = attestationRef01Ent.List(attestationRef01Match, null);
        var attestationRef01List = attestationRef01ListResult as List<object?>;
        Assert.True(attestationRef01List != null,
            $"expected list result to be a list, got {attestationRef01ListResult?.GetType()}");

        var attestationRef01ListFound = StructUtils.Select(
            TestRunner.EntityListToData(attestationRef01List!),
            new Dictionary<string, object?> { ["id"] = attestationRef01Data!["id"] });
        Assert.False(StructUtils.IsEmpty(attestationRef01ListFound),
            "expected to find created entity in list");

        // LOAD
        var attestationRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = attestationRef01Data!["id"],
        };
        var attestationRef01DataDt0Loaded = attestationRef01Ent.Load(attestationRef01MatchDt0, null);
        var attestationRef01DataDt0LoadResult = Helpers.ToMapAny(attestationRef01DataDt0Loaded);
        Assert.True(attestationRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(attestationRef01DataDt0LoadResult!["id"], attestationRef01Data["id"]),
            "expected load result id to match");

    }

    [Fact]
    public async Task Stream()
    {
        var setup = AttestationBasicSetup(new Dictionary<string, object?>
        {
            ["feature"] = new Dictionary<string, object?>
            {
                ["streaming"] = new Dictionary<string, object?> { ["active"] = true },
            },
        });
        if (setup.Live)
        {
            return; // unit mode only - streams the seeded fixture data
        }

        var ent = setup.Client.Attestation();
        var match = new Dictionary<string, object?>();

        // Materialised list result for the same op.
        var listed = ent.List(match, null) as List<object?> ?? new List<object?>();

        // stream("list") yields items via the streaming feature's iterator.
        var streamed = new List<object?>();
        await foreach (var item in ent.Stream("list", match, null))
        {
            streamed.Add(item);
        }
        Assert.True(streamed.Count > 0, "expected stream to yield items");
        Assert.Equal(listed.Count, streamed.Count);

        // Fallback: with streaming inactive, stream still yields the
        // materialised items.
        var setup2 = AttestationBasicSetup(null);
        var ent2 = setup2.Client.Attestation();
        var streamed2 = new List<object?>();
        await foreach (var item in ent2.Stream("list", match, null))
        {
            streamed2.Add(item);
        }
        Assert.Equal(listed.Count, streamed2.Count);
    }

    private static EntityTestSetup AttestationBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "attestation",
            "AttestationTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse attestation test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinDecryptxP2peSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "attestation01", "attestation02", "attestation03" },
            new Dictionary<string, object?>
            {
                ["`$PACK`"] = new List<object?>
                {
                    "",
                    new Dictionary<string, object?>
                    {
                        ["`$KEY`"] = "`$COPY`",
                        ["`$VAL`"] = new List<object?> { "`$FORMAT`", "upper", "`$COPY`" },
                    },
                },
            });

        // Detect ENTID env override before EnvOverride consumes it. When
        // live mode is on without a real override, the basic test runs
        // against synthetic IDs from the fixture and 4xx's.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID"] = idmap,
            ["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFINDECRYPTXP_PE_TEST_ATTESTATION_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFINDECRYPTXP_PE_TEST_LIVE"], "TRUE"))
        {
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFINDECRYPTXP_PE_APIKEY"],
                },
                extra,
            });
            client = new BluefinDecryptxP2peSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFINDECRYPTXP_PE_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}
