# Transaction entity test (offline, mock transport)

defmodule BluefinDecryptxP2pe.TransactionEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinDecryptxP2pe.Helpers, as: H
  alias BluefinDecryptxP2pe.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/transaction/TransactionTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinDecryptxP2pe.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.transaction"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinDecryptxP2pe.test()
    ent = BluefinDecryptxP2pe.transaction(sdk)
    assert ent != nil
  end

  test "should list records" do
    sdk = mk_sdk()
    ent = BluefinDecryptxP2pe.transaction(sdk)
    result = BluefinDecryptxP2pe.Entity.Transaction.list(ent, S.jm([]))
    assert S.islist(result)
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinDecryptxP2pe.transaction(sdk)
      rec = BluefinDecryptxP2pe.Entity.Transaction.load(ent, S.jm(["id", id]))
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should create then read back" do
    sdk = BluefinDecryptxP2pe.test(S.jm(["entity", S.jm(["transaction", S.jm([])])]))
    ent = BluefinDecryptxP2pe.transaction(sdk)
    made = BluefinDecryptxP2pe.Entity.Transaction.create(ent, S.jm(["name", "test-create"]))
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end
end
