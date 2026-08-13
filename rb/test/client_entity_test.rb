# Client entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinDecryptxP2pe_sdk"
require_relative "runner"

class ClientEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    ent = testsdk.Client(nil)
    assert !ent.nil?
  end

  # Feature #4: the entity stream(action, ...) method runs the op pipeline and
  # returns an Enumerator over result items. With the streaming feature active
  # it yields the feature's incremental output; otherwise it falls back to the
  # materialised list so stream always yields.
  def test_stream
    seed = {
      "entity" => {
        "client" => {
          "s1" => { "id" => "s1" },
          "s2" => { "id" => "s2" },
          "s3" => { "id" => "s3" },
        },
      },
    }

    # Fallback: streaming inactive -> yields the materialised list items.
    base = BluefinDecryptxP2peSDK.test(seed, nil)
    seen = base.Client(nil).stream("list", nil, nil).to_a
    assert_equal 3, seen.length

    # Inbound: streaming active -> yields each item from the feature.
    cfg = BluefinDecryptxP2peConfig.make_config
    if cfg["feature"].is_a?(Hash) && cfg["feature"].key?("streaming")
      sdk = BluefinDecryptxP2peSDK.test(seed, { "feature" => { "streaming" => { "active" => true } } })
      got = []
      sdk.Client(nil).stream("list", nil, nil).each do |item|
        if item.is_a?(Array)
          got.concat(item)
        else
          got << item
        end
      end
      assert_equal 3, got.length
    end
  end

  def test_basic_flow
    setup = client_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create", "list", "load", "remove"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "client." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    client_ref01_ent = client.Client(nil)
    client_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.client"), "client_ref01"))

    client_ref01_data_result = client_ref01_ent.create(client_ref01_data, nil)
    client_ref01_data = Helpers.to_map(client_ref01_data_result.respond_to?(:data_get) ? client_ref01_data_result.data_get : client_ref01_data_result)
    assert !client_ref01_data.nil?
    assert !client_ref01_data["id"].nil?

    # LIST
    client_ref01_match = {}

    client_ref01_list_result = client_ref01_ent.list(client_ref01_match, nil)
    assert client_ref01_list_result.is_a?(Array)

    found_item = Vs.select(
      Runner.entity_list_to_data(client_ref01_list_result),
      { "id" => client_ref01_data["id"] })
    assert !Vs.isempty(found_item)

    # LOAD
    client_ref01_match_dt0 = {
      "id" => client_ref01_data["id"],
    }
    client_ref01_data_dt0_loaded = client_ref01_ent.load(client_ref01_match_dt0, nil)
    client_ref01_data_dt0_load_result = Helpers.to_map(client_ref01_data_dt0_loaded.respond_to?(:data_get) ? client_ref01_data_dt0_loaded.data_get : client_ref01_data_dt0_loaded)
    assert !client_ref01_data_dt0_load_result.nil?
    assert_equal client_ref01_data_dt0_load_result["id"], client_ref01_data["id"]

    # REMOVE
    client_ref01_match_rm0 = {
      "id" => client_ref01_data["id"],
    }
    client_ref01_ent.remove(client_ref01_match_rm0, nil)

    # LIST
    client_ref01_match_rt0 = {}

    client_ref01_list_rt0_result = client_ref01_ent.list(client_ref01_match_rt0, nil)
    assert client_ref01_list_rt0_result.is_a?(Array)

    not_found_item = Vs.select(
      Runner.entity_list_to_data(client_ref01_list_rt0_result),
      { "id" => client_ref01_data["id"] })
    assert Vs.isempty(not_found_item)

  end
end

def client_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "client", "ClientTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinDecryptxP2peSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["client01", "client02", "client03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID" => idmap,
    "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
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
