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
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "complete_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "note"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]) ]));
        ("name", (Str "attestation"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/attestations"));
                ("parts", (ja [
                  (Str "attestations") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("client", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "contact"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "direct_partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mid"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (10.))) ]) ]));
        ("name", (Str "client"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/clients"));
                ("parts", (ja [
                  (Str "clients") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
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
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("decryption", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "success"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (0.))) ]) ]));
        ("name", (Str "decryption"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/decryption"));
                ("parts", (ja [
                  (Str "decryption") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "activated_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "activation_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "alternate_key"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "audit_next_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "audit_notification_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device_build"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device_state"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device_type"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "error_counter"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "error_last_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (13.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "initialized_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (14.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "initialized_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (15.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "inject_key"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (16.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_virtual"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (17.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "kif"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (18.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "last_activity_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (19.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (20.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (21.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (22.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (23.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "note"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (24.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (25.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "serial_number"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (26.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (27.))) ]) ]));
        ("name", (Str "device"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/devices"));
                ("parts", (ja [
                  (Str "devices") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "device_state"));
                      ("orig", (Str "device_state"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "asc"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_direction"));
                      ("orig", (Str "sorting_direction"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "serialnumber"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_field"));
                      ("orig", (Str "sorting_field"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_build", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "app_version"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "build_number"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "config_file_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device_type"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "firmware_version"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "hardware_version"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "note"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "white_listing_bin_range"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (13.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "white_listing_used"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (14.))) ]) ]));
        ("name", (Str "device_build"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_custody_detail", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "complete_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "custodian"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "note"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "transfer_method"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (12.))) ]) ]));
        ("name", (Str "device_custody_detail"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (2.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_custody_list", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "complete_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "custodian"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified_by"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "note"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "status"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "transfer_method"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (12.))) ]) ]));
        ("name", (Str "device_custody_list"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "device_type"));
                      ("orig", (Str "device_type"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (1.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_list", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "data"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "total"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (1.))) ]) ]));
        ("name", (Str "device_list"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "share_partner_to"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "asc"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_direction"));
                      ("orig", (Str "sorting_direction"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "serialnumber"));
                      ("kind", (Str "query"));
                      ("name", (Str "sorting_field"));
                      ("orig", (Str "sorting_field"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "virtual_device") ]) ])) ])) ]));
      ("device_receive_result", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "success"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (0.))) ]) ]));
        ("name", (Str "device_receive_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/receive"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "receive") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_rki_activate_result", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "success"));
            ("req", (Bool true));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (0.))) ]) ]));
        ("name", (Str "device_rki_activate_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/rki/activate"));
                ("parts", (ja [
                  (Str "devices");
                  (Str "rki");
                  (Str "activate") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_state", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]) ]));
        ("name", (Str "device_state"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceStates"));
                ("parts", (ja [
                  (Str "deviceStates") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_type", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device_type_mode"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "hardware_version"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "manufacturer"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "model"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "photo_url"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "product_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (11.))) ]) ]));
        ("name", (Str "device_type"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceTypes"));
                ("parts", (ja [
                  (Str "deviceTypes") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("inject_key", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_p2_pe"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "key_type"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (7.))) ]) ]));
        ("name", (Str "inject_key"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "GET"));
                ("orig", (Str "/injectKeys"));
                ("parts", (ja [
                  (Str "injectKeys") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("kif", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]) ]));
        ("name", (Str "kif"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "GET"));
                ("orig", (Str "/kifs"));
                ("parts", (ja [
                  (Str "kifs") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("location", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "address1"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "address2"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "billing_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "city"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "country"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "custom_reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location_type"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mail_address1"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mail_address2"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mail_city"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mail_country"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mail_postal_code"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (13.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "mail_state_province"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (14.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (15.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (16.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name_of_business"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (17.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "note"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (18.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "postal_code"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (19.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "state_province"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (20.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "unique_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (21.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (22.))) ]) ]));
        ("name", (Str "location"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/locations"));
                ("parts", (ja [
                  (Str "locations") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "billing_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client_can_order_equipment"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "contact"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "parent"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "verification_phrase"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (13.))) ]) ]));
        ("name", (Str "partner"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/partners"));
                ("parts", (ja [
                  (Str "partners") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("shipment", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "carrier"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "date_received"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "date_shipped"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "dc_kif"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "item"));
            ("req", (Bool false));
            ("type", (Str "`$ARRAY`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "kif"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "shipment_type"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "tracking"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (13.))) ]) ]));
        ("name", (Str "shipment"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/shipments"));
                ("parts", (ja [
                  (Str "shipments") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "mode"));
                      ("orig", (Str "mode"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("success", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "success"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (0.))) ]) ]));
        ("name", (Str "success"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "share_partner_to"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "share_partner_to"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "virtual_device") ]) ])) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "alternate_key"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "client_ref"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "decrypted"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "device_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "direct_partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "encrypted"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "end_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "err_code"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "err_message"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "ip_address"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_virtual"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (13.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "key_type"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (14.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "location"));
            ("req", (Bool true));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (15.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "message_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (16.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "method"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (17.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (18.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "reference"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (19.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "serial_number"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (20.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "start_date"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (21.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "success"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (22.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "transaction_source"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (23.))) ]) ]));
        ("name", (Str "transaction"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/transactions"));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client_ref"));
                      ("orig", (Str "client_ref"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "date_from"));
                      ("orig", (Str "date_from"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "date_to"));
                      ("orig", (Str "date_to"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "location"));
                      ("orig", (Str "location"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "message_id"));
                      ("orig", (Str "message_id"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Str "nocount"));
                      ("kind", (Str "query"));
                      ("name", (Str "paging_mode"));
                      ("orig", (Str "paging_mode"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serial_number"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "success"));
                      ("orig", (Str "success"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$BOOLEAN`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "email"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "first_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "kif"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "last_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "phone"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_role"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (11.))) ]) ]));
        ("name", (Str "update_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (empty_map ()));
                ("method", (Str "POST"));
                ("orig", (Str "/users"));
                ("parts", (ja [
                  (Str "users") ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$STRING`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "query"));
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$ANY`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (0.)));
                      ("kind", (Str "query"));
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]);
                    (jo [
                      ("active", (Bool true));
                      ("example", (Num (10.)));
                      ("kind", (Str "query"));
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("reqd", (Bool false));
                      ("type", (Str "`$INTEGER`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "list")) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (2.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (3.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (4.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (5.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (6.))) ]) ]));
            ("key$", (Str "update")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("active", (Bool true));
            ("name", (Str "client"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "created"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "email"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "first_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "is_active"));
            ("req", (Bool false));
            ("type", (Str "`$BOOLEAN`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "kif"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "last_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "modified"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "partner"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (9.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "phone"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (10.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_name"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (11.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "user_role"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (12.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "version"));
            ("req", (Bool false));
            ("type", (Str "`$INTEGER`"));
            ("index$", (Num (13.))) ]) ]));
        ("name", (Str "user"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()
