// Generated basic-flow test for the kif entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped KifTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object KifEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("kif.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.kif(null)
      rep.check("kif.instance", ent != null, "expected non-null kif entity")
    }

    rep.scope("kif.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/kif/KifTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("kif01", "KIF01")
      idmap.put("kif02", "KIF02")
      idmap.put("kif03", "KIF03")
      val now = System.currentTimeMillis()

      // LIST
      val kifRef01Ent = client.kif(null)
      val kifRef01Match = new LinkedHashMap[String, Object]()
      val kifRef01ListResult = kifRef01Ent.list(kifRef01Match, null)
      rep.check("kif.list.islist", kifRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + kifRef01ListResult)
    }
  }
}
