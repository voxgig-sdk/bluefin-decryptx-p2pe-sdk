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
      ("name", (Str "BluefinDecryptxP2pe"));
      ("slug", (Str "bluefin-decryptx-p2pe"));
      ("version", (Str "0.1.1"));
      ("target", (Str "ocaml")) ]));
    ("feature", (jo [
      ("audit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("actor", (Str "anonymous"));
          ("max", (Num (1000.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sink", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("clienttrack", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("clientVersion", (Str "0.0.1")) ]));
        ("optspec", (jo [
          ("clientName", (Str "`$STRING`"));
          ("clientVersion", (Str "`$STRING`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("sessionId", (Str "`$STRING`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("debug", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("max", (Num (100.)));
          ("redact", (ja [
            (Str "authorization");
            (Str "cookie");
            (Str "set-cookie");
            (Str "api-key");
            (Str "apikey");
            (Str "x-api-key");
            (Str "idempotency-key") ])) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("onEntry", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("idempotency", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("header", (Str "Idempotency-Key"));
          ("methods", (ja [
            (Str "POST");
            (Str "PUT");
            (Str "PATCH");
            (Str "DELETE") ]));
          ("ops", (ja [
            (Str "create");
            (Str "update");
            (Str "remove") ])) ]));
        ("optspec", (jo [
          ("keygen", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("log", (jo [
        ("options", (jo [
          ("active", (Bool true)) ]));
        ("optspec", (jo [
          ("level", (Str "`$STRING`"));
          ("logger", (Str "`$ANY`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("metrics", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("paging", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("afterVar", (Str "after"));
          ("cursorParam", (Str "cursor"));
          ("firstVar", (Str "first"));
          ("limitParam", (Str "limit"));
          ("pageParam", (Str "page"));
          ("startPage", (Num (1.))) ]));
        ("optspec", (jo [
          ("limit", (Str "`$NUMBER`"));
          ("ops", (Str "`$LIST`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("ratelimit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("burst", (Num (5.)));
          ("rate", (Num (5.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("retry", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("factor", (Num (2.)));
          ("maxDelay", (Num (2000.)));
          ("minDelay", (Num (50.)));
          ("retries", (Num (2.)));
          ("statuses", (ja [
            (Num (408.));
            (Num (425.));
            (Num (429.));
            (Num (500.));
            (Num (502.));
            (Num (503.));
            (Num (504.)) ])) ]));
        ("optspec", (jo [
          ("jitter", (Str "`$BOOLEAN`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("telemetry", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("exporter", (Str "`$FUNCTION`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("entity", (Str "`$MAP`"));
          ("net", (Str "`$MAP`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "base")) ]));
      ("timeout", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("ms", (Num (30000.))) ]));
        ("optspec", (jo [
          ("clearTimer", (Str "`$FUNCTION`"));
          ("setTimer", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ])) ]));
    ("options", (jo [
      ("base", (Str "https://apis.p2pemanager.com/api/v1"));
      ("auth", (jo [
        ("prefix", (Str "Basic"));
        ("basic", (Bool true)) ]));
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
        ("user", (empty_map ())) ])) ]));
    ("entity", (jo [
      ("attestation", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "completeDate"));
            ("short", (Str "The date and time that the Attestation took place."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "device"));
            ("short", (Str "Reference to the associated Device resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "Text describing the attestation."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("short", (Str "Free form field that allows the Client associate notes with the Attestation."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "attestations")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "attestations") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "attestations")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "attestations") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "attestations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "attestations");
                  (Str "{id}") ])) ]) ])) ])) ]));
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
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the Client account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "mid"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Client's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the Client's root Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "clients") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "clients") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ])) ]) ])) ])) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]);
                  (jo [
                    ("lit", (Str "custody")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("decryption", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("short", (Str "true if the payload decryption was successful."));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "decryption")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "decryption") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "activatedBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "activationDate"));
            ("short", (Str "Timestamp from when the Device was activated."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "alternateKey"));
            ("short", (Str "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "auditNextDate"));
            ("short", (Str "Date and time that the Device is due its next PCI Audit."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "auditNotificationDate"));
            ("short", (Str "Date and time that a notification should be sent that a PCI audit is due."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "deviceBuild"));
            ("short", (Str "Reference to the associated Device Build resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "deviceState"));
            ("short", (Str "Reference to the associated Device State resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("short", (Str "Reference to the associated Device Type resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "errorCounter"));
            ("short", (Str "The number times the Device has been in error."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "errorLastDate"));
            ("short", (Str "Timestamp from the last time that the Device had an error."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "The Device's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "initializedBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "initializedDate"));
            ("short", (Str "Timestamp from when the Device was initialized."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "injectKey"));
            ("short", (Str "Reference to the associated Device resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "isVirtual"));
            ("short", (Str "Indicates if a Device is Virtual (represents a Device shared with a partner)."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("short", (Str "Reference to the associated KIF resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "lastActivityDate"));
            ("short", (Str "Timestamp from the last time that the Device was used."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Device's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("short", (Str "Arbitary note that can be attached to a Device entry."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("short", (Str "The Device's serial number."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]) ]));
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
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "devices") ])) ]) ])) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_build", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appVersion"));
            ("short", (Str "If a Device Type has more than one Application Code version the supported version is specified here."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "buildNumber"));
            ("short", (Str "The Build Number."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "configFileName"));
            ("short", (Str "The name of the configuration file that is uploaded to the device."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("short", (Str "The Device Type Name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firmwareVersion"));
            ("short", (Str "A list of firmware versions that this Device Build covers."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("short", (Str "A list of hardware versions that this Device Build covers."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the device build is still active and not succeeded by subsequent build."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Device Builds's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("short", (Str "Notes attached to the device build by Bluefin CISO."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "whiteListingBinRanges"));
            ("short", (Str "A comma separated list of BIN ranges that aren't encrypted by the terminal."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "whiteListingUsed"));
            ("short", (Str "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal."));
            ("type", (Str "`$BOOLEAN`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceBuilds")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "deviceBuilds") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceBuilds")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "deviceBuilds");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_custody_detail", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "completeDate"));
            ("short", (Str "The date and time that the Custody change took place."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "device"));
            ("short", (Str "Reference to the associated Device resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("short", (Str "Free form field that allows the Client associate notes with the Custody Change."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "status"));
            ("short", (Str "Reference to the associated Custody Status."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "transferMethod"));
            ("short", (Str "Reference to the associated Transfer Method."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]);
                  (jo [
                    ("lit", (Str "custody")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "id");
                    (Str "serial_number") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_custody_list", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "completeDate"));
            ("short", (Str "The date and time that the Custody change took place."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "device"));
            ("short", (Str "Reference to the associated Device resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "date-time"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("short", (Str "Free form field that allows the Client associate notes with the Custody Change."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "status"));
            ("short", (Str "Reference to the associated Custody Status."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "transferMethod"));
            ("short", (Str "Reference to the associated Transfer Method."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]);
                  (jo [
                    ("lit", (Str "custody")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "device") ]) ])) ])) ]));
      ("device_list", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "data"));
            ("short", (Str "List of Devices."));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "total"));
            ("short", (Str "Total number of Devices available (not the number of Users in the response)."));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "virtualDevices")) ]);
                  (jo [
                    ("var", (Str "share_partner_to")) ]) ]));
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
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "virtual_device") ]) ])) ])) ]));
      ("device_receive_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("req", (Bool true));
            ("short", (Str "Indicates if the action succeeded."));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("lit", (Str "receive")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "receive") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_rki_activate_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("req", (Bool true));
            ("short", (Str "Indicates if the RKI activation succeeded."));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("lit", (Str "rki")) ]);
                  (jo [
                    ("lit", (Str "activate")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "rki");
                  (Str "activate") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_state", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "Unique identifier for this Device state."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "Descriptive name for this Device state."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceStates")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "deviceStates") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_type", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "deviceTypeMode"));
            ("short", (Str "The Device type."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("short", (Str "The Device hardware version."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "Unique idenifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the DeviceType is active."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "manufacturer"));
            ("short", (Str "The Device manufacturer."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "model"));
            ("short", (Str "The Device model."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The DeviceType name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "photoUrl"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("short", (Str "The Device name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceTypes")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "deviceTypes") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceTypes")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "deviceTypes");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("inject_key", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "unique idenifier"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "Active flag, inactive keys cannot be assigned to devices."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "isP2PE"));
            ("short", (Str "Flags if a key is for a P2PE compliant cypher."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("short", (Str "The cipher type that the key works with."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "Key name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "injectKeys")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "injectKeys") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "injectKeys")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "injectKeys");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("kif", (jo [
        ("fields", (ja [
          (jo [
            ("format", (Str "int64"));
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The KIF's name."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "kifs")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "kifs") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("location", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "address1"));
            ("short", (Str "The Location's street address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "address2"));
            ("short", (Str "The Location's street address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "billingId"));
            ("short", (Str "\\?"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "city"));
            ("short", (Str "The Location's city."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "country"));
            ("short", (Str "The Location's country."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "customReference"));
            ("short", (Str "A Partner specified reference for a location."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "locationType"));
            ("short", (Str "The Location's clasification."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailAddress1"));
            ("short", (Str "The Location's street address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailAddress2"));
            ("short", (Str "The Location's street address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailCity"));
            ("short", (Str "The Location's city."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailCountry"));
            ("short", (Str "The Location's street address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailPostalCode"));
            ("short", (Str "The Location's postal code."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "mailStateProvince"));
            ("short", (Str "The Location's street state or province."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Location's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "nameOfBusiness"));
            ("short", (Str "The name of the business at this location."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "notes"));
            ("short", (Str "Note for delivery driver."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("short", (Str "The Location's postal code."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "stateProvince"));
            ("short", (Str "The Location's street state or province."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "uniqueId"));
            ("short", (Str "Unique Identifier for the Location."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "locations") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "locations") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("short", (Str "The Partner's billing identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "clientCanOrderEquipment"));
            ("short", (Str "This property indicates if the Partner is allowed to order Equipment."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "contact"));
            ("op", (jo [
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the Parter account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The Partner's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "parent"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "partnerId"));
            ("short", (Str "The Partner's id."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("short", (Str "The Partner's reference string."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("short", (Str "The verification phrase is a message that the Partner creates."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "partners") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "partners") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("shipment", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "carrier"));
            ("short", (Str "The name of the courier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "dateReceived"));
            ("short", (Str "The date and time that a package is recieved."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "dateShipped"));
            ("short", (Str "The date and time that a package is shipped."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "dcKif"));
            ("short", (Str "Reference to the associated KIF resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "items"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("short", (Str "Reference to the associated KIF resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "shipmentType"));
            ("short", (Str "The type of shipment."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "tracking"));
            ("short", (Str "The courier's tracking number."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int32"));
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "shipments") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "kif");
                    (Str "mode");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "shipments") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "shipments");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("success", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "success"));
            ("short", (Str "Indicates if the action was a success."));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "virtualDevices")) ]);
                  (jo [
                    ("var", (Str "share_partner_to")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ])) ]) ])) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "virtualDevices")) ]);
                  (jo [
                    ("var", (Str "share_partner_to")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "virtual_device") ]) ])) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "alternateKey"));
            ("short", (Str "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "clientRef"));
            ("short", (Str "Client Reference property that is included in the decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "int32"));
            ("name", (Str "decrypted"));
            ("short", (Str "A Transcation can process muliple decryptions."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "deviceName"));
            ("short", (Str "The name of the Device that generated the payload to decrypt."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "int32"));
            ("name", (Str "encrypted"));
            ("short", (Str "A Transcation can process muliple encryptions."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "endDate"));
            ("short", (Str "Timestamp from the end of the transaction."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("short", (Str "The error code that is sent in response to a failed decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("short", (Str "The error messge that is sent in response to a failed decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("short", (Str "The IP address of the http client that makes the decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isVirtual"));
            ("short", (Str "Indicates if the Transaction came from a virtual Device."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("short", (Str "The type of cipher used during decrytion."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("short", (Str "Message ID."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "method"));
            ("short", (Str "The decryption cypher/method."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "reference"));
            ("short", (Str "The reference property that the Client includes in the decrypt API call."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("short", (Str "The serial number of the Device that generated the payload to decrypt."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "startDate"));
            ("short", (Str "Timestamp from the beginning of the transaction."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "success"));
            ("short", (Str "The success indicator."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "transactionSource"));
            ("short", (Str "The source of the Transaction."));
            ("type", (Str "`$STRING`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "transactions") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]) ]));
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
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "transactions") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "email"));
            ("short", (Str "The User's email address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("short", (Str "The User's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "ID of newly created resource"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the User account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("short", (Str "Reference to the associated KIF resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("short", (Str "The User's Surname."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("short", (Str "The User's phone number without dashes, spaces, or brackets."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("short", (Str "The User's unique username."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("short", (Str "Reference to the associated User Role."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("select", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "users") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client");
                    (Str "kif");
                    (Str "partner");
                    (Str "skip");
                    (Str "take") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("parts", (ja [
                  (Str "users") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "shipments");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ])) ]);
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "email"));
            ("short", (Str "The User's email address."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("short", (Str "The User's name."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the User account is active or disabled."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
            ("name", (Str "kif"));
            ("short", (Str "Reference to the associated KIF resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("short", (Str "The User's Surname."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("format", (Str "datetime"));
            ("name", (Str "modified"));
            ("short", (Str "Last modified timestamp."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "partner"));
            ("short", (Str "Reference to the associated Partner."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "phone"));
            ("short", (Str "The User's phone number without dashes, spaces, or brackets."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userName"));
            ("short", (Str "The User's unique username."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("short", (Str "Reference to the associated User Role."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("type", (Str "`$INTEGER`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ])) ]) ])) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

(* The plugin definitions the model selected, per feature: none - no
 * plugin-bearing feature is active in this SDK. *)
let feature_plugins (_name : string) = []

let make_feature (name : string) : feature =
  match name with
  | "audit" -> audit_feature ()
  | "clienttrack" -> clienttrack_feature ()
  | "debug" -> debug_feature ()
  | "idempotency" -> idempotency_feature ()
  | "log" -> log_feature ()
  | "metrics" -> metrics_feature ()
  | "paging" -> paging_feature ()
  | "ratelimit" -> ratelimit_feature ()
  | "retry" -> retry_feature ()
  | "telemetry" -> telemetry_feature ()
  | "test" -> test_feature ()
  | "timeout" -> timeout_feature ()
  | _ -> base_feature ()
