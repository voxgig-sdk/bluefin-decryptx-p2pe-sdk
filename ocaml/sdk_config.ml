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
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("transport", (Str "base")) ])) ]));
    ("options", (jo [
      ("base", (Str "https://apis.p2pemanager.com/api/v1"));
      ("auth", (jo [
        ("prefix", (Str "Basic")) ]));
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
            ("name", (Str "completeDate"));
            ("short", (Str "The date and time that the Attestation took place."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("short", (Str "Reference to the associated User resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "activationDate"));
            ("short", (Str "Timestamp from when the Device was activated."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "alternateKey"));
            ("short", (Str "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "auditNextDate"));
            ("short", (Str "Date and time that the Device is due its next PCI Audit."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "auditNotificationDate"));
            ("short", (Str "Date and time that a notification should be sent that a PCI audit is due."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
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
            ("name", (Str "lastActivityDate"));
            ("short", (Str "Timestamp from the last time that the Device was used."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "isActive"));
            ("short", (Str "This property indicates if the device build is still active and not succeeded by subsequent build."));
            ("type", (Str "`$BOOLEAN`")) ]);
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("short", (Str "The date and time that the Custody change took place."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
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
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
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
            ("short", (Str "The date and time that the Custody change took place."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
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
            ("name", (Str "id"));
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "location"));
            ("req", (Bool true));
            ("short", (Str "Reference to the associated Location resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ])) ]));
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
            ("short", (Str "Unique identifier for this Device state."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "Descriptive name for this Device state."));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ]));
      ("device_type", (jo [
        ("fields", (ja [
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("short", (Str "This resource's unique identifier."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
            ("name", (Str "name"));
            ("short", (Str "The KIF's name."));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ])) ]));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("short", (Str "The name of the courier."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "client"));
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "dateReceived"));
            ("short", (Str "The date and time that a package is recieved."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
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
            ("name", (Str "version"));
            ("short", (Str "The number of times that this resource has been updated."));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("name", (Str "created"));
            ("short", (Str "Creation timestamp in ISO 8601 format."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
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
            ("name", (Str "encrypted"));
            ("short", (Str "A Transcation can process muliple encryptions."));
            ("type", (Str "`$INTEGER`")) ]);
          (jo [
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
                  ("res", (Str "`body.data`")) ])) ]) ])) ]));
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
            ("short", (Str "Reference to the associated Client resource."));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
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
