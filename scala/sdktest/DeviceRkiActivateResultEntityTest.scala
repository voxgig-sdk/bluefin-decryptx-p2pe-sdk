// Generated basic-flow test for the device_rki_activate_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DeviceRkiActivateResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DeviceRkiActivateResultEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("device_rki_activate_result.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.deviceRkiActivateResult(null)
      rep.check("device_rki_activate_result.instance", ent != null, "expected non-null device_rki_activate_result entity")
    }

    rep.scope("device_rki_activate_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/device_rki_activate_result/DeviceRkiActivateResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("device_rki_activate_result01", "DEVICE_RKI_ACTIVATE_RESULT01")
      idmap.put("device_rki_activate_result02", "DEVICE_RKI_ACTIVATE_RESULT02")
      idmap.put("device_rki_activate_result03", "DEVICE_RKI_ACTIVATE_RESULT03")
      val now = System.currentTimeMillis()

      // CREATE
      val deviceRkiActivateResultRef01Ent = client.deviceRkiActivateResult(null)
      var deviceRkiActivateResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.device_rki_activate_result"), "device_rki_activate_result_ref01"))
      val deviceRkiActivateResultRef01DataResult = deviceRkiActivateResultRef01Ent.create(deviceRkiActivateResultRef01Data, null)
      deviceRkiActivateResultRef01Data = Helpers.toMapAny(deviceRkiActivateResultRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("device_rki_activate_result.create.map", deviceRkiActivateResultRef01Data != null, "expected create result to be a map")
    }
  }
}
