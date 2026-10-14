# CreateResult entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinDecryptxP2pe_sdk"
require_relative "runner"

class CreateResultEntityTest < Minitest::Test
  # main.kit.test.live.strict is true (the default is true): a live
  # request that fails, or a live test missing an input it needs,
  # fails the test.
  # An account with no record for a test to read skips it either way.
  LIVE_STRICT = true

  def test_create_instance
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    ent = testsdk.CreateResult(nil)
    assert !ent.nil?
  end

  def test_validate
    cfg = BluefinDecryptxP2peConfig.shared_config
    unless cfg["feature"].is_a?(Hash) && cfg["feature"].key?("validate")
      skip("feature not present in this SDK: validate")
    end
    client = BluefinDecryptxP2peSDK.test(nil, { "feature" => { "validate" => { "active" => true } } })
    err = assert_raises(StandardError) do
      client.CreateResult(nil).create({ "device_type" => 1, "serial_number" => "x", "custodian" => "x", "location" => "x" }, nil)
    end
    assert_equal "validate_failed", err.code
  end

  def test_basic_flow
    setup = create_result_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "create_result." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    if setup[:live]
      ["device_type01", "serial_number01"].each do |_live_key|
        if setup[:synthetic_only] || setup[:idmap][_live_key].nil?
          Runner.live_miss(LIVE_STRICT, "Live entity test blocked: needs #{_live_key} via BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID")
        end
      end
    end
    client = setup[:client]

    # CREATE
    create_result_ref01_ent = client.CreateResult(nil)
    create_result_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.create_result"), "create_result_ref01"))
    create_result_ref01_data["device_type"] = setup[:idmap]["device_type01"]
    create_result_ref01_data["serial_number"] = setup[:idmap]["serial_number01"]

    create_result_ref01_data_result = create_result_ref01_ent.create(create_result_ref01_data, nil)
    create_result_ref01_data = Helpers.to_map(create_result_ref01_data_result.respond_to?(:data_get) ? create_result_ref01_data_result.data_get : create_result_ref01_data_result)
    assert !create_result_ref01_data.nil?

  end
end

def create_result_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "create_result", "CreateResultTestData.json")
  entity_data_source = File.read(entity_data_file, encoding: "UTF-8")
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinDecryptxP2peSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["create_result01", "create_result02", "create_result03", "device01", "device02", "device03", "device_type01", "serial_number01"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  entid_env_raw = ENV["BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID" => idmap,
    "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_APIKEY" => "",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFIN_DECRYPTX_P2PE_TEST_CREATE_RESULT_ENTID"])
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
