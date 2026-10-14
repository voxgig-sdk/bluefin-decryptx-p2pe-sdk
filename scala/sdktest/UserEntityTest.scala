// Generated basic-flow test for the user entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped UserTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Config, Context, Helpers, SdkEntity, SdkError, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.feature.BaseFeature
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object UserEntityTest {

  import SdkTestSupport.{B, I, jl, om}

  private def hasFeature(name: String): Boolean = {
    val fm = Helpers.toMapAny(Config.sharedConfig().get("feature"))
    fm != null && fm.get(name) != null
  }

  def run(rep: SdkTestReport): Unit = {
    rep.scope("user.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.user(null)
      rep.check("user.instance", ent != null, "expected non-null user entity")
    }

    rep.scope("user.validate") {
      if (hasFeature("validate")) {
        val client = BluefinDecryptxP2peSDK.testSDK(null, om("feature" -> om("validate" -> om("active" -> B(true)))))
        val err = try {
          client.user(null).load(om("id" -> I(1)), null)
          null
        } catch { case e: SdkError => e }
        rep.check("user.validate", err != null && "validate_failed" == err.code,
          "expected validate_failed, got " + err)
      }
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
      val userRef01DataRaw = Struct.items(Helpers.toMapAny(
          Struct.getpath(entityData, "existing.user")))
      val userRef01Data = Helpers.toMapAny(userRef01DataRaw.get(0).get(1))

      // LOAD
      val userRef01Ent = client.user(null)
      val userRef01MatchDt0 = new LinkedHashMap[String, Object]()
      userRef01MatchDt0.put("id", userRef01Data.get("id"))
      val userRef01DataDt0Loaded = userRef01Ent.load(userRef01MatchDt0, null)
      val userRef01DataDt0LoadResult = Helpers.toMapAny(userRef01DataDt0Loaded match { case e: SdkEntity => e.data(); case o => o })
      rep.check("user.load.map", userRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("user.load.id", userRef01Data.get("id"), userRef01DataDt0LoadResult.get("id"))
    }
  }
}
