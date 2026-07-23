// Generated basic-flow test for the user entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped UserTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object UserEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("user.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.user(null)
      rep.check("user.instance", ent != null, "expected non-null user entity")
    }

    rep.scope("user.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/user/UserTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("user01", "USER01")
      idmap.put("user02", "USER02")
      idmap.put("user03", "USER03")
      val now = System.currentTimeMillis()

      // LOAD
      val userRef01Ent = client.user(null)
      val userRef01MatchDt0 = new LinkedHashMap[String, Object]()
      userRef01MatchDt0.put("id", userRef01Data.get("id"))
      val userRef01DataDt0Loaded = userRef01Ent.load(userRef01MatchDt0, null)
      val userRef01DataDt0LoadResult = Helpers.toMapAny(userRef01DataDt0Loaded)
      rep.check("user.load.map", userRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("user.load.id", userRef01Data.get("id"), userRef01DataDt0LoadResult.get("id"))
    }
  }
}
