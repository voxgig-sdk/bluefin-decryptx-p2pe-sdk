// Generated basic-flow test for the update_result entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped UpdateResultTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object UpdateResultEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("update_result.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.updateResult(null)
      rep.check("update_result.instance", ent != null, "expected non-null update_result entity")
    }

    rep.scope("update_result.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/update_result/UpdateResultTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("update_result01", "UPDATE_RESULT01")
      idmap.put("update_result02", "UPDATE_RESULT02")
      idmap.put("update_result03", "UPDATE_RESULT03")
      val now = System.currentTimeMillis()

      // CREATE
      val updateResultRef01Ent = client.updateResult(null)
      var updateResultRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.update_result"), "update_result_ref01"))
      val updateResultRef01DataResult = updateResultRef01Ent.create(updateResultRef01Data, null)
      updateResultRef01Data = Helpers.toMapAny(updateResultRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("update_result.create.map", updateResultRef01Data != null, "expected create result to be a map")
      rep.check("update_result.create.id", updateResultRef01Data != null && updateResultRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val updateResultRef01Match = new LinkedHashMap[String, Object]()
      val updateResultRef01ListResult = updateResultRef01Ent.list(updateResultRef01Match, null)
      rep.check("update_result.list.islist", updateResultRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + updateResultRef01ListResult)
      val updateResultRef01List = updateResultRef01ListResult.asInstanceOf[JList[Object]]
      val updateResultRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(updateResultRef01List), SdkTestSupport.om("id" -> updateResultRef01Data.get("id")))
      rep.check("update_result.list.exists", !Struct.isempty(updateResultRef01ListFound), "expected to find created entity in list")

      // UPDATE
      val updateResultRef01DataUp0Up = new LinkedHashMap[String, Object]()
      updateResultRef01DataUp0Up.put("id", updateResultRef01Data.get("id"))
      val updateResultRef01MarkdefUp0Name = "email"
      val updateResultRef01MarkdefUp0Value = "Mark01-update_result_ref01_" + now
      updateResultRef01DataUp0Up.put(updateResultRef01MarkdefUp0Name, updateResultRef01MarkdefUp0Value)
      val updateResultRef01ResdataUp0Result = updateResultRef01Ent.update(updateResultRef01DataUp0Up, null)
      val updateResultRef01ResdataUp0 = Helpers.toMapAny(updateResultRef01ResdataUp0Result match { case e: SdkEntity => e.data(); case o => o })
      rep.check("update_result.update.map", updateResultRef01ResdataUp0 != null, "expected update result to be a map")
      rep.eq("update_result.update.id", updateResultRef01DataUp0Up.get("id"), updateResultRef01ResdataUp0.get("id"))
      rep.eq("update_result.update.mark", updateResultRef01MarkdefUp0Value, updateResultRef01ResdataUp0.get(updateResultRef01MarkdefUp0Name))
    }
  }
}
