# DeviceCustodyDetail direct test

import json
import pytest

from bluefindecryptxp2pe_sdk.utility.voxgig_struct import voxgig_struct as vs
from bluefindecryptxp2pe_sdk import BluefinDecryptxP2peSDK
from bluefindecryptxp2pe_sdk.core import helpers
from test import runner


class TestDeviceCustodyDetailDirect:

    def test_should_direct_load_device_custody_detail(self):
        setup = _device_custody_detail_direct_setup({"id": "direct01"})
        _skip, _reason = runner.is_control_skipped("direct", "direct-load-device_custody_detail", "live" if setup["live"] else "unit")
        if _skip:
            # pytest already imported at module scope
            pytest.skip(_reason or "skipped via sdk-test-control.json")
            return
        if setup["live"]:
            # pytest already imported at module scope
            pytest.skip("live direct-load needs real ID — set *_ENTID env var with real IDs to run")
            return

        client = setup["client"]

        params = {}
        query = {}
        if not setup["live"]:
            params["device_type"] = "direct01"
            params["id"] = "direct02"
            params["serial_number"] = "direct03"

        result = client.direct({
            "path": "devices/{serial_number}/{device_type}/custody/{id}",
            "method": "GET",
            "params": params,
            "query": query,
        })
        if setup["live"]:
            # Live mode is lenient: synthetic IDs frequently 4xx. Skip
            # rather than fail when the load endpoint isn't reachable
            # with the IDs we can construct from setup.idmap.
            if result.get("err") is not None:
                pytest.skip(f"load call failed (likely synthetic IDs against live API): {result.get('err')}")
                return
            if not result.get("ok"):
                pytest.skip("load call not ok (likely synthetic IDs against live API)")
                return
            status = helpers.to_int(result["status"])
            if status < 200 or status >= 300:
                pytest.skip(f"expected 2xx status, got {status}")
                return
        else:
            assert result["ok"] is True
            assert helpers.to_int(result["status"]) == 200
            assert result["data"] is not None
            if isinstance(result["data"], dict):
                assert result["data"]["id"] == "direct01"
            assert len(setup["calls"]) == 1



def _device_custody_detail_direct_setup(mockres):
    runner.load_env_local()

    calls = []

    env = runner.env_override({
        "BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID": {},
        "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE": "FALSE",
        "BLUEFIN_DECRYPTX_P2PE_APIKEY": "NONE",
    })

    live = env.get("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == "TRUE"

    if live:
        merged_opts = {
            "apikey": env.get("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
        }
        client = BluefinDecryptxP2peSDK(merged_opts)
        return {
            "client": client,
            "calls": calls,
            "live": True,
            "idmap": {},
        }

    def mock_fetch(url, init):
        calls.append({"url": url, "init": init})
        return {
            "status": 200,
            "statusText": "OK",
            "headers": {},
            "json": lambda: mockres if mockres is not None else {"id": "direct01"},
            "body": "mock",
        }, None

    client = BluefinDecryptxP2peSDK({
        "base": "http://localhost:8080",
        "system": {
            "fetch": mock_fetch,
        },
    })

    return {
        "client": client,
        "calls": calls,
        "live": False,
        "idmap": {},
    }
