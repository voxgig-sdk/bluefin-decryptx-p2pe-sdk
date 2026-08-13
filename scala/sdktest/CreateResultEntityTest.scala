// Generated basic-flow test for the create_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped CreateResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object CreateResultEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("create_result.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.createResult(null)
      rep.check("create_result.instance", ent != null, "expected non-null create_result entity")
    }

    rep.scope("create_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/create_result/CreateResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("create_result01", "CREATE_RESULT01")
      idmap.put("create_result02", "CREATE_RESULT02")
      idmap.put("create_result03", "CREATE_RESULT03")
      idmap.put("device01", "DEVICE01")
      idmap.put("device02", "DEVICE02")
      idmap.put("device03", "DEVICE03")
      idmap.put("device_type01", "DEVICE_TYPE01")
      idmap.put("serial_number01", "SERIAL_NUMBER01")
      val now = System.currentTimeMillis()

      // CREATE
      val createResultRef01Ent = client.createResult(null)
      var createResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.create_result"), "create_result_ref01"))
      createResultRef01Data.put("device_type", idmap.get("device_type01"))
      createResultRef01Data.put("serial_number", idmap.get("serial_number01"))
      val createResultRef01DataResult = createResultRef01Ent.create(createResultRef01Data, null)
      createResultRef01Data = Helpers.toMapAny(createResultRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("create_result.create.map", createResultRef01Data != null, "expected create result to be a map")
    }
  }
}
