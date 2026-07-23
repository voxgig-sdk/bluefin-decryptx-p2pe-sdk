package voxgig.bluefindecryptxp2pesdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefindecryptxp2pesdk.core.Helpers;
import voxgig.bluefindecryptxp2pesdk.core.SdkEntity;
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK;
import voxgig.bluefindecryptxp2pesdk.utility.Json;
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class DeviceEntityTest {

  @Test
  public void instance() {
    BluefinDecryptxP2peSDK testsdk = BluefinDecryptxP2peSDK.testSDK();
    SdkEntity ent = testsdk.device(null);
    assertNotNull(ent, "expected non-null device entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = deviceBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "list", "load" }) {
      String reason = RunnerSupport.skipReason("entityOp", "device." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_ENTID JSON to run live");
    BluefinDecryptxP2peSDK client = setup.client;

    // CREATE
    SdkEntity deviceRef01Ent = client.device(null);
    Map<String, Object> deviceRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.device"), "device_ref01"));
    deviceRef01Data.put("serial_number", setup.idmap.get("serial_number01"));

    Object deviceRef01DataResult = deviceRef01Ent.create(deviceRef01Data, null);
    deviceRef01Data = Helpers.toMapAny(deviceRef01DataResult);
    assertNotNull(deviceRef01Data, "expected create result to be a map");
    assertNotNull(deviceRef01Data.get("id"), "expected created entity to have an id");

    // LIST
    Map<String, Object> deviceRef01Match = new LinkedHashMap<>();

    Object deviceRef01ListResult = deviceRef01Ent.list(deviceRef01Match, null);
    assertTrue(deviceRef01ListResult instanceof List,
        "expected list result to be an array, got " + deviceRef01ListResult);
    List<Object> deviceRef01List = (List<Object>) deviceRef01ListResult;

    List<Object> foundItem = Struct.select(
        RunnerSupport.entityListToData(deviceRef01List),
        Struct.jm("id", deviceRef01Data.get("id")));
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list");

    // LOAD
    Map<String, Object> deviceRef01MatchDt0 = new LinkedHashMap<>();
    deviceRef01MatchDt0.put("id", deviceRef01Data.get("id"));
    Object deviceRef01DataDt0Loaded = deviceRef01Ent.load(deviceRef01MatchDt0, null);
    Map<String, Object> deviceRef01DataDt0LoadResult = Helpers.toMapAny(deviceRef01DataDt0Loaded);
    assertNotNull(deviceRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(deviceRef01Data.get("id"), deviceRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

  }

  @Test
  public void stream() {
    Map<String, Object> streamingActive = new LinkedHashMap<>();
    Map<String, Object> streamingOpts = new LinkedHashMap<>();
    streamingOpts.put("active", true);
    Map<String, Object> featureOpts = new LinkedHashMap<>();
    featureOpts.put("streaming", streamingOpts);
    streamingActive.put("feature", featureOpts);

    RunnerSupport.EntityTestSetup setup = deviceBasicSetup(streamingActive);
    Assumptions.assumeFalse(setup.live,
        "stream test streams the seeded fixture data (unit mode only)");

    SdkEntity ent = setup.client.device(null);
    Map<String, Object> match = new LinkedHashMap<>();

    // Materialised list result for the same op.
    Object listedResult = ent.list(match, null);
    List<Object> listed = listedResult instanceof List
        ? (List<Object>) listedResult : new ArrayList<>();

    // stream("list") yields items via the streaming feature's iterator.
    List<Object> streamed = ent.stream("list", match, null)
        .collect(Collectors.toList());
    assertTrue(streamed.size() > 0, "expected stream to yield items");
    assertEquals(listed.size(), streamed.size(),
        "expected stream to yield the same item count as list");

    // Fallback: with streaming inactive, stream still yields the
    // materialised items.
    RunnerSupport.EntityTestSetup setup2 = deviceBasicSetup(null);
    SdkEntity ent2 = setup2.client.device(null);
    List<Object> streamed2 = ent2.stream("list", match, null)
        .collect(Collectors.toList());
    assertEquals(listed.size(), streamed2.size(),
        "expected fallback stream to yield the materialised items");
  }

  static RunnerSupport.EntityTestSetup deviceBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "device", "DeviceTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read device test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("device01");
    idnames.add("device02");
    idnames.add("device03");
    idnames.add("serial_number01");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINDECRYPTXP_PE_TEST_DEVICE_ENTID", idmap);
    envm.put("BLUEFINDECRYPTXP_PE_TEST_LIVE", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINDECRYPTXP_PE_TEST_DEVICE_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFINDECRYPTXP_PE_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      liveOpts.put("apikey", env.get("BLUEFINDECRYPTXP_PE_APIKEY"));
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}
