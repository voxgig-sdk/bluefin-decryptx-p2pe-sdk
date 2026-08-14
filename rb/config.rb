# BluefinDecryptxP2pe SDK configuration

module BluefinDecryptxP2peConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "BluefinDecryptxP2pe",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://apis.p2pemanager.com/api/v1",
        "auth" => {
          "prefix" => "Basic",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "attestation" => {},
          "client" => {},
          "create_result" => {},
          "decryption" => {},
          "device" => {},
          "device_build" => {},
          "device_custody_detail" => {},
          "device_custody_list" => {},
          "device_list" => {},
          "device_receive_result" => {},
          "device_rki_activate_result" => {},
          "device_state" => {},
          "device_type" => {},
          "inject_key" => {},
          "kif" => {},
          "location" => {},
          "partner" => {},
          "shipment" => {},
          "success" => {},
          "transaction" => {},
          "update_result" => {},
          "user" => {},
        },
      },
      "entity" => {
        "attestation" => {
          "fields" => [
            {
              "name" => "client",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "completeDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "device",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "notes",
              "type" => "`$STRING`",
            },
          ],
          "name" => "attestation",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/attestations",
                  "parts" => [
                    "attestations",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/attestations",
                  "parts" => [
                    "attestations",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/attestations/{id}",
                  "parts" => [
                    "attestations",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "client" => {
          "fields" => [
            {
              "name" => "contact",
              "op" => {
                "list" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "directPartner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "location",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "mid",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "client",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/clients",
                  "parts" => [
                    "clients",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/clients",
                  "parts" => [
                    "clients",
                  ],
                  "select" => {
                    "exist" => [
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/clients/{id}",
                  "parts" => [
                    "clients",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/clients/{id}",
                  "parts" => [
                    "clients",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "create_result" => {
          "fields" => [],
          "name" => "create_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "device_type",
                        "orig" => "device_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "serial_number",
                        "orig" => "serial_number",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/devices/{serialNumber}/{deviceType}/custody",
                  "parts" => [
                    "devices",
                    "{serial_number}",
                    "{device_type}",
                    "custody",
                  ],
                  "rename" => {
                    "param" => {
                      "deviceType" => "device_type",
                      "serialNumber" => "serial_number",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "device_type",
                      "serial_number",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "device",
              ],
            ],
          },
        },
        "decryption" => {
          "fields" => [
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
          ],
          "name" => "decryption",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/decryption",
                  "parts" => [
                    "decryption",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "device" => {
          "fields" => [
            {
              "name" => "activatedBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "activationDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "alternateKey",
              "type" => "`$STRING`",
            },
            {
              "name" => "auditNextDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "auditNotificationDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "client",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "createdBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "deviceBuild",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "deviceState",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "deviceType",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "errorCounter",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "errorLastDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "initializedBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "initializedDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "injectKey",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "isVirtual",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "kif",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "lastActivityDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "location",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "modifiedBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "notes",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "serialNumber",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "device",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/devices",
                  "parts" => [
                    "devices",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "device_state",
                        "orig" => "device_state",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "kif",
                        "orig" => "kif",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "serial_number",
                        "orig" => "serial_number",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "asc",
                        "kind" => "query",
                        "name" => "sorting_direction",
                        "orig" => "sorting_direction",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "serialnumber",
                        "kind" => "query",
                        "name" => "sorting_field",
                        "orig" => "sorting_field",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/devices",
                  "parts" => [
                    "devices",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "device_state",
                      "kif",
                      "partner",
                      "serial_number",
                      "skip",
                      "sorting_direction",
                      "sorting_field",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "device_type",
                        "orig" => "device_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "serial_number",
                        "orig" => "serial_number",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/devices/{serialNumber}/{deviceType}",
                  "parts" => [
                    "devices",
                    "{serial_number}",
                    "{device_type}",
                  ],
                  "rename" => {
                    "param" => {
                      "deviceType" => "device_type",
                      "serialNumber" => "serial_number",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "device_type",
                      "serial_number",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/devices/{id}",
                  "parts" => [
                    "devices",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "device",
              ],
            ],
          },
        },
        "device_build" => {
          "fields" => [
            {
              "name" => "appVersion",
              "type" => "`$STRING`",
            },
            {
              "name" => "buildNumber",
              "type" => "`$STRING`",
            },
            {
              "name" => "configFileName",
              "type" => "`$STRING`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "deviceType",
              "type" => "`$STRING`",
            },
            {
              "name" => "firmwareVersion",
              "type" => "`$STRING`",
            },
            {
              "name" => "hardwareVersion",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "notes",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "whiteListingBinRanges",
              "type" => "`$STRING`",
            },
            {
              "name" => "whiteListingUsed",
              "type" => "`$BOOLEAN`",
            },
          ],
          "name" => "device_build",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "device_type",
                        "orig" => "device_type",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/deviceBuilds",
                  "parts" => [
                    "deviceBuilds",
                  ],
                  "select" => {
                    "exist" => [
                      "device_type",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/deviceBuilds/{id}",
                  "parts" => [
                    "deviceBuilds",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "device_custody_detail" => {
          "fields" => [
            {
              "name" => "completeDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "createdBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "custodian",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "device",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "location",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "modifiedBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "notes",
              "type" => "`$STRING`",
            },
            {
              "name" => "status",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "transferMethod",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "device_custody_detail",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "device_type",
                        "orig" => "device_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "serial_number",
                        "orig" => "serial_number",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/devices/{serialNumber}/{deviceType}/custody/{id}",
                  "parts" => [
                    "devices",
                    "{serial_number}",
                    "{device_type}",
                    "custody",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "deviceType" => "device_type",
                      "serialNumber" => "serial_number",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "device_type",
                      "id",
                      "serial_number",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "device",
              ],
            ],
          },
        },
        "device_custody_list" => {
          "fields" => [
            {
              "name" => "completeDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "createdBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "custodian",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "device",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "location",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "modifiedBy",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "notes",
              "type" => "`$STRING`",
            },
            {
              "name" => "status",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "transferMethod",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "device_custody_list",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "device_type",
                        "orig" => "device_type",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "param",
                        "name" => "serial_number",
                        "orig" => "serial_number",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/devices/{serialNumber}/{deviceType}/custody",
                  "parts" => [
                    "devices",
                    "{serial_number}",
                    "{device_type}",
                    "custody",
                  ],
                  "rename" => {
                    "param" => {
                      "deviceType" => "device_type",
                      "serialNumber" => "serial_number",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "device_type",
                      "serial_number",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "device",
              ],
            ],
          },
        },
        "device_list" => {
          "fields" => [
            {
              "name" => "data",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "total",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "device_list",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "share_partner_to",
                        "orig" => "share_partner_to",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "query" => [
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => "asc",
                        "kind" => "query",
                        "name" => "sorting_direction",
                        "orig" => "sorting_direction",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "serialnumber",
                        "kind" => "query",
                        "name" => "sorting_field",
                        "orig" => "sorting_field",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/virtualDevices/{sharePartnerTo}",
                  "parts" => [
                    "virtualDevices",
                    "{share_partner_to}",
                  ],
                  "rename" => {
                    "param" => {
                      "sharePartnerTo" => "share_partner_to",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "share_partner_to",
                      "skip",
                      "sorting_direction",
                      "sorting_field",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "virtual_device",
              ],
            ],
          },
        },
        "device_receive_result" => {
          "fields" => [
            {
              "name" => "success",
              "req" => true,
              "type" => "`$BOOLEAN`",
            },
          ],
          "name" => "device_receive_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/devices/receive",
                  "parts" => [
                    "devices",
                    "receive",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "device_rki_activate_result" => {
          "fields" => [
            {
              "name" => "success",
              "req" => true,
              "type" => "`$BOOLEAN`",
            },
          ],
          "name" => "device_rki_activate_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/devices/rki/activate",
                  "parts" => [
                    "devices",
                    "rki",
                    "activate",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "device_state" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
          ],
          "name" => "device_state",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/deviceStates",
                  "parts" => [
                    "deviceStates",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "device_type" => {
          "fields" => [
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "deviceTypeMode",
              "type" => "`$STRING`",
            },
            {
              "name" => "hardwareVersion",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "manufacturer",
              "type" => "`$STRING`",
            },
            {
              "name" => "model",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "photoUrl",
              "type" => "`$STRING`",
            },
            {
              "name" => "productName",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "device_type",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/deviceTypes",
                  "parts" => [
                    "deviceTypes",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/deviceTypes/{id}",
                  "parts" => [
                    "deviceTypes",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "inject_key" => {
          "fields" => [
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "isP2PE",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "keyType",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "inject_key",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/injectKeys",
                  "parts" => [
                    "injectKeys",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/injectKeys/{id}",
                  "parts" => [
                    "injectKeys",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "kif" => {
          "fields" => [
            {
              "name" => "id",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
          ],
          "name" => "kif",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/kifs",
                  "parts" => [
                    "kifs",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "location" => {
          "fields" => [
            {
              "name" => "address1",
              "type" => "`$STRING`",
            },
            {
              "name" => "address2",
              "type" => "`$STRING`",
            },
            {
              "name" => "billingId",
              "type" => "`$STRING`",
            },
            {
              "name" => "city",
              "type" => "`$STRING`",
            },
            {
              "name" => "country",
              "type" => "`$STRING`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "customReference",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "locationType",
              "type" => "`$STRING`",
            },
            {
              "name" => "mailAddress1",
              "type" => "`$STRING`",
            },
            {
              "name" => "mailAddress2",
              "type" => "`$STRING`",
            },
            {
              "name" => "mailCity",
              "type" => "`$STRING`",
            },
            {
              "name" => "mailCountry",
              "type" => "`$STRING`",
            },
            {
              "name" => "mailPostalCode",
              "type" => "`$STRING`",
            },
            {
              "name" => "mailStateProvince",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "nameOfBusiness",
              "type" => "`$STRING`",
            },
            {
              "name" => "notes",
              "type" => "`$STRING`",
            },
            {
              "name" => "postalCode",
              "type" => "`$STRING`",
            },
            {
              "name" => "stateProvince",
              "type" => "`$STRING`",
            },
            {
              "name" => "uniqueId",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "location",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/locations",
                  "parts" => [
                    "locations",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/locations",
                  "parts" => [
                    "locations",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/locations/{id}",
                  "parts" => [
                    "locations",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/locations/{id}",
                  "parts" => [
                    "locations",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "partner" => {
          "fields" => [
            {
              "name" => "billingId",
              "type" => "`$STRING`",
            },
            {
              "name" => "clientCanOrderEquipment",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "contact",
              "op" => {
                "list" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "location",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "parent",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "partnerId",
              "type" => "`$STRING`",
            },
            {
              "name" => "reference",
              "type" => "`$STRING`",
            },
            {
              "name" => "verificationPhrase",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "partner",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/partners",
                  "parts" => [
                    "partners",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/partners",
                  "parts" => [
                    "partners",
                  ],
                  "select" => {
                    "exist" => [
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/partners/{id}",
                  "parts" => [
                    "partners",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "shipment" => {
          "fields" => [
            {
              "name" => "carrier",
              "type" => "`$STRING`",
            },
            {
              "name" => "client",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "dateReceived",
              "type" => "`$STRING`",
            },
            {
              "name" => "dateShipped",
              "type" => "`$STRING`",
            },
            {
              "name" => "dcKif",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "items",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "kif",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "shipmentType",
              "type" => "`$STRING`",
            },
            {
              "name" => "tracking",
              "type" => "`$STRING`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "shipment",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/shipments",
                  "parts" => [
                    "shipments",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "kif",
                        "orig" => "kif",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "mode",
                        "orig" => "mode",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/shipments",
                  "parts" => [
                    "shipments",
                  ],
                  "select" => {
                    "exist" => [
                      "kif",
                      "mode",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/shipments/{id}",
                  "parts" => [
                    "shipments",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "success" => {
          "fields" => [
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
          ],
          "name" => "success",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "share_partner_to",
                        "orig" => "share_partner_to",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/virtualDevices/{sharePartnerTo}",
                  "parts" => [
                    "virtualDevices",
                    "{share_partner_to}",
                  ],
                  "rename" => {
                    "param" => {
                      "sharePartnerTo" => "share_partner_to",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "share_partner_to",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "share_partner_to",
                        "orig" => "share_partner_to",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/virtualDevices/{sharePartnerTo}",
                  "parts" => [
                    "virtualDevices",
                    "{share_partner_to}",
                  ],
                  "rename" => {
                    "param" => {
                      "sharePartnerTo" => "share_partner_to",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "share_partner_to",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "virtual_device",
              ],
            ],
          },
        },
        "transaction" => {
          "fields" => [
            {
              "name" => "alternateKey",
              "type" => "`$STRING`",
            },
            {
              "name" => "client",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "clientRef",
              "type" => "`$STRING`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "decrypted",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "deviceName",
              "type" => "`$STRING`",
            },
            {
              "name" => "directPartner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "encrypted",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "endDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "errCode",
              "type" => "`$STRING`",
            },
            {
              "name" => "errMessage",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "ipAddress",
              "type" => "`$STRING`",
            },
            {
              "name" => "isVirtual",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "keyType",
              "type" => "`$STRING`",
            },
            {
              "name" => "location",
              "req" => true,
              "type" => "`$OBJECT`",
            },
            {
              "name" => "messageId",
              "type" => "`$STRING`",
            },
            {
              "name" => "method",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "reference",
              "type" => "`$STRING`",
            },
            {
              "name" => "serialNumber",
              "type" => "`$STRING`",
            },
            {
              "name" => "startDate",
              "type" => "`$STRING`",
            },
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "transactionSource",
              "type" => "`$STRING`",
            },
          ],
          "name" => "transaction",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/transactions",
                  "parts" => [
                    "transactions",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "client_ref",
                        "orig" => "client_ref",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "date_from",
                        "orig" => "date_from",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "date_to",
                        "orig" => "date_to",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "location",
                        "orig" => "location",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "message_id",
                        "orig" => "message_id",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => "nocount",
                        "kind" => "query",
                        "name" => "paging_mode",
                        "orig" => "paging_mode",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "reference",
                        "orig" => "reference",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "serial_number",
                        "orig" => "serial_number",
                        "type" => "`$STRING`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "success",
                        "orig" => "success",
                        "type" => "`$BOOLEAN`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/transactions",
                  "parts" => [
                    "transactions",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "client_ref",
                      "date_from",
                      "date_to",
                      "location",
                      "message_id",
                      "paging_mode",
                      "partner",
                      "reference",
                      "serial_number",
                      "skip",
                      "success",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/transactions/{id}",
                  "parts" => [
                    "transactions",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "update_result" => {
          "fields" => [
            {
              "name" => "client",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "email",
              "type" => "`$STRING`",
            },
            {
              "name" => "firstName",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "kif",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "lastName",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "phone",
              "type" => "`$STRING`",
            },
            {
              "name" => "userName",
              "type" => "`$STRING`",
            },
            {
              "name" => "userRole",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "update_result",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/users",
                  "parts" => [
                    "users",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "client",
                        "orig" => "client",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "kif",
                        "orig" => "kif",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "partner",
                        "orig" => "partner",
                        "type" => "`$ANY`",
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "skip",
                        "orig" => "skip",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "example" => 10,
                        "kind" => "query",
                        "name" => "take",
                        "orig" => "take",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/users",
                  "parts" => [
                    "users",
                  ],
                  "select" => {
                    "exist" => [
                      "client",
                      "kif",
                      "partner",
                      "skip",
                      "take",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/clients/{id}",
                  "parts" => [
                    "clients",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/devices/{id}",
                  "parts" => [
                    "devices",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/locations/{id}",
                  "parts" => [
                    "locations",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/partners/{id}",
                  "parts" => [
                    "partners",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/shipments/{id}",
                  "parts" => [
                    "shipments",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/transactions/{id}",
                  "parts" => [
                    "transactions",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/users/{id}",
                  "parts" => [
                    "users",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "user" => {
          "fields" => [
            {
              "name" => "client",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "created",
              "type" => "`$STRING`",
            },
            {
              "name" => "email",
              "type" => "`$STRING`",
            },
            {
              "name" => "firstName",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "isActive",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "kif",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "lastName",
              "type" => "`$STRING`",
            },
            {
              "name" => "modified",
              "type" => "`$STRING`",
            },
            {
              "name" => "partner",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "phone",
              "type" => "`$STRING`",
            },
            {
              "name" => "userName",
              "type" => "`$STRING`",
            },
            {
              "name" => "userRole",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "version",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "user",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/users/{id}",
                  "parts" => [
                    "users",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/users/{id}",
                  "parts" => [
                    "users",
                    "{id}",
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    BluefinDecryptxP2peFeatures.make_feature(name)
  end
end
