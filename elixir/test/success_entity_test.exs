# Success entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.SuccessEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.success(sdk)
    assert ent != nil
  end

  test "should refuse an invalid request" do
    if BluefinDecryptxP2pe.FeatureHarness.has_feature("validate") do
      client = BluefinDecryptxP2pe.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinDecryptxP2pe.Error, fn ->
          BluefinDecryptxP2pe.Entity.Success.create(BluefinDecryptxP2pe.success(client), S.jm(["share_partner_to", 1, "devices", "x", "sharePartnerFrom", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
