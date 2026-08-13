// Generated basic-flow test for the decryption entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct DecryptionSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static DecryptionSetup decryption_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/decryption/DecryptionTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("decryption01"), Value("decryption02"), Value("decryption03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_DECRYPTION_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_DECRYPTION_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  DecryptionSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void decryption_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->decryption();
  ASSERT_EQ(ent->getName(), std::string("decryption"), "entity name");
}


static void decryption_entity_basic() {
  auto setup = decryption_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create"}) {
    auto sk = is_control_skipped("entityOp", std::string("decryption.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto decryption_ref01_ent = client->decryption();
  Value decryption_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "decryption"}), "decryption_ref01"));
  if (!decryption_ref01_data.is_map()) decryption_ref01_data = vmap();
  {
    Value decryption_ref01_data_result = decryption_ref01_ent->create(Struct::clone(decryption_ref01_data), Value::undef())->data();
    decryption_ref01_data = Helpers::toMapAny(decryption_ref01_data_result);
    if (!decryption_ref01_data.is_map()) decryption_ref01_data = vmap();
    ASSERT_TRUE(decryption_ref01_data.is_map(), "expected create result to be a map");
  }

}

int main() {
  T_RUN(decryption_entity_instance);
  T_RUN(decryption_entity_basic);
  return sdktest::summary("decryption_entity_test");
}
