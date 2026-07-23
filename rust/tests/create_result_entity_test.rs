// Generated basic-flow test for the create_result entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_decryptx_p2pe_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_decryptx_p2pe_sdk::utility::voxgigstruct as vs;
use bluefin_decryptx_p2pe_sdk::{test_sdk, Entity, BluefinDecryptxP2peEntity, BluefinDecryptxP2peSDK, Value};

#[test]
fn create_result_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.create_result(Value::Noval);
    assert_eq!(ent.get_name(), "create_result");
}

#[test]
fn create_result_entity_stream() {
    // stream() runs the list op through the full pipeline and yields each
    // result item. Seed two entities via test mode; with the `streaming`
    // feature active it yields the feature's incremental items, else it
    // falls back to the materialised items — either way every item yields.
    let seed = jo(vec![(
        "entity",
        jo(vec![(
            "create_result",
            jo(vec![
                ("strm01", jo(vec![("id", Value::str("strm01"))])),
                ("strm02", jo(vec![("id", Value::str("strm02"))])),
            ]),
        )]),
    )]);

    let sdkopts = jo(vec![(
        "feature",
        jo(vec![("streaming", jo(vec![("active", Value::Bool(true))]))]),
    )]);

    let testsdk = test_sdk(seed.clone(), sdkopts);
    let ent = testsdk.create_result(Value::Noval);
    let items: Vec<Value> = ent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(items.len(), 2, "stream should yield both seeded items");

    // Fallback: streaming inactive still yields both materialised items.
    let plainsdk = test_sdk(seed, Value::Noval);
    let plainent = plainsdk.create_result(Value::Noval);
    let plain_items: Vec<Value> = plainent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(plain_items.len(), 2, "fallback stream should yield both items");
}

#[test]
fn create_result_entity_basic() {
    let setup = create_result_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("create_result.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let create_result_ref01_ent = client.create_result(Value::Noval);
    let create_result_ref01_data = to_map(&getp(
        &getpath(&["new", "create_result"], &setup.data),
        "create_result_ref01",
    ));
    setp(&create_result_ref01_data, "device_type", getp(&setup.idmap, "device_type01"));
    setp(&create_result_ref01_data, "serial_number", getp(&setup.idmap, "serial_number01"));

    let create_result_ref01_data_result = create_result_ref01_ent
        .create(create_result_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let create_result_ref01_data = to_map(&create_result_ref01_data_result);
    assert!(
        matches!(create_result_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );

}

fn create_result_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("create_result");
    entity_data_file.push("CreateResultTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("create_result01"), Value::str("create_result02"), Value::str("create_result03"), Value::str("device01"), Value::str("device02"), Value::str("device03"), Value::str("device_type01"), Value::str("serial_number01")]),
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
    let entid_env_raw = std::env::var("BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID", idmap.clone()),
        ("BLUEFINDECRYPTXP_PE_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINDECRYPTXP_PE_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINDECRYPTXP_PE_TEST_CREATE_RESULT_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

    let live = getp(&env, "BLUEFINDECRYPTXP_PE_TEST_LIVE") == Value::str("TRUE");

    let client = if live {
        let merged = vs::merge(
            &ja(vec![jo(vec![("apikey", getp(&env, "BLUEFINDECRYPTXP_PE_APIKEY"))]), extra]),
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
        explain: getp(&env, "BLUEFINDECRYPTXP_PE_TEST_EXPLAIN") == Value::str("TRUE"),
        live,
        synthetic_only: live && !idmap_overridden,
        now: now_ms(),
    }
}
