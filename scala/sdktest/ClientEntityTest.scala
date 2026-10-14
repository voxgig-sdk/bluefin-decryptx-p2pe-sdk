// Generated basic-flow test for the client entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ClientTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object ClientEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("client hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("client.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.client(null)
      rep.check("client.instance", ent != null, "expected non-null client entity")
    }

    rep.scope("client.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).client(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("client.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).client(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.client(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("client.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("client.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().client(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("client.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("client.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("client.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.client(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("client.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("client.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.client(null).list(null, om("throw" -> B(false)))
      rep.check("client.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("client.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.client(null).list(om("partner" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("client.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("client.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/client/ClientTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("client01", "CLIENT01")
      idmap.put("client02", "CLIENT02")
      idmap.put("client03", "CLIENT03")
      val now = System.currentTimeMillis()

      // CREATE
      val clientRef01Ent = client.client(null)
      var clientRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.client"), "client_ref01"))
      val clientRef01DataResult = clientRef01Ent.create(clientRef01Data, null)
      clientRef01Data = Helpers.toMapAny(clientRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("client.create.map", clientRef01Data != null, "expected create result to be a map")
      rep.check("client.create.id", clientRef01Data != null && clientRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val clientRef01Match = new LinkedHashMap[String, Object]()
      val clientRef01ListResult = clientRef01Ent.list(clientRef01Match, null)
      rep.check("client.list.islist", clientRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + clientRef01ListResult)
      val clientRef01List = clientRef01ListResult.asInstanceOf[JList[Object]]
      val clientRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(clientRef01List), SdkTestSupport.om("id" -> clientRef01Data.get("id")))
      rep.check("client.list.exists", !Struct.isempty(clientRef01ListFound), "expected to find created entity in list")

      // LOAD
      val clientRef01MatchDt0 = new LinkedHashMap[String, Object]()
      clientRef01MatchDt0.put("id", clientRef01Data.get("id"))
      val clientRef01DataDt0Loaded = clientRef01Ent.load(clientRef01MatchDt0, null)
      val clientRef01DataDt0LoadResult = Helpers.toMapAny(clientRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("client.load.map", clientRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("client.load.id", clientRef01Data.get("id"), clientRef01DataDt0LoadResult.get("id"))

      // REMOVE
      val clientRef01MatchRm0 = new LinkedHashMap[String, Object]()
      clientRef01MatchRm0.put("id", clientRef01Data.get("id"))
      clientRef01Ent.remove(clientRef01MatchRm0, null)

      // LIST
      val clientRef01MatchRt0 = new LinkedHashMap[String, Object]()
      val clientRef01ListRt0Result = clientRef01Ent.list(clientRef01MatchRt0, null)
      rep.check("client.list.islist", clientRef01ListRt0Result.isInstanceOf[JList[?]], "expected list result to be an array, got " + clientRef01ListRt0Result)
      val clientRef01ListRt0 = clientRef01ListRt0Result.asInstanceOf[JList[Object]]
      val clientRef01ListRt0NotFound = Struct.select(
          SdkTestSupport.entityListToData(clientRef01ListRt0), SdkTestSupport.om("id" -> clientRef01Data.get("id")))
      rep.check("client.list.notexists", Struct.isempty(clientRef01ListRt0NotFound), "expected removed entity to not be in list")
    }
  }
}
