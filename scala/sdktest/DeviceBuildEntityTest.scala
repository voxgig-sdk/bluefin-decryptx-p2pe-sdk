// Generated basic-flow test for the device_build entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceBuildTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceBuildEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("device_build hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_build.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceBuild(null)
      rep.check("device_build.instance", ent != null, "expected non-null device_build entity")
    }

    rep.scope("device_build.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).deviceBuild(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("device_build.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).deviceBuild(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.deviceBuild(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("device_build.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("device_build.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().deviceBuild(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("device_build.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("device_build.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("device_build.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.deviceBuild(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("device_build.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("device_build.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.deviceBuild(null).list(null, om("throw" -> B(false)))
      rep.check("device_build.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("device_build.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.deviceBuild(null).list(om("device_type" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("device_build.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("device_build.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_build/DeviceBuildTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_build01", "DEVICE_BUILD01")
      idmap.put("device_build02", "DEVICE_BUILD02")
      idmap.put("device_build03", "DEVICE_BUILD03")
      val now = System.currentTimeMillis()
      val deviceBuildRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.device_build")))
      val deviceBuildRef01Data = Helpers.toMapAny(deviceBuildRef01DataRaw.get(0).get(1))

      // LIST
      val deviceBuildRef01Ent = client.deviceBuild(null)
      val deviceBuildRef01Match = new LinkedHashMap[String, Object]()
      val deviceBuildRef01ListResult = deviceBuildRef01Ent.list(deviceBuildRef01Match, null)
      rep.check("device_build.list.islist", deviceBuildRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceBuildRef01ListResult)

      // LOAD
      val deviceBuildRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceBuildRef01MatchDt0.put("id", deviceBuildRef01Data.get("id"))
      val deviceBuildRef01DataDt0Loaded = deviceBuildRef01Ent.load(deviceBuildRef01MatchDt0, null)
      val deviceBuildRef01DataDt0LoadResult = Helpers.toMapAny(deviceBuildRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_build.load.map", deviceBuildRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device_build.load.id", deviceBuildRef01Data.get("id"), deviceBuildRef01DataDt0LoadResult.get("id"))
    }
  }
}
