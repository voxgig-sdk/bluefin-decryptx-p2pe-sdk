// Generated basic-flow test for the virtual_device entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct VirtualDeviceSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static VirtualDeviceSetup virtual_device_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/virtual_device/VirtualDeviceTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("virtual_device01"), Value("virtual_device02"), Value("virtual_device03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_VIRTUAL_DEVICE_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_VIRTUAL_DEVICE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  VirtualDeviceSetup s;
  s.client = client;
  s.d = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void virtual_device_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->virtual_device();
  ASSERT_EQ(ent->getName(), std::string("virtual_device"), "entity name");
}


static void virtual_device_entity_basic() {
  auto setup = virtual_device_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"load"}) {
    auto sk = is_control_skipped("entityOp", std::string("virtual_device.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value virtual_device_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "virtual_device"}));
  Value virtual_device_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(virtual_device_ref01_data_raw);
    virtual_device_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!virtual_device_ref01_data.is_map()) virtual_device_ref01_data = vmap();
  }
  // LOAD
  auto virtual_device_ref01_ent = client->virtual_device();
  Value virtual_device_ref01_match_dt0 = vmap({{"id", getp(virtual_device_ref01_data, "id")}});
  Value virtual_device_ref01_data_dt0_loaded = virtual_device_ref01_ent->load(Struct::clone(virtual_device_ref01_match_dt0), Value::undef())->data();
  Value virtual_device_ref01_data_dt0_load_result = Helpers::toMapAny(virtual_device_ref01_data_dt0_loaded);
  ASSERT_TRUE(virtual_device_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(virtual_device_ref01_data_dt0_load_result, "id"), getp(virtual_device_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(virtual_device_entity_instance);
  T_RUN(virtual_device_entity_basic);
  return sdktest::summary("virtual_device_entity_test");
}
