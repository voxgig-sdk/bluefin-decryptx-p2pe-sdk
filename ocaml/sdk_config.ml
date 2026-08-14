(* Generated API configuration (mirrors go core/config.go).
 *
 * make_config () — the embedded API model as a voxgig struct value.
 * make_feature name — the N-feature-safe factory the client uses. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Sdk_features

let make_config () : value =
  (jo [
    ("main", (jo [
      ("name", (Str "BluefinDecryptxP2pe")) ]));
    ("feature", (jo [
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ])) ])) ]));
    ("options", (jo [
      ("base", (Str "https://apis.p2pemanager.com/api/v1"));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("attestation", (empty_map ()));
        ("client", (empty_map ()));
        ("create_result", (empty_map ()));
        ("decryption", (empty_map ()));
        ("device", (empty_map ()));
        ("device_build", (empty_map ()));
        ("device_custody_detail", (empty_map ()));
        ("device_custody_list", (empty_map ()));
        ("device_list", (empty_map ()));
        ("device_receive_result", (empty_map ()));
        ("device_rki_activate_result", (empty_map ()));
        ("device_state", (empty_map ()));
        ("device_type", (empty_map ()));
        ("inject_key", (empty_map ()));
        ("kif", (empty_map ()));
        ("location", (empty_map ()));
        ("partner", (empty_map ()));
        ("shipment", (empty_map ()));
        ("success", (empty_map ()));
        ("transaction", (empty_map ()));
        ("update_result", (empty_map ()));
        ("user", (empty_map ())) ]));
      ("auth", (jo [
        ("prefix", (Str "Basic")) ])) ]));
    ("entity", (jo [
      ("attestation", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "completeDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "device"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "attestation"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/attestations"));
                ("parts", (ja [
                  (Str "attestations") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/attestations"));
                ("parts", (ja [
                  (Str "attestations") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/attestations/{id}"));
                ("parts", (ja [
                  (Str "attestations");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("client", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "contact"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "mid"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "client"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/clients"));
                ("parts", (ja [
                  (Str "clients") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients"));
                ("parts", (ja [
                  (Str "clients") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients/{id}"));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/clients/{id}"));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("create_result", (jo [
        ("fields", (empty_list ()));
        ("name", (Str "create_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}/custody"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("decryption", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("type", (Str "`$BOOLEAN`")) ]) ]));
        ("name", (Str "decryption"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/decryption"));
                ("parts", (ja [
                  (Str "decryption") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "activatedBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "activationDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "alternateKey"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "auditNextDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "auditNotificationDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "deviceBuild"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "deviceState"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "errorCounter"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "errorLastDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "initializedBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "initializedDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "injectKey"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "isVirtual"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "lastActivityDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "device"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices"));
                ("parts", (ja [
                  (Str "devices") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "device_state"));
                      ("orig", (Str "device_state"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Str "asc"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_direction"));
                      ("orig", (Str "sorting_direction"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Str "serialnumber"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_field"));
                      ("orig", (Str "sorting_field"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices"));
                ("parts", (ja [
                  (Str "devices") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "device_state");
                    (Str "kif");
                    (Str "partner");
                    (Str "serial_number");
                    (Str "skip");
                    (Str "sorting_direction");
                    (Str "sorting_field");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{id}"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_build", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appVersion"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "buildNumber"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "configFileName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firmwareVersion"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "whiteListingBinRanges"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "whiteListingUsed"));
            ("type", (Str "`$BOOLEAN`")) ]) ]));
        ("name", (Str "device_build"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceBuilds"));
                ("parts", (ja [
                  (Str "deviceBuilds") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceBuilds/{id}"));
                ("parts", (ja [
                  (Str "deviceBuilds");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_custody_detail", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "completeDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "device"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "status"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "transferMethod"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "device_custody_detail"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}/custody/{id}"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "id");
                    (Str "serial_number") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_custody_list", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "completeDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "device"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "status"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "transferMethod"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "device_custody_list"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}/custody"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_list", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "data"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "total"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "device_list"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "share_partner_to"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Str "asc"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_direction"));
                      ("orig", (Str "sorting_direction"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Str "serialnumber"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_field"));
                      ("orig", (Str "sorting_field"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/virtualDevices/{sharePartnerTo}"));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to");
                    (Str "skip");
                    (Str "sorting_direction");
                    (Str "sorting_field");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "virtual_device") ]) ])) ])) ]));
      ("device_receive_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`")) ]) ]));
        ("name", (Str "device_receive_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/receive"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "receive") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_rki_activate_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`")) ]) ]));
        ("name", (Str "device_rki_activate_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/rki/activate"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "rki");
                  (Str "activate") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_state", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "device_state"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceStates"));
                ("parts", (ja [
                  (Str "deviceStates") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_type", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "deviceTypeMode"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "manufacturer"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "model"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "photoUrl"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "device_type"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceTypes"));
                ("parts", (ja [
                  (Str "deviceTypes") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceTypes/{id}"));
                ("parts", (ja [
                  (Str "deviceTypes");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("inject_key", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "isP2PE"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "inject_key"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/injectKeys"));
                ("parts", (ja [
                  (Str "injectKeys") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/injectKeys/{id}"));
                ("parts", (ja [
                  (Str "injectKeys");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("kif", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "kif"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/kifs"));
                ("parts", (ja [
                  (Str "kifs") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("location", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "address1"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "address2"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "billingId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "city"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "customReference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "locationType"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailAddress1"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailAddress2"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailCity"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailCountry"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailPostalCode"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailStateProvince"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameOfBusiness"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "stateProvince"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "uniqueId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "location"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/locations"));
                ("parts", (ja [
                  (Str "locations") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/locations"));
                ("parts", (ja [
                  (Str "locations") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/locations/{id}"));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/locations/{id}"));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "clientCanOrderEquipment"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "contact"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "parent"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partnerId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "partner"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/partners"));
                ("parts", (ja [
                  (Str "partners") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners"));
                ("parts", (ja [
                  (Str "partners") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners/{id}"));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("shipment", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "carrier"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "dateReceived"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "dateShipped"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "dcKif"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "items"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "shipmentType"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "tracking"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "shipment"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/shipments"));
                ("parts", (ja [
                  (Str "shipments") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "mode"));
                      ("orig", (Str "mode"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/shipments"));
                ("parts", (ja [
                  (Str "shipments") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "kif");
                    (Str "mode");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/shipments/{id}"));
                ("parts", (ja [
                  (Str "shipments");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("success", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("type", (Str "`$BOOLEAN`")) ]) ]));
        ("name", (Str "success"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "share_partner_to"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/virtualDevices/{sharePartnerTo}"));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "share_partner_to"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/virtualDevices/{sharePartnerTo}"));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "virtual_device") ]) ])) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "alternateKey"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "clientRef"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "decrypted"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "deviceName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "encrypted"));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "endDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isVirtual"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "method"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "startDate"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "success"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "transactionSource"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "transaction"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/transactions"));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client_ref"));
                      ("orig", (Str "client_ref"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "date_from"));
                      ("orig", (Str "date_from"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "date_to"));
                      ("orig", (Str "date_to"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "location"));
                      ("orig", (Str "location"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "message_id"));
                      ("orig", (Str "message_id"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Str "nocount"));
                      ("kind", (Str "query"));
                      ("name", (Str "paging_mode"));
                      ("orig", (Str "paging_mode"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "success"));
                      ("orig", (Str "success"));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions"));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "client_ref");
                    (Str "date_from");
                    (Str "date_to");
                    (Str "location");
                    (Str "message_id");
                    (Str "paging_mode");
                    (Str "partner");
                    (Str "reference");
                    (Str "serial_number");
                    (Str "skip");
                    (Str "success");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions/{id}"));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "update_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (empty_map ()));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/users"));
                ("parts", (ja [
                  (Str "users") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$ANY`")) ]);
                    (jo [
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users"));
                ("parts", (ja [
                  (Str "users") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "kif");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/clients/{id}"));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/devices/{id}"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/locations/{id}"));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/partners/{id}"));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/shipments/{id}"));
                ("parts", (ja [
                  (Str "shipments");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/transactions/{id}"));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/users/{id}"));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "email"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modified"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("name", (Str "user"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users/{id}"));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/users/{id}"));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()
