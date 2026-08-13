// Generated basic-flow test for the inject_key entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct InjectKeySetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static InjectKeySetup inject_key_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/inject_key/InjectKeyTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("inject_key01"), Value("inject_key02"), Value("inject_key03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  InjectKeySetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void inject_key_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->inject_key();
  ASSERT_EQ(ent->getName(), std::string("inject_key"), "entity name");
}


static void inject_key_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"inject_key", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->inject_key();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->inject_key();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void inject_key_entity_basic() {
  auto setup = inject_key_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"list", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("inject_key.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value inject_key_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "inject_key"}));
  Value inject_key_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(inject_key_ref01_data_raw);
    inject_key_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!inject_key_ref01_data.is_map()) inject_key_ref01_data = vmap();
  }
  // LIST
  auto inject_key_ref01_ent = client->inject_key();
  Value inject_key_ref01_match = vmap();
  auto inject_key_ref01_list_ents = inject_key_ref01_ent->list(Struct::clone(inject_key_ref01_match), Value::undef());
  // list resolves to one ENTITY per record; the flow asserts on the records.
  Value inject_key_ref01_list = vlist();
  for (const auto& e : inject_key_ref01_list_ents) { inject_key_ref01_list.as_list()->push_back(e->data()); }
  ASSERT_TRUE(inject_key_ref01_list.is_list(), "expected list result to be an array");

  // LOAD
  Value inject_key_ref01_match_dt0 = vmap({{"id", getp(inject_key_ref01_data, "id")}});
  Value inject_key_ref01_data_dt0_loaded = inject_key_ref01_ent->load(Struct::clone(inject_key_ref01_match_dt0), Value::undef())->data();
  Value inject_key_ref01_data_dt0_load_result = Helpers::toMapAny(inject_key_ref01_data_dt0_loaded);
  ASSERT_TRUE(inject_key_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(inject_key_ref01_data_dt0_load_result, "id"), getp(inject_key_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(inject_key_entity_instance);
  T_RUN(inject_key_entity_stream);
  T_RUN(inject_key_entity_basic);
  return sdktest::summary("inject_key_entity_test");
}
