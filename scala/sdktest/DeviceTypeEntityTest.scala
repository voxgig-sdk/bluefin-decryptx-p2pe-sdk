// Generated basic-flow test for the device_type entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceTypeTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceTypeEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("device_type hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_type.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceType(null)
      rep.check("device_type.instance", ent != null, "expected non-null device_type entity")
    }

    rep.scope("device_type.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).deviceType(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("device_type.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).deviceType(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.deviceType(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("device_type.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("device_type.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().deviceType(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("device_type.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("device_type.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("device_type.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.deviceType(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("device_type.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("device_type.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.deviceType(null).list(null, om("throw" -> B(false)))
      rep.check("device_type.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("device_type.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.deviceType(null).list(om("created" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("device_type.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("device_type.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_type/DeviceTypeTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_type01", "DEVICE_TYPE01")
      idmap.put("device_type02", "DEVICE_TYPE02")
      idmap.put("device_type03", "DEVICE_TYPE03")
      val now = System.currentTimeMillis()
      val deviceTypeRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.device_type")))
      val deviceTypeRef01Data = Helpers.toMapAny(deviceTypeRef01DataRaw.get(0).get(1))

      // LIST
      val deviceTypeRef01Ent = client.deviceType(null)
      val deviceTypeRef01Match = new LinkedHashMap[String, Object]()
      val deviceTypeRef01ListResult = deviceTypeRef01Ent.list(deviceTypeRef01Match, null)
      rep.check("device_type.list.islist", deviceTypeRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceTypeRef01ListResult)

      // LOAD
      val deviceTypeRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceTypeRef01MatchDt0.put("id", deviceTypeRef01Data.get("id"))
      val deviceTypeRef01DataDt0Loaded = deviceTypeRef01Ent.load(deviceTypeRef01MatchDt0, null)
      val deviceTypeRef01DataDt0LoadResult = Helpers.toMapAny(deviceTypeRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_type.load.map", deviceTypeRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device_type.load.id", deviceTypeRef01Data.get("id"), deviceTypeRef01DataDt0LoadResult.get("id"))
    }
  }
}
