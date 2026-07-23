# BluefinDecryptxP2pe SDK exists test

require "minitest/autorun"
require_relative "../BluefinDecryptxP2pe_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BluefinDecryptxP2peSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
