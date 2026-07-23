// Generated basic-flow test for the update_result entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_decryptx_p2pe_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_decryptx_p2pe_sdk::utility::voxgigstruct as vs;
use bluefin_decryptx_p2pe_sdk::{test_sdk, Entity, BluefinDecryptxP2peEntity, BluefinDecryptxP2peSDK, Value};

#[test]
fn update_result_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.update_result(Value::Noval);
    assert_eq!(ent.get_name(), "update_result");
}

#[test]
fn update_result_entity_stream() {
    // stream() runs the list op through the full pipeline and yields each
    // result item. Seed two entities via test mode; with the `streaming`
    // feature active it yields the feature's incremental items, else it
    // falls back to the materialised items — either way every item yields.
    let seed = jo(vec![(
        "entity",
        jo(vec![(
            "update_result",
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
    let ent = testsdk.update_result(Value::Noval);
    let items: Vec<Value> = ent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(items.len(), 2, "stream should yield both seeded items");

    // Fallback: streaming inactive still yields both materialised items.
    let plainsdk = test_sdk(seed, Value::Noval);
    let plainent = plainsdk.update_result(Value::Noval);
    let plain_items: Vec<Value> = plainent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(plain_items.len(), 2, "fallback stream should yield both items");
}

#[test]
fn update_result_entity_basic() {
    let setup = update_result_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "list", "update"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("update_result.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let update_result_ref01_ent = client.update_result(Value::Noval);
    let update_result_ref01_data = to_map(&getp(
        &getpath(&["new", "update_result"], &setup.data),
        "update_result_ref01",
    ));

    let update_result_ref01_data_result = update_result_ref01_ent
        .create(update_result_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let update_result_ref01_data = to_map(&update_result_ref01_data_result);
    assert!(
        matches!(update_result_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&update_result_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

    // LIST
    let update_result_ref01_match = Value::empty_map();

    let update_result_ref01_list = update_result_ref01_ent
        .list(update_result_ref01_match.clone(), Value::Noval)
        .expect("list failed");
    assert!(
        matches!(update_result_ref01_list, Value::List(_)),
        "expected list result to be an array"
    );

    let found_item = vs::select(
        &entity_list_to_data(&update_result_ref01_list),
        &jo(vec![("id", getp(&update_result_ref01_data, "id"))]),
    );
    assert!(
        !vs::is_empty(&found_item),
        "expected to find created entity in list"
    );

    // UPDATE
    let update_result_ref01_data_up0_up = Value::empty_map();
    setp(&update_result_ref01_data_up0_up, "id", getp(&update_result_ref01_data, "id"));

    let update_result_ref01_markdef_up0_name = "email";
    let update_result_ref01_markdef_up0_value = format!("Mark01-update_result_ref01_{}", setup.now);
    setp(
        &update_result_ref01_data_up0_up,
        update_result_ref01_markdef_up0_name,
        Value::str(update_result_ref01_markdef_up0_value.clone()),
    );

    let update_result_ref01_resdata_up0_result = update_result_ref01_ent
        .update(update_result_ref01_data_up0_up.clone(), Value::Noval)
        .expect("update failed");
    let update_result_ref01_resdata_up0 = to_map(&update_result_ref01_resdata_up0_result);
    assert!(
        matches!(update_result_ref01_resdata_up0, Value::Map(_)),
        "expected update result to be a map"
    );
    assert_eq!(
        getp(&update_result_ref01_resdata_up0, "id"),
        getp(&update_result_ref01_data_up0_up, "id"),
        "expected update result id to match"
    );
    assert_eq!(
        getp(&update_result_ref01_resdata_up0, update_result_ref01_markdef_up0_name),
        Value::str(update_result_ref01_markdef_up0_value.clone()),
        "expected {} to be updated",
        update_result_ref01_markdef_up0_name
    );

}

fn update_result_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("update_result");
    entity_data_file.push("UpdateResultTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("update_result01"), Value::str("update_result02"), Value::str("update_result03")]),
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
    let entid_env_raw = std::env::var("BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID", idmap.clone()),
        ("BLUEFINDECRYPTXP_PE_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFINDECRYPTXP_PE_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFINDECRYPTXP_PE_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFINDECRYPTXP_PE_TEST_UPDATE_RESULT_ENTID")) {
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
