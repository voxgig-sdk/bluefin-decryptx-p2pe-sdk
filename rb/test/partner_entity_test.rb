# Partner entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinDecryptxP2pe_sdk"
require_relative "runner"

class PartnerEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    ent = testsdk.Partner(nil)
    assert !ent.nil?
  end

  # Feature #4: the entity stream(action, ...) method runs the op pipeline and
  # returns an Enumerator over result items. With the streaming feature active
  # it yields the feature's incremental output; otherwise it falls back to the
  # materialised list so stream always yields.
  def test_stream
    seed = {
      "entity" => {
        "partner" => {
          "s1" => { "id" => "s1" },
          "s2" => { "id" => "s2" },
          "s3" => { "id" => "s3" },
        },
      },
    }

    # Fallback: streaming inactive -> yields the materialised list items.
    base = BluefinDecryptxP2peSDK.test(seed, nil)
    seen = base.Partner(nil).stream("list", nil, nil).to_a
    assert_equal 3, seen.length

    # Inbound: streaming active -> yields each item from the feature.
    cfg = BluefinDecryptxP2peConfig.make_config
    if cfg["feature"].is_a?(Hash) && cfg["feature"].key?("streaming")
      sdk = BluefinDecryptxP2peSDK.test(seed, { "feature" => { "streaming" => { "active" => true } } })
      got = []
      sdk.Partner(nil).stream("list", nil, nil).each do |item|
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
    setup = partner_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create", "list", "load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "partner." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # CREATE
    partner_ref01_ent = client.Partner(nil)
    partner_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.partner"), "partner_ref01"))

    partner_ref01_data_result = partner_ref01_ent.create(partner_ref01_data, nil)
    partner_ref01_data = Helpers.to_map(partner_ref01_data_result)
    assert !partner_ref01_data.nil?
    assert !partner_ref01_data["id"].nil?

    # LIST
    partner_ref01_match = {}

    partner_ref01_list_result = partner_ref01_ent.list(partner_ref01_match, nil)
    assert partner_ref01_list_result.is_a?(Array)

    found_item = Vs.select(
      Runner.entity_list_to_data(partner_ref01_list_result),
      { "id" => partner_ref01_data["id"] })
    assert !Vs.isempty(found_item)

    # LOAD
    partner_ref01_match_dt0 = {
      "id" => partner_ref01_data["id"],
    }
    partner_ref01_data_dt0_loaded = partner_ref01_ent.load(partner_ref01_match_dt0, nil)
    partner_ref01_data_dt0_load_result = Helpers.to_map(partner_ref01_data_dt0_loaded)
    assert !partner_ref01_data_dt0_load_result.nil?
    assert_equal partner_ref01_data_dt0_load_result["id"], partner_ref01_data["id"]

  end
end

def partner_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "partner", "PartnerTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinDecryptxP2peSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["partner01", "partner02", "partner03"],
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
  entid_env_raw = ENV["BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID" => idmap,
    "BLUEFINDECRYPTXP_PE_TEST_LIVE" => "FALSE",
    "BLUEFINDECRYPTXP_PE_TEST_EXPLAIN" => "FALSE",
    "BLUEFINDECRYPTXP_PE_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINDECRYPTXP_PE_TEST_PARTNER_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["BLUEFINDECRYPTXP_PE_APIKEY"],
      },
      extra || {},
    ])
    client = BluefinDecryptxP2peSDK.new(Helpers.to_map(merged_opts))
  end

  live = env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
