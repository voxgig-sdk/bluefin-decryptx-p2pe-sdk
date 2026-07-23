# DeviceCustodyDetail entity test

require "minitest/autorun"
require "json"
require_relative "../BluefinDecryptxP2pe_sdk"
require_relative "runner"

class DeviceCustodyDetailEntityTest < Minitest::Test
  def test_create_instance
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    ent = testsdk.DeviceCustodyDetail(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = device_custody_detail_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "device_custody_detail." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    device_custody_detail_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.device_custody_detail")))
    device_custody_detail_ref01_data = nil
    if device_custody_detail_ref01_data_raw.length > 0
      device_custody_detail_ref01_data = Helpers.to_map(device_custody_detail_ref01_data_raw[0][1])
    end

    # LOAD
    device_custody_detail_ref01_ent = client.DeviceCustodyDetail(nil)
    device_custody_detail_ref01_match_dt0 = {
      "id" => device_custody_detail_ref01_data["id"],
    }
    device_custody_detail_ref01_data_dt0_loaded = device_custody_detail_ref01_ent.load(device_custody_detail_ref01_match_dt0, nil)
    device_custody_detail_ref01_data_dt0_load_result = Helpers.to_map(device_custody_detail_ref01_data_dt0_loaded)
    assert !device_custody_detail_ref01_data_dt0_load_result.nil?
    assert_equal device_custody_detail_ref01_data_dt0_load_result["id"], device_custody_detail_ref01_data["id"]

  end
end

def device_custody_detail_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "device_custody_detail", "DeviceCustodyDetailTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = BluefinDecryptxP2peSDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["device_custody_detail01", "device_custody_detail02", "device_custody_detail03", "device01", "device02", "device03", "device_type01", "serial_number01"],
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
  entid_env_raw = ENV["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID" => idmap,
    "BLUEFINDECRYPTXP_PE_TEST_LIVE" => "FALSE",
    "BLUEFINDECRYPTXP_PE_TEST_EXPLAIN" => "FALSE",
    "BLUEFINDECRYPTXP_PE_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["BLUEFINDECRYPTXP_PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID"])
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
