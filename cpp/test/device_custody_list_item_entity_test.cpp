// Generated basic-flow test for the device_custody_list_item entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct DeviceCustodyListItemSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static DeviceCustodyListItemSetup device_custody_list_item_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/device_custody_list_item/DeviceCustodyListItemTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("device_custody_list_item01"), Value("device_custody_list_item02"), Value("device_custody_list_item03"), Value("device01"), Value("device02"), Value("device03"), Value("device_type01"), Value("serial_number01")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ITEM_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  DeviceCustodyListItemSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void device_custody_list_item_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->device_custody_list_item();
  ASSERT_EQ(ent->getName(), std::string("device_custody_list_item"), "entity name");
}


static bool device_custody_list_item_has_feature(const std::string& name) {
  Value fm = Helpers::toMapAny(getp(sharedConfig(), "feature"));
  return fm.is_map() && !getp(fm, name).is_undef();
}

static void device_custody_list_item_entity_validate() {
  if (!device_custody_list_item_has_feature("validate")) {
    std::cerr << "skip: feature not present in this SDK: validate\n";
    return;
  }
  auto vsdk = BluefinDecryptxP2peSDK::testSDK(Value::undef(), vmap({{"feature",
      vmap({{"validate", vmap({{"active", Value(true)}})}})}}));
  std::string code;
  try {
    vsdk->device_custody_list_item()->list(vmap({{"device_type", Value(1)}, {"serial_number", Value("x")}}), Value::undef());
  } catch (const SdkErrorPtr& err) {
    code = err->code;
  }
  ASSERT_EQ(code, std::string("validate_failed"), "an invalid request fails with validate_failed");
}

static void device_custody_list_item_entity_basic() {
  auto setup = device_custody_list_item_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"list"}) {
    auto sk = is_control_skipped("entityOp", std::string("device_custody_list_item.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value device_custody_list_item_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "device_custody_list_item"}));
  Value device_custody_list_item_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(device_custody_list_item_ref01_data_raw);
    device_custody_list_item_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!device_custody_list_item_ref01_data.is_map()) device_custody_list_item_ref01_data = vmap();
  }
  // LIST
  auto device_custody_list_item_ref01_ent = client->device_custody_list_item();
  Value device_custody_list_item_ref01_match = vmap();
  setp(device_custody_list_item_ref01_match, "device_type", getp(setup.idmap, "device_type01"));
  setp(device_custody_list_item_ref01_match, "serial_number", getp(setup.idmap, "serial_number01"));
  auto device_custody_list_item_ref01_list_ents = device_custody_list_item_ref01_ent->list(Struct::clone(device_custody_list_item_ref01_match), Value::undef());
  // list resolves to one ENTITY per record; the flow asserts on the records.
  Value device_custody_list_item_ref01_list = vlist();
  for (const auto& e : device_custody_list_item_ref01_list_ents) { device_custody_list_item_ref01_list.as_list()->push_back(e->data()); }
  ASSERT_TRUE(device_custody_list_item_ref01_list.is_list(), "expected list result to be an array");

}

int main() {
  T_RUN(device_custody_list_item_entity_instance);
  T_RUN(device_custody_list_item_entity_validate);
  T_RUN(device_custody_list_item_entity_basic);
  return sdktest::summary("device_custody_list_item_entity_test");
}
