-- BluefinDecryptxP2pe SDK

local vs = require("utility.struct.struct")
local Utility = require("core.utility_type")
local Spec = require("core.spec")
local helpers = require("core.helpers")

-- Load utility registration (populates Utility._registrar)
require("utility.register")

-- Typed-model annotations (LuaLS ---@class); empty at runtime.
require("bluefin-decryptx-p2pe_types")

-- Load features
local BaseFeature = require("feature.base_feature")
local features_factory = require("features")


local BluefinDecryptxP2peSDK = {}
BluefinDecryptxP2peSDK.__index = BluefinDecryptxP2peSDK


local function _make_feature(name)
  local factory = features_factory[name]
  if factory ~= nil then
    return factory()
  end
  return features_factory.base()
end

BluefinDecryptxP2peSDK._make_feature = _make_feature


function BluefinDecryptxP2peSDK.new(options)
  local self = setmetatable({}, BluefinDecryptxP2peSDK)
  self.mode = "live"
  self.features = {}
  self.options = nil

  local utility = Utility.new()
  self._utility = utility

  local config = require("config_shared")()

  self._rootctx = utility.make_context({
    client = self,
    utility = utility,
    config = config,
    options = options or {},
    shared = {},
  }, nil)

  self.options = utility.make_options(self._rootctx)

  if vs.getpath(self.options, "feature.test.active") == true then
    self.mode = "test"
  end

  self._rootctx.options = self.options

  -- Add features in the resolved order (make_options puts an explicit list
  -- order first, else defaults to test-first). Ordering matters: the `test`
  -- feature installs the base mock transport and the transport features
  -- (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
  -- must be added before them to sit at the base of the chain.
  local feature_opts = helpers.to_map(vs.getprop(self.options, "feature"))
  if feature_opts ~= nil then
    local featureorder = vs.getpath(self.options, "__derived__.featureorder")
    if type(featureorder) == "table" then
      for _, fname in ipairs(featureorder) do
        local fopts = helpers.to_map(feature_opts[fname])
        if fopts ~= nil and fopts["active"] == true then
          utility.feature_add(self._rootctx, _make_feature(fname))
        end
      end
    end
  end

  -- Add extension features.
  local extend = vs.getprop(self.options, "extend")
  if type(extend) == "table" then
    for _, f in ipairs(extend) do
      if type(f) == "table" and type(f.get_name) == "function" then
        utility.feature_add(self._rootctx, f)
      end
    end
  end

  -- Initialize features.
  for _, f in ipairs(self.features) do
    utility.feature_init(self._rootctx, f)
  end

  utility.feature_hook(self._rootctx, "PostConstruct")

    -- feature: audit
  -- feature: clienttrack
  -- feature: idempotency
  -- feature: log
  -- feature: metrics
  -- feature: paging
  -- feature: ratelimit
  -- feature: retry
  -- feature: telemetry
  -- feature: test
  -- feature: timeout


  return self
end


function BluefinDecryptxP2peSDK:options_map()
  local out = vs.clone(self.options)
  if type(out) == "table" then
    return out
  end
  return {}
end


function BluefinDecryptxP2peSDK:get_utility()
  return Utility.copy(self._utility)
end


function BluefinDecryptxP2peSDK:get_root_ctx()
  return self._rootctx
end


function BluefinDecryptxP2peSDK:prepare(fetchargs)
  local utility = self._utility

  fetchargs = fetchargs or {}

  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "prepare",
    ctrl = ctrl,
  }, self._rootctx)

  local options = self.options

  local path = vs.getprop(fetchargs, "path") or ""
  if type(path) ~= "string" then path = "" end

  local method = vs.getprop(fetchargs, "method") or "GET"
  if type(method) ~= "string" then method = "GET" end

  local params = helpers.to_map(vs.getprop(fetchargs, "params")) or {}
  local query = helpers.to_map(vs.getprop(fetchargs, "query")) or {}

  local headers = utility.prepare_headers(ctx)

  local base = vs.getprop(options, "base") or ""
  if type(base) ~= "string" then base = "" end
  local prefix = vs.getprop(options, "prefix") or ""
  if type(prefix) ~= "string" then prefix = "" end
  local suffix = vs.getprop(options, "suffix") or ""
  if type(suffix) ~= "string" then suffix = "" end

  ctx.spec = Spec.new({
    base = base,
    prefix = prefix,
    suffix = suffix,
    path = path,
    method = method,
    params = params,
    query = query,
    headers = headers,
    body = vs.getprop(fetchargs, "body"),
    step = "start",
  })

  -- Merge user-provided headers.
  local uh = vs.getprop(fetchargs, "headers")
  if type(uh) == "table" then
    for k, v in pairs(uh) do
      ctx.spec.headers[k] = v
    end
  end

  local _, err = utility.prepare_auth(ctx)
  if err ~= nil then
    return nil, err
  end

  return utility.make_fetch_def(ctx)
