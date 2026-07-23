// Generated basic-flow test for the kif entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct KifSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static KifSetup kif_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/kif/KifTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("kif01"), Value("kif02"), Value("kif03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_KIF_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_KIF_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  KifSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void kif_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->kif();
  ASSERT_EQ(ent->getName(), std::string("kif"), "entity name");
}

static void kif_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"kif", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->kif();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->kif();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void kif_entity_basic() {
  auto setup = kif_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"list"}) {
    auto sk = is_control_skipped("entityOp", std::string("kif.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;

  // Bootstrap entity data from existing test data (no create step in flow).
  // Declare _data at FUNCTION scope (later load/update steps reference it);
  // only _data_raw was declared, so the block-local assignment left _data
  // undeclared ("was not declared in this scope").
  Value kif_ref01_data_raw = Helpers::toMapAny(Struct::getpath(setup.data, {"existing", "kif"}));
  Value kif_ref01_data = vmap();
  {
    std::vector<Value> its = Struct::items(kif_ref01_data_raw);
    kif_ref01_data = its.empty() ? vmap() : Helpers::toMapAny(pair_val(its[0]));
    if (!kif_ref01_data.is_map()) kif_ref01_data = vmap();
  }
  // LIST
  auto kif_ref01_ent = client->kif();
  Value kif_ref01_match = vmap();
  Value kif_ref01_list = kif_ref01_ent->list(Struct::clone(kif_ref01_match), Value::undef());
  ASSERT_TRUE(kif_ref01_list.is_list(), "expected list result to be an array");

}

int main() {
  T_RUN(kif_entity_instance);
  T_RUN(kif_entity_stream);
  T_RUN(kif_entity_basic);
  return sdktest::summary("kif_entity_test");
}
