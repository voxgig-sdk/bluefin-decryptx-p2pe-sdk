// Generated basic-flow test for the update_result entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct UpdateResultSetup {
  std::shared_ptr<BluefinDecryptxP2peSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static UpdateResultSetup update_result_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/update_result/UpdateResultTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinDecryptxP2peSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("update_result01"), Value("update_result02"), Value("update_result03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID", idmap},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value("TRUE");

  UpdateResultSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void update_result_entity_instance() {
  auto testsdk = BluefinDecryptxP2peSDK::testSDK();
  auto ent = testsdk->update_result();
  ASSERT_EQ(ent->getName(), std::string("update_result"), "entity name");
}


static void update_result_entity_stream() {
  // stream() runs the list op through the full pipeline and returns the
  // result items. Seed two entities via test mode; with the streaming feature
  // active it yields the feature's incremental items, else it falls back to
  // the materialised items — either way every item is yielded.
  Value seed = vmap({{"entity", vmap({{"update_result", vmap({
      {"strm01", vmap({{"id", Value("strm01")}})},
      {"strm02", vmap({{"id", Value("strm02")}})}})}})}});
  Value sdkopts = vmap({{"feature",
      vmap({{"streaming", vmap({{"active", Value(true)}})}})}});

  auto strsdk = BluefinDecryptxP2peSDK::testSDK(seed, sdkopts);
  auto se = strsdk->update_result();
  std::vector<Value> items = se->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)items.size(), 2, "stream yields both seeded items");

  auto plainsdk = BluefinDecryptxP2peSDK::testSDK(seed, Value::undef());
  auto pe = plainsdk->update_result();
  std::vector<Value> pitems = pe->stream("list", Value::undef(), Value::undef());
  ASSERT_EQ((int)pitems.size(), 2, "fallback stream yields both items");
}

static bool update_result_has_feature(const std::string& name) {
  Value fm = Helpers::toMapAny(getp(sharedConfig(), "feature"));
  return fm.is_map() && !getp(fm, name).is_undef();
}

class UpdateResultFailHook : public BaseFeature {
public:
  int unexpected = 0;
  UpdateResultFailHook() : BaseFeature("failhook", "0.0.1", true) {}
  void preSpec(CtxPtr ctx) override {
    throw std::runtime_error("update_result hook failed");
  }
  void preUnexpected(CtxPtr ctx) override {
    unexpected++;
  }
};

static void update_result_entity_stream_error() {
  Value offline = vmap({{"net", vmap({{"offline", Value(true)}})}});
  std::string msg;
  try {
    BluefinDecryptxP2peSDK::testSDK(offline, Value::undef())->update_result()
        ->stream("list", Value::undef(), Value::undef());
  } catch (const SdkErrorPtr& err) {
    msg = err->getMessage();
  }
  ASSERT_TRUE(msg.find("offline") != std::string::npos,
      "stream: a failed operation fails the stream");

  bool raised = false;
  try {
    BluefinDecryptxP2peSDK::testSDK(offline, Value::undef())->update_result()
        ->stream("list", Value::undef(), vmap({{"ctrl", vmap({{"throw", Value(false)}})}}));
  } catch (const SdkErrorPtr&) {
    raised = true;
  }
  ASSERT_FALSE(raised, "stream: under throw false a failed stream ends");

  if (update_result_has_feature("rbac")) {
    std::string code;
    try {
      BluefinDecryptxP2peSDK::testSDK(Value::undef(), vmap({{"feature", vmap({{"rbac",
          vmap({{"active", Value(true)}, {"deny", Value(true)}})}})}}))->update_result()
          ->stream("list", Value::undef(), Value::undef());
    } catch (const SdkErrorPtr& err) {
      code = err->code;
    }
    ASSERT_EQ(code, std::string("rbac_denied"), "stream: a denied operation fails the stream");
  }
}

static void update_result_entity_stream_ctrl() {
  Value explain = vmap();
  Value ctrl = vmap({{"explain", explain}});
  BluefinDecryptxP2peSDK::testSDK()->update_result()->stream("list", Value::undef(), vmap({{"ctrl", ctrl}}));
  ASSERT_TRUE(getp(ctrl, "stream").is_undef(), "stream: the caller's ctrl gains no key");
  ASSERT_TRUE(!explain.as_map()->empty(), "stream: the caller's explain record is filled");
}

