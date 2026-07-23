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
class PartnerEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.partner(null)
    assertNotNull(ent, "expected non-null partner entity")
  }

  @Test
  fun basic() {
    val setup = partnerBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf("create", "list", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "partner.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val partnerRef01Ent = client.partner(null)
    var partnerRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.partner"), "partner_ref01")) ?: linkedMapOf())

    val partnerRef01DataResult = partnerRef01Ent.create(partnerRef01Data, null)
    partnerRef01Data = Helpers.toMapAny(partnerRef01DataResult) ?: linkedMapOf()
    assertNotNull(partnerRef01Data, "expected create result to be a map")
    assertNotNull(partnerRef01Data["id"], "expected created entity to have an id")

    // LIST
    val partnerRef01Match = linkedMapOf<String, Any?>()

    val partnerRef01ListResult = partnerRef01Ent.list(partnerRef01Match, null)
    assertTrue(partnerRef01ListResult is List<*>,
        "expected list result to be an array, got " + partnerRef01ListResult)
    val partnerRef01List = partnerRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(partnerRef01List),
        Struct.jm("id", partnerRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // LOAD
    val partnerRef01MatchDt0 = linkedMapOf<String, Any?>()
    partnerRef01MatchDt0["id"] = partnerRef01Data["id"]
    val partnerRef01DataDt0Loaded = partnerRef01Ent.load(partnerRef01MatchDt0, null)
    val partnerRef01DataDt0LoadResult = Helpers.toMapAny(partnerRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(partnerRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(partnerRef01Data["id"], partnerRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = partnerBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.partner(null)
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
    val setup2 = partnerBasicSetup(null)
    val ent2 = setup2.client.partner(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun partnerBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "partner", "PartnerTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read partner test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("partner01")
      idnames.add("partner02")
      idnames.add("partner03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID"] = idmap
      envm["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID"])
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
