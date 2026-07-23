// Generated basic-flow test for the client entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct ClientSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static ClientSetup client_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/client/ClientTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("client01"), Value("client02"), Value("client03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID", idmap},
    {"BLUEFINDECRYPTXP_PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFINDECRYPTXP_PE_TEST_CLIENT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value("TRUE");

  ClientSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void client_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->client();
  ASSERT_EQ(ent->getName(), std::string("client"), "entity name");
}

static void client_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"client", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->client();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->client();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static void client_entity_basic() {
  auto setup = client_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "load", "remove"}) {
    auto sk = is_control_skipped("entityOp", std::string("client.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto client_ref01_ent = client->client();
  Value client_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "client"}), "client_ref01"));
  if (!client_ref01_data.is_map()) client_ref01_data = vmap();
  {
    Value client_ref01_data_result = client_ref01_ent->create(Struct::clone(client_ref01_data), Value::undef());
    client_ref01_data = Helpers::toMapAny(client_ref01_data_result);
    if (!client_ref01_data.is_map()) client_ref01_data = vmap();
    ASSERT_TRUE(client_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(client_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value client_ref01_match = vmap();
  Value client_ref01_list = client_ref01_ent->list(Struct::clone(client_ref01_match), Value::undef());
  ASSERT_TRUE(client_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(client_ref01_list), vmap({{"id", getp(client_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // LOAD
  Value client_ref01_match_dt0 = vmap({{"id", getp(client_ref01_data, "id")}});
  Value client_ref01_data_dt0_loaded = client_ref01_ent->load(Struct::clone(client_ref01_match_dt0), Value::undef());
  Value client_ref01_data_dt0_load_result = Helpers::toMapAny(client_ref01_data_dt0_loaded);
  ASSERT_TRUE(client_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(client_ref01_data_dt0_load_result, "id"), getp(client_ref01_data, "id"), "expected load result id to match");

  // REMOVE
  {
    Value client_ref01_match_rm0 = vmap({{"id", getp(client_ref01_data, "id")}});
    client_ref01_ent->remove(Struct::clone(client_ref01_match_rm0), Value::undef());
  }

  // LIST
  Value client_ref01_match_rt0 = vmap();
  Value client_ref01_list_rt0 = client_ref01_ent->list(Struct::clone(client_ref01_match_rt0), Value::undef());
  ASSERT_TRUE(client_ref01_list_rt0.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(client_ref01_list_rt0), vmap({{"id", getp(client_ref01_data, "id")}}));
    ASSERT_TRUE(found.empty(), "expected removed entity to not be in list");
  }

}

int main() {
  T_RUN(client_entity_instance);
  T_RUN(client_entity_stream);
  T_RUN(client_entity_basic);
  return sdktest::summary("client_entity_test");
}
