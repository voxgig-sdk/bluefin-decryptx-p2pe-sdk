// Generated basic-flow test for the attestation entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct AttestationSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static AttestationSetup attestation_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/attestation/AttestationTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("attestation01"), Value("attestation02"), Value("attestation03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  AttestationSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void attestation_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->attestation();
  ASSERT_EQ(ent->getName(), std::string("attestation"), "entity name");
}


static void attestation_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"attestation", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->attestation();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->attestation();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void attestation_entity_basic() {
  auto setup = attestation_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "load"}) {
    auto sk = is_control_skipped("entityOp", std::string("attestation.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto attestation_ref01_ent = client->attestation();
  Value attestation_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "attestation"}), "attestation_ref01"));
  if (!attestation_ref01_data.is_map()) attestation_ref01_data = vmap();
  {
    Value attestation_ref01_data_result = attestation_ref01_ent->create(Struct::clone(attestation_ref01_data), Value::undef())->data();
    attestation_ref01_data = Helpers::toMapAny(attestation_ref01_data_result);
    if (!attestation_ref01_data.is_map()) attestation_ref01_data = vmap();
    ASSERT_TRUE(attestation_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(attestation_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value attestation_ref01_match = vmap();
  auto attestation_ref01_list_ents = attestation_ref01_ent->list(Struct::clone(attestation_ref01_match), Value::undef());
  // list resolves to one ENTITY per record; the flow asserts on the records.
  Value attestation_ref01_list = vlist();
  for (const auto& e : attestation_ref01_list_ents) { attestation_ref01_list.as_list()->push_back(e->data()); }
  ASSERT_TRUE(attestation_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(attestation_ref01_list), vmap({{"id", getp(attestation_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // LOAD
  Value attestation_ref01_match_dt0 = vmap({{"id", getp(attestation_ref01_data, "id")}});
  Value attestation_ref01_data_dt0_loaded = attestation_ref01_ent->load(Struct::clone(attestation_ref01_match_dt0), Value::undef())->data();
  Value attestation_ref01_data_dt0_load_result = Helpers::toMapAny(attestation_ref01_data_dt0_loaded);
  ASSERT_TRUE(attestation_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(attestation_ref01_data_dt0_load_result, "id"), getp(attestation_ref01_data, "id"), "expected load result id to match");

}

int main() {
  T_RUN(attestation_entity_instance);
  T_RUN(attestation_entity_stream);
  T_RUN(attestation_entity_basic);
  return sdktest::summary("attestation_entity_test");
}
