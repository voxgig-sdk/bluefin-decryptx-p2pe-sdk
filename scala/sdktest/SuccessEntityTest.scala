// Generated basic-flow test for the success entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped SuccessTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object SuccessEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("success.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.success(null)
      rep.check("success.instance", ent != null, "expected non-null success entity")
    }

    rep.scope("success.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/success/SuccessTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("success01", "SUCCESS01")
      idmap.put("success02", "SUCCESS02")
      idmap.put("success03", "SUCCESS03")
      idmap.put("virtual_device01", "VIRTUAL_DEVICE01")
      idmap.put("virtual_device02", "VIRTUAL_DEVICE02")
      idmap.put("virtual_device03", "VIRTUAL_DEVICE03")
      idmap.put("share_partner_to01", "SHARE_PARTNER_TO01")
      val now = System.currentTimeMillis()

      // CREATE
      val successRef01Ent = client.success(null)
      var successRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.success"), "success_ref01"))
      successRef01Data.put("share_partner_to", idmap.get("share_partner_to01"))
      val successRef01DataResult = successRef01Ent.create(successRef01Data, null)
      successRef01Data = Helpers.toMapAny(successRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("success.create.map", successRef01Data != null, "expected create result to be a map")

    }
  }
}
