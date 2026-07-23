-- BluefinDecryptxP2pe SDK exists test

local sdk = require("bluefin-decryptx-p2pe_sdk")

describe("BluefinDecryptxP2peSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