end


-- Raw endpoint access is operator-controllable, like every entity op.
-- Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
-- either one reaches the same endpoint.
function BluefinDecryptxP2peSDK:direct(fetchargs)
  if not self:_op_allowed("direct") then
    return self:_op_denied("direct"), nil
  end

  return self:_raw_request(fetchargs)
end


-- Is this raw-access op permitted by the SDK's allow.op option?
function BluefinDecryptxP2peSDK:_op_allowed(op)
  local allow = vs.getpath(self.options, "allow.op")
  return type(allow) == "string" and allow:find(op, 1, true) ~= nil
end


function BluefinDecryptxP2peSDK:_op_denied(op)
  local allow = vs.getpath(self.options, "allow.op")
  if type(allow) ~= "string" then allow = "" end
  return {
    ok = false,
    err = "BluefinDecryptxP2peSDK: " .. op .. ": operation not allowed by" ..
      " SDK option allow.op value: \"" .. allow .. "\"",
  }
end


-- Ungated request path shared by direct and graphql, each of which checks its
-- own allow.op token first. Private, rather than a flag on fetchargs: a
-- caller-supplied marker would let anyone opt straight back out of the gate
-- by passing it.
function BluefinDecryptxP2peSDK:_raw_request(fetchargs)
  local utility = self._utility

  local fetchdef, err = self:prepare(fetchargs)
  if err ~= nil then
    return { ok = false, err = err }, nil
  end

  fetchargs = fetchargs or {}
  local ctrl = helpers.to_map(vs.getprop(fetchargs, "ctrl")) or {}

  local ctx = utility.make_context({
    opname = "direct",
    ctrl = ctrl,
  }, self._rootctx)

  local url = fetchdef["url"] or ""
  local fetched, fetch_err = utility.fetcher(ctx, url, fetchdef)

  if fetch_err ~= nil then
    return { ok = false, err = fetch_err }, nil
  end

  if fetched == nil then
    return {
      ok = false,
      err = ctx:make_error("direct_no_response", "response: undefined"),
    }, nil
  end

  if type(fetched) == "table" then
    local status = helpers.to_int(vs.getprop(fetched, "status"))
    local headers = vs.getprop(fetched, "headers") or {}

    -- No-body responses (204, 304) and explicit zero content-length
    -- must skip JSON parsing — calling json() on an empty body errors.
    local content_length = nil
    if type(headers) == "table" then
      content_length = headers["content-length"]
    end
    local no_body = status == 204 or status == 304 or tostring(content_length) == "0"

    local json_data = nil
    if not no_body then
      local jf = vs.getprop(fetched, "json")
      if type(jf) == "function" then
        local ok, result = pcall(jf)
        if ok then
          json_data = result
        end
        -- Non-JSON body: json_data stays nil, status/headers preserved.
      end
    end

    return {
      ok = status >= 200 and status < 300,
      status = status,
      headers = headers,
      data = json_data,
    }, nil
  end

  return {
    ok = false,
    err = ctx:make_error("direct_invalid", "invalid response type"),
  }, nil
end


