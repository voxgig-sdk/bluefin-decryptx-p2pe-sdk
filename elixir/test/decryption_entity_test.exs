# Decryption entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.DecryptionEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.decryption(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinDecryptxP2pe.test(S.jm(["entity", S.jm(["decryption", S.jm([])])]))
    ent = BluefinDecryptxP2pe.decryption(sdk)
    created = BluefinDecryptxP2pe.Entity.Decryption.create(ent, S.jm(["name", "test-create"]))
    made = BluefinDecryptxP2pe.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinDecryptxP2pe.FeatureHarness.has_feature("validate") do
      client = BluefinDecryptxP2pe.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinDecryptxP2pe.Error, fn ->
          BluefinDecryptxP2pe.Entity.Decryption.create(BluefinDecryptxP2pe.decryption(client), S.jm(["cbcVector", 1, "deviceType", "x", "encrypted", "x", "serialNumber", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
