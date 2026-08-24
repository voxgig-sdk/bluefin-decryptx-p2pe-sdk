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
class TransactionEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinDecryptxP2peSDK.testSDK()
    val ent = testsdk.transaction(null)
    assertNotNull(ent, "expected non-null transaction entity")
  }

  @Test
  fun basic() {
    val setup = transactionBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf<String>("create", "list", "load")) {
      val reason = RunnerSupport.skipReason("entityOp", "transaction.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val transactionRef01Ent = client.transaction(null)
    var transactionRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.transaction"), "transaction_ref01")) ?: linkedMapOf())

    val transactionRef01DataResult = transactionRef01Ent.create(transactionRef01Data, null)
    transactionRef01Data = Helpers.toMapAny(if (transactionRef01DataResult is SdkEntity) transactionRef01DataResult.data() else transactionRef01DataResult) ?: linkedMapOf()
    assertNotNull(transactionRef01Data, "expected create result to be a map")
    assertNotNull(transactionRef01Data["id"], "expected created entity to have an id")

    // LIST
    val transactionRef01Match = linkedMapOf<String, Any?>()

    val transactionRef01ListResult = transactionRef01Ent.list(transactionRef01Match, null)
    assertTrue(transactionRef01ListResult is List<*>,
        "expected list result to be an array, got " + transactionRef01ListResult)
    val transactionRef01List = transactionRef01ListResult as List<Any?>

    val foundItem = Struct.select(
        RunnerSupport.entityListToData(transactionRef01List),
        Struct.jm("id", transactionRef01Data["id"]))
    assertFalse(Struct.isempty(foundItem), "expected to find created entity in list")

    // LOAD
    val transactionRef01MatchDt0 = linkedMapOf<String, Any?>()
    transactionRef01MatchDt0["id"] = transactionRef01Data["id"]
    val transactionRef01DataDt0Loaded = transactionRef01Ent.load(transactionRef01MatchDt0, null)
    val transactionRef01DataDt0LoadResult = Helpers.toMapAny(if (transactionRef01DataDt0Loaded is SdkEntity) transactionRef01DataDt0Loaded.data() else transactionRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(transactionRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(transactionRef01Data["id"], transactionRef01DataDt0LoadResult["id"],
        "expected load result id to match")

  }

  @Test
  fun stream() {
    val streamingActive = linkedMapOf<String, Any?>(
      "feature" to linkedMapOf<String, Any?>(
        "streaming" to linkedMapOf<String, Any?>("active" to true),
      ),
    )
    val setup = transactionBasicSetup(streamingActive)
    Assumptions.assumeFalse(
      setup.live,
      "stream test streams the seeded fixture data (unit mode only)",
    )

    val ent = setup.client.transaction(null)
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
    val setup2 = transactionBasicSetup(null)
    val ent2 = setup2.client.transaction(null)
    val streamed2 = ent2.stream("list", match, null).toList()
    assertEquals(listed.size, streamed2.size, "expected fallback stream to match list")
  }

  companion object {
    fun transactionBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "transaction", "TransactionTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read transaction test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinDecryptxP2peSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("transaction01")
      idnames.add("transaction02")
      idnames.add("transaction03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID"] = idmap
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_DECRYPTX_P2PE_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_DECRYPTX_P2PE_TEST_TRANSACTION_ENTID"])
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
