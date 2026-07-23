# Kif entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.KifEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinDecryptxP2pe.Helpers, as: H
  alias BluefinDecryptxP2pe.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/kif/KifTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinDecryptxP2pe.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.kif"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.kif(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinDecryptxP2pe.kif(sdk)
    result = BluefinDecryptxP2pe.Entity.Kif.list(ent, S.jm([]))
    assert S.islist(result)
  end
end
