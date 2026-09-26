// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinDecryptxP2pe")),
            ("slug".to_string(), Value::str("bluefin-decryptx-p2pe")),
            ("version".to_string(), Value::str("0.1.1")),
            ("target".to_string(), Value::str("rust")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("audit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("actor".to_string(), Value::str("anonymous")),
                    ("max".to_string(), Value::Num(1000f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("sink".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("clienttrack".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("clientVersion".to_string(), Value::str("0.0.1")),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("clientName".to_string(), Value::str("`$STRING`")),
                    ("clientVersion".to_string(), Value::str("`$STRING`")),
                    ("headers".to_string(), Value::str("`$MAP`")),
                    ("idgen".to_string(), Value::str("`$FUNCTION`")),
                    ("sessionId".to_string(), Value::str("`$STRING`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("debug".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("max".to_string(), Value::Num(100f64)),
                    ("redact".to_string(), Value::list(vec![
                        Value::str("authorization"),
                        Value::str("cookie"),
                        Value::str("set-cookie"),
                        Value::str("api-key"),
                        Value::str("apikey"),
                        Value::str("x-api-key"),
                        Value::str("idempotency-key"),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("onEntry".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("idempotency".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("header".to_string(), Value::str("Idempotency-Key")),
                    ("methods".to_string(), Value::list(vec![
                        Value::str("POST"),
                        Value::str("PUT"),
                        Value::str("PATCH"),
                        Value::str("DELETE"),
                    ])),
                    ("ops".to_string(), Value::list(vec![
                        Value::str("create"),
                        Value::str("update"),
                        Value::str("remove"),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("keygen".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("log".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(true)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("level".to_string(), Value::str("`$STRING`")),
                    ("logger".to_string(), Value::str("`$ANY`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("metrics".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("paging".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("afterVar".to_string(), Value::str("after")),
                    ("cursorParam".to_string(), Value::str("cursor")),
                    ("firstVar".to_string(), Value::str("first")),
                    ("limitParam".to_string(), Value::str("limit")),
                    ("pageParam".to_string(), Value::str("page")),
                    ("startPage".to_string(), Value::Num(1f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("limit".to_string(), Value::str("`$NUMBER`")),
                    ("ops".to_string(), Value::str("`$LIST`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("ratelimit".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("burst".to_string(), Value::Num(5f64)),
                    ("rate".to_string(), Value::Num(5f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                    ("sleep".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("retry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("factor".to_string(), Value::Num(2f64)),
                    ("maxDelay".to_string(), Value::Num(2000f64)),
                    ("minDelay".to_string(), Value::Num(50f64)),
                    ("retries".to_string(), Value::Num(2f64)),
                    ("statuses".to_string(), Value::list(vec![
                        Value::Num(408f64),
                        Value::Num(425f64),
                        Value::Num(429f64),
                        Value::Num(500f64),
                        Value::Num(502f64),
                        Value::Num(503f64),
                        Value::Num(504f64),
                    ])),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("jitter".to_string(), Value::str("`$BOOLEAN`")),
                    ("sleep".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
            ("telemetry".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("exporter".to_string(), Value::str("`$FUNCTION`")),
                    ("headers".to_string(), Value::str("`$MAP`")),
                    ("idgen".to_string(), Value::str("`$FUNCTION`")),
                    ("now".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("none")),
            ])),
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("entity".to_string(), Value::str("`$MAP`")),
                    ("net".to_string(), Value::str("`$MAP`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("base")),
            ])),
            ("timeout".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                    ("ms".to_string(), Value::Num(30000f64)),
                ])),
                ("optspec".to_string(), Value::map_of([
                    ("clearTimer".to_string(), Value::str("`$FUNCTION`")),
                    ("setTimer".to_string(), Value::str("`$FUNCTION`")),
                ])),
                ("strict".to_string(), Value::Bool(false)),
                ("transport".to_string(), Value::str("wrap")),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://apis.p2pemanager.com/api/v1")),
            ("auth".to_string(), Value::map_of([
                ("prefix".to_string(), Value::str("Basic")),
                ("basic".to_string(), Value::Bool(true)),
            ])),
            ("headers".to_string(), Value::map_of([
                ("content-type".to_string(), Value::str("application/json")),
            ])),
            ("entity".to_string(), Value::map_of([
                ("attestation".to_string(), Value::empty_map()),
                ("client".to_string(), Value::empty_map()),
                ("create_result".to_string(), Value::empty_map()),
                ("decryption".to_string(), Value::empty_map()),
                ("device".to_string(), Value::empty_map()),
                ("device_build".to_string(), Value::empty_map()),
                ("device_custody_detail".to_string(), Value::empty_map()),
                ("device_custody_list_item".to_string(), Value::empty_map()),
                ("device_receive_result".to_string(), Value::empty_map()),
                ("device_rki_activate_result".to_string(), Value::empty_map()),
                ("device_state".to_string(), Value::empty_map()),
                ("device_type".to_string(), Value::empty_map()),
                ("inject_key".to_string(), Value::empty_map()),
                ("kif".to_string(), Value::empty_map()),
                ("location".to_string(), Value::empty_map()),
                ("partner".to_string(), Value::empty_map()),
                ("shipment".to_string(), Value::empty_map()),
                ("success".to_string(), Value::empty_map()),
                ("transaction".to_string(), Value::empty_map()),
                ("update_result".to_string(), Value::empty_map()),
                ("user".to_string(), Value::empty_map()),
                ("virtual_device".to_string(), Value::empty_map()),
            ])),
        ])),
        ("entity".to_string(), Value::map_of([
            ("attestation".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("completeDate")),
                        ("title".to_string(), Value::str("Complete Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The date and time that the Attestation took place.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("device")),
                        ("title".to_string(), Value::str("Device")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Text describing the attestation.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notes")),
                        ("title".to_string(), Value::str("Notes")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Free form field that allows the Client associate notes with the Attestation.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("attestation")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/attestations")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("attestations")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("attestations"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/attestations")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("attestations")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("attestations"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/attestations/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("attestations")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("attestations"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("client".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
                        ("title".to_string(), Value::str("Contact")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("title".to_string(), Value::str("Direct Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the Client account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("location")),
                        ("title".to_string(), Value::str("Location")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated Location resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mid")),
                        ("title".to_string(), Value::str("Mid")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Some Partners will have an merchant ids on their own software offerings.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Client's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the Client's root Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("client")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("create_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::empty_list()),
                ("name".to_string(), Value::str("create_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}/custody")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("serial_number")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("device_type")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("custody")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{serial_number}"),
                                    Value::str("{device_type}"),
                                    Value::str("custody"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("deviceType".to_string(), Value::str("device_type")),
                                        ("serialNumber".to_string(), Value::str("serial_number")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("serial_number"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("$.main.kit.entity.device"),
                        ]),
                    ])),
                ])),
            ])),
            ("decryption".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("title".to_string(), Value::str("Success")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("true if the payload decryption was successful.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("decryption")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/decryption")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("decryption")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("decryption"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("activatedBy")),
                        ("title".to_string(), Value::str("Activated By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("activationDate")),
                        ("title".to_string(), Value::str("Activation Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from when the Device was activated.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("alternateKey")),
                        ("title".to_string(), Value::str("Alternate Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("auditNextDate")),
                        ("title".to_string(), Value::str("Audit Next Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Date and time that the Device is due its next PCI Audit.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("auditNotificationDate")),
                        ("title".to_string(), Value::str("Audit Notification Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Date and time that a notification should be sent that a PCI audit is due.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("createdBy")),
                        ("title".to_string(), Value::str("Created By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("deviceBuild")),
                        ("title".to_string(), Value::str("Device Build")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device Build resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("deviceState")),
                        ("title".to_string(), Value::str("Device State")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device State resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("deviceType")),
                        ("title".to_string(), Value::str("Device Type")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device Type resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errorCounter")),
                        ("title".to_string(), Value::str("Error Counter")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number times the Device has been in error.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errorLastDate")),
                        ("title".to_string(), Value::str("Error Last Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from the last time that the Device had an error.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("initializedBy")),
                        ("title".to_string(), Value::str("Initialized By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("initializedDate")),
                        ("title".to_string(), Value::str("Initialized Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from when the Device was initialized.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("injectKey")),
                        ("title".to_string(), Value::str("Inject Key")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isVirtual")),
                        ("title".to_string(), Value::str("Is Virtual")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("Indicates if a Device is Virtual (represents a Device shared with a partner).")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("kif")),
                        ("title".to_string(), Value::str("Kif")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated KIF resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastActivityDate")),
                        ("title".to_string(), Value::str("Last Activity Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from the last time that the Device was used.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("location")),
                        ("title".to_string(), Value::str("Location")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated Location resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modifiedBy")),
                        ("title".to_string(), Value::str("Modified By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notes")),
                        ("title".to_string(), Value::str("Notes")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Arbitary note that can be attached to a Device entry.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("serialNumber")),
                        ("title".to_string(), Value::str("Serial Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device's serial number.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("device")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("device_state")),
                                            ("orig".to_string(), Value::str("device_state")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("kif")),
                                            ("orig".to_string(), Value::str("kif")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("sorting_direction")),
                                            ("orig".to_string(), Value::str("sorting_direction")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::str("asc")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("sorting_field")),
                                            ("orig".to_string(), Value::str("sorting_field")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::str("serialnumber")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("device_state"),
                                        Value::str("kif"),
                                        Value::str("partner"),
                                        Value::str("serial_number"),
                                        Value::str("skip"),
                                        Value::str("sorting_direction"),
                                        Value::str("sorting_field"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("serial_number")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("device_type")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{serial_number}"),
                                    Value::str("{device_type}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("deviceType".to_string(), Value::str("device_type")),
                                        ("serialNumber".to_string(), Value::str("serial_number")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("serial_number"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_build".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("appVersion")),
                        ("title".to_string(), Value::str("App Version")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("If a Device Type has more than one Application Code version the supported version is specified here.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("buildNumber")),
                        ("title".to_string(), Value::str("Build Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Build Number.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("configFileName")),
                        ("title".to_string(), Value::str("Config File Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the configuration file that is uploaded to the device.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("deviceType")),
                        ("title".to_string(), Value::str("Device Type")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device Type Name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firmwareVersion")),
                        ("title".to_string(), Value::str("Firmware Version")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("A list of firmware versions that this Device Build covers.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("hardwareVersion")),
                        ("title".to_string(), Value::str("Hardware Version")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("A list of hardware versions that this Device Build covers.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the device build is still active and not succeeded by subsequent build.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device Builds's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notes")),
                        ("title".to_string(), Value::str("Notes")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Notes attached to the device build by Bluefin CISO.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("whiteListingBinRanges")),
                        ("title".to_string(), Value::str("White Listing Bin Ranges")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("A comma separated list of BIN ranges that aren't encrypted by the terminal.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("whiteListingUsed")),
                        ("title".to_string(), Value::str("White Listing Used")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("device_build")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceBuilds")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("deviceBuilds")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceBuilds"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceBuilds/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("deviceBuilds")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceBuilds"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_custody_detail".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("completeDate")),
                        ("title".to_string(), Value::str("Complete Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The date and time that the Custody change took place.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("createdBy")),
                        ("title".to_string(), Value::str("Created By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("custodian")),
                        ("title".to_string(), Value::str("Custodian")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("device")),
                        ("title".to_string(), Value::str("Device")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("location")),
                        ("title".to_string(), Value::str("Location")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated Location resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modifiedBy")),
                        ("title".to_string(), Value::str("Modified By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notes")),
                        ("title".to_string(), Value::str("Notes")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Free form field that allows the Client associate notes with the Custody Change.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("status")),
                        ("title".to_string(), Value::str("Status")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Custody Status.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("transferMethod")),
                        ("title".to_string(), Value::str("Transfer Method")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Transfer Method.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("device_custody_detail")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}/custody/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("serial_number")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("device_type")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("custody")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{serial_number}"),
                                    Value::str("{device_type}"),
                                    Value::str("custody"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("deviceType".to_string(), Value::str("device_type")),
                                        ("serialNumber".to_string(), Value::str("serial_number")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("id"),
                                        Value::str("serial_number"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("$.main.kit.entity.device"),
                        ]),
                    ])),
                ])),
            ])),
            ("device_custody_list_item".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("completeDate")),
                        ("title".to_string(), Value::str("Complete Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The date and time that the Custody change took place.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("createdBy")),
                        ("title".to_string(), Value::str("Created By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("custodian")),
                        ("title".to_string(), Value::str("Custodian")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("device")),
                        ("title".to_string(), Value::str("Device")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Device resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("location")),
                        ("title".to_string(), Value::str("Location")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated Location resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("date-time")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modifiedBy")),
                        ("title".to_string(), Value::str("Modified By")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notes")),
                        ("title".to_string(), Value::str("Notes")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Free form field that allows the Client associate notes with the Custody Change.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("status")),
                        ("title".to_string(), Value::str("Status")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Custody Status.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("transferMethod")),
                        ("title".to_string(), Value::str("Transfer Method")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Transfer Method.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("device_custody_list_item")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}/custody")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("serial_number")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("device_type")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("custody")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{serial_number}"),
                                    Value::str("{device_type}"),
                                    Value::str("custody"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("deviceType".to_string(), Value::str("device_type")),
                                        ("serialNumber".to_string(), Value::str("serial_number")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("serial_number"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("$.main.kit.entity.device"),
                        ]),
                    ])),
                ])),
            ])),
            ("device_receive_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("title".to_string(), Value::str("Success")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indicates if the action succeeded.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_receive_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices/receive")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("receive")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("receive"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_rki_activate_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("title".to_string(), Value::str("Success")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Indicates if the RKI activation succeeded.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_rki_activate_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices/rki/activate")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("rki")),
                                    ]),
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("activate")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("rki"),
                                    Value::str("activate"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_state".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Unique identifier for this Device state.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Descriptive name for this Device state.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("device_state")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceStates")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("deviceStates")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceStates"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_type".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("deviceTypeMode")),
                        ("title".to_string(), Value::str("Device Type Mode")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device type.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("hardwareVersion")),
                        ("title".to_string(), Value::str("Hardware Version")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device hardware version.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Unique idenifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the DeviceType is active.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("manufacturer")),
                        ("title".to_string(), Value::str("Manufacturer")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device manufacturer.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("model")),
                        ("title".to_string(), Value::str("Model")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device model.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The DeviceType name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("photoUrl")),
                        ("title".to_string(), Value::str("Photo Url")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("productName")),
                        ("title".to_string(), Value::str("Product Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Device name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("device_type")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceTypes")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("deviceTypes")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceTypes"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceTypes/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("deviceTypes")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceTypes"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("inject_key".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("unique idenifier")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("Active flag, inactive keys cannot be assigned to devices.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isP2PE")),
                        ("title".to_string(), Value::str("Is P2 Pe")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("Flags if a key is for a P2PE compliant cypher.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("keyType")),
                        ("title".to_string(), Value::str("Key Type")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The cipher type that the key works with.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Key name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("inject_key")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/injectKeys")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("injectKeys")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("injectKeys"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/injectKeys/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("injectKeys")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("injectKeys"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("kif".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                        ("format".to_string(), Value::str("int64")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The KIF's name.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("kif")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/kifs")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("kifs")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("kifs"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("location".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("address1")),
                        ("title".to_string(), Value::str("Address1")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("address2")),
                        ("title".to_string(), Value::str("Address2")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("billingId")),
                        ("title".to_string(), Value::str("Billing Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("\\?")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("city")),
                        ("title".to_string(), Value::str("City")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's city.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("country")),
                        ("title".to_string(), Value::str("Country")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's country.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("customReference")),
                        ("title".to_string(), Value::str("Custom Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("A Partner specified reference for a location.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("locationType")),
                        ("title".to_string(), Value::str("Location Type")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's clasification.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mailAddress1")),
                        ("title".to_string(), Value::str("Mail Address1")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mailAddress2")),
                        ("title".to_string(), Value::str("Mail Address2")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mailCity")),
                        ("title".to_string(), Value::str("Mail City")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's city.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mailCountry")),
                        ("title".to_string(), Value::str("Mail Country")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mailPostalCode")),
                        ("title".to_string(), Value::str("Mail Postal Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's postal code.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("mailStateProvince")),
                        ("title".to_string(), Value::str("Mail State Province")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street state or province.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("nameOfBusiness")),
                        ("title".to_string(), Value::str("Name Of Business")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the business at this location.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("notes")),
                        ("title".to_string(), Value::str("Notes")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Note for delivery driver.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("postalCode")),
                        ("title".to_string(), Value::str("Postal Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's postal code.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("stateProvince")),
                        ("title".to_string(), Value::str("State Province")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Location's street state or province.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("uniqueId")),
                        ("title".to_string(), Value::str("Unique Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Unique Identifier for the Location.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("location")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/locations")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("locations")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/locations")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("locations")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/locations/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("locations")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/locations/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("locations")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("partner".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("billingId")),
                        ("title".to_string(), Value::str("Billing Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's billing identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("clientCanOrderEquipment")),
                        ("title".to_string(), Value::str("Client Can Order Equipment")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the Partner is allowed to order Equipment.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("contact")),
                        ("title".to_string(), Value::str("Contact")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("short".to_string(), Value::str("Reference to the associated User resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the Parter account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("location")),
                        ("title".to_string(), Value::str("Location")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated Location resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("name")),
                        ("title".to_string(), Value::str("Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("parent")),
                        ("title".to_string(), Value::str("Parent")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partnerId")),
                        ("title".to_string(), Value::str("Partner Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's id.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("title".to_string(), Value::str("Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The Partner's reference string.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("verificationPhrase")),
                        ("title".to_string(), Value::str("Verification Phrase")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The verification phrase is a message that the Partner creates.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("partner")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("shipment".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("carrier")),
                        ("title".to_string(), Value::str("Carrier")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the courier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("dateReceived")),
                        ("title".to_string(), Value::str("Date Received")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The date and time that a package is recieved.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("dateShipped")),
                        ("title".to_string(), Value::str("Date Shipped")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The date and time that a package is shipped.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("dcKif")),
                        ("title".to_string(), Value::str("Dc Kif")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated KIF resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("items")),
                        ("title".to_string(), Value::str("Items")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("kif")),
                        ("title".to_string(), Value::str("Kif")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated KIF resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("shipmentType")),
                        ("title".to_string(), Value::str("Shipment Type")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The type of shipment.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("tracking")),
                        ("title".to_string(), Value::str("Tracking")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The courier's tracking number.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("shipment")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/shipments")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("shipments")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/shipments")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("shipments")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("kif")),
                                            ("orig".to_string(), Value::str("kif")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("mode")),
                                            ("orig".to_string(), Value::str("mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("kif"),
                                        Value::str("mode"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/shipments/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("shipments")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("success".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("title".to_string(), Value::str("Success")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("Indicates if the action was a success.")),
                    ]),
                ])),
                ("name".to_string(), Value::str("success")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/virtualDevices/{sharePartnerTo}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("virtualDevices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("share_partner_to")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("virtualDevices"),
                                    Value::str("{share_partner_to}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("sharePartnerTo".to_string(), Value::str("share_partner_to")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("share_partner_to")),
                                            ("orig".to_string(), Value::str("share_partner_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("share_partner_to"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/virtualDevices/{sharePartnerTo}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("virtualDevices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("share_partner_to")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("virtualDevices"),
                                    Value::str("{share_partner_to}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("sharePartnerTo".to_string(), Value::str("share_partner_to")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("share_partner_to")),
                                            ("orig".to_string(), Value::str("share_partner_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("share_partner_to"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("$.main.kit.entity.virtual_device"),
                        ]),
                    ])),
                ])),
            ])),
            ("transaction".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("alternateKey")),
                        ("title".to_string(), Value::str("Alternate Key")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("clientRef")),
                        ("title".to_string(), Value::str("Client Ref")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Client Reference property that is included in the decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("decrypted")),
                        ("title".to_string(), Value::str("Decrypted")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("A Transcation can process muliple decryptions.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("deviceName")),
                        ("title".to_string(), Value::str("Device Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The name of the Device that generated the payload to decrypt.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("directPartner")),
                        ("title".to_string(), Value::str("Direct Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("encrypted")),
                        ("title".to_string(), Value::str("Encrypted")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("A Transcation can process muliple encryptions.")),
                        ("format".to_string(), Value::str("int32")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("endDate")),
                        ("title".to_string(), Value::str("End Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from the end of the transaction.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errCode")),
                        ("title".to_string(), Value::str("Err Code")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The error code that is sent in response to a failed decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("errMessage")),
                        ("title".to_string(), Value::str("Err Message")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The error messge that is sent in response to a failed decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("ipAddress")),
                        ("title".to_string(), Value::str("Ip Address")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The IP address of the http client that makes the decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isVirtual")),
                        ("title".to_string(), Value::str("Is Virtual")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("Indicates if the Transaction came from a virtual Device.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("keyType")),
                        ("title".to_string(), Value::str("Key Type")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The type of cipher used during decrytion.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("location")),
                        ("title".to_string(), Value::str("Location")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("req".to_string(), Value::Bool(true)),
                        ("short".to_string(), Value::str("Reference to the associated Location resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("messageId")),
                        ("title".to_string(), Value::str("Message Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Message ID.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("method")),
                        ("title".to_string(), Value::str("Method")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The decryption cypher/method.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("reference")),
                        ("title".to_string(), Value::str("Reference")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The reference property that the Client includes in the decrypt API call.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("serialNumber")),
                        ("title".to_string(), Value::str("Serial Number")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The serial number of the Device that generated the payload to decrypt.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("startDate")),
                        ("title".to_string(), Value::str("Start Date")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Timestamp from the beginning of the transaction.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("success")),
                        ("title".to_string(), Value::str("Success")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("The success indicator.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("transactionSource")),
                        ("title".to_string(), Value::str("Transaction Source")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The source of the Transaction.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("transaction")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/transactions")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("transactions")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("transactions")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client_ref")),
                                            ("orig".to_string(), Value::str("client_ref")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("date_from")),
                                            ("orig".to_string(), Value::str("date_from")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("date_to")),
                                            ("orig".to_string(), Value::str("date_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("location")),
                                            ("orig".to_string(), Value::str("location")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("message_id")),
                                            ("orig".to_string(), Value::str("message_id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("paging_mode")),
                                            ("orig".to_string(), Value::str("paging_mode")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::str("nocount")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("success")),
                                            ("orig".to_string(), Value::str("success")),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("client_ref"),
                                        Value::str("date_from"),
                                        Value::str("date_to"),
                                        Value::str("location"),
                                        Value::str("message_id"),
                                        Value::str("paging_mode"),
                                        Value::str("partner"),
                                        Value::str("reference"),
                                        Value::str("serial_number"),
                                        Value::str("skip"),
                                        Value::str("success"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("transactions")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("update_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("title".to_string(), Value::str("Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's email address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firstName")),
                        ("title".to_string(), Value::str("First Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("ID of newly created resource")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the User account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("kif")),
                        ("title".to_string(), Value::str("Kif")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated KIF resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastName")),
                        ("title".to_string(), Value::str("Last Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's Surname.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phone")),
                        ("title".to_string(), Value::str("Phone")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's phone number without dashes, spaces, or brackets.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userName")),
                        ("title".to_string(), Value::str("User Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's unique username.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userRole")),
                        ("title".to_string(), Value::str("User Role")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated User Role.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("update_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/users")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::empty_map()),
                                ("select".to_string(), Value::empty_map()),
                            ]),
                        ])),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body.data`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("kif")),
                                            ("orig".to_string(), Value::str("kif")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("type".to_string(), Value::str("`$ANY`")),
                                            ("kind".to_string(), Value::str("query")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("kif"),
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("clients")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/devices/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("devices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/locations/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("locations")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("partners")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/shipments/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("shipments")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/transactions/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("transactions")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("user".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("client")),
                        ("title".to_string(), Value::str("Client")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Client resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("created")),
                        ("title".to_string(), Value::str("Created")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Creation timestamp in ISO 8601 format.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("email")),
                        ("title".to_string(), Value::str("Email")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's email address.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("firstName")),
                        ("title".to_string(), Value::str("First Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's name.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("This resource's unique identifier.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("isActive")),
                        ("title".to_string(), Value::str("Is Active")),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("short".to_string(), Value::str("This property indicates if the User account is active or disabled.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("kif")),
                        ("title".to_string(), Value::str("Kif")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated KIF resource.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("lastName")),
                        ("title".to_string(), Value::str("Last Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's Surname.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("modified")),
                        ("title".to_string(), Value::str("Modified")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("Last modified timestamp.")),
                        ("format".to_string(), Value::str("datetime")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("partner")),
                        ("title".to_string(), Value::str("Partner")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated Partner.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("phone")),
                        ("title".to_string(), Value::str("Phone")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's phone number without dashes, spaces, or brackets.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userName")),
                        ("title".to_string(), Value::str("User Name")),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("short".to_string(), Value::str("The User's unique username.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("userRole")),
                        ("title".to_string(), Value::str("User Role")),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("short".to_string(), Value::str("Reference to the associated User Role.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("version")),
                        ("title".to_string(), Value::str("Version")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("The number of times that this resource has been updated.")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("user")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("users")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("virtual_device".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("name".to_string(), Value::str("data")),
                        ("title".to_string(), Value::str("Data")),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("short".to_string(), Value::str("List of Devices.")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("id")),
                        ("title".to_string(), Value::str("Id")),
                        ("type".to_string(), Value::str("`$STRING`")),
                    ]),
                    Value::map_of([
                        ("name".to_string(), Value::str("total")),
                        ("title".to_string(), Value::str("Total")),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("short".to_string(), Value::str("Total number of Devices available (not the number of Users in the response).")),
                    ]),
                ])),
                ("id".to_string(), Value::map_of([
                    ("field".to_string(), Value::str("id")),
                    ("name".to_string(), Value::str("id")),
                ])),
                ("name".to_string(), Value::str("virtual_device")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/virtualDevices/{sharePartnerTo}")),
                                ("segments".to_string(), Value::list(vec![
                                    Value::map_of([
                                        ("lit".to_string(), Value::str("virtualDevices")),
                                    ]),
                                    Value::map_of([
                                        ("var".to_string(), Value::str("id")),
                                    ]),
                                ])),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("virtualDevices"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("sharePartnerTo".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("share_partner_to")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("param")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("sorting_direction")),
                                            ("orig".to_string(), Value::str("sorting_direction")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::str("asc")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("sorting_field")),
                                            ("orig".to_string(), Value::str("sorting_field")),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::str("serialnumber")),
                                        ]),
                                        Value::map_of([
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("example".to_string(), Value::Num(10f64)),
                                        ]),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                        Value::str("skip"),
                                        Value::str("sorting_direction"),
                                        Value::str("sorting_field"),
                                        Value::str("take"),
                                    ])),
                                ])),
                            ]),
                        ])),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
        ])),
    ])
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// THREAD-LOCAL, not a global: Value is Rc/RefCell-backed and so is neither
// Send nor Sync. One config per thread is the widest scope that is sound here,
// and the clone is an Rc bump, not a deep copy.
thread_local! {
    static SHARED_CONFIG: Value = make_config();
}

/// The per-thread config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() -> Value {
    SHARED_CONFIG.with(|c| c.clone())
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "audit" => Rc::new(RefCell::new(crate::feature::audit::AuditFeature::new())),
        "clienttrack" => Rc::new(RefCell::new(crate::feature::clienttrack::ClienttrackFeature::new())),
        "debug" => Rc::new(RefCell::new(crate::feature::debug::DebugFeature::new())),
        "idempotency" => Rc::new(RefCell::new(crate::feature::idempotency::IdempotencyFeature::new())),
        "log" => Rc::new(RefCell::new(crate::feature::log::LogFeature::new())),
        "metrics" => Rc::new(RefCell::new(crate::feature::metrics::MetricsFeature::new())),
        "paging" => Rc::new(RefCell::new(crate::feature::paging::PagingFeature::new())),
        "ratelimit" => Rc::new(RefCell::new(crate::feature::ratelimit::RatelimitFeature::new())),
        "retry" => Rc::new(RefCell::new(crate::feature::retry::RetryFeature::new())),
        "telemetry" => Rc::new(RefCell::new(crate::feature::telemetry::TelemetryFeature::new())),
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        "timeout" => Rc::new(RefCell::new(crate::feature::timeout::TimeoutFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
