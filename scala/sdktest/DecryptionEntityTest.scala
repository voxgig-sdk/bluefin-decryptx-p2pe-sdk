// Generated basic-flow test for the decryption entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped DecryptionTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object DecryptionEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("decryption.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.decryption(null)
      rep.check("decryption.instance", ent != null, "expected non-null decryption entity")
    }

    rep.scope("decryption.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/decryption/DecryptionTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("decryption01", "DECRYPTION01")
      idmap.put("decryption02", "DECRYPTION02")
      idmap.put("decryption03", "DECRYPTION03")
      val now = System.currentTimeMillis()

      // CREATE
      val decryptionRef01Ent = client.decryption(null)
      var decryptionRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.decryption"), "decryption_ref01"))
      val decryptionRef01DataResult = decryptionRef01Ent.create(decryptionRef01Data, null)
      decryptionRef01Data = Helpers.toMapAny(decryptionRef01DataResult)
      rep.check("decryption.create.map", decryptionRef01Data != null, "expected create result to be a map")
    }
  }
}
