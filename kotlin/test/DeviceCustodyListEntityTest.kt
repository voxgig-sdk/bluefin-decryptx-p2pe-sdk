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
class DeviceCustodyListEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.deviceCustodyList(null)
    assertNotNull(ent, "expected non-null device_custody_list entity")
  }

  @Test
  fun basic() {
    val setup = deviceCustodyListBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("list")) {
      val reason = RunnerSupport.skipReason("entityOp", "device_custody_list.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID JSON to run live",
    )
    val client = setup.client

    // Bootstrap entity data from existing test data (no create step in flow).
    val deviceCustodyListRef01DataRaw = Struct.items(Helpers.toMapAny(
        Struct.getpath(setup.data, "existing.device_custody_list")))
    val deviceCustodyListRef01Data: MutableMap<String, Any?> = if (deviceCustodyListRef01DataRaw.isEmpty())
        linkedMapOf() else (Helpers.toMapAny(deviceCustodyListRef01DataRaw[0][1]) ?: linkedMapOf())

    // LIST
    val deviceCustodyListRef01Ent = client.deviceCustodyList(null)
    val deviceCustodyListRef01Match = linkedMapOf<String, Any?>()
    deviceCustodyListRef01Match["device_type"] = setup.idmap!!["device_type01"]
    deviceCustodyListRef01Match["serial_number"] = setup.idmap!!["serial_number01"]

    val deviceCustodyListRef01ListResult = deviceCustodyListRef01Ent.list(deviceCustodyListRef01Match, null)
    assertTrue(deviceCustodyListRef01ListResult is List<*>,
        "expected list result to be an array, got " + deviceCustodyListRef01ListResult)

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = deviceCustodyListBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.deviceCustodyList(null)
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
    val setup2 = deviceCustodyListBasicSetup(null)
    val ent2 = setup2.client.deviceCustodyList(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun deviceCustodyListBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "device_custody_list", "DeviceCustodyListTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read device_custody_list test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("device_custody_list01")
      idnames.add("device_custody_list02")
      idnames.add("device_custody_list03")
      idnames.add("device01")
      idnames.add("device02")
      idnames.add("device03")
      idnames.add("device_type01")
      idnames.add("serial_number01")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID"] = idmap
      envm["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFINDECRYPTXP_PE_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFINDECRYPTXP_PE_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinDecryptxP2peSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}
