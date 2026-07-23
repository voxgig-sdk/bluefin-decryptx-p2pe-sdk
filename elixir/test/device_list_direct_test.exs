# DeviceList direct test (offline, mock system.fetch)

defmodule BluefinDecryptxP2pe.DeviceListDirectTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinDecryptxP2pe.Helpers, as: H

  # A recording live-mode SDK whose transport returns `canned`.
  defp mk(canned) do
    parent = self()

    fetch = fn url, _fetchdef ->
      send(parent, {:called, url})
      {S.jm(["status", 200, "statusText", "OK", "headers", S.jm([]), "json", fn -> canned end, "body", "mock"]), nil}
    end

    BluefinDecryptxP2pe.new(S.jm(["base", "http://localhost:8080", "system", S.jm(["fetch", fetch])]))
  end

  test "should direct load device_list" do
    canned = S.jm(["id", "direct01"])
    sdk = mk(canned)
    res = BluefinDecryptxP2pe.direct(sdk, H.deep(%{"path" => "/device_list/direct01", "method" => "GET", "params" => %{}}))
    assert S.getprop(res, "ok") == true
    assert H.to_int(S.getprop(res, "status")) == 200
    data = S.getprop(res, "data")
    assert S.ismap(data)
    assert S.getprop(data, "id") == "direct01"
    assert_received {:called, _url}
  end
end
