// Generated basic-flow test for the device_custody_list entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct DeviceCustodyListSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static DeviceCustodyListSetup device_custody_list_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/device_custody_list/DeviceCustodyListTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("device_custody_list01"), Value("device_custody_list02"), Value("device_custody_list03"), Value("device01"), Value("device02"), Value("device03"), Value("device_type01"), Value("serial_number01")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_LIST_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  DeviceCustodyListSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void device_custody_list_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->device_custody_list();
  ASSERT_EQ(ent->getName(), std::string("device_custody_list"), "entity name");
}

static void device_custody_list_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"device_custody_list", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->device_custody_list();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->device_custody_list();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void device_custody_list_entity_basic() {
  auto setup = device_custody_list_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"list"}) {
    auto sk = is_control_skipped("entityOp", std::string("device_custody_list.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value device_custody_list_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "device_custody_list"}));
  Value device_custody_list_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(device_custody_list_ref01_data_raw);
    device_custody_list_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!device_custody_list_ref01_data.is_map()) device_custody_list_ref01_data = vmap();
  }
  // LIST
  auto device_custody_list_ref01_ent = client->device_custody_list();
  Value device_custody_list_ref01_match = vmap();
  setp(device_custody_list_ref01_match, "device_type", getp(setup.idmap, "device_type01"));
  setp(device_custody_list_ref01_match, "serial_number", getp(setup.idmap, "serial_number01"));
  Value device_custody_list_ref01_list = device_custody_list_ref01_ent->list(Struct::clone(device_custody_list_ref01_match), Value::undef());
  ASSERT_TRUE(device_custody_list_ref01_list.is_list(), "expected list result to be an array");

}

int main() {
  T_RUN(device_custody_list_entity_instance);
  T_RUN(device_custody_list_entity_stream);
  T_RUN(device_custody_list_entity_basic);
  return sdktest::summary("device_custody_list_entity_test");
}
