# UpdateResult entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.UpdateResultEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinDecryptxP2pe.Helpers, as: H
  alias BluefinDecryptxP2pe.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/update_result/UpdateResultTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinDecryptxP2pe.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.update_result"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.update_result(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinDecryptxP2pe.update_result(sdk)
    # The op resolves to one ENTITY per record; the record is reached with
    # data_get. See AGENTS.md "Entity operations return ENTITIES".
    result = BluefinDecryptxP2pe.Entity.UpdateResult.list(ent, S.jm([]))
    assert S.islist(result)
    if S.size(result) > 0 do
      Enum.each(0..(S.size(result) - 1), fn i ->
        assert S.ismap(BluefinDecryptxP2pe.EntityBase.data_get(S.getelem(result, i)))
      end)
    end
  end

  test "should create then read back" do
    sdk = BluefinDecryptxP2pe.test(S.jm(["entity", S.jm(["update_result", S.jm([])])]))
    ent = BluefinDecryptxP2pe.update_result(sdk)
    created = BluefinDecryptxP2pe.Entity.UpdateResult.create(ent, S.jm(["name", "test-create"]))
    made = BluefinDecryptxP2pe.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
