# DeviceRkiActivateResult entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.DeviceRkiActivateResultEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinDecryptxP2pe.Helpers, as: H
  alias BluefinDecryptxP2pe.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/device_rki_activate_result/DeviceRkiActivateResultTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinDecryptxP2pe.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.device_rki_activate_result"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.device_rki_activate_result(sdk)
    assert ent != nil
  end

  test "should create then read back" do
    sdk = BluefinDecryptxP2pe.test(S.jm(["entity", S.jm(["device_rki_activate_result", S.jm([])])]))
    ent = BluefinDecryptxP2pe.device_rki_activate_result(sdk)
    made = BluefinDecryptxP2pe.Entity.DeviceRkiActivateResult.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
