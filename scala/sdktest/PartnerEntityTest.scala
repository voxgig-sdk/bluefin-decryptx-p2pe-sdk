// Generated basic-flow test for the partner entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped PartnerTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object PartnerEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("partner.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.partner(null)
      rep.check("partner.instance", ent != null, "expected non-null partner entity")
    }

    rep.scope("partner.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/partner/PartnerTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("partner01", "PARTNER01")
      idmap.put("partner02", "PARTNER02")
      idmap.put("partner03", "PARTNER03")
      val now = System.currentTimeMillis()

      // CREATE
      val partnerRef01Ent = client.partner(null)
      var partnerRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.partner"), "partner_ref01"))
      val partnerRef01DataResult = partnerRef01Ent.create(partnerRef01Data, null)
      partnerRef01Data = Helpers.toMapAny(partnerRef01DataResult match { case e: SdkEntity => e.data(); case o => o })
      rep.check("partner.create.map", partnerRef01Data != null, "expected create result to be a map")
      rep.check("partner.create.id", partnerRef01Data != null && partnerRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val partnerRef01Match = new LinkedHashMap[String, Object]()
      val partnerRef01ListResult = partnerRef01Ent.list(partnerRef01Match, null)
      rep.check("partner.list.islist", partnerRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + partnerRef01ListResult)
      val partnerRef01List = partnerRef01ListResult.asInstanceOf[JList[Object]]
      val partnerRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(partnerRef01List), SdkTestSupport.om("id" -> partnerRef01Data.get("id")))
      rep.check("partner.list.exists", !Struct.isempty(partnerRef01ListFound), "expected to find created entity in list")

      // LOAD
      val partnerRef01MatchDt0 = new LinkedHashMap[String, Object]()
      partnerRef01MatchDt0.put("id", partnerRef01Data.get("id"))
      val partnerRef01DataDt0Loaded = partnerRef01Ent.load(partnerRef01MatchDt0, null)
      val partnerRef01DataDt0LoadResult = Helpers.toMapAny(partnerRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("partner.load.map", partnerRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("partner.load.id", partnerRef01Data.get("id"), partnerRef01DataDt0LoadResult.get("id"))
    }
  }
}