-- Raw GraphQL access: the pressure valve that makes the generated surface's
-- deliberate omissions (per-call selection sets, typed filter builders,
-- batching, subscriptions) livable — the whole schema stays reachable.
--
-- Thin wrapper over the same prepare/fetch path direct uses, with the one
-- thing raw direct cannot do for GraphQL: a GraphQL failure rides HTTP 200 as
-- a top-level `errors` array, so status alone would report a failed query as
-- ok.
--
-- NOTE: like direct, this bypasses the feature pipeline — no retry, ratelimit
-- or paging features apply.
function BluefinDecryptxP2peSDK:graphql(query, variables, ctrl)
  if not self:_op_allowed("graphql") then
    return self:_op_denied("graphql"), nil
  end

  local res, err = self:_raw_request({
    method = "POST",
    headers = { ["content-type"] = "application/json" },
    body = {
      query = query,
      variables = type(variables) == "table" and variables or {},
    },
    ctrl = type(ctrl) == "table" and ctrl or {},
  })

  if err ~= nil or type(res) ~= "table" then
    return res, err
  end

  -- Errors are read BEFORE any status check: a GraphQL parse or validation
  -- failure comes back as HTTP 400 carrying the standard { errors = {...} }
  -- body, and the raw path represents a non-2xx as ok=false with no err — so
  -- returning early on status would discard the server's own diagnostics,
  -- which are the only useful part of that response.
  local errors = vs.getpath(res, "data.errors")

  if type(errors) == "table" and 0 < #errors then
    local msg = vs.getprop(errors[1], "message")
    if type(msg) ~= "string" or msg == "" then
      msg = "graphql error"
    end
    res.ok = false
    res.err = "BluefinDecryptxP2peSDK: graphql: " .. msg
    res.graphql = errors
  end

  return res, nil
end



