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
          ("now", (Str "`$FUNCTION`"));
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
        ("device_custody_list_item", (empty_map ()));
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
        ("user", (empty_map ()));
        ("virtual_device", (empty_map ())) ])) ]));
    ("entity", (jo [
      ("attestation", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "completeDate"));
            ("title", (Str "Complete Date"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The date and time that the Attestation took place."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "device"));
            ("title", (Str "Device"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "devices"));
            ("title", (Str "Devices"));
            ("type", (Str "`$ARRAY`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "Text describing the attestation.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Free form field that allows the Client associate notes with the Attestation.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/attestations"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "attestations")) ]) ]));
                ("parts", (ja [
                  (Str "attestations") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/attestations"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "attestations")) ]) ]));
                ("parts", (ja [
                  (Str "attestations") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/attestations/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "attestations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "attestations");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("client", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "contact"));
            ("title", (Str "Contact"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("title", (Str "Direct Partner"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Client account is active or disabled.")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "mid"));
            ("title", (Str "Mid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Client's name.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the Client's root Partner.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/clients"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("parts", (ja [
                  (Str "clients") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]) ]));
                ("parts", (ja [
                  (Str "clients") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "partner") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/clients/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/clients/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("create_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "completeDate"));
            ("title", (Str "Complete Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The date and time that the Custody change took place."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("title", (Str "Custodian"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Free form field that allows the Client associate notes with the Custody Change.")) ]) ]));
        ("name", (Str "create_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}/custody"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]);
                  (jo [
                    ("lit", (Str "custody")) ]) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "device_type"));
                      ("orig", (Str "deviceType"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serialNumber"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "$.main.kit.entity.device") ]) ])) ])) ]));
      ("decryption", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "cbcVector"));
            ("title", (Str "Cbc Vector"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Base64 or hex encoded initial vector obtained from device.")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("title", (Str "Device Type"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The device Type.")) ]);
          (jo [
            ("name", (Str "encoding"));
            ("title", (Str "Encoding"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The payload encoding")) ]);
          (jo [
            ("name", (Str "encrypted"));
            ("title", (Str "Encrypted"));
            ("type", (Str "`$ARRAY`"));
            ("req", (Bool true)) ]);
          (jo [
            ("name", (Str "hasCcData"));
            ("title", (Str "Has Cc Data"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A string (of up to 50 characters) that helps partners identify individual API calls.")) ]);
          (jo [
            ("name", (Str "sequenceNumber"));
            ("title", (Str "Sequence Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Sequence number obtained from device in base 64 or hex encoded format.")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("title", (Str "Serial Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The serial number of the device.")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "true if the payload decryption was successful.")) ]) ]));
        ("name", (Str "decryption"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/decryption"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "decryption")) ]) ]));
                ("parts", (ja [
                  (Str "decryption") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "activatedBy"));
            ("title", (Str "Activated By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "activationDate"));
            ("title", (Str "Activation Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from when the Device was activated."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "alternateKey"));
            ("title", (Str "Alternate Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.")) ]);
          (jo [
            ("name", (Str "auditNextDate"));
            ("title", (Str "Audit Next Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Date and time that the Device is due its next PCI Audit."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "auditNotificationDate"));
            ("title", (Str "Audit Notification Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Date and time that a notification should be sent that a PCI audit is due."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("title", (Str "Created By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "deviceBuild"));
            ("title", (Str "Device Build"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device Build resource.")) ]);
          (jo [
            ("name", (Str "deviceState"));
            ("title", (Str "Device State"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device State resource.")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("title", (Str "Device Type"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Device Type resource.")) ]);
          (jo [
            ("name", (Str "errorCounter"));
            ("title", (Str "Error Counter"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number times the Device has been in error.")) ]);
          (jo [
            ("name", (Str "errorLastDate"));
            ("title", (Str "Error Last Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the last time that the Device had an error."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device's unique identifier.")) ]);
          (jo [
            ("name", (Str "initializedBy"));
            ("title", (Str "Initialized By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "initializedDate"));
            ("title", (Str "Initialized Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from when the Device was initialized."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "injectKey"));
            ("title", (Str "Inject Key"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "isVirtual"));
            ("title", (Str "Is Virtual"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "Indicates if a Device is Virtual (represents a Device shared with a partner).")) ]);
          (jo [
            ("name", (Str "kif"));
            ("title", (Str "Kif"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated KIF resource.")) ]);
          (jo [
            ("name", (Str "lastActivityDate"));
            ("title", (Str "Last Activity Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the last time that the Device was used."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("title", (Str "Modified By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device's name.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Arbitary note that can be attached to a Device entry.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("title", (Str "Serial Number"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Device's serial number.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]) ]));
                ("parts", (ja [
                  (Str "devices") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]) ]));
                ("parts", (ja [
                  (Str "devices") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "device_state"));
                      ("orig", (Str "deviceState"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serialNumber"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "sorting_direction"));
                      ("orig", (Str "sorting.direction"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("example", (Str "asc")) ]);
                    (jo [
                      ("name", (Str "sorting_field"));
                      ("orig", (Str "sorting.field"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("example", (Str "serialnumber")) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "device_type"));
                      ("orig", (Str "deviceType"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serialNumber"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_build", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appVersion"));
            ("title", (Str "App Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "If a Device Type has more than one Application Code version the supported version is specified here.")) ]);
          (jo [
            ("name", (Str "buildNumber"));
            ("title", (Str "Build Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Build Number.")) ]);
          (jo [
            ("name", (Str "configFileName"));
            ("title", (Str "Config File Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the configuration file that is uploaded to the device.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("title", (Str "Device Type"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device Type Name.")) ]);
          (jo [
            ("name", (Str "firmwareVersion"));
            ("title", (Str "Firmware Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A list of firmware versions that this Device Build covers.")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("title", (Str "Hardware Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A list of hardware versions that this Device Build covers.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the device build is still active and not succeeded by subsequent build.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device Builds's name.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Notes attached to the device build by Bluefin CISO.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]);
          (jo [
            ("name", (Str "whiteListingBinRanges"));
            ("title", (Str "White Listing Bin Ranges"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A comma separated list of BIN ranges that aren't encrypted by the terminal.")) ]);
          (jo [
            ("name", (Str "whiteListingUsed"));
            ("title", (Str "White Listing Used"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceBuilds"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceBuilds")) ]) ]));
                ("parts", (ja [
                  (Str "deviceBuilds") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "device_type"));
                      ("orig", (Str "deviceType"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceBuilds/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceBuilds")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "deviceBuilds");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_custody_detail", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "completeDate"));
            ("title", (Str "Complete Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The date and time that the Custody change took place."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("title", (Str "Created By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("title", (Str "Custodian"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "device"));
            ("title", (Str "Device"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("title", (Str "Modified By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Free form field that allows the Client associate notes with the Custody Change.")) ]);
          (jo [
            ("name", (Str "status"));
            ("title", (Str "Status"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Custody Status.")) ]);
          (jo [
            ("name", (Str "transferMethod"));
            ("title", (Str "Transfer Method"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Transfer Method.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}/custody/{id}"));
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
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "device_type"));
                      ("orig", (Str "deviceType"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serialNumber"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "id");
                    (Str "serial_number") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "$.main.kit.entity.device") ]) ])) ])) ]));
      ("device_custody_list_item", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "completeDate"));
            ("title", (Str "Complete Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The date and time that the Custody change took place."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "createdBy"));
            ("title", (Str "Created By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "custodian"));
            ("title", (Str "Custodian"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "device"));
            ("title", (Str "Device"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "date-time")) ]);
          (jo [
            ("name", (Str "modifiedBy"));
            ("title", (Str "Modified By"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Free form field that allows the Client associate notes with the Custody Change.")) ]);
          (jo [
            ("name", (Str "status"));
            ("title", (Str "Status"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Custody Status.")) ]);
          (jo [
            ("name", (Str "transferMethod"));
            ("title", (Str "Transfer Method"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Transfer Method.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "device_custody_list_item"));
        ("op", (jo [
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/devices/{serialNumber}/{deviceType}/custody"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "serial_number")) ]);
                  (jo [
                    ("var", (Str "device_type")) ]);
                  (jo [
                    ("lit", (Str "custody")) ]) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{serial_number}");
                  (Str "{device_type}");
                  (Str "custody") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("deviceType", (Str "device_type"));
                    ("serialNumber", (Str "serial_number")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "device_type"));
                      ("orig", (Str "deviceType"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]);
                    (jo [
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serialNumber"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "device_type");
                    (Str "serial_number") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "$.main.kit.entity.device") ]) ])) ])) ]));
      ("device_receive_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "serialNumber"));
            ("title", (Str "Serial Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The serial number of the Device that is shipped.")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("req", (Bool true));
            ("short", (Str "Indicates if the action succeeded.")) ]);
          (jo [
            ("name", (Str "tamperLabel"));
            ("title", (Str "Tamper Label"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The code that is printed the tamper label of the Device that is shipped.")) ]) ]));
        ("name", (Str "device_receive_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/devices/receive"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("lit", (Str "receive")) ]) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "receive") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_rki_activate_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "appVersion"));
            ("title", (Str "App Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "If a Device Type has more than one Application Code version the supported version is specified here.")) ]);
          (jo [
            ("name", (Str "buildName"));
            ("title", (Str "Build Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device Builds's name.")) ]);
          (jo [
            ("name", (Str "buildNumber"));
            ("title", (Str "Build Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Build Number.")) ]);
          (jo [
            ("name", (Str "configFile"));
            ("title", (Str "Config File"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "\\?")) ]);
          (jo [
            ("name", (Str "firmwareVersion"));
            ("title", (Str "Firmware Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A list of firmware versions that this Device Build covers.")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("title", (Str "Hardware Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A list of hardware versions that this Device Build covers.")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("title", (Str "Serial Number"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("short", (Str "The referenced Device's serial number.")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("req", (Bool true));
            ("short", (Str "Indicates if the RKI activation succeeded.")) ]);
          (jo [
            ("name", (Str "whiteListingBinRanges"));
            ("title", (Str "White Listing Bin Ranges"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "\\?")) ]) ]));
        ("name", (Str "device_rki_activate_result"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
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
                ("parts", (ja [
                  (Str "devices");
                  (Str "rki");
                  (Str "activate") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_state", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Unique identifier for this Device state."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Descriptive name for this Device state.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceStates"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceStates")) ]) ]));
                ("parts", (ja [
                  (Str "deviceStates") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_type", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "deviceTypeMode"));
            ("title", (Str "Device Type Mode"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device type.")) ]);
          (jo [
            ("name", (Str "hardwareVersion"));
            ("title", (Str "Hardware Version"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device hardware version.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Unique idenifier.")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the DeviceType is active.")) ]);
          (jo [
            ("name", (Str "manufacturer"));
            ("title", (Str "Manufacturer"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device manufacturer.")) ]);
          (jo [
            ("name", (Str "model"));
            ("title", (Str "Model"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device model.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The DeviceType name.")) ]);
          (jo [
            ("name", (Str "photoUrl"));
            ("title", (Str "Photo Url"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "productName"));
            ("title", (Str "Product Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device name.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceTypes"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceTypes")) ]) ]));
                ("parts", (ja [
                  (Str "deviceTypes") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/deviceTypes/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "deviceTypes")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "deviceTypes");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("inject_key", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "unique idenifier")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "Active flag, inactive keys cannot be assigned to devices.")) ]);
          (jo [
            ("name", (Str "isP2PE"));
            ("title", (Str "Is P2 Pe"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "Flags if a key is for a P2PE compliant cypher.")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("title", (Str "Key Type"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The cipher type that the key works with.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Key name.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/injectKeys"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "injectKeys")) ]) ]));
                ("parts", (ja [
                  (Str "injectKeys") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/injectKeys/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "injectKeys")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "injectKeys");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("kif", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "This resource's unique identifier."));
            ("format", (Str "int64")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The KIF's name.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/kifs"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "kifs")) ]) ]));
                ("parts", (ja [
                  (Str "kifs") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("location", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "address1"));
            ("title", (Str "Address1"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "address2"));
            ("title", (Str "Address2"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "billingId"));
            ("title", (Str "Billing Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "\\?")) ]);
          (jo [
            ("name", (Str "city"));
            ("title", (Str "City"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Location's city.")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "country"));
            ("title", (Str "Country"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "The Location's country.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "customReference"));
            ("title", (Str "Custom Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A Partner specified reference for a location.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "locationType"));
            ("title", (Str "Location Type"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Location's clasification.")) ]);
          (jo [
            ("name", (Str "mailAddress1"));
            ("title", (Str "Mail Address1"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "mailAddress2"));
            ("title", (Str "Mail Address2"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "mailCity"));
            ("title", (Str "Mail City"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's city.")) ]);
          (jo [
            ("name", (Str "mailCountry"));
            ("title", (Str "Mail Country"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "mailPostalCode"));
            ("title", (Str "Mail Postal Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's postal code.")) ]);
          (jo [
            ("name", (Str "mailStateProvince"));
            ("title", (Str "Mail State Province"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street state or province.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Location's name.")) ]);
          (jo [
            ("name", (Str "nameOfBusiness"));
            ("title", (Str "Name Of Business"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the business at this location.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Note for delivery driver.")) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("title", (Str "Postal Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's postal code.")) ]);
          (jo [
            ("name", (Str "stateProvince"));
            ("title", (Str "State Province"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street state or province.")) ]);
          (jo [
            ("name", (Str "uniqueId"));
            ("title", (Str "Unique Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Unique Identifier for the Location.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/locations"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]) ]));
                ("parts", (ja [
                  (Str "locations") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/locations"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]) ]));
                ("parts", (ja [
                  (Str "locations") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "client") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/locations/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/locations/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("partner", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "billingId"));
            ("title", (Str "Billing Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's billing identifier.")) ]);
          (jo [
            ("name", (Str "clientCanOrderEquipment"));
            ("title", (Str "Client Can Order Equipment"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Partner is allowed to order Equipment.")) ]);
          (jo [
            ("name", (Str "contact"));
            ("title", (Str "Contact"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ]));
              ("list", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Parter account is active or disabled.")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Partner's name.")) ]);
          (jo [
            ("name", (Str "parent"));
            ("title", (Str "Parent"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "partnerId"));
            ("title", (Str "Partner Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's id.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The Partner's reference string.")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("title", (Str "Verification Phrase"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The verification phrase is a message that the Partner creates.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/partners"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("parts", (ja [
                  (Str "partners") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]) ]));
                ("parts", (ja [
                  (Str "partners") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/partners/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("shipment", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "carrier"));
            ("title", (Str "Carrier"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The name of the courier.")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "dateReceived"));
            ("title", (Str "Date Received"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The date and time that a package is recieved."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "dateShipped"));
            ("title", (Str "Date Shipped"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The date and time that a package is shipped."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "dcKif"));
            ("title", (Str "Dc Kif"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated KIF resource.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "items"));
            ("title", (Str "Items"));
            ("type", (Str "`$ARRAY`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$ARRAY`")) ])) ])) ]);
          (jo [
            ("name", (Str "kif"));
            ("title", (Str "Kif"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated KIF resource.")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "shipmentType"));
            ("title", (Str "Shipment Type"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The type of shipment.")) ]);
          (jo [
            ("name", (Str "tracking"));
            ("title", (Str "Tracking"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The courier's tracking number.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated."));
            ("format", (Str "int32")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/shipments"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]) ]));
                ("parts", (ja [
                  (Str "shipments") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/shipments"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]) ]));
                ("parts", (ja [
                  (Str "shipments") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("reqd", (Bool true));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "mode"));
                      ("orig", (Str "mode"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "kif") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/shipments/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "shipments");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("success", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "devices"));
            ("title", (Str "Devices"));
            ("type", (Str "`$ARRAY`"));
            ("req", (Bool true));
            ("short", (Str "An array of Device ids to share with partner.")) ]);
          (jo [
            ("name", (Str "sharePartnerFrom"));
            ("title", (Str "Share Partner From"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "Indicates if the action was a success.")) ]) ]));
        ("name", (Str "success"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/virtualDevices/{sharePartnerTo}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "virtualDevices")) ]);
                  (jo [
                    ("var", (Str "share_partner_to")) ]) ]));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "sharePartnerTo"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/virtualDevices/{sharePartnerTo}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "virtualDevices")) ]);
                  (jo [
                    ("var", (Str "share_partner_to")) ]) ]));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{share_partner_to}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "share_partner_to")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "share_partner_to"));
                      ("orig", (Str "sharePartnerTo"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "share_partner_to") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (ja [
            (ja [
              (Str "$.main.kit.entity.virtual_device") ]) ])) ])) ]));
      ("transaction", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "alternateKey"));
            ("title", (Str "Alternate Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "clientRef"));
            ("title", (Str "Client Ref"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Client Reference property that is included in the decrypt API call.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "decrypted"));
            ("title", (Str "Decrypted"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "A Transcation can process muliple decryptions."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "device"));
            ("title", (Str "Device"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "deviceName"));
            ("title", (Str "Device Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the Device that generated the payload to decrypt.")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("title", (Str "Direct Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "encrypted"));
            ("title", (Str "Encrypted"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "A Transcation can process muliple encryptions."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "endDate"));
            ("title", (Str "End Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the end of the transaction."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("title", (Str "Err Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The error code that is sent in response to a failed decrypt API call.")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("title", (Str "Err Message"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The error messge that is sent in response to a failed decrypt API call.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("title", (Str "Ip Address"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The IP address of the http client that makes the decrypt API call.")) ]);
          (jo [
            ("name", (Str "isVirtual"));
            ("title", (Str "Is Virtual"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "Indicates if the Transaction came from a virtual Device.")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("title", (Str "Key Type"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The type of cipher used during decrytion.")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("title", (Str "Message Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Message ID.")) ]);
          (jo [
            ("name", (Str "method"));
            ("title", (Str "Method"));
            ("type", (Str "`$STRING`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The decryption cypher/method.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("op", (jo [
              ("create", (jo [
                ("req", (Bool true));
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The reference property that the Client includes in the decrypt API call.")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("title", (Str "Serial Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The serial number of the Device that generated the payload to decrypt.")) ]);
          (jo [
            ("name", (Str "startDate"));
            ("title", (Str "Start Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the beginning of the transaction."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "The success indicator.")) ]);
          (jo [
            ("name", (Str "transactionSource"));
            ("title", (Str "Transaction Source"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The source of the Transaction.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/transactions"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]) ]));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]) ]));
                ("parts", (ja [
                  (Str "transactions") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "client_ref"));
                      ("orig", (Str "clientRef"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "date_from"));
                      ("orig", (Str "dateFrom"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "date_to"));
                      ("orig", (Str "dateTo"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "location"));
                      ("orig", (Str "location"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "message_id"));
                      ("orig", (Str "messageId"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "paging_mode"));
                      ("orig", (Str "paging.mode"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("example", (Str "nocount")) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "reference"));
                      ("orig", (Str "reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "serial_number"));
                      ("orig", (Str "serialNumber"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query")) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "success"));
                      ("orig", (Str "success"));
                      ("type", (Str "`$BOOLEAN`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/transactions/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("update_result", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "address1"));
            ("title", (Str "Address1"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "address2"));
            ("title", (Str "Address2"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "alternateKey"));
            ("title", (Str "Alternate Key"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.")) ]);
          (jo [
            ("name", (Str "auditNextDate"));
            ("title", (Str "Audit Next Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Date and time that the Device is due its next PCI Audit."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "billingId"));
            ("title", (Str "Billing Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "\\?")) ]);
          (jo [
            ("name", (Str "city"));
            ("title", (Str "City"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's city.")) ]);
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "clientCanOrderEquipment"));
            ("title", (Str "Client Can Order Equipment"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the Partner is allowed to order Equipment.")) ]);
          (jo [
            ("name", (Str "clientRef"));
            ("title", (Str "Client Ref"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Client Reference property that is included in the decrypt API call.")) ]);
          (jo [
            ("name", (Str "contact"));
            ("title", (Str "Contact"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated User resource.")) ]);
          (jo [
            ("name", (Str "country"));
            ("title", (Str "Country"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Country.")) ]);
          (jo [
            ("name", (Str "customReference"));
            ("title", (Str "Custom Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "A Partner specified reference for a location.")) ]);
          (jo [
            ("name", (Str "dateShipped"));
            ("title", (Str "Date Shipped"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The date and time that a package is shipped."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "decrypted"));
            ("title", (Str "Decrypted"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "A Transcation can process muliple decryptions."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "device"));
            ("title", (Str "Device"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "deviceBuild"));
            ("title", (Str "Device Build"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device Build resource.")) ]);
          (jo [
            ("name", (Str "deviceType"));
            ("title", (Str "Device Type"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device Type resource.")) ]);
          (jo [
            ("name", (Str "directPartner"));
            ("title", (Str "Direct Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "email"));
            ("title", (Str "Email"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's email address.")) ]);
          (jo [
            ("name", (Str "encrypted"));
            ("title", (Str "Encrypted"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "A Transcation can process muliple encryptions."));
            ("format", (Str "int32")) ]);
          (jo [
            ("name", (Str "endDate"));
            ("title", (Str "End Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the end of the transaction."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "errCode"));
            ("title", (Str "Err Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The error code that is sent in response to a failed decrypt API call.")) ]);
          (jo [
            ("name", (Str "errMessage"));
            ("title", (Str "Err Message"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The error messge that is sent in response to a failed decrypt API call.")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("title", (Str "First Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's name.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "ID of newly created resource")) ]);
          (jo [
            ("name", (Str "injectKey"));
            ("title", (Str "Inject Key"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Device resource.")) ]);
          (jo [
            ("name", (Str "ipAddress"));
            ("title", (Str "Ip Address"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The IP address of the http client that makes the decrypt API call.")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$BOOLEAN`")) ]));
              ("update", (jo [
                ("type", (Str "`$BOOLEAN`")) ])) ]));
            ("short", (Str "This property indicates if the User account is active or disabled.")) ]);
          (jo [
            ("name", (Str "items"));
            ("title", (Str "Items"));
            ("type", (Str "`$ARRAY`")) ]);
          (jo [
            ("name", (Str "keyType"));
            ("title", (Str "Key Type"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The type of cipher used during decrytion.")) ]);
          (jo [
            ("name", (Str "kif"));
            ("title", (Str "Kif"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated KIF resource.")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("title", (Str "Last Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's Surname.")) ]);
          (jo [
            ("name", (Str "location"));
            ("title", (Str "Location"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource.")) ]);
          (jo [
            ("name", (Str "locationType"));
            ("title", (Str "Location Type"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's clasification.")) ]);
          (jo [
            ("name", (Str "mailAddress1"));
            ("title", (Str "Mail Address1"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "mailAddress2"));
            ("title", (Str "Mail Address2"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "mailCity"));
            ("title", (Str "Mail City"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's city.")) ]);
          (jo [
            ("name", (Str "mailCountry"));
            ("title", (Str "Mail Country"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street address.")) ]);
          (jo [
            ("name", (Str "mailPostalCode"));
            ("title", (Str "Mail Postal Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's postal code.")) ]);
          (jo [
            ("name", (Str "mailStateProvince"));
            ("title", (Str "Mail State Province"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street state or province.")) ]);
          (jo [
            ("name", (Str "messageId"));
            ("title", (Str "Message Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Message ID.")) ]);
          (jo [
            ("name", (Str "method"));
            ("title", (Str "Method"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The decryption cypher/method.")) ]);
          (jo [
            ("name", (Str "mid"));
            ("title", (Str "Mid"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Some Partners will have an merchant ids on their own software offerings.")) ]);
          (jo [
            ("name", (Str "name"));
            ("title", (Str "Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Client's name.")) ]);
          (jo [
            ("name", (Str "nameOfBusiness"));
            ("title", (Str "Name Of Business"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The name of the business at this location.")) ]);
          (jo [
            ("name", (Str "notes"));
            ("title", (Str "Notes"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Arbitary note that can be attached to a Device entry.")) ]);
          (jo [
            ("name", (Str "parent"));
            ("title", (Str "Parent"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "partnerId"));
            ("title", (Str "Partner Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's id.")) ]);
          (jo [
            ("name", (Str "phone"));
            ("title", (Str "Phone"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's phone number without dashes, spaces, or brackets.")) ]);
          (jo [
            ("name", (Str "postalCode"));
            ("title", (Str "Postal Code"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's postal code.")) ]);
          (jo [
            ("name", (Str "reference"));
            ("title", (Str "Reference"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Partner's reference string.")) ]);
          (jo [
            ("name", (Str "sendWelcomeEmail"));
            ("title", (Str "Send Welcome Email"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "If this property is set to '*true*' the newly created user will be sent a welcome email.")) ]);
          (jo [
            ("name", (Str "serialNumber"));
            ("title", (Str "Serial Number"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Device's serial number.")) ]);
          (jo [
            ("name", (Str "startDate"));
            ("title", (Str "Start Date"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Timestamp from the beginning of the transaction."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "stateProvince"));
            ("title", (Str "State Province"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The Location's street state or province.")) ]);
          (jo [
            ("name", (Str "success"));
            ("title", (Str "Success"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "The success indicator.")) ]);
          (jo [
            ("name", (Str "tracking"));
            ("title", (Str "Tracking"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The courier's tracking number.")) ]);
          (jo [
            ("name", (Str "uniqueId"));
            ("title", (Str "Unique Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Unique Identifier for the Location.")) ]);
          (jo [
            ("name", (Str "userName"));
            ("title", (Str "User Name"));
            ("type", (Str "`$STRING`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$STRING`")) ]));
              ("update", (jo [
                ("type", (Str "`$STRING`")) ])) ]));
            ("short", (Str "The User's unique username.")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("title", (Str "User Role"));
            ("type", (Str "`$OBJECT`"));
            ("req", (Bool true));
            ("op", (jo [
              ("list", (jo [
                ("type", (Str "`$OBJECT`")) ]));
              ("update", (jo [
                ("type", (Str "`$OBJECT`")) ])) ]));
            ("short", (Str "Reference to the associated User Role.")) ]);
          (jo [
            ("name", (Str "verificationPhrase"));
            ("title", (Str "Verification Phrase"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The verification phrase is a message that the Partner creates.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/users"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("parts", (ja [
                  (Str "users") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (empty_map ()));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("list", (jo [
            ("input", (Str "data"));
            ("name", (Str "list"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]) ]));
                ("parts", (ja [
                  (Str "users") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body.data`")) ]));
                ("args", (jo [
                  ("query", (ja [
                    (jo [
                      ("name", (Str "client"));
                      ("orig", (Str "client"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "kif"));
                      ("orig", (Str "kif"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "partner"));
                      ("orig", (Str "partner"));
                      ("type", (Str "`$ANY`"));
                      ("kind", (Str "query"));
                      ("field", (Bool true)) ]);
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (empty_map ()));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("update", (jo [
            ("input", (Str "data"));
            ("name", (Str "update"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/clients/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "clients")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "clients");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/devices/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "devices")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "devices");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/locations/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "locations")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "locations");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/partners/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "partners")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "partners");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/shipments/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "shipments")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "shipments");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/transactions/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "transactions")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "transactions");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "PATCH"));
                ("orig", (Str "/users/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("user", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "client"));
            ("title", (Str "Client"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Client resource.")) ]);
          (jo [
            ("name", (Str "created"));
            ("title", (Str "Created"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "email"));
            ("title", (Str "Email"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The User's email address.")) ]);
          (jo [
            ("name", (Str "firstName"));
            ("title", (Str "First Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The User's name.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "This resource's unique identifier.")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("title", (Str "Is Active"));
            ("type", (Str "`$BOOLEAN`"));
            ("short", (Str "This property indicates if the User account is active or disabled.")) ]);
          (jo [
            ("name", (Str "kif"));
            ("title", (Str "Kif"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated KIF resource.")) ]);
          (jo [
            ("name", (Str "lastName"));
            ("title", (Str "Last Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The User's Surname.")) ]);
          (jo [
            ("name", (Str "modified"));
            ("title", (Str "Modified"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Last modified timestamp."));
            ("format", (Str "datetime")) ]);
          (jo [
            ("name", (Str "partner"));
            ("title", (Str "Partner"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated Partner.")) ]);
          (jo [
            ("name", (Str "phone"));
            ("title", (Str "Phone"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The User's phone number without dashes, spaces, or brackets.")) ]);
          (jo [
            ("name", (Str "userName"));
            ("title", (Str "User Name"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "The User's unique username.")) ]);
          (jo [
            ("name", (Str "userRole"));
            ("title", (Str "User Role"));
            ("type", (Str "`$OBJECT`"));
            ("short", (Str "Reference to the associated User Role.")) ]);
          (jo [
            ("name", (Str "version"));
            ("title", (Str "Version"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "The number of times that this resource has been updated.")) ]) ]));
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
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/users/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/users/{id}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "users")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "users");
                  (Str "{id}") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("virtual_device", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "data"));
            ("title", (Str "Data"));
            ("type", (Str "`$ARRAY`"));
            ("short", (Str "List of Devices.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "total"));
            ("title", (Str "Total"));
            ("type", (Str "`$INTEGER`"));
            ("short", (Str "Total number of Devices available (not the number of Users in the response).")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
        ("name", (Str "virtual_device"));
        ("op", (jo [
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/virtualDevices/{sharePartnerTo}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "virtualDevices")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "virtualDevices");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("sharePartnerTo", (Str "id")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "sharePartnerTo"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ]));
                  ("query", (ja [
                    (jo [
                      ("name", (Str "skip"));
                      ("orig", (Str "skip"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (0.))) ]);
                    (jo [
                      ("name", (Str "sorting_direction"));
                      ("orig", (Str "sorting.direction"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("example", (Str "asc")) ]);
                    (jo [
                      ("name", (Str "sorting_field"));
                      ("orig", (Str "sorting.field"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "query"));
                      ("example", (Str "serialnumber")) ]);
                    (jo [
                      ("name", (Str "take"));
                      ("orig", (Str "take"));
                      ("type", (Str "`$INTEGER`"));
                      ("kind", (Str "query"));
                      ("example", (Num (10.))) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id") ])) ]));
                ("response", (jo [
                  ("kind", (Str "json"));
                  ("media", (Str "application/json")) ])) ]) ])) ])) ]));
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
