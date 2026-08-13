// Generated basic-flow test for the create_result entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct CreateResultSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static CreateResultSetup create_result_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/create_result/CreateResultTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("create_result01"), Value("create_result02"), Value("create_result03"), Value("device01"), Value("device02"), Value("device03"), Value("device_type01"), Value("serial_number01")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  CreateResultSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void create_result_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->create_result();
  ASSERT_EQ(ent->getName(), std::string("create_result"), "entity name");
}


static void create_result_entity_basic() {
  auto setup = create_result_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("create_result.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto create_result_ref01_ent = client->create_result();
  Value create_result_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "create_result"}), "create_result_ref01"));
  if (!create_result_ref01_data.is_map()) create_result_ref01_data = vmap();
  setp(create_result_ref01_data, "device_type", getp(setup.idmap, "device_type01"));
  setp(create_result_ref01_data, "serial_number", getp(setup.idmap, "serial_number01"));
  {
    Value create_result_ref01_data_result = create_result_ref01_ent->create(Struct::clone(create_result_ref01_data), Value::undef())->data();
    create_result_ref01_data = Helpers::toMapAny(create_result_ref01_data_result);
    if (!create_result_ref01_data.is_map()) create_result_ref01_data = vmap();
    ASSERT_TRUE(create_result_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(create_result_entity_instance);
  T_RUN(create_result_entity_basic);
  return sdktest::summary("create_result_entity_test");
}
