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
public class ShipmentEntityTest {

  @Test
  public void instance() {
    BluefinDecryptxP2peSDK testsdk = BluefinDecryptxP2peSDK.testSDK();
    SdkEntity ent = testsdk.shipment(null);
    assertNotNull(ent, "expected non-null shipment entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = shipmentBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "list", "load" }) {
      String reason = RunnerSupport.skipReason("entityOp", "shipment." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_SHIPMENT_ENTID JSON to run live");
    BluefinDecryptxP2peSDK client = setup.client;

    // CREATE
    SdkEntity shipmentRef01Ent = client.shipment(null);
    Map<String, Object> shipmentRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.shipment"), "shipment_ref01"));

    Object shipmentRef01DataResult = shipmentRef01Ent.create(shipmentRef01Data, null);
    shipmentRef01Data = Helpers.toMapAny(shipmentRef01DataResult);
    assertNotNull(shipmentRef01Data, "expected create result to be a map");
    assertNotNull(shipmentRef01Data.get("id"), "expected created entity to have an id");

    // LIST
    Map<String, Object> shipmentRef01Match = new LinkedHashMap<>();

    Object shipmentRef01ListResult = shipmentRef01Ent.list(shipmentRef01Match, null);
    assertTrue(shipmentRef01ListResult instanceof List,
        "expected list result to be an array, got " + shipmentRef01ListResult);
    List<Object> shipmentRef01List = (List<Object>) shipmentRef01ListResult;

    List<Object> foundItem = Struct.select(
        RunnerSupport.entityListToData(shipmentRef01List),
        Struct.jm("id", shipmentRef01Data.get("id")));
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list");

    // LOAD
    Map<String, Object> shipmentRef01MatchDt0 = new LinkedHashMap<>();
    shipmentRef01MatchDt0.put("id", shipmentRef01Data.get("id"));
    Object shipmentRef01DataDt0Loaded = shipmentRef01Ent.load(shipmentRef01MatchDt0, null);
    Map<String, Object> shipmentRef01DataDt0LoadResult = Helpers.toMapAny(shipmentRef01DataDt0Loaded);
    assertNotNull(shipmentRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(shipmentRef01Data.get("id"), shipmentRef01DataDt0LoadResult.get("id"),
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

    RunnerSupport.EntityTestSetup setup = shipmentBasicSetup(streamingActive);
    Assumptions.assumeFalse(setup.live,
        "stream test streams the seeded fixture data (unit mode only)");

    SdkEntity ent = setup.client.shipment(null);
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
    RunnerSupport.EntityTestSetup setup2 = shipmentBasicSetup(null);
    SdkEntity ent2 = setup2.client.shipment(null);
    List<Object> streamed2 = ent2.stream("list", match, null)
        .collect(Collectors.toList());
    assertEquals(listed.size(), streamed2.size(),
        "expected fallback stream to yield the materialised items");
  }

  static RunnerSupport.EntityTestSetup shipmentBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "shipment", "ShipmentTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read shipment test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("shipment01");
    idnames.add("shipment02");
    idnames.add("shipment03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_SHIPMENT_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINDECRYPTXP_PE_TEST_SHIPMENT_ENTID", idmap);
    envm.put("BLUEFINDECRYPTXP_PE_TEST_LIVE", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINDECRYPTXP_PE_TEST_SHIPMENT_ENTID"));
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
