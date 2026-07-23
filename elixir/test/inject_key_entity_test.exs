# InjectKey entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.InjectKeyEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinDecryptxP2pe.Helpers, as: H
  alias BluefinDecryptxP2pe.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/inject_key/InjectKeyTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinDecryptxP2pe.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.inject_key"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.inject_key(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinDecryptxP2pe.inject_key(sdk)
    result = BluefinDecryptxP2pe.Entity.InjectKey.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinDecryptxP2pe.inject_key(sdk)
      rec = BluefinDecryptxP2pe.Entity.InjectKey.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end
end
