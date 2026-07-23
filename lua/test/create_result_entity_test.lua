-- CreateResult entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("bluefin-decryptx-p2pe_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

describe("CreateResultEntity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:CreateResult(nil)
    assert.is_not_nil(ent)
  end)

  it("should run basic flow", function()
    local setup = create_result_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"create"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "create_result." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    -- The basic flow consumes synthetic IDs from the fixture. In live mode
    -- without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only then
      pending("live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID JSON to run live")
      return
    end
    local client = setup.client

    -- CREATE
    local create_result_ref01_ent = client:CreateResult(nil)
    local create_result_ref01_data = helpers.to_map(vs.getprop(
      vs.getpath(setup.data, "new.create_result"), "create_result_ref01"))
    create_result_ref01_data["device_type"] = setup.idmap["device_type01"]
    create_result_ref01_data["serial_number"] = setup.idmap["serial_number01"]

    local create_result_ref01_data_result, err = create_result_ref01_ent:create(create_result_ref01_data, nil)
    assert.is_nil(err)
    create_result_ref01_data = helpers.to_map(create_result_ref01_data_result)
    assert.is_not_nil(create_result_ref01_data)

  end)
end)

function create_result_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/create_result/CreateResultTestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read create_result test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "create_result01", "create_result02", "create_result03", "device01", "device02", "device03", "device_type01", "serial_number01" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Detect ENTID env override before envOverride consumes it. When live
  -- mode is on without a real override, the basic test runs against synthetic
  -- IDs from the fixture and 4xx's. Surface this so the test can skip.
  local entid_env_raw = os.getenv("BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID"] = idmap,
    ["BLUEFINDECRYPTXP_PE_TEST_LIVE"] = "FALSE",
    ["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] = "FALSE",
    ["BLUEFINDECRYPTXP_PE_APIKEY"] = "NONE",
  })

  local idmap_resolved = helpers.to_map(
    env["BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      {
        apikey = env["BLUEFINDECRYPTXP_PE_APIKEY"],
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["BLUEFINDECRYPTXP_PE_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["BLUEFINDECRYPTXP_PE_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
