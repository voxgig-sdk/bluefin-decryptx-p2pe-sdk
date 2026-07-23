// Generated basic-flow test for the device entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct DeviceSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static DeviceSetup device_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/device/DeviceTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("device01"), Value("device02"), Value("device03"), Value("serial_number01")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_DEVICE_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_DEVICE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  DeviceSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void device_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->device();
  ASSERT_EQ(ent->getName(), std::string("device"), "entity name");
}

static void device_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"device", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->device();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->device();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void device_entity_basic() {
  auto setup = device_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("device.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto device_ref01_ent = client->device();
  Value device_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "device"}), "device_ref01"));
  if (!device_ref01_data.is_map()) device_ref01_data = vmap();
  setp(device_ref01_data, "serial_number", getp(setup.idmap, "serial_number01"));
  {
    Value device_ref01_data_result = device_ref01_ent->create(Struct::clone(device_ref01_data), Value::undef());
    device_ref01_data = Helpers::toMapAny(device_ref01_data_result);
    if (!device_ref01_data.is_map()) device_ref01_data = vmap();
    ASSERT_TRUE(device_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(device_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value device_ref01_match = vmap();
  Value device_ref01_list = device_ref01_ent->list(Struct::clone(device_ref01_match), Value::undef());
  ASSERT_TRUE(device_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(device_ref01_list), vmap({{"id", getp(device_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // LOAD
  Value device_ref01_match_dt0 = vmap({{"id", getp(device_ref01_data, "id")}});
  Value device_ref01_data_dt0_loaded = device_ref01_ent->load(Struct::clone(device_ref01_match_dt0), Value::undef());
  Value device_ref01_data_dt0_load_result = Helpers::toMapAny(device_ref01_data_dt0_loaded);
  ASSERT_TRUE(device_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(device_ref01_data_dt0_load_result, "id"), getp(device_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(device_entity_instance);
  T_RUN(device_entity_stream);
  T_RUN(device_entity_basic);
  return sdktest::summary("device_entity_test");
}
