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
    # The op resolves to one ENTITY per record; the record is reached with
    # data_get. See AGENTS.md "Entity operations return ENTITIES".
    result = BluefinDecryptxP2pe.Entity.InjectKey.list(ent, S.jm([]))
    assert S.islist(result)
    if S.size(result) > 0 do
      Enum.each(0..(S.size(result) - 1), fn i ->
        assert S.ismap(BluefinDecryptxP2pe.EntityBase.data_get(S.getelem(result, i)))
      end)
    end
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinDecryptxP2pe.inject_key(sdk)
      loaded = BluefinDecryptxP2pe.Entity.InjectKey.load(ent, S.jm(["id", id]))
      rec = BluefinDecryptxP2pe.EntityBase.data_get(loaded)
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should report a failed stream" do
    offline = S.jm(["net", S.jm(["offline", true])])

    err =
      assert_raise BluefinDecryptxP2pe.Error, fn ->
        Enum.to_list(BluefinDecryptxP2pe.EntityBase.stream(BluefinDecryptxP2pe.inject_key(BluefinDecryptxP2pe.test(offline)), "list"))
      end

    assert String.contains?(Exception.message(err), "offline")

    quiet = S.jm(["ctrl", S.jm(["throw", false])])
    Enum.to_list(BluefinDecryptxP2pe.EntityBase.stream(BluefinDecryptxP2pe.inject_key(BluefinDecryptxP2pe.test(offline)), "list", nil, quiet))

    if BluefinDecryptxP2pe.FeatureHarness.has_feature("rbac") do
      denied = BluefinDecryptxP2pe.test(nil, S.jm(["feature", S.jm(["rbac", S.jm(["active", true, "deny", true])])]))

      err =
        assert_raise BluefinDecryptxP2pe.Error, fn ->
          Enum.to_list(BluefinDecryptxP2pe.EntityBase.stream(BluefinDecryptxP2pe.inject_key(denied), "list"))
        end

      assert err.code == "rbac_denied"
    end
  end

  test "should leave the caller's ctrl" do
    explain = S.jm([])
    ctrl = S.jm(["explain", explain])
    Enum.to_list(BluefinDecryptxP2pe.EntityBase.stream(BluefinDecryptxP2pe.inject_key(BluefinDecryptxP2pe.test()), "list", nil, S.jm(["ctrl", ctrl])))
    assert S.keysof(ctrl) == ["explain"]
    assert S.size(explain) > 0
  end

  test "should end a stream whose source fails as the operation would" do
    seen = S.jm(["n", 0])

    hook =
      S.jm([
        "name", "lazyhook", "version", "0.0.1", "active", true, "options", S.jm([]),
        "init", fn _ctx, _opts -> nil end,
        "PreDone", fn ctx ->
          S.setprop(S.getprop(ctx, "result"), "stream",
            fn -> Stream.map([1], fn _ -> raise "inject_key source failed" end) end)
        end,
        "PreUnexpected", fn _ctx -> S.setprop(seen, "n", S.getprop(seen, "n") + 1) end
      ])

    client = BluefinDecryptxP2pe.new(S.jm(["feature", S.jm(["test", S.jm(["active", true])]), "extend", S.jt([hook])]))

    err =
      try do
        Enum.to_list(BluefinDecryptxP2pe.EntityBase.stream(BluefinDecryptxP2pe.inject_key(client), "list"))
        nil
      rescue
        e -> e
      end

    assert err != nil and String.contains?(Exception.message(err), "source failed")
    assert S.getprop(seen, "n") > 0

    fired = S.getprop(seen, "n")
    quiet = S.jm(["ctrl", S.jm(["throw", false])])
    assert Enum.to_list(BluefinDecryptxP2pe.EntityBase.stream(BluefinDecryptxP2pe.inject_key(client), "list", nil, quiet)) == []
    assert S.getprop(seen, "n") > fired
  end

  test "should fire PreUnexpected" do
    seen = S.jm(["n", 0])

    hook =
      S.jm([
        "name", "failhook", "version", "0.0.1", "active", true, "options", S.jm([]),
        "init", fn _ctx, _opts -> nil end,
        "PreSpec", fn _ctx -> raise "inject_key hook failed" end,
        "PreUnexpected", fn _ctx -> S.setprop(seen, "n", S.getprop(seen, "n") + 1) end
      ])

    client = BluefinDecryptxP2pe.new(S.jm(["feature", S.jm(["test", S.jm(["active", true])]), "extend", S.jt([hook])]))

    err =
      try do
        BluefinDecryptxP2pe.Entity.InjectKey.list(BluefinDecryptxP2pe.inject_key(client), S.jm([]))
        nil
      rescue
        e -> e
      end

    assert err != nil and String.contains?(Exception.message(err), "hook failed")
    assert S.getprop(seen, "n") > 0

    fired = S.getprop(seen, "n")
    assert BluefinDecryptxP2pe.Entity.InjectKey.list(BluefinDecryptxP2pe.inject_key(client), S.jm([]), S.jm(["throw", false])) == nil
    assert S.getprop(seen, "n") > fired
  end

  test "should refuse an invalid request" do
    if BluefinDecryptxP2pe.FeatureHarness.has_feature("validate") do
      client = BluefinDecryptxP2pe.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinDecryptxP2pe.Error, fn ->
          BluefinDecryptxP2pe.Entity.InjectKey.list(BluefinDecryptxP2pe.inject_key(client), S.jm(["created", 1]))
        end

      assert err.code == "validate_failed"
    end
  end
end
