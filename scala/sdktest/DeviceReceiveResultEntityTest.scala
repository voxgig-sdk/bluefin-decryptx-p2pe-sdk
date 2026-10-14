// Generated basic-flow test for the device_receive_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceReceiveResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceReceiveResultEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_receive_result.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceReceiveResult(null)
      rep.check("device_receive_result.instance", ent != null, "expected non-null device_receive_result entity")
    }

    rep.scope("device_receive_result.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.deviceReceiveResult(null).create(om("serialNumber" -> I(1), "success" -> B(true), "tamperLabel" -> "x"), null)
          null
        } catch { case e: SdkError => e }
        rep.check("device_receive_result.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
    }

    rep.scope("device_receive_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_receive_result/DeviceReceiveResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_receive_result01", "DEVICE_RECEIVE_RESULT01")
      idmap.put("device_receive_result02", "DEVICE_RECEIVE_RESULT02")
      idmap.put("device_receive_result03", "DEVICE_RECEIVE_RESULT03")
      val now = System.currentTimeMillis()

      // CREATE
      val deviceReceiveResultRef01Ent = client.deviceReceiveResult(null)
      var deviceReceiveResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.device_receive_result"), "device_receive_result_ref01"))
      val deviceReceiveResultRef01DataResult = deviceReceiveResultRef01Ent.create(deviceReceiveResultRef01Data, null)
      deviceReceiveResultRef01Data = Helpers.toMapAny(deviceReceiveResultRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_receive_result.create.map", deviceReceiveResultRef01Data != null, "expected create result to be a map")
    }
  }
}
