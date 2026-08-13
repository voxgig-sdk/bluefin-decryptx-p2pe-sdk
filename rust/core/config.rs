// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinDecryptxP2pe")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://apis.p2pemanager.com/api/v1")),
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
                ("device_custody_list".to_string(), Value::empty_map()),
                ("device_list".to_string(), Value::empty_map()),
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
            ])),
            ("auth".to_string(), Value::map_of([
                ("prefix".to_string(), Value::str("Basic")),
            ])),
        ])),
        ("entity".to_string(), Value::map_of([
            ("attestation".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("completeDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("device")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notes")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("attestation")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/attestations")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("attestations"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/attestations")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("attestations"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/attestations/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("attestations"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("client".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("contact")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("directPartner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mid")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("client")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
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
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}/custody")),
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
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("serial_number"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("device"),
                        ]),
                    ])),
                ])),
            ])),
            ("decryption".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("success")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("decryption")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/decryption")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("decryption"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("activatedBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("activationDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("alternateKey")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("auditNextDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("auditNotificationDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("createdBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("deviceBuild")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("deviceState")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("deviceType")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("errorCounter")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("errorLastDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("initializedBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(14f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("initializedDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(15f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("injectKey")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(16f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isVirtual")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(17f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("kif")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(18f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("lastActivityDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(19f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(20f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(21f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modifiedBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(22f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(23f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notes")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(24f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(25f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("serialNumber")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(26f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(27f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("device_state")),
                                            ("orig".to_string(), Value::str("device_state")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("kif")),
                                            ("orig".to_string(), Value::str("kif")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("asc")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("sorting_direction")),
                                            ("orig".to_string(), Value::str("sorting_direction")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("serialnumber")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("sorting_field")),
                                            ("orig".to_string(), Value::str("sorting_field")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}")),
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
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("serial_number"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("device"),
                        ]),
                    ])),
                ])),
            ])),
            ("device_build".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("appVersion")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("buildNumber")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("configFileName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("deviceType")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("firmwareVersion")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("hardwareVersion")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notes")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("whiteListingBinRanges")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("whiteListingUsed")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(14f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_build")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceBuilds")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceBuilds"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceBuilds/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceBuilds"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_custody_detail".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("completeDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("createdBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("custodian")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("device")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modifiedBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notes")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("transferMethod")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_custody_detail")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(2f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}/custody/{id}")),
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
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("id"),
                                        Value::str("serial_number"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("device"),
                        ]),
                    ])),
                ])),
            ])),
            ("device_custody_list".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("completeDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("createdBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("custodian")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("device")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modifiedBy")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notes")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("status")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("transferMethod")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_custody_list")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("device_type")),
                                            ("orig".to_string(), Value::str("device_type")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(1f64)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/devices/{serialNumber}/{deviceType}/custody")),
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
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("device_type"),
                                        Value::str("serial_number"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("device"),
                        ]),
                    ])),
                ])),
            ])),
            ("device_list".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("data")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("total")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_list")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("share_partner_to")),
                                            ("orig".to_string(), Value::str("share_partner_to")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("asc")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("sorting_direction")),
                                            ("orig".to_string(), Value::str("sorting_direction")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("serialnumber")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("sorting_field")),
                                            ("orig".to_string(), Value::str("sorting_field")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/virtualDevices/{sharePartnerTo}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("virtualDevices"),
                                    Value::str("{share_partner_to}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("sharePartnerTo".to_string(), Value::str("share_partner_to")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("share_partner_to"),
                                        Value::str("skip"),
                                        Value::str("sorting_direction"),
                                        Value::str("sorting_field"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("virtual_device"),
                        ]),
                    ])),
                ])),
            ])),
            ("device_receive_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("success")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_receive_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices/receive")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("receive"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_rki_activate_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("success")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_rki_activate_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/devices/rki/activate")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("rki"),
                                    Value::str("activate"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_state".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_state")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceStates")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceStates"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("device_type".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("deviceTypeMode")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("hardwareVersion")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("manufacturer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("model")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("photoUrl")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("productName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("device_type")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceTypes")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceTypes"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/deviceTypes/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("deviceTypes"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("inject_key".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isP2PE")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("keyType")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("inject_key")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/injectKeys")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("injectKeys"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/injectKeys/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("injectKeys"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("kif".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("kif")),
                ("op".to_string(), Value::map_of([
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/kifs")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("kifs"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("location".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("address1")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("address2")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("billingId")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("city")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("country")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("customReference")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("locationType")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mailAddress1")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mailAddress2")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mailCity")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mailCountry")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mailPostalCode")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("mailStateProvince")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(14f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(15f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(16f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("nameOfBusiness")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(17f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("notes")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(18f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("postalCode")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(19f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("stateProvince")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(20f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("uniqueId")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(21f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(22f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("location")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/locations")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/locations")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("client"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/locations/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/locations/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("partner".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("billingId")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("clientCanOrderEquipment")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("contact")),
                        ("op".to_string(), Value::map_of([
                            ("list".to_string(), Value::map_of([
                                ("req".to_string(), Value::Bool(true)),
                                ("type".to_string(), Value::str("`$OBJECT`")),
                            ])),
                        ])),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("name")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("parent")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partnerId")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reference")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("verificationPhrase")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("partner")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("partner"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("shipment".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("carrier")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("dateReceived")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("dateShipped")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("dcKif")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("items")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$ARRAY`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("kif")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("shipmentType")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("tracking")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("shipment")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/shipments")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("kif")),
                                            ("orig".to_string(), Value::str("kif")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("mode")),
                                            ("orig".to_string(), Value::str("mode")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/shipments")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("kif"),
                                        Value::str("mode"),
                                        Value::str("skip"),
                                        Value::str("take"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/shipments/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("success".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("success")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("success")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("share_partner_to")),
                                            ("orig".to_string(), Value::str("share_partner_to")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/virtualDevices/{sharePartnerTo}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("virtualDevices"),
                                    Value::str("{share_partner_to}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("sharePartnerTo".to_string(), Value::str("share_partner_to")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("share_partner_to"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("share_partner_to")),
                                            ("orig".to_string(), Value::str("share_partner_to")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/virtualDevices/{sharePartnerTo}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("virtualDevices"),
                                    Value::str("{share_partner_to}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("sharePartnerTo".to_string(), Value::str("share_partner_to")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("share_partner_to"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::list(vec![
                        Value::list(vec![
                            Value::str("virtual_device"),
                        ]),
                    ])),
                ])),
            ])),
            ("transaction".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("alternateKey")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("clientRef")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("decrypted")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("deviceName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("directPartner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("encrypted")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("endDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("errCode")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("errMessage")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("ipAddress")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isVirtual")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("keyType")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(14f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("location")),
                        ("req".to_string(), Value::Bool(true)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(15f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("messageId")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(16f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("method")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(17f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(18f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("reference")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(19f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("serialNumber")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(20f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("startDate")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(21f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("success")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(22f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("transactionSource")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(23f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("transaction")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/transactions")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client_ref")),
                                            ("orig".to_string(), Value::str("client_ref")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("date_from")),
                                            ("orig".to_string(), Value::str("date_from")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("date_to")),
                                            ("orig".to_string(), Value::str("date_to")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("location")),
                                            ("orig".to_string(), Value::str("location")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("message_id")),
                                            ("orig".to_string(), Value::str("message_id")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::str("nocount")),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("paging_mode")),
                                            ("orig".to_string(), Value::str("paging_mode")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("reference")),
                                            ("orig".to_string(), Value::str("reference")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("serial_number")),
                                            ("orig".to_string(), Value::str("serial_number")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("success")),
                                            ("orig".to_string(), Value::str("success")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$BOOLEAN`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/transactions/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("update_result".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("email")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("firstName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("kif")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("lastName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("phone")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("userName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("userRole")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("update_result")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::empty_map()),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/users")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                ])),
                                ("select".to_string(), Value::empty_map()),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("list".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("list")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("query".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("client")),
                                            ("orig".to_string(), Value::str("client")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("kif")),
                                            ("orig".to_string(), Value::str("kif")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("partner")),
                                            ("orig".to_string(), Value::str("partner")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$ANY`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(0f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("skip")),
                                            ("orig".to_string(), Value::str("skip")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("example".to_string(), Value::Num(10f64)),
                                            ("kind".to_string(), Value::str("query")),
                                            ("name".to_string(), Value::str("take")),
                                            ("orig".to_string(), Value::str("take")),
                                            ("reqd".to_string(), Value::Bool(false)),
                                            ("type".to_string(), Value::str("`$INTEGER`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
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
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("list")),
                    ])),
                    ("update".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("update")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/clients/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("clients"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/devices/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("devices"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/locations/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("locations"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(2f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/partners/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("partners"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(3f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/shipments/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("shipments"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(4f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/transactions/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("transactions"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(5f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("PATCH")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(6f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("update")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
            ("user".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("client")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("created")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("email")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("firstName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("id")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("isActive")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$BOOLEAN`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("kif")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("lastName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("modified")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("partner")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("phone")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(10f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("userName")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(11f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("userRole")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(12f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("version")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$INTEGER`")),
                        ("index$".to_string(), Value::Num(13f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("user")),
                ("op".to_string(), Value::map_of([
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/users/{id}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("users"),
                                    Value::str("{id}"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
        ])),
    ])
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}
