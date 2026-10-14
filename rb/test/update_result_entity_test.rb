# UpdateResult entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinDecryptxP2pe_sdk"
require_relative "runner"

class UpdateResultEntityTest < Minitest::Test
  # main.kit.test.live.strict is true (the default is true): a live
  # request that fails, or a live test missing an input it needs,
  # fails the test.
  # An account with no record for a test to read skips it either way.
  LIVE_STRICT = true

  def test_create_instance
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    ent = testsdk.UpdateResult(nil)
    assert !ent.nil?
  end

  def test_list_entities
    seed = {
      "entity" => {
        "update_result" => {
          "l1" => { "id" => "l1" },
          "l2" => { "id" => "l2" },
        },
      },
    }
    items = BluefinDecryptxP2peSDK.test(seed, nil).UpdateResult(nil).list(nil, nil)
    # list resolves to one entity per record; data_get reads the record.
    assert_equal 2, items.length
    items.each do |item|
      assert item.respond_to?(:data_get)
      assert item.data_get.is_a?(Hash)
    end
  end

  # Feature #4: the entity stream(action, ...) method runs the op pipeline and
  # returns an Enumerator over result items. With the streaming feature active
  # it yields the feature's incremental output; otherwise it falls back to the
  # materialised list so stream always yields.
  def test_stream
    seed = {
      "entity" => {
        "update_result" => {
          "s1" => { "id" => "s1" },
          "s2" => { "id" => "s2" },
          "s3" => { "id" => "s3" },
        },
      },
    }

    # Fallback: streaming inactive -> yields the materialised list items.
    base = BluefinDecryptxP2peSDK.test(seed, nil)
    seen = base.UpdateResult(nil).stream("list", nil, nil).to_a
    assert_equal 3, seen.length

    # Inbound: streaming active -> yields each item from the feature.
    cfg = BluefinDecryptxP2peConfig.shared_config
    if cfg["feature"].is_a?(Hash) && cfg["feature"].key?("streaming")
      sdk = BluefinDecryptxP2peSDK.test(seed, { "feature" => { "streaming" => { "active" => true } } })
      got = []
      sdk.UpdateResult(nil).stream("list", nil, nil).each do |item|
        if item.is_a?(Array)
          got.concat(item)
        else
          got << item
        end
      end
      assert_equal 3, got.length
    end
  end

  class FailHook < BluefinDecryptxP2peBaseFeature
    attr_reader :unexpected

    def initialize
      super()
      @name = "failhook"
      @unexpected = 0
    end

    def PreSpec(ctx)
      raise "update_result hook failed"
    end

    def PreUnexpected(ctx)
      @unexpected += 1
    end
  end

  def test_stream_error
    offline = { "net" => { "offline" => true } }
    err = assert_raises(StandardError) do
      BluefinDecryptxP2peSDK.test(offline, nil).UpdateResult(nil).stream("list", nil, nil).to_a
    end
    assert_match(/offline/, err.message)

    BluefinDecryptxP2peSDK.test(offline, nil).UpdateResult(nil)
      .stream("list", nil, { "ctrl" => { "throw" => false } }).to_a

    cfg = BluefinDecryptxP2peConfig.shared_config
    if cfg["feature"].is_a?(Hash) && cfg["feature"].key?("rbac")
      denied = BluefinDecryptxP2peSDK.test(nil, { "feature" => { "rbac" => { "active" => true, "deny" => true } } })
      err = assert_raises(StandardError) do
        denied.UpdateResult(nil).stream("list", nil, nil).to_a
      end
      assert_equal "rbac_denied", err.code
    end
  end

  def test_stream_ctrl
    explain = {}
    ctrl = { "explain" => explain }
    BluefinDecryptxP2peSDK.test(nil, nil).UpdateResult(nil).stream("list", nil, { "ctrl" => ctrl }).to_a
    assert_equal ["explain"], ctrl.keys
    assert_same explain, ctrl["explain"]
    refute_empty explain
  end

  def test_unexpected
    hook = FailHook.new
    client = BluefinDecryptxP2peSDK.new({ "feature" => { "test" => { "active" => true } }, "extend" => [hook] })

    err = assert_raises(StandardError) do
      client.UpdateResult(nil).list(nil, nil)
    end
    assert_match(/hook failed/, err.message)
    assert_operator hook.unexpected, :>, 0

    fired = hook.unexpected
    assert_nil client.UpdateResult(nil).list(nil, { "throw" => false })
    assert_operator hook.unexpected, :>, fired
  end

  def test_validate
    cfg = BluefinDecryptxP2peConfig.shared_config
    unless cfg["feature"].is_a?(Hash) && cfg["feature"].key?("validate")
      skip("feature not present in this SDK: validate")
    end
    client = BluefinDecryptxP2peSDK.test(nil, { "feature" => { "validate" => { "active" => true } } })
    err = assert_raises(StandardError) do
      client.UpdateResult(nil).list({ "client" => 1 }, nil)
    end
    assert_equal "validate_failed", err.code
  end

  def test_basic_flow
    setup = update_result_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create", "list", "update"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "update_result." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    client = setup[:client]

    # CREATE
    update_result_ref01_ent = client.UpdateResult(nil)
    update_result_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.update_result"), "update_result_ref01"))

    update_result_ref01_data_result = update_result_ref01_ent.create(update_result_ref01_data, nil)
    update_result_ref01_data = Helpers.to_map(update_result_ref01_data_result.respond_to?(:data_get) ? update_result_ref01_data_result.data_get : update_result_ref01_data_result)
    assert !update_result_ref01_data.nil?
    assert !update_result_ref01_data["id"].nil?

    # LIST
    update_result_ref01_match = {}

    update_result_ref01_list_result = update_result_ref01_ent.list(update_result_ref01_match, nil)
    assert update_result_ref01_list_result.is_a?(Array)

    found_item = Vs.select(
      Runner.entity_list_to_data(update_result_ref01_list_result),
      { "id" => update_result_ref01_data["id"] })
    assert !Vs.isempty(found_item)

    # UPDATE
    update_result_ref01_data_up0_up = {
      "id" => update_result_ref01_data["id"],
    }

    update_result_ref01_markdef_up0_name = "address1"
    update_result_ref01_markdef_up0_value = "Mark01-update_result_ref01_#{setup[:now]}"
    update_result_ref01_data_up0_up[update_result_ref01_markdef_up0_name] = update_result_ref01_markdef_up0_value

    update_result_ref01_resdata_up0_result = update_result_ref01_ent.update(update_result_ref01_data_up0_up, nil)
    update_result_ref01_resdata_up0 = Helpers.to_map(update_result_ref01_resdata_up0_result.respond_to?(:data_get) ? update_result_ref01_resdata_up0_result.data_get : update_result_ref01_resdata_up0_result)
    assert !update_result_ref01_resdata_up0.nil?
    assert_equal update_result_ref01_resdata_up0["id"], update_result_ref01_data_up0_up["id"]
    assert_equal update_result_ref01_resdata_up0[update_result_ref01_markdef_up0_name], update_result_ref01_markdef_up0_value

  end
end

def update_result_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "update_result", "UpdateResultTestData.json")
  entity_data_source = File.read(entity_data_file, encoding: "UTF-8")
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinDecryptxP2peSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["update_result01", "update_result02", "update_result03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  entid_env_raw = ENV["BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID" => idmap,
    "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_APIKEY" => "",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFIN_DECRYPTX_P2PE_TEST_UPDATE_RESULT_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      # FIRST, so the generated fields below win: sdk-test-control.json's
      # test.client.options adds to the live client, it does not redirect it.
      Runner.live_client_options,
      {
        "apikey" => env["BLUEFIN_DECRYPTX_P2PE_APIKEY"],
      },
      extra || {},
    ])
    client = BluefinDecryptxP2peSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
