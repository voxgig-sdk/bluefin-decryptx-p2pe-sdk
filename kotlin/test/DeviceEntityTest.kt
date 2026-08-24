package voxgig.bluefindecryptxp2pesdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefindecryptxp2pesdk.core.Helpers
import voxgig.bluefindecryptxp2pesdk.core.SdkEntity
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK
import voxgig.bluefindecryptxp2pesdk.utility.Json
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class DeviceEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.device(null)
    assertNotNull(ent, "expected non-null device entity")
  }

  @Test
  fun basic() {
    val setup = deviceBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf<String>("create", "list", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "device.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val deviceRef01Ent = client.device(null)
    var deviceRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.device"), "device_ref01")) ?: linkedMapOf())
    deviceRef01Data["serial_number"] = setup.idmap!!["serial_number01"]

    val deviceRef01DataResult = deviceRef01Ent.create(deviceRef01Data, null)
    deviceRef01Data = Helpers.toMapAny(if (deviceRef01DataResult is SdkEntity) deviceRef01DataResult.data() else deviceRef01DataResult) ?: linkedMapOf()
    assertNotNull(deviceRef01Data, "expected create result to be a map")
    assertNotNull(deviceRef01Data["id"], "expected created entity to have an id")

    // LIST
    val deviceRef01Match = linkedMapOf<String, Any?>()

    val deviceRef01ListResult = deviceRef01Ent.list(deviceRef01Match, null)
    assertTrue(deviceRef01ListResult is List<*>,
        "expected list result to be an array, got " + deviceRef01ListResult)
    val deviceRef01List = deviceRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(deviceRef01List),
        Struct.jm("id", deviceRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // LOAD
    val deviceRef01MatchDt0 = linkedMapOf<String, Any?>()
    deviceRef01MatchDt0["id"] = deviceRef01Data["id"]
    val deviceRef01DataDt0Loaded = deviceRef01Ent.load(deviceRef01MatchDt0, null)
    val deviceRef01DataDt0LoadResult = Helpers.toMapAny(if (deviceRef01DataDt0Loaded is SdkEntity) deviceRef01DataDt0Loaded.data() else deviceRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(deviceRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(deviceRef01Data["id"], deviceRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = deviceBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.device(null)
    val match = linkedMapOf<String, Any?>()

    // Materialised list result for the same op.
    val listedResult = ent.list(match, null)
    val listed = (listedResult as? List<Any?>) ?: emptyList<Any?>()

    // stream("list") yields items via the streaming feature's iterator.
    val streamed = ent.stream("list", match, null).toList()
    assertTrue(streamed.size > 0, "expected stream to yield items")
    assertEquals(listed.size, streamed.size, "expected stream to match list count")

    // Fallback: with streaming inactive, stream still yields the materialised
    // items.
    val setup2 = deviceBasicSetup(null)
    val ent2 = setup2.client.device(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun deviceBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "device", "DeviceTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read device test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("device01")
      idnames.add("device02")
      idnames.add("device03")
      idnames.add("serial_number01")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID"] = idmap
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFIN_DECRYPTX_P2PE_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}
