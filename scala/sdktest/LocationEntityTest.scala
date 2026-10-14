// Generated basic-flow test for the location entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped LocationTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object LocationEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("location hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("location.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.location(null)
      rep.check("location.instance", ent != null, "expected non-null location entity")
    }

    rep.scope("location.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).location(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("location.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).location(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.location(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("location.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("location.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().location(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("location.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("location.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("location.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.location(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("location.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("location.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.location(null).list(null, om("throw" -> B(false)))
      rep.check("location.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("location.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.location(null).list(om("client" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("location.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("location.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/location/LocationTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("location01", "LOCATION01")
      idmap.put("location02", "LOCATION02")
      idmap.put("location03", "LOCATION03")
      val now = System.currentTimeMillis()

      // CREATE
      val locationRef01Ent = client.location(null)
      var locationRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.location"), "location_ref01"))
      val locationRef01DataResult = locationRef01Ent.create(locationRef01Data, null)
      locationRef01Data = Helpers.toMapAny(locationRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("location.create.map", locationRef01Data != null, "expected create result to be a map")
      rep.check("location.create.id", locationRef01Data != null && locationRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val locationRef01Match = new LinkedHashMap[String, Object]()
      val locationRef01ListResult = locationRef01Ent.list(locationRef01Match, null)
      rep.check("location.list.islist", locationRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + locationRef01ListResult)
      val locationRef01List = locationRef01ListResult.asInstanceOf[JList[Object]]
      val locationRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(locationRef01List), SdkTestSupport.om("id" -> locationRef01Data.get("id")))
      rep.check("location.list.exists", !Struct.isempty(locationRef01ListFound), "expected to find created entity in list")

      // LOAD
      val locationRef01MatchDt0 = new LinkedHashMap[String, Object]()
      locationRef01MatchDt0.put("id", locationRef01Data.get("id"))
      val locationRef01DataDt0Loaded = locationRef01Ent.load(locationRef01MatchDt0, null)
      val locationRef01DataDt0LoadResult = Helpers.toMapAny(locationRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("location.load.map", locationRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("location.load.id", locationRef01Data.get("id"), locationRef01DataDt0LoadResult.get("id"))

      // REMOVE
      val locationRef01MatchRm0 = new LinkedHashMap[String, Object]()
      locationRef01MatchRm0.put("id", locationRef01Data.get("id"))
      locationRef01Ent.remove(locationRef01MatchRm0, null)

      // LIST
      val locationRef01MatchRt0 = new LinkedHashMap[String, Object]()
      val locationRef01ListRt0Result = locationRef01Ent.list(locationRef01MatchRt0, null)
      rep.check("location.list.islist", locationRef01ListRt0Result.isInstanceOf[JList[?]], "expected list result to be an array, got " + locationRef01ListRt0Result)
      val locationRef01ListRt0 = locationRef01ListRt0Result.asInstanceOf[JList[Object]]
      val locationRef01ListRt0NotFound = Struct.select(
          SdkTestSupport.entityListToData(locationRef01ListRt0), SdkTestSupport.om("id" -> locationRef01Data.get("id")))
      rep.check("location.list.notexists", Struct.isempty(locationRef01ListRt0NotFound), "expected removed entity to not be in list")
    }
  }
}
