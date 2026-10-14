# CreateResult entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.CreateResultEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.create_result(sdk)
    assert ent != nil
  end

  test "should refuse an invalid request" do
    if BluefinDecryptxP2pe.FeatureHarness.has_feature("validate") do
      client = BluefinDecryptxP2pe.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinDecryptxP2pe.Error, fn ->
          BluefinDecryptxP2pe.Entity.CreateResult.create(BluefinDecryptxP2pe.create_result(client), S.jm(["device_type", 1, "serial_number", "x", "custodian", "x", "location", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