-- Idiomatic facade: client:Attestation():list() / client:Attestation():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Attestation(data)
  local EntityMod = require("entity.attestation_entity")
  if data == nil then
    if self._attestation == nil then
      self._attestation = EntityMod.new(self, nil)
    end
    return self._attestation
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Client():list() / client:Client():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Client(data)
  local EntityMod = require("entity.client_entity")
  if data == nil then
    if self._client_ == nil then
      self._client_ = EntityMod.new(self, nil)
    end
    return self._client_
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:CreateResult():list() / client:CreateResult():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:CreateResult(data)
  local EntityMod = require("entity.create_result_entity")
  if data == nil then
    if self._create_result == nil then
      self._create_result = EntityMod.new(self, nil)
    end
    return self._create_result
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Decryption():list() / client:Decryption():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Decryption(data)
  local EntityMod = require("entity.decryption_entity")
  if data == nil then
    if self._decryption == nil then
      self._decryption = EntityMod.new(self, nil)
    end
    return self._decryption
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Device():list() / client:Device():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Device(data)
  local EntityMod = require("entity.device_entity")
  if data == nil then
    if self._device == nil then
      self._device = EntityMod.new(self, nil)
    end
    return self._device
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceBuild():list() / client:DeviceBuild():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceBuild(data)
  local EntityMod = require("entity.device_build_entity")
  if data == nil then
    if self._device_build == nil then
      self._device_build = EntityMod.new(self, nil)
    end
    return self._device_build
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceCustodyDetail():list() / client:DeviceCustodyDetail():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceCustodyDetail(data)
  local EntityMod = require("entity.device_custody_detail_entity")
  if data == nil then
    if self._device_custody_detail == nil then
      self._device_custody_detail = EntityMod.new(self, nil)
    end
    return self._device_custody_detail
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceCustodyList():list() / client:DeviceCustodyList():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceCustodyList(data)
  local EntityMod = require("entity.device_custody_list_entity")
  if data == nil then
    if self._device_custody_list == nil then
      self._device_custody_list = EntityMod.new(self, nil)
    end
    return self._device_custody_list
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceList():list() / client:DeviceList():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceList(data)
  local EntityMod = require("entity.device_list_entity")
  if data == nil then
    if self._device_list == nil then
      self._device_list = EntityMod.new(self, nil)
    end
    return self._device_list
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceReceiveResult():list() / client:DeviceReceiveResult():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceReceiveResult(data)
  local EntityMod = require("entity.device_receive_result_entity")
  if data == nil then
    if self._device_receive_result == nil then
      self._device_receive_result = EntityMod.new(self, nil)
    end
    return self._device_receive_result
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceRkiActivateResult():list() / client:DeviceRkiActivateResult():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceRkiActivateResult(data)
  local EntityMod = require("entity.device_rki_activate_result_entity")
  if data == nil then
    if self._device_rki_activate_result == nil then
      self._device_rki_activate_result = EntityMod.new(self, nil)
    end
    return self._device_rki_activate_result
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceState():list() / client:DeviceState():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceState(data)
  local EntityMod = require("entity.device_state_entity")
  if data == nil then
    if self._device_state == nil then
      self._device_state = EntityMod.new(self, nil)
    end
    return self._device_state
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:DeviceType():list() / client:DeviceType():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:DeviceType(data)
  local EntityMod = require("entity.device_type_entity")
  if data == nil then
    if self._device_type == nil then
      self._device_type = EntityMod.new(self, nil)
    end
    return self._device_type
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:InjectKey():list() / client:InjectKey():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:InjectKey(data)
  local EntityMod = require("entity.inject_key_entity")
  if data == nil then
    if self._inject_key == nil then
      self._inject_key = EntityMod.new(self, nil)
    end
    return self._inject_key
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Kif():list() / client:Kif():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Kif(data)
  local EntityMod = require("entity.kif_entity")
  if data == nil then
    if self._kif == nil then
      self._kif = EntityMod.new(self, nil)
    end
    return self._kif
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Location():list() / client:Location():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Location(data)
  local EntityMod = require("entity.location_entity")
  if data == nil then
    if self._location == nil then
      self._location = EntityMod.new(self, nil)
    end
    return self._location
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Partner():list() / client:Partner():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Partner(data)
  local EntityMod = require("entity.partner_entity")
  if data == nil then
    if self._partner == nil then
      self._partner = EntityMod.new(self, nil)
    end
    return self._partner
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Shipment():list() / client:Shipment():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Shipment(data)
  local EntityMod = require("entity.shipment_entity")
  if data == nil then
    if self._shipment == nil then
      self._shipment = EntityMod.new(self, nil)
    end
    return self._shipment
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Success():list() / client:Success():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Success(data)
  local EntityMod = require("entity.success_entity")
  if data == nil then
    if self._success == nil then
      self._success = EntityMod.new(self, nil)
    end
    return self._success
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:Transaction():list() / client:Transaction():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:Transaction(data)
  local EntityMod = require("entity.transaction_entity")
  if data == nil then
    if self._transaction == nil then
      self._transaction = EntityMod.new(self, nil)
    end
    return self._transaction
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:UpdateResult():list() / client:UpdateResult():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:UpdateResult(data)
  local EntityMod = require("entity.update_result_entity")
  if data == nil then
    if self._update_result == nil then
      self._update_result = EntityMod.new(self, nil)
    end
    return self._update_result
  end
  return EntityMod.new(self, data)
end


-- Idiomatic facade: client:User():list() / client:User():load({ id = ... })
-- Entity access is capitalised (PascalCase) for parity with the other SDKs.
function BluefinDecryptxP2peSDK:User(data)
  local EntityMod = require("entity.user_entity")
  if data == nil then
    if self._user == nil then
      self._user = EntityMod.new(self, nil)
    end
    return self._user
  end
  return EntityMod.new(self, data)
end




function BluefinDecryptxP2peSDK.test(testopts, sdkopts)
  sdkopts = sdkopts or {}
  sdkopts = vs.clone(sdkopts)
  if type(sdkopts) ~= "table" then
    sdkopts = {}
  end

  testopts = testopts or {}
  testopts = vs.clone(testopts)
  if type(testopts) ~= "table" then
    testopts = {}
  end
  testopts["active"] = true

  vs.setpath(sdkopts, "feature.test", testopts)

  local sdk = BluefinDecryptxP2peSDK.new(sdkopts)
  sdk.mode = "test"

  return sdk
end


return BluefinDecryptxP2peSDK
