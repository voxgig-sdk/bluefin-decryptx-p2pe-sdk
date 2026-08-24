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
class UpdateResultEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.updateResult(null)
    assertNotNull(ent, "expected non-null update_result entity")
  }

  @Test
  fun basic() {
    val setup = updateResultBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf<String>("create", "list", "update")) {
      val reason = RunnerSupport.skipReason("entityOp", "update_result.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val updateResultRef01Ent = client.updateResult(null)
    var updateResultRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.update_result"), "update_result_ref01")) ?: linkedMapOf())

    val updateResultRef01DataResult = updateResultRef01Ent.create(updateResultRef01Data, null)
    updateResultRef01Data = Helpers.toMapAny(if (updateResultRef01DataResult is SdkEntity) updateResultRef01DataResult.data() else updateResultRef01DataResult) ?: linkedMapOf()
    assertNotNull(updateResultRef01Data, "expected create result to be a map")
    assertNotNull(updateResultRef01Data["id"], "expected created entity to have an id")

    // LIST
    val updateResultRef01Match = linkedMapOf<String, Any?>()

    val updateResultRef01ListResult = updateResultRef01Ent.list(updateResultRef01Match, null)
    assertTrue(updateResultRef01ListResult is List<*>,
        "expected list result to be an array, got " + updateResultRef01ListResult)
    val updateResultRef01List = updateResultRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(updateResultRef01List),
        Struct.jm("id", updateResultRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // UPDATE
    val updateResultRef01DataUp0Up = linkedMapOf<String, Any?>()
    updateResultRef01DataUp0Up["id"] = updateResultRef01Data["id"]

    val updateResultRef01MarkdefUp0Name = "email"
    val updateResultRef01MarkdefUp0Value = "Mark01-update_result_ref01_" + setup.now
    updateResultRef01DataUp0Up[updateResultRef01MarkdefUp0Name] = updateResultRef01MarkdefUp0Value

    val updateResultRef01ResdataUp0Result = updateResultRef01Ent.update(updateResultRef01DataUp0Up, null)
    val updateResultRef01ResdataUp0 = Helpers.toMapAny(if (updateResultRef01ResdataUp0Result is SdkEntity) updateResultRef01ResdataUp0Result.data() else updateResultRef01ResdataUp0Result) ?: linkedMapOf()
    assertNotNull(updateResultRef01ResdataUp0, "expected update result to be a map")
    assertEquals(updateResultRef01DataUp0Up["id"], updateResultRef01ResdataUp0["id"],
        "expected update result id to match")
    assertEquals(updateResultRef01MarkdefUp0Value, updateResultRef01ResdataUp0[updateResultRef01MarkdefUp0Name],
        "expected " + updateResultRef01MarkdefUp0Name + " to be updated")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = updateResultBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.updateResult(null)
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
    val setup2 = updateResultBasicSetup(null)
    val ent2 = setup2.client.updateResult(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun updateResultBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "update_result", "UpdateResultTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read update_result test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("update_result01")
      idnames.add("update_result02")
      idnames.add("update_result03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"] = idmap
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"])
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
