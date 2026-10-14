# DeviceRkiActivateResult entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinDecryptxP2pe_sdk"
require_relative "runner"

class DeviceRkiActivateResultEntityTest < Minitest::Test
  # main.kit.test.live.strict is true (the default is true): a live
  # request that fails, or a live test missing an input it needs,
  # fails the test.
  # An account with no record for a test to read skips it either way.
  LIVE_STRICT = true

  def test_create_instance
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    ent = testsdk.DeviceRkiActivateResult(nil)
    assert !ent.nil?
  end

  def test_validate
    cfg = BluefinDecryptxP2peConfig.shared_config
    unless cfg["feature"].is_a?(Hash) && cfg["feature"].key?("validate")
      skip("feature not present in this SDK: validate")
    end
    client = BluefinDecryptxP2peSDK.test(nil, { "feature" => { "validate" => { "active" => true } } })
    err = assert_raises(StandardError) do
      client.DeviceRkiActivateResult(nil).create({ "appVersion" => 1, "serialNumber" => "x", "success" => true }, nil)
    end
    assert_equal "validate_failed", err.code
  end

  def test_basic_flow
    setup = device_rki_activate_result_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["create"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "device_rki_activate_result." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    client = setup[:client]

    # CREATE
    device_rki_activate_result_ref01_ent = client.DeviceRkiActivateResult(nil)
    device_rki_activate_result_ref01_data = Helpers.to_map(Vs.getprop(
      Vs.getpath(setup[:data], "new.device_rki_activate_result"), "device_rki_activate_result_ref01"))

    device_rki_activate_result_ref01_data_result = device_rki_activate_result_ref01_ent.create(device_rki_activate_result_ref01_data, nil)
    device_rki_activate_result_ref01_data = Helpers.to_map(device_rki_activate_result_ref01_data_result.respond_to?(:data_get) ? device_rki_activate_result_ref01_data_result.data_get : device_rki_activate_result_ref01_data_result)
    assert !device_rki_activate_result_ref01_data.nil?

  end
end

def device_rki_activate_result_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "device_rki_activate_result", "DeviceRkiActivateResultTestData.json")
  entity_data_source = File.read(entity_data_file, encoding: "UTF-8")
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinDecryptxP2peSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["device_rki_activate_result01", "device_rki_activate_result02", "device_rki_activate_result03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Whether *_ENTID supplied the idmap, read before env_override consumes
  # it: without it, the ids a live flow binds are the fixture's synthetic ones.
  entid_env_raw = ENV["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID" => idmap,
    "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN" => "FALSE",
    "BLUEFIN_DECRYPTX_P2PE_APIKEY" => "",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_RKI_ACTIVATE_RESULT_ENTID"])
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
