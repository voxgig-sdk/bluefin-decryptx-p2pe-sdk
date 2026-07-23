-- BluefinDecryptxP2pe SDK error

local BluefinDecryptxP2peError = {}
BluefinDecryptxP2peError.__index = BluefinDecryptxP2peError


function BluefinDecryptxP2peError.new(code, msg, ctx)
  local self = setmetatable({}, BluefinDecryptxP2peError)
  self.is_sdk_error = true
  self.sdk = "BluefinDecryptxP2pe"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function BluefinDecryptxP2peError:error()
  return self.msg
end


function BluefinDecryptxP2peError:__tostring()
  return self.msg
end


return BluefinDecryptxP2peError
