// Generated basic-flow test for the client entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_decryptx_p2pe_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_decryptx_p2pe_sdk::utility::voxgigstruct as vs;
use bluefin_decryptx_p2pe_sdk::{test_sdk, Entity, BluefinDecryptxP2peEntity, BluefinDecryptxP2peSDK, Value};

#[test]
fn client_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.client(Value::Noval);
    assert_eq!(ent.get_name(), "client");
}

#[test]
fn client_entity_stream() {
    // stream() runs the list op through the full pipeline and yields each
    // result item. Seed two entities via test mode; with the `streaming`
    // feature active it yields the feature's incremental items, else it
    // falls back to the materialised items — either way every item yields.
    let seed = jo(vec![(
        "entity",
        jo(vec![(
            "client",
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
    let ent = testsdk.client(Value::Noval);
    let items: Vec<Value> = ent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(items.len(), 2, "stream should yield both seeded items");

    // Fallback: streaming inactive still yields both materialised items.
    let plainsdk = test_sdk(seed, Value::Noval);
    let plainent = plainsdk.client(Value::Noval);
    let plain_items: Vec<Value> = plainent
        .stream("list", Value::empty_map(), Value::empty_map())
        .expect("stream failed")
        .collect();
    assert_eq!(plain_items.len(), 2, "fallback stream should yield both items");
}

#[test]
fn client_entity_basic() {
    let setup = client_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "list", "load", "remove"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("client.{}", op), mode);
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
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let client_ref01_ent = client.client(Value::Noval);
    let client_ref01_data = to_map(&getp(
        &getpath(&["new", "client"], &setup.data),
        "client_ref01",
    ));

    let client_ref01_data_result = client_ref01_ent
        .create(client_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let client_ref01_data = to_map(&client_ref01_data_result.data(None));
    assert!(
        matches!(client_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&client_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

    // LIST
    let client_ref01_match = Value::empty_map();

    let client_ref01_list = client_ref01_ent
        .list(client_ref01_match.clone(), Value::Noval)
        .expect("list failed");
    // list resolves to one ENTITY per record; the flow asserts on the
    // records, so map each through data().
    let client_ref01_list = ja(client_ref01_list.iter().map(|e| e.data(None)).collect::<Vec<Value>>());

    let found_item = vs::select(
        &entity_list_to_data(&client_ref01_list),
        &jo(vec![("id", getp(&client_ref01_data, "id"))]),
    );
    assert!(
        !vs::is_empty(&found_item),
        "expected to find created entity in list"
    );

    // LOAD
    let client_ref01_match_dt0 = jo(vec![("id", getp(&client_ref01_data, "id"))]);
    let client_ref01_data_dt0_loaded = client_ref01_ent
        .load(client_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let client_ref01_data_dt0_load_result = to_map(&client_ref01_data_dt0_loaded.data(None));
    assert!(
        matches!(client_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&client_ref01_data_dt0_load_result, "id"),
        getp(&client_ref01_data, "id"),
        "expected load result id to match"
    );

    // REMOVE
    let client_ref01_match_rm0 = jo(vec![("id", getp(&client_ref01_data, "id"))]);
    client_ref01_ent
        .remove(client_ref01_match_rm0.clone(), Value::Noval)
        .expect("remove failed");

    // LIST
    let client_ref01_match_rt0 = Value::empty_map();

    let client_ref01_list_rt0 = client_ref01_ent
        .list(client_ref01_match_rt0.clone(), Value::Noval)
        .expect("list failed");
    // list resolves to one ENTITY per record; the flow asserts on the
    // records, so map each through data().
    let client_ref01_list_rt0 = ja(client_ref01_list_rt0.iter().map(|e| e.data(None)).collect::<Vec<Value>>());

    let not_found_item = vs::select(
        &entity_list_to_data(&client_ref01_list_rt0),
        &jo(vec![("id", getp(&client_ref01_data, "id"))]),
    );
    assert!(
        vs::is_empty(&not_found_item),
        "expected removed entity to not be in list"
    );

}

fn client_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("client");
    entity_data_file.push("ClientTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("client01"), Value::str("client02"), Value::str("client03")]),
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
    let entid_env_raw = std::env::var("BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID", idmap.clone()),
        ("BLUEFIN_DECRYPTX_P2PE_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFIN_DECRYPTX_P2PE_APIKEY", Value::str("NONE")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFIN_DECRYPTX_P2PE_TEST_CLIENT_ENTID")) {
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
