// Generated basic-flow test for the device_custody_detail entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct DeviceCustodyDetailSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static DeviceCustodyDetailSetup device_custody_detail_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/device_custody_detail/DeviceCustodyDetailTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("device_custody_detail01"), Value("device_custody_detail02"), Value("device_custody_detail03"), Value("device01"), Value("device02"), Value("device03"), Value("device_type01"), Value("serial_number01")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  DeviceCustodyDetailSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void device_custody_detail_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->device_custody_detail();
  ASSERT_EQ(ent->getName(), std::string("device_custody_detail"), "entity name");
}

static void device_custody_detail_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"device_custody_detail", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->device_custody_detail();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->device_custody_detail();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void device_custody_detail_entity_basic() {
  auto setup = device_custody_detail_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"load"}) {
    auto sk = is_control_skipped("entityOp", std::string("device_custody_detail.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value device_custody_detail_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "device_custody_detail"}));
  Value device_custody_detail_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(device_custody_detail_ref01_data_raw);
    device_custody_detail_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!device_custody_detail_ref01_data.is_map()) device_custody_detail_ref01_data = vmap();
  }
  // LOAD
  auto device_custody_detail_ref01_ent = client->device_custody_detail();
  Value device_custody_detail_ref01_match_dt0 = vmap({{"id", getp(device_custody_detail_ref01_data, "id")}});
  Value device_custody_detail_ref01_data_dt0_loaded = device_custody_detail_ref01_ent->load(Struct::clone(device_custody_detail_ref01_match_dt0), Value::undef());
  Value device_custody_detail_ref01_data_dt0_load_result = Helpers::toMapAny(device_custody_detail_ref01_data_dt0_loaded);
  ASSERT_TRUE(device_custody_detail_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(device_custody_detail_ref01_data_dt0_load_result, "id"), getp(device_custody_detail_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(device_custody_detail_entity_instance);
  T_RUN(device_custody_detail_entity_stream);
  T_RUN(device_custody_detail_entity_basic);
  return sdktest::summary("device_custody_detail_entity_test");
}
