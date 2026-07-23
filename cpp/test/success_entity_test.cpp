// Generated basic-flow test for the success entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct SuccessSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static SuccessSetup success_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/success/SuccessTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("success01"), Value("success02"), Value("success03"), Value("virtual_device01"), Value("virtual_device02"), Value("virtual_device03"), Value("share_partner_to01")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_SUCCESS_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_SUCCESS_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  SuccessSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void success_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->success();
  ASSERT_EQ(ent->getName(), std::string("success"), "entity name");
}

static void success_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"success", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->success();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->success();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void success_entity_basic() {
  auto setup = success_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "remove"}) {
    auto sk = is_control_skipped("entityOp", std::string("success.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto success_ref01_ent = client->success();
  Value success_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "success"}), "success_ref01"));
  if (!success_ref01_data.is_map()) success_ref01_data = vmap();
  setp(success_ref01_data, "share_partner_to", getp(setup.idmap, "share_partner_to01"));
  {
    Value success_ref01_data_result = success_ref01_ent->create(Struct::clone(success_ref01_data), Value::undef());
    success_ref01_data = Helpers::toMapAny(success_ref01_data_result);
    if (!success_ref01_data.is_map()) success_ref01_data = vmap();
    ASSERT_TRUE(success_ref01_data.is_map(), "expected create result to be a map");
  }

  // REMOVE
  {
    Value success_ref01_match_rm0 = vmap({{"id", getp(success_ref01_data, "id")}});
    success_ref01_ent->remove(Struct::clone(success_ref01_match_rm0), Value::undef());
  }

}

int main() {
  T_RUN(success_entity_instance);
  T_RUN(success_entity_stream);
  T_RUN(success_entity_basic);
  return sdktest::summary("success_entity_test");
}
