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
public class DeviceCustodyDetailEntityTest {

  @Test
  public void instance() {
    BluefinDecryptxP2peSDK testsdk = BluefinDecryptxP2peSDK.testSDK();
    SdkEntity ent = testsdk.deviceCustodyDetail(null);
    assertNotNull(ent, "expected non-null device_custody_detail entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = deviceCustodyDetailBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "load" }) {
      String reason = RunnerSupport.skipReason("entityOp", "device_custody_detail." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID JSON to run live");
    BluefinDecryptxP2peSDK client = setup.client;

    // Bootstrap entity data from existing test data (no create step in flow).
    List<List<Object>> deviceCustodyDetailRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.device_custody_detail")));
    Map<String, Object> deviceCustodyDetailRef01Data = deviceCustodyDetailRef01DataRaw.isEmpty()
        ? null : Helpers.toMapAny(deviceCustodyDetailRef01DataRaw.get(0).get(1));

    // LOAD
    SdkEntity deviceCustodyDetailRef01Ent = client.deviceCustodyDetail(null);
    Map<String, Object> deviceCustodyDetailRef01MatchDt0 = new LinkedHashMap<>();
    deviceCustodyDetailRef01MatchDt0.put("id", deviceCustodyDetailRef01Data.get("id"));
    Object deviceCustodyDetailRef01DataDt0Loaded = deviceCustodyDetailRef01Ent.load(deviceCustodyDetailRef01MatchDt0, null);
    Map<String, Object> deviceCustodyDetailRef01DataDt0LoadResult = Helpers.toMapAny(deviceCustodyDetailRef01DataDt0Loaded);
    assertNotNull(deviceCustodyDetailRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(deviceCustodyDetailRef01Data.get("id"), deviceCustodyDetailRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

  }

  static RunnerSupport.EntityTestSetup deviceCustodyDetailBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "device_custody_detail", "DeviceCustodyDetailTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read device_custody_detail test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("device_custody_detail01");
    idnames.add("device_custody_detail02");
    idnames.add("device_custody_detail03");
    idnames.add("device01");
    idnames.add("device02");
    idnames.add("device03");
    idnames.add("device_type01");
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
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID", idmap);
    envm.put("BLUEFINDECRYPTXP_PE_TEST_LIVE", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINDECRYPTXP_PE_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"));
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
