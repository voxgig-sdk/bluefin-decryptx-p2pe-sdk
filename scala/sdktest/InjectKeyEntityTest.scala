// Generated basic-flow test for the inject_key entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped InjectKeyTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, SdkEntity, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object InjectKeyEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("inject_key.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.injectKey(null)
      rep.check("inject_key.instance", ent != null, "expected non-null inject_key entity")
    }

    rep.scope("inject_key.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/inject_key/InjectKeyTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("inject_key01", "INJECT_KEY01")
      idmap.put("inject_key02", "INJECT_KEY02")
      idmap.put("inject_key03", "INJECT_KEY03")
      val now = System.currentTimeMillis()
      val injectKeyRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.inject_key")))
      val injectKeyRef01Data = Helpers.toMapAny(injectKeyRef01DataRaw.get(0).get(1))

      // LIST
      val injectKeyRef01Ent = client.injectKey(null)
      val injectKeyRef01Match = new LinkedHashMap[String, Object]()
      val injectKeyRef01ListResult = injectKeyRef01Ent.list(injectKeyRef01Match, null)
      rep.check("inject_key.list.islist", injectKeyRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + injectKeyRef01ListResult)

      // LOAD
      val injectKeyRef01MatchDt0 = new LinkedHashMap[String, Object]()
      injectKeyRef01MatchDt0.put("id", injectKeyRef01Data.get("id"))
      val injectKeyRef01DataDt0Loaded = injectKeyRef01Ent.load(injectKeyRef01MatchDt0, null)
      val injectKeyRef01DataDt0LoadResult = Helpers.toMapAny(injectKeyRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("inject_key.load.map", injectKeyRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("inject_key.load.id", injectKeyRef01Data.get("id"), injectKeyRef01DataDt0LoadResult.get("id"))
    }
  }
}
