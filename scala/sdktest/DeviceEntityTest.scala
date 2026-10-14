// Generated basic-flow test for the device entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  final class FailHook extends BaseFeature("failhook", "0.0.1", true) {
    var unexpected = 0
    override def preSpec(ctx: Context): Unit = throw new RuntimeException("device hook failed")
    override def preUnexpected(ctx: Context): Unit = unexpected += 1
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.device(null)
      rep.check("device.instance", ent != null, "expected non-null device entity")
    }

    rep.scope("device.stream.error") {
      val offline = om("net" -> om("offline" -> B(true)))
      val err = try {
        BluefinDecryptxP2peSDK.testSDK(offline, null).device(null).stream("list", null, null).toList
        null
      } catch { case e: RuntimeException => e }
      rep.check("device.stream.error", err != null && String.valueOf(err.getMessage).contains("offline"),
        "expected the transport failure to raise from the stream, got " + err)

      BluefinDecryptxP2peSDK.testSDK(offline, null).device(null)
        .stream("list", null, om("ctrl" -> om("throw" -> B(false)))).toList

      if (hasFeature("rbac")) {
        val denied = BluefinDecryptxP2peSDK.testSDK(null,
          om("feature" -> om("rbac" -> om("active" -> B(true), "deny" -> B(true)))))
        val denyerr = try {
          denied.device(null).stream("list", null, null).toList
          null
        } catch { case e: SdkError => e }
        rep.check("device.stream.denied", denyerr != null && "rbac_denied" == denyerr.code,
          "expected the rbac denial to raise from the stream, got " + denyerr)
      }
    }

    rep.scope("device.stream.ctrl") {
      val explain = new LinkedHashMap[String, Object]()
      val ctrl = om("explain" -> explain)
      BluefinDecryptxP2peSDK.testSDK().device(null).stream("list", null, om("ctrl" -> ctrl)).toList
      rep.check("device.stream.ctrl", 1 == ctrl.size() && (explain eq ctrl.get("explain")),
        "the stream changed the caller's ctrl")
      rep.check("device.stream.explain", !explain.isEmpty(), "the caller's explain record was not filled")
    }

    rep.scope("device.unexpected") {
      val hook = new FailHook()
      val client = new BluefinDecryptxP2peSDK(om("feature" -> om("test" -> om("active" -> B(true))), "extend" -> jl(hook)))
      val err = try {
        client.device(null).list(null, null)
        null
      } catch { case e: RuntimeException => e }
      rep.check("device.unexpected.raise", err != null && String.valueOf(err.getMessage).contains("hook failed"),
        "expected the hook's failure, got " + err)
      rep.check("device.unexpected.fired", hook.unexpected > 0, "PreUnexpected did not fire")

      val fired = hook.unexpected
      client.device(null).list(null, om("throw" -> B(false)))
      rep.check("device.unexpected.nothrow", hook.unexpected > fired,
        "PreUnexpected did not fire under throw false")
    }

    rep.scope("device.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.device(null).list(om("client" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("device.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("device.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device/DeviceTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device01", "DEVICE01")
      idmap.put("device02", "DEVICE02")
      idmap.put("device03", "DEVICE03")
      idmap.put("serial_number01", "SERIAL_NUMBER01")
      val now = System.currentTimeMillis()

      // CREATE
      val deviceRef01Ent = client.device(null)
      var deviceRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.device"), "device_ref01"))
      deviceRef01Data.put("serial_number", idmap.get("serial_number01"))
      val deviceRef01DataResult = deviceRef01Ent.create(deviceRef01Data, null)
      deviceRef01Data = Helpers.toMapAny(deviceRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device.create.map", deviceRef01Data != null, "expected create result to be a map")
      rep.check("device.create.id", deviceRef01Data != null && deviceRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val deviceRef01Match = new LinkedHashMap[String, Object]()
      val deviceRef01ListResult = deviceRef01Ent.list(deviceRef01Match, null)
      rep.check("device.list.islist", deviceRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + deviceRef01ListResult)
      val deviceRef01List = deviceRef01ListResult.asInstanceOf[JList[Object]]
      val deviceRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(deviceRef01List), SdkTestSupport.om("id" -> deviceRef01Data.get("id")))
      rep.check("device.list.exists", !Struct.isempty(deviceRef01ListFound), "expected to find created entity in list")

      // LOAD
      val deviceRef01MatchDt0 = new LinkedHashMap[String, Object]()
      deviceRef01MatchDt0.put("id", deviceRef01Data.get("id"))
      val deviceRef01DataDt0Loaded = deviceRef01Ent.load(deviceRef01MatchDt0, null)
      val deviceRef01DataDt0LoadResult = Helpers.toMapAny(deviceRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device.load.map", deviceRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("device.load.id", deviceRef01Data.get("id"), deviceRef01DataDt0LoadResult.get("id"))
    }
  }
}
