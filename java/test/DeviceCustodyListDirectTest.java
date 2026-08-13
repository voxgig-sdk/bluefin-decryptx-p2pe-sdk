package voxgig.bluefindecryptxp2pesdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Supplier;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefindecryptxp2pesdk.core.Helpers;
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK;
import voxgig.bluefindecryptxp2pesdk.utility.Json;

@SuppressWarnings({"unchecked", "unused"})
public class DeviceCustodyListDirectTest {

  static Map<String, Object> jm(Object... kv) {
    Map<String, Object> out = new LinkedHashMap<>();
    for (int i = 0; i < kv.length - 1; i += 2) {
      out.put(String.valueOf(kv[i]), kv[i + 1]);
    }
    return out;
  }

  @Test
  public void directListDeviceCustodyList() {
    List<Object> mockres = new ArrayList<>();
    mockres.add(jm("id", "direct01"));
    mockres.add(jm("id", "direct02"));
    DirectSetup setup = directSetup(mockres);
    String mode = setup.live ? "live" : "unit";
    String reason = RunnerSupport.skipReason("direct", "direct-list-device_custody_list", mode);
    Assumptions.assumeTrue(reason == null,
        reason == null || "".equals(reason)
            ? "skipped via sdk-test-control.json" : reason);
    if (setup.live) {
      for (String liveKey : new String[] { "device_type01", "serial_number01" }) {
        Assumptions.assumeTrue(setup.idmap.get(liveKey) != null,
            "live test needs " + liveKey + " via *_ENTID env var (synthetic IDs only)");
      }
    }
    BluefinDecryptxP2peSDK client = setup.client;

    Map<String, Object> params = new LinkedHashMap<>();
    if (setup.live) {
      params.put("device_type", setup.idmap.get("device_type01"));
    }
    else {
      params.put("device_type", "direct01");
    }
    if (setup.live) {
      params.put("serial_number", setup.idmap.get("serial_number01"));
    }
    else {
      params.put("serial_number", "direct02");
    }

    Map<String, Object> result = client.direct(jm(
        "path", "devices/{serial_number}/{device_type}/custody",
        "method", "GET",
        "params", params));
    if (setup.live) {
      // Live mode is lenient: synthetic IDs frequently 4xx and the
      // list-response shape varies wildly across public APIs. Skip
      // rather than fail when the call doesn't return a usable list.
      Assumptions.assumeTrue(Boolean.TRUE.equals(result.get("ok")),
          "list call not ok (likely synthetic IDs against live API): " + result);
      int status = Helpers.toInt(result.get("status"));
      Assumptions.assumeTrue(status >= 200 && status < 300,
          "expected 2xx status, got " + result.get("status"));
    }
    else {
      assertEquals(true, result.get("ok"), "expected ok to be true");
      assertEquals(200, Helpers.toInt(result.get("status")), "expected status 200");
    }

    if (!setup.live) {
      assertTrue(result.get("data") instanceof List,
          "expected data to be an array, got " + result.get("data"));
      assertEquals(2, ((List<Object>) result.get("data")).size(), "expected 2 items");

      assertEquals(1, setup.calls.size(), "expected 1 call");
      Map<String, Object> call = setup.calls.get(0);
      Map<String, Object> initMap = Helpers.toMapAny(call.get("init"));
      if (initMap != null) {
        assertEquals("GET", initMap.get("method"), "expected method GET");
      }
      String url = call.get("url") instanceof String ? (String) call.get("url") : "";
      assertTrue(url.contains("direct01"),
          "expected url to contain direct01, got " + url);
      assertTrue(url.contains("direct02"),
          "expected url to contain direct02, got " + url);
    }
  }

  static class DirectSetup {
    BluefinDecryptxP2peSDK client;
    List<Map<String, Object>> calls;
    boolean live;
    Map<String, Object> idmap;
  }

  static DirectSetup directSetup(Object mockres) {
    RunnerSupport.loadEnvLocal();

    final List<Map<String, Object>> calls = new ArrayList<>();

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ENTID", new LinkedHashMap<>());
    envm.put("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", "FALSE");
    envm.put("BLUEFIN_DECRYPTX_P2PE_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    boolean live = "TRUE".equals(env.get("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE"));

    DirectSetup setup = new DirectSetup();
    setup.calls = calls;

    if (live) {
      Map<String, Object> mergedOpts = new LinkedHashMap<>();
      mergedOpts.put("apikey", env.get("BLUEFIN_DECRYPTX_P2PE_APIKEY"));
      setup.client = new BluefinDecryptxP2peSDK(mergedOpts);
      setup.live = true;

      Map<String, Object> idmap = new LinkedHashMap<>();
      Object entidRaw = env.get("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_LIST_ENTID");
      if (entidRaw instanceof String && ((String) entidRaw).startsWith("{")) {
        Map<String, Object> parsed = Helpers.toMapAny(Json.parseOrNull((String) entidRaw));
        if (parsed != null) {
          idmap = parsed;
        }
      }
      else if (entidRaw instanceof Map) {
        idmap = (Map<String, Object>) entidRaw;
      }
      setup.idmap = idmap;
      return setup;
    }

    final Object mockdata = mockres != null ? mockres : jm("id", "direct01");
    BiFunction<String, Map<String, Object>, Map<String, Object>> mockFetch =
        (url, init) -> {
          calls.add(jm("url", url, "init", init));
          return jm(
              "status", 200,
              "statusText", "OK",
              "headers", new LinkedHashMap<>(),
              "json", (Supplier<Object>) () -> mockdata);
        };

    setup.client = new BluefinDecryptxP2peSDK(jm(
        "base", "http://localhost:8080",
        "system", jm("fetch", mockFetch)));
    setup.live = false;
    setup.idmap = new LinkedHashMap<>();
    return setup;
  }
}
