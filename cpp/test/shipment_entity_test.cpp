// Generated basic-flow test for the shipment entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct ShipmentSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static ShipmentSetup shipment_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/shipment/ShipmentTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("shipment01"), Value("shipment02"), Value("shipment03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_SHIPMENT_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_SHIPMENT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  ShipmentSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void shipment_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->shipment();
  ASSERT_EQ(ent->getName(), std::string("shipment"), "entity name");
}

static void shipment_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"shipment", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->shipment();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->shipment();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void shipment_entity_basic() {
  auto setup = shipment_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("shipment.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto shipment_ref01_ent = client->shipment();
  Value shipment_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "shipment"}), "shipment_ref01"));
  if (!shipment_ref01_data.is_map()) shipment_ref01_data = vmap();
  {
    Value shipment_ref01_data_result = shipment_ref01_ent->create(Struct::clone(shipment_ref01_data), Value::undef());
    shipment_ref01_data = Helpers::toMapAny(shipment_ref01_data_result);
    if (!shipment_ref01_data.is_map()) shipment_ref01_data = vmap();
    ASSERT_TRUE(shipment_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(shipment_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value shipment_ref01_match = vmap();
  Value shipment_ref01_list = shipment_ref01_ent->list(Struct::clone(shipment_ref01_match), Value::undef());
  ASSERT_TRUE(shipment_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(shipment_ref01_list), vmap({{"id", getp(shipment_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // LOAD
  Value shipment_ref01_match_dt0 = vmap({{"id", getp(shipment_ref01_data, "id")}});
  Value shipment_ref01_data_dt0_loaded = shipment_ref01_ent->load(Struct::clone(shipment_ref01_match_dt0), Value::undef());
  Value shipment_ref01_data_dt0_load_result = Helpers::toMapAny(shipment_ref01_data_dt0_loaded);
  ASSERT_TRUE(shipment_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(shipment_ref01_data_dt0_load_result, "id"), getp(shipment_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(shipment_entity_instance);
  T_RUN(shipment_entity_stream);
  T_RUN(shipment_entity_basic);
  return sdktest::summary("shipment_entity_test");
}
