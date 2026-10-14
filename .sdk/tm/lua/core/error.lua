-- BluefinDecryptxP2pe SDK error

local json = require("dkjson")

local BluefinDecryptxP2peError = {}
BluefinDecryptxP2peError.__index = BluefinDecryptxP2peError

-- Reachable for a debugger, absent from the table itself: the context holds
-- the live spec and options, and an error is what gets dumped or encoded.
local CONTEXT = setmetatable({}, { __mode = "k" })


function BluefinDecryptxP2peError.new(code, msg, ctx)
  local self = setmetatable({}, BluefinDecryptxP2peError)
  self.is_sdk_error = true
  self.sdk = "BluefinDecryptxP2pe"
  self.code = code or ""
  self.msg = msg or ""
  self.result = nil
  self.spec = nil
  CONTEXT[self] = ctx
  return self
end


function BluefinDecryptxP2peError:context()
  return CONTEXT[self]
end


function BluefinDecryptxP2peError:error()
  return self.msg
end


-- What make_error attached is already cleaned; the context is not part of
-- the record.
function BluefinDecryptxP2peError:to_table()
  return {
    sdk = self.sdk,
    code = self.code,
    msg = self.msg,
    status = self.status,
    result = self.result,
    spec = self.spec,
  }
end


function BluefinDecryptxP2peError:to_json()
  return json.encode(self:to_table())
end


function BluefinDecryptxP2peError:__tostring()
  return self.msg
end


function BluefinDecryptxP2peError.__tojson(self)
  return self:to_json()
end


return BluefinDecryptxP2peError
