// Generated basic-flow test for the transaction entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped TransactionTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object TransactionEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("transaction hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("transaction.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.transaction(null)
      rep.check("transaction.instance", ent != null, "expected non-null transaction entity")
    }

    rep.scope("transaction.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).transaction(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("transaction.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).transaction(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.transaction(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("transaction.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("transaction.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().transaction(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("transaction.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("transaction.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("transaction.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.transaction(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("transaction.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("transaction.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.transaction(null).list(null, om("throw" -> B(false)))
      rep.check("transaction.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("transaction.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.transaction(null).list(om("client" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("transaction.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("transaction.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/transaction/TransactionTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("transaction01", "TRANSACTION01")
      idmap.put("transaction02", "TRANSACTION02")
      idmap.put("transaction03", "TRANSACTION03")
      val now = System.currentTimeMillis()

      // CREATE
      val transactionRef01Ent = client.transaction(null)
      var transactionRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.transaction"), "transaction_ref01"))
      val transactionRef01DataResult = transactionRef01Ent.create(transactionRef01Data, null)
      transactionRef01Data = Helpers.toMapAny(transactionRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("transaction.create.map", transactionRef01Data != null, "expected create result to be a map")
      rep.check("transaction.create.id", transactionRef01Data != null && transactionRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val transactionRef01Match = new LinkedHashMap[String, Object]()
      val transactionRef01ListResult = transactionRef01Ent.list(transactionRef01Match, null)
      rep.check("transaction.list.islist", transactionRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + transactionRef01ListResult)
      val transactionRef01List = transactionRef01ListResult.asInstanceOf[JList[Object]]
      val transactionRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(transactionRef01List), SdkTestSupport.om("id" -> transactionRef01Data.get("id")))
      rep.check("transaction.list.exists", !Struct.isempty(transactionRef01ListFound), "expected to find created entity in list")

      // LOAD
      val transactionRef01MatchDt0 = new LinkedHashMap[String, Object]()
      transactionRef01MatchDt0.put("id", transactionRef01Data.get("id"))
      val transactionRef01DataDt0Loaded = transactionRef01Ent.load(transactionRef01MatchDt0, null)
      val transactionRef01DataDt0LoadResult = Helpers.toMapAny(transactionRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("transaction.load.map", transactionRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("transaction.load.id", transactionRef01Data.get("id"), transactionRef01DataDt0LoadResult.get("id"))
    }
  }
}