static void update_result_entity_unexpected() {
  auto hook = std::make_shared<UpdateResultFailHook>();
  auto client = BluefinDecryptxP2peSDK::testSDK();
  client->getRootCtx()->utility->featureAdd(client->getRootCtx(), hook);

  std::string msg;
  try {
    client->update_result()->list(Value::undef(), Value::undef());
  } catch (const SdkErrorPtr& err) {
    msg = err->getMessage();
  }
  ASSERT_TRUE(msg.find("hook failed") != std::string::npos, "a throwing hook fails the operation");
  ASSERT_TRUE(0 < hook->unexpected, "a throwing hook fires PreUnexpected");

  int fired = hook->unexpected;
  client->update_result()->list(Value::undef(), vmap({{"throw", Value(false)}}));
  ASSERT_TRUE(fired < hook->unexpected, "under throw false PreUnexpected fires too");
}

static void update_result_entity_validate() {
  if (!update_result_has_feature("validate")) {
    std::cerr << "skip: feature not present in this SDK: validate\n";
    return;
  }
  auto vsdk = BluefinDecryptxP2peSDK::testSDK(Value::undef(), vmap({{"feature",
      vmap({{"validate", vmap({{"active", Value(true)}})}})}}));
  std::string code;
  try {
    vsdk->update_result()->list(vmap({{"client", Value(1)}}), Value::undef());
  } catch (const SdkErrorPtr& err) {
    code = err->code;
  }
  ASSERT_EQ(code, std::string("validate_failed"), "an invalid request fails with validate_failed");
}

static void update_result_entity_basic() {
  auto setup = update_result_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "list", "update"}) {
    auto sk = is_control_skipped("entityOp", std::string("update_result.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto update_result_ref01_ent = client->update_result();
  Value update_result_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "update_result"}), "update_result_ref01"));
  if (!update_result_ref01_data.is_map()) update_result_ref01_data = vmap();
  {
    Value update_result_ref01_data_result = update_result_ref01_ent->create(Struct::clone(update_result_ref01_data), Value::undef())->data();
    update_result_ref01_data = Helpers::toMapAny(update_result_ref01_data_result);
    if (!update_result_ref01_data.is_map()) update_result_ref01_data = vmap();
    ASSERT_TRUE(update_result_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(update_result_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LIST
  Value update_result_ref01_match = vmap();
  auto update_result_ref01_list_ents = update_result_ref01_ent->list(Struct::clone(update_result_ref01_match), Value::undef());
  // list resolves to one ENTITY per record; the flow asserts on the records.
  Value update_result_ref01_list = vlist();
  for (const auto& e : update_result_ref01_list_ents) { update_result_ref01_list.as_list()->push_back(e->data()); }
  ASSERT_TRUE(update_result_ref01_list.is_list(), "expected list result to be an array");
  {
    std::vector<Value> found = Struct::select(entity_list_to_data(update_result_ref01_list), vmap({{"id", getp(update_result_ref01_data, "id")}}));
    ASSERT_TRUE(!found.empty(), "expected to find created entity in list");
  }

  // UPDATE
  Value update_result_ref01_data_up0_up = vmap();
  setp(update_result_ref01_data_up0_up, "id", getp(update_result_ref01_data, "id"));
  std::string update_result_ref01_data_up0_markval = std::string("Mark01-update_result_ref01_") + std::to_string(setup.now);
  setp(update_result_ref01_data_up0_up, "address1", Value(update_result_ref01_data_up0_markval));
  Value update_result_ref01_resdata_up0_result = update_result_ref01_ent->update(Struct::clone(update_result_ref01_data_up0_up), Value::undef())->data();
  Value update_result_ref01_resdata_up0 = Helpers::toMapAny(update_result_ref01_resdata_up0_result);
  if (!update_result_ref01_resdata_up0.is_map()) update_result_ref01_resdata_up0 = vmap();
  ASSERT_TRUE(update_result_ref01_resdata_up0.is_map(), "expected update result to be a map");
  ASSERT_EQ_VAL(getp(update_result_ref01_resdata_up0, "id"), getp(update_result_ref01_data_up0_up, "id"), "expected update result id to match");
  ASSERT_EQ_VAL(getp(update_result_ref01_resdata_up0, "address1"), Value(update_result_ref01_data_up0_markval), "expected address1 to be updated");

}

int main() {
  T_RUN(update_result_entity_instance);
  T_RUN(update_result_entity_stream);
  T_RUN(update_result_entity_stream_error);
  T_RUN(update_result_entity_stream_ctrl);
  T_RUN(update_result_entity_unexpected);
  T_RUN(update_result_entity_validate);
  T_RUN(update_result_entity_basic);
  return sdktest::summary("update_result_entity_test");
}
