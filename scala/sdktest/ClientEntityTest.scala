// Generated basic-flow test for the client entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped ClientTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefindecryptxp2pesdk.core.{Helpers, BluefinDecryptxP2peSDK}
import voxgig.bluefindecryptxp2pesdk.utility.struct.Struct

object ClientEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("client.instance") {
      val testsdk = BluefinDecryptxP2peSDK.testSDK()
      val ent = testsdk.client(null)
      rep.check("client.instance", ent != null, "expected non-null client entity")
    }

    rep.scope("client.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/client/ClientTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinDecryptxP2peSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("client01", "CLIENT01")
      idmap.put("client02", "CLIENT02")
      idmap.put("client03", "CLIENT03")
      val now = System.currentTimeMillis()

      // CREATE
      val clientRef01Ent = client.client(null)
      var clientRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.client"), "client_ref01"))
      val clientRef01DataResult = clientRef01Ent.create(clientRef01Data, null)
      clientRef01Data = Helpers.toMapAny(clientRef01DataResult)
      rep.check("client.create.map", clientRef01Data != null, "expected create result to be a map")
      rep.check("client.create.id", clientRef01Data != null && clientRef01Data.get("id") != null, "expected created entity to have an id")

      // LIST
      val clientRef01Match = new LinkedHashMap[String, Object]()
      val clientRef01ListResult = clientRef01Ent.list(clientRef01Match, null)
      rep.check("client.list.islist", clientRef01ListResult.isInstanceOf[JList[?]], "expected list result to be an array, got " + clientRef01ListResult)
      val clientRef01List = clientRef01ListResult.asInstanceOf[JList[Object]]
      val clientRef01ListFound = Struct.select(
          SdkTestSupport.entityListToData(clientRef01List), SdkTestSupport.om("id" -> clientRef01Data.get("id")))
      rep.check("client.list.exists", !Struct.isempty(clientRef01ListFound), "expected to find created entity in list")

      // LOAD
      val clientRef01MatchDt0 = new LinkedHashMap[String, Object]()
      clientRef01MatchDt0.put("id", clientRef01Data.get("id"))
      val clientRef01DataDt0Loaded = clientRef01Ent.load(clientRef01MatchDt0, null)
      val clientRef01DataDt0LoadResult = Helpers.toMapAny(clientRef01DataDt0Loaded)
      rep.check("client.load.map", clientRef01DataDt0LoadResult != null, "expected load result to be a map")
      rep.eq("client.load.id", clientRef01Data.get("id"), clientRef01DataDt0LoadResult.get("id"))

      // REMOVE
      val clientRef01MatchRm0 = new LinkedHashMap[String, Object]()
      clientRef01MatchRm0.put("id", clientRef01Data.get("id"))
      clientRef01Ent.remove(clientRef01MatchRm0, null)

      // LIST
      val clientRef01MatchRt0 = new LinkedHashMap[String, Object]()
      val clientRef01ListRt0Result = clientRef01Ent.list(clientRef01MatchRt0, null)
      rep.check("client.list.islist", clientRef01ListRt0Result.isInstanceOf[JList[?]], "expected list result to be an array, got " + clientRef01ListRt0Result)
      val clientRef01ListRt0 = clientRef01ListRt0Result.asInstanceOf[JList[Object]]
      val clientRef01ListRt0NotFound = Struct.select(
          SdkTestSupport.entityListToData(clientRef01ListRt0), SdkTestSupport.om("id" -> clientRef01Data.get("id")))
      rep.check("client.list.notexists", Struct.isempty(clientRef01ListRt0NotFound), "expected removed entity to not be in list")
    }
  }
}
