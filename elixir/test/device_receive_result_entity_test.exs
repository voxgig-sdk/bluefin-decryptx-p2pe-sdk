# DeviceReceiveResult entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.DeviceReceiveResultEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.device_receive_result(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinDecryptxP2pe.test(S.jm(["entity", S.jm(["device_receive_result", S.jm([])])]))
    ent = BluefinDecryptxP2pe.device_receive_result(sdk)
    created = BluefinDecryptxP2pe.Entity.DeviceReceiveResult.create(ent, S.jm(["name", "test-create"]))
    made = BluefinDecryptxP2pe.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinDecryptxP2pe.FeatureHarness.has_feature("validate") do
      client = BluefinDecryptxP2pe.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinDecryptxP2pe.Error, fn ->
          BluefinDecryptxP2pe.Entity.DeviceReceiveResult.create(BluefinDecryptxP2pe.device_receive_result(client), S.jm(["serialNumber", 1, "success", true, "tamperLabel", "x"]))
        end

      assert err.code == "validate_failed"
    end
  end
end
