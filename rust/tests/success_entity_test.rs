// Generated basic-flow test for the success entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_decryptx_p2pe_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_decryptx_p2pe_sdk::utility::voxgigstruct as vs;
use bluefin_decryptx_p2pe_sdk::{test_sdk, Entity, BluefinDecryptxP2peEntity, BluefinDecryptxP2peSDK, Value};

#[test]
fn success_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.success(Value::Noval);
    assert_eq!(ent.get_name(), "success");
}

#[test]
fn success_entity_basic() {
    let setup = success_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "remove"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("success.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_SUCCESS_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let success_ref01_ent = client.success(Value::Noval);
    let success_ref01_data = to_map(&getp(
        &getpath(&["new", "success"], &setup.data),
        "success_ref01",
    ));
    setp(&success_ref01_data, "share_partner_to", getp(&setup.idmap, "share_partner_to01"));

    let success_ref01_data_result = success_ref01_ent
        .create(success_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let success_ref01_data = to_map(&success_ref01_data_result);
    assert!(
        matches!(success_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );

    // REMOVE
    let success_ref01_match_rm0 = jo(vec![("id", getp(&success_ref01_data, "id"))]);
    success_ref01_ent
        .remove(success_ref01_match_rm0.clone(), Value::Noval)
        .expect("remove failed");

}

fn success_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("success");
    entity_data_file.push("SuccessTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("success01"), Value::str("success02"), Value::str("success03"), Value::str("virtual_device01"), Value::str("virtual_device02"), Value::str("virtual_device03"), Value::str("share_partner_to01")]),
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
    let entid_env_raw = std::env::var("BLUEFINDECRYPTXP_PE_TEST_SUCCESS_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINDECRYPTXP_PE_TEST_SUCCESS_ENTID", idmap.clone()),
        ("BLUEFINDECRYPTXP_PE_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINDECRYPTXP_PE_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINDECRYPTXP_PE_TEST_SUCCESS_ENTID")) {
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
