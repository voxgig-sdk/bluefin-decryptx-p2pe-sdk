// Generated basic-flow test for the device_custody_detail entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_decryptx_p2pe_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_decryptx_p2pe_sdk::utility::voxgigstruct as vs;
use bluefin_decryptx_p2pe_sdk::{test_sdk, Entity, BluefinDecryptxP2peEntity, BluefinDecryptxP2peSDK, Value};

#[test]
fn device_custody_detail_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.device_custody_detail(Value::Noval);
    assert_eq!(ent.get_name(), "device_custody_detail");
}

#[test]
fn device_custody_detail_entity_basic() {
    let setup = device_custody_detail_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["load"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("device_custody_detail.{}", op), mode);
        if skip {
            let reason = if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            };
            eprintln!("skip: {}", reason);
            return;
        }
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only {
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();

    // Bootstrap entity data from existing test data (no create step in flow).
    let device_custody_detail_ref01_data_raw = vs::items(&to_map(&getpath(&["existing", "device_custody_detail"], &setup.data)));
    let device_custody_detail_ref01_data = to_map(&vs::get_elem(
        &vs::get_elem(&device_custody_detail_ref01_data_raw, &Value::Num(0.0), Value::Noval),
        &Value::Num(1.0),
        Value::Noval,
    ));
    // LOAD
    let device_custody_detail_ref01_ent = client.device_custody_detail(Value::Noval);
    let device_custody_detail_ref01_match_dt0 = jo(vec![("id", getp(&device_custody_detail_ref01_data, "id"))]);
    let device_custody_detail_ref01_data_dt0_loaded = device_custody_detail_ref01_ent
        .load(device_custody_detail_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let device_custody_detail_ref01_data_dt0_load_result = to_map(&device_custody_detail_ref01_data_dt0_loaded.data(None));
    assert!(
        matches!(device_custody_detail_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&device_custody_detail_ref01_data_dt0_load_result, "id"),
        getp(&device_custody_detail_ref01_data, "id"),
        "expected load result id to match"
    );

}

fn device_custody_detail_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("device_custody_detail");
    entity_data_file.push("DeviceCustodyDetailTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("device_custody_detail01"), Value::str("device_custody_detail02"), Value::str("device_custody_detail03"), Value::str("device01"), Value::str("device02"), Value::str("device03"), Value::str("device_type01"), Value::str("serial_number01")]),
        &jo(vec![(
            "`$PACK`",
            ja(vec![
                Value::str(""),
                jo(vec![
                    ("`$KEY`", Value::str("`$COPY`")),
                    (
                        "`$VAL`",
                        ja(vec![
                            Value::str("`$FORMAT`"),
                            Value::str("upper"),
                            Value::str("`$COPY`"),
                        ]),
                    ),
                ]),
            ]),
        )]),
        None,
    )
    .unwrap_or_else(|_| Value::empty_map());

    // Detect ENTID env override before env_override consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's.
    let entid_env_raw = std::env::var("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID", idmap.clone()),
        ("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFIN_DECRYPTX_P2PE_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

    let live = getp(&env, "BLUEFIN_DECRYPTX_P2PE_TEST_LIVE") == Value::str("TRUE");

    let client = if live {
        let merged = vs::merge(
            &ja(vec![jo(vec![("apikey", getp(&env, "BLUEFIN_DECRYPTX_P2PE_APIKEY"))]), extra]),
            None,
        );
        BluefinDecryptxP2peSDK::new(to_map(&merged))
    } else {
        client
    };

    EntityTestSetup {
        client,
        data: entity_data,
        idmap: idmap_resolved,
        env: env.clone(),
        explain: getp(&env, "BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN") == Value::str("TRUE"),
        live,
        synthetic_only: live && !idmap_overridden,
        now: now_ms(),
    }
}
