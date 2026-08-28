
const { BaseFeature } = require('./feature/base/BaseFeature')
const { AuditFeature } = require('./feature/audit/AuditFeature')
const { ClienttrackFeature } = require('./feature/clienttrack/ClienttrackFeature')
const { IdempotencyFeature } = require('./feature/idempotency/IdempotencyFeature')
const { LogFeature } = require('./feature/log/LogFeature')
const { MetricsFeature } = require('./feature/metrics/MetricsFeature')
const { PagingFeature } = require('./feature/paging/PagingFeature')
const { RatelimitFeature } = require('./feature/ratelimit/RatelimitFeature')
const { RetryFeature } = require('./feature/retry/RetryFeature')
const { TelemetryFeature } = require('./feature/telemetry/TelemetryFeature')
const { TestFeature } = require('./feature/test/TestFeature')
const { TimeoutFeature } = require('./feature/timeout/TimeoutFeature')



const FEATURE_CLASS = {
   audit: AuditFeature,
 clienttrack: ClienttrackFeature,
 idempotency: IdempotencyFeature,
 log: LogFeature,
 metrics: MetricsFeature,
 paging: PagingFeature,
 ratelimit: RatelimitFeature,
 retry: RetryFeature,
 telemetry: TelemetryFeature,
 test: TestFeature,
 timeout: TimeoutFeature,

}


class Config {

  makeFeature(fn) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(fn) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'BluefinDecryptxP2pe',
        slug: "bluefin-decryptx-p2pe",
    version: "0.1.1",
    target: "js",

  }


  feature = {
     audit:     {
      "options": {
        "active": false,
        "actor": "anonymous",
        "max": 1000
      },
      "transport": "none"
    },
 clienttrack:     {
      "options": {
        "active": false,
        "clientVersion": "0.0.1"
      },
      "transport": "none"
    },
 idempotency:     {
      "options": {
        "active": false,
        "header": "Idempotency-Key",
        "methods": [
          "POST",
          "PUT",
          "PATCH",
          "DELETE"
        ],
        "ops": [
          "create",
          "update",
          "remove"
        ]
      },
      "transport": "none"
    },
 log:     {
      "options": {
        "active": true
      },
      "transport": "none"
    },
 metrics:     {
      "options": {
        "active": false
      },
      "transport": "none"
    },
 paging:     {
      "options": {
        "active": false,
        "afterVar": "after",
        "cursorParam": "cursor",
        "firstVar": "first",
        "limitParam": "limit",
        "pageParam": "page",
        "startPage": 1
      },
      "transport": "none"
    },
 ratelimit:     {
      "options": {
        "active": false,
        "burst": 5,
        "rate": 5
      },
      "transport": "wrap"
    },
 retry:     {
      "options": {
        "active": false,
        "factor": 2,
        "maxDelay": 2000,
        "minDelay": 50,
        "retries": 2,
        "statuses": [
          408,
          425,
          429,
          500,
          502,
          503,
          504
        ]
      },
      "transport": "wrap"
    },
 telemetry:     {
      "options": {
        "active": false
      },
      "transport": "none"
    },
 test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },
 timeout:     {
      "options": {
        "active": false,
        "ms": 30000
      },
      "transport": "wrap"
    },

  }


  options = {
    base: "https://apis.p2pemanager.com/api/v1",

    auth: {
      prefix: 'Basic',
    },

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      attestation: {
      },

      client: {
      },

      create_result: {
      },

      decryption: {
      },

      device: {
      },

      device_build: {
      },

      device_custody_detail: {
      },

      device_custody_list: {
      },

      device_list: {
      },

      device_receive_result: {
      },

      device_rki_activate_result: {
      },

      device_state: {
      },

      device_type: {
      },

      inject_key: {
      },

      kif: {
      },

      location: {
      },

      partner: {
      },

      shipment: {
      },

      success: {
      },

      transaction: {
      },

      update_result: {
      },

      user: {
      },

    }
  }


  entity = {
    "attestation": {
      "fields": [
        {
          "name": "client",
          "short": "Reference to the associated Client resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "completeDate",
          "short": "The date and time that the Attestation took place.",
          "type": "`$STRING`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "device",
          "short": "Reference to the associated Device resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "Text describing the attestation.",
          "type": "`$STRING`"
        },
        {
          "name": "notes",
          "short": "Free form field that allows the Client associate notes with the Attestation.",
          "type": "`$STRING`"
        }
      ],
      "name": "attestation",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/attestations",
              "parts": [
                "attestations"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/attestations",
              "parts": [
                "attestations"
              ],
              "select": {
                "exist": [
                  "client",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/attestations/{id}",
              "parts": [
                "attestations",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "client": {
      "fields": [
        {
          "name": "contact",
          "op": {
            "list": {
              "req": true,
              "type": "`$OBJECT`"
            }
          },
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "directPartner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "isActive",
          "short": "This property indicates if the Client account is active or disabled.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "location",
          "req": true,
          "short": "Reference to the associated Location resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "mid",
          "short": "Some Partners will have an merchant ids on their own software offerings.",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "The Client's name.",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "short": "Reference to the Client's root Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "client",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/clients",
              "parts": [
                "clients"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/clients",
              "parts": [
                "clients"
              ],
              "select": {
                "exist": [
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/clients/{id}",
              "parts": [
                "clients",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/clients/{id}",
              "parts": [
                "clients",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "create_result": {
      "fields": [],
      "name": "create_result",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "device_type",
                    "orig": "device_type",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "param",
                    "name": "serial_number",
                    "orig": "serial_number",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/devices/{serialNumber}/{deviceType}/custody",
              "parts": [
                "devices",
                "{serial_number}",
                "{device_type}",
                "custody"
              ],
              "rename": {
                "param": {
                  "deviceType": "device_type",
                  "serialNumber": "serial_number"
                }
              },
              "select": {
                "exist": [
                  "device_type",
                  "serial_number"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "device"
          ]
        ]
      }
    },
    "decryption": {
      "fields": [
        {
          "name": "success",
          "short": "true if the payload decryption was successful.",
          "type": "`$BOOLEAN`"
        }
      ],
      "name": "decryption",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/decryption",
              "parts": [
                "decryption"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "device": {
      "fields": [
        {
          "name": "activatedBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "activationDate",
          "short": "Timestamp from when the Device was activated.",
          "type": "`$STRING`"
        },
        {
          "name": "alternateKey",
          "short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
          "type": "`$STRING`"
        },
        {
          "name": "auditNextDate",
          "short": "Date and time that the Device is due its next PCI Audit.",
          "type": "`$STRING`"
        },
        {
          "name": "auditNotificationDate",
          "short": "Date and time that a notification should be sent that a PCI audit is due.",
          "type": "`$STRING`"
        },
        {
          "name": "client",
          "short": "Reference to the associated Client resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "createdBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "deviceBuild",
          "short": "Reference to the associated Device Build resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "deviceState",
          "short": "Reference to the associated Device State resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "deviceType",
          "short": "Reference to the associated Device Type resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "errorCounter",
          "short": "The number times the Device has been in error.",
          "type": "`$INTEGER`"
        },
        {
          "name": "errorLastDate",
          "short": "Timestamp from the last time that the Device had an error.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "The Device's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "initializedBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "initializedDate",
          "short": "Timestamp from when the Device was initialized.",
          "type": "`$STRING`"
        },
        {
          "name": "injectKey",
          "short": "Reference to the associated Device resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "isVirtual",
          "short": "Indicates if a Device is Virtual (represents a Device shared with a partner).",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "kif",
          "short": "Reference to the associated KIF resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "lastActivityDate",
          "short": "Timestamp from the last time that the Device was used.",
          "type": "`$STRING`"
        },
        {
          "name": "location",
          "req": true,
          "short": "Reference to the associated Location resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "modifiedBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "name",
          "short": "The Device's name.",
          "type": "`$STRING`"
        },
        {
          "name": "notes",
          "short": "Arbitary note that can be attached to a Device entry.",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "serialNumber",
          "short": "The Device's serial number.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "device",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/devices",
              "parts": [
                "devices"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "device_state",
                    "orig": "device_state",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "kif",
                    "orig": "kif",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "serial_number",
                    "orig": "serial_number",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": "asc",
                    "kind": "query",
                    "name": "sorting_direction",
                    "orig": "sorting_direction",
                    "type": "`$STRING`"
                  },
                  {
                    "example": "serialnumber",
                    "kind": "query",
                    "name": "sorting_field",
                    "orig": "sorting_field",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/devices",
              "parts": [
                "devices"
              ],
              "select": {
                "exist": [
                  "client",
                  "device_state",
                  "kif",
                  "partner",
                  "serial_number",
                  "skip",
                  "sorting_direction",
                  "sorting_field",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "device_type",
                    "orig": "device_type",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "param",
                    "name": "serial_number",
                    "orig": "serial_number",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/devices/{serialNumber}/{deviceType}",
              "parts": [
                "devices",
                "{serial_number}",
                "{device_type}"
              ],
              "rename": {
                "param": {
                  "deviceType": "device_type",
                  "serialNumber": "serial_number"
                }
              },
              "select": {
                "exist": [
                  "device_type",
                  "serial_number"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/devices/{id}",
              "parts": [
                "devices",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "device"
          ]
        ]
      }
    },
    "device_build": {
      "fields": [
        {
          "name": "appVersion",
          "short": "If a Device Type has more than one Application Code version the supported version is specified here.",
          "type": "`$STRING`"
        },
        {
          "name": "buildNumber",
          "short": "The Build Number.",
          "type": "`$STRING`"
        },
        {
          "name": "configFileName",
          "short": "The name of the configuration file that is uploaded to the device.",
          "type": "`$STRING`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "deviceType",
          "short": "The Device Type Name.",
          "type": "`$STRING`"
        },
        {
          "name": "firmwareVersion",
          "short": "A list of firmware versions that this Device Build covers.",
          "type": "`$STRING`"
        },
        {
          "name": "hardwareVersion",
          "short": "A list of hardware versions that this Device Build covers.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$INTEGER`"
        },
        {
          "name": "isActive",
          "short": "This property indicates if the device build is still active and not succeeded by subsequent build.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "The Device Builds's name.",
          "type": "`$STRING`"
        },
        {
          "name": "notes",
          "short": "Notes attached to the device build by Bluefin CISO.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        },
        {
          "name": "whiteListingBinRanges",
          "short": "A comma separated list of BIN ranges that aren't encrypted by the terminal.",
          "type": "`$STRING`"
        },
        {
          "name": "whiteListingUsed",
          "short": "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.",
          "type": "`$BOOLEAN`"
        }
      ],
      "name": "device_build",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "device_type",
                    "orig": "device_type",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/deviceBuilds",
              "parts": [
                "deviceBuilds"
              ],
              "select": {
                "exist": [
                  "device_type",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/deviceBuilds/{id}",
              "parts": [
                "deviceBuilds",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "device_custody_detail": {
      "fields": [
        {
          "name": "completeDate",
          "short": "The date and time that the Custody change took place.",
          "type": "`$STRING`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "createdBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "custodian",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "device",
          "short": "Reference to the associated Device resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$INTEGER`"
        },
        {
          "name": "location",
          "req": true,
          "short": "Reference to the associated Location resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "modifiedBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "notes",
          "short": "Free form field that allows the Client associate notes with the Custody Change.",
          "type": "`$STRING`"
        },
        {
          "name": "status",
          "short": "Reference to the associated Custody Status.",
          "type": "`$OBJECT`"
        },
        {
          "name": "transferMethod",
          "short": "Reference to the associated Transfer Method.",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "device_custody_detail",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "device_type",
                    "orig": "device_type",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "param",
                    "name": "serial_number",
                    "orig": "serial_number",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/devices/{serialNumber}/{deviceType}/custody/{id}",
              "parts": [
                "devices",
                "{serial_number}",
                "{device_type}",
                "custody",
                "{id}"
              ],
              "rename": {
                "param": {
                  "deviceType": "device_type",
                  "serialNumber": "serial_number"
                }
              },
              "select": {
                "exist": [
                  "device_type",
                  "id",
                  "serial_number"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "device"
          ]
        ]
      }
    },
    "device_custody_list": {
      "fields": [
        {
          "name": "completeDate",
          "short": "The date and time that the Custody change took place.",
          "type": "`$STRING`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "createdBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "custodian",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "device",
          "short": "Reference to the associated Device resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$INTEGER`"
        },
        {
          "name": "location",
          "req": true,
          "short": "Reference to the associated Location resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "modifiedBy",
          "req": true,
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "notes",
          "short": "Free form field that allows the Client associate notes with the Custody Change.",
          "type": "`$STRING`"
        },
        {
          "name": "status",
          "short": "Reference to the associated Custody Status.",
          "type": "`$OBJECT`"
        },
        {
          "name": "transferMethod",
          "short": "Reference to the associated Transfer Method.",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "device_custody_list",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "device_type",
                    "orig": "device_type",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "param",
                    "name": "serial_number",
                    "orig": "serial_number",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/devices/{serialNumber}/{deviceType}/custody",
              "parts": [
                "devices",
                "{serial_number}",
                "{device_type}",
                "custody"
              ],
              "rename": {
                "param": {
                  "deviceType": "device_type",
                  "serialNumber": "serial_number"
                }
              },
              "select": {
                "exist": [
                  "device_type",
                  "serial_number",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "device"
          ]
        ]
      }
    },
    "device_list": {
      "fields": [
        {
          "name": "data",
          "short": "List of Devices.",
          "type": "`$ARRAY`"
        },
        {
          "name": "total",
          "short": "Total number of Devices available (not the number of Users in the response).",
          "type": "`$INTEGER`"
        }
      ],
      "name": "device_list",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "share_partner_to",
                    "orig": "share_partner_to",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "query": [
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": "asc",
                    "kind": "query",
                    "name": "sorting_direction",
                    "orig": "sorting_direction",
                    "type": "`$STRING`"
                  },
                  {
                    "example": "serialnumber",
                    "kind": "query",
                    "name": "sorting_field",
                    "orig": "sorting_field",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/virtualDevices/{sharePartnerTo}",
              "parts": [
                "virtualDevices",
                "{share_partner_to}"
              ],
              "rename": {
                "param": {
                  "sharePartnerTo": "share_partner_to"
                }
              },
              "select": {
                "exist": [
                  "share_partner_to",
                  "skip",
                  "sorting_direction",
                  "sorting_field",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "virtual_device"
          ]
        ]
      }
    },
    "device_receive_result": {
      "fields": [
        {
          "name": "success",
          "req": true,
          "short": "Indicates if the action succeeded.",
          "type": "`$BOOLEAN`"
        }
      ],
      "name": "device_receive_result",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/devices/receive",
              "parts": [
                "devices",
                "receive"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "device_rki_activate_result": {
      "fields": [
        {
          "name": "success",
          "req": true,
          "short": "Indicates if the RKI activation succeeded.",
          "type": "`$BOOLEAN`"
        }
      ],
      "name": "device_rki_activate_result",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/devices/rki/activate",
              "parts": [
                "devices",
                "rki",
                "activate"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "device_state": {
      "fields": [
        {
          "name": "id",
          "short": "Unique identifier for this Device state.",
          "type": "`$INTEGER`"
        },
        {
          "name": "name",
          "short": "Descriptive name for this Device state.",
          "type": "`$STRING`"
        }
      ],
      "name": "device_state",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/deviceStates",
              "parts": [
                "deviceStates"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "device_type": {
      "fields": [
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "deviceTypeMode",
          "short": "The Device type.",
          "type": "`$STRING`"
        },
        {
          "name": "hardwareVersion",
          "short": "The Device hardware version.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "Unique idenifier.",
          "type": "`$STRING`"
        },
        {
          "name": "isActive",
          "short": "This property indicates if the DeviceType is active.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "manufacturer",
          "short": "The Device manufacturer.",
          "type": "`$STRING`"
        },
        {
          "name": "model",
          "short": "The Device model.",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "The DeviceType name.",
          "type": "`$STRING`"
        },
        {
          "name": "photoUrl",
          "type": "`$STRING`"
        },
        {
          "name": "productName",
          "short": "The Device name.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "device_type",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/deviceTypes",
              "parts": [
                "deviceTypes"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/deviceTypes/{id}",
              "parts": [
                "deviceTypes",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "inject_key": {
      "fields": [
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "unique idenifier",
          "type": "`$STRING`"
        },
        {
          "name": "isActive",
          "short": "Active flag, inactive keys cannot be assigned to devices.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "isP2PE",
          "short": "Flags if a key is for a P2PE compliant cypher.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "keyType",
          "short": "The cipher type that the key works with.",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "Key name.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "inject_key",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/injectKeys",
              "parts": [
                "injectKeys"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/injectKeys/{id}",
              "parts": [
                "injectKeys",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "kif": {
      "fields": [
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$INTEGER`"
        },
        {
          "name": "name",
          "short": "The KIF's name.",
          "type": "`$STRING`"
        }
      ],
      "name": "kif",
      "op": {
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "GET",
              "orig": "/kifs",
              "parts": [
                "kifs"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "location": {
      "fields": [
        {
          "name": "address1",
          "short": "The Location's street address.",
          "type": "`$STRING`"
        },
        {
          "name": "address2",
          "short": "The Location's street address.",
          "type": "`$STRING`"
        },
        {
          "name": "billingId",
          "short": "\\?",
          "type": "`$STRING`"
        },
        {
          "name": "city",
          "short": "The Location's city.",
          "type": "`$STRING`"
        },
        {
          "name": "country",
          "short": "The Location's country.",
          "type": "`$STRING`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "customReference",
          "short": "A Partner specified reference for a location.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "locationType",
          "short": "The Location's clasification.",
          "type": "`$STRING`"
        },
        {
          "name": "mailAddress1",
          "short": "The Location's street address.",
          "type": "`$STRING`"
        },
        {
          "name": "mailAddress2",
          "short": "The Location's street address.",
          "type": "`$STRING`"
        },
        {
          "name": "mailCity",
          "short": "The Location's city.",
          "type": "`$STRING`"
        },
        {
          "name": "mailCountry",
          "short": "The Location's street address.",
          "type": "`$STRING`"
        },
        {
          "name": "mailPostalCode",
          "short": "The Location's postal code.",
          "type": "`$STRING`"
        },
        {
          "name": "mailStateProvince",
          "short": "The Location's street state or province.",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "The Location's name.",
          "type": "`$STRING`"
        },
        {
          "name": "nameOfBusiness",
          "short": "The name of the business at this location.",
          "type": "`$STRING`"
        },
        {
          "name": "notes",
          "short": "Note for delivery driver.",
          "type": "`$STRING`"
        },
        {
          "name": "postalCode",
          "short": "The Location's postal code.",
          "type": "`$STRING`"
        },
        {
          "name": "stateProvince",
          "short": "The Location's street state or province.",
          "type": "`$STRING`"
        },
        {
          "name": "uniqueId",
          "short": "Unique Identifier for the Location.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "location",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/locations",
              "parts": [
                "locations"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/locations",
              "parts": [
                "locations"
              ],
              "select": {
                "exist": [
                  "client",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/locations/{id}",
              "parts": [
                "locations",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/locations/{id}",
              "parts": [
                "locations",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "partner": {
      "fields": [
        {
          "name": "billingId",
          "short": "The Partner's billing identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "clientCanOrderEquipment",
          "short": "This property indicates if the Partner is allowed to order Equipment.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "contact",
          "op": {
            "list": {
              "req": true,
              "type": "`$OBJECT`"
            }
          },
          "short": "Reference to the associated User resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "isActive",
          "short": "This property indicates if the Parter account is active or disabled.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "location",
          "req": true,
          "short": "Reference to the associated Location resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "name",
          "short": "The Partner's name.",
          "type": "`$STRING`"
        },
        {
          "name": "parent",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "partnerId",
          "short": "The Partner's id.",
          "type": "`$STRING`"
        },
        {
          "name": "reference",
          "short": "The Partner's reference string.",
          "type": "`$STRING`"
        },
        {
          "name": "verificationPhrase",
          "short": "The verification phrase is a message that the Partner creates.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "partner",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/partners",
              "parts": [
                "partners"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/partners",
              "parts": [
                "partners"
              ],
              "select": {
                "exist": [
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/partners/{id}",
              "parts": [
                "partners",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "shipment": {
      "fields": [
        {
          "name": "carrier",
          "short": "The name of the courier.",
          "type": "`$STRING`"
        },
        {
          "name": "client",
          "short": "Reference to the associated Client resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "dateReceived",
          "short": "The date and time that a package is recieved.",
          "type": "`$STRING`"
        },
        {
          "name": "dateShipped",
          "short": "The date and time that a package is shipped.",
          "type": "`$STRING`"
        },
        {
          "name": "dcKif",
          "short": "Reference to the associated KIF resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "items",
          "type": "`$ARRAY`"
        },
        {
          "name": "kif",
          "short": "Reference to the associated KIF resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "shipmentType",
          "short": "The type of shipment.",
          "type": "`$STRING`"
        },
        {
          "name": "tracking",
          "short": "The courier's tracking number.",
          "type": "`$STRING`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "shipment",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/shipments",
              "parts": [
                "shipments"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "kif",
                    "orig": "kif",
                    "reqd": true,
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "mode",
                    "orig": "mode",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/shipments",
              "parts": [
                "shipments"
              ],
              "select": {
                "exist": [
                  "kif",
                  "mode",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/shipments/{id}",
              "parts": [
                "shipments",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "success": {
      "fields": [
        {
          "name": "success",
          "short": "Indicates if the action was a success.",
          "type": "`$BOOLEAN`"
        }
      ],
      "name": "success",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "share_partner_to",
                    "orig": "share_partner_to",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/virtualDevices/{sharePartnerTo}",
              "parts": [
                "virtualDevices",
                "{share_partner_to}"
              ],
              "rename": {
                "param": {
                  "sharePartnerTo": "share_partner_to"
                }
              },
              "select": {
                "exist": [
                  "share_partner_to"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "share_partner_to",
                    "orig": "share_partner_to",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/virtualDevices/{sharePartnerTo}",
              "parts": [
                "virtualDevices",
                "{share_partner_to}"
              ],
              "rename": {
                "param": {
                  "sharePartnerTo": "share_partner_to"
                }
              },
              "select": {
                "exist": [
                  "share_partner_to"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": [
          [
            "virtual_device"
          ]
        ]
      }
    },
    "transaction": {
      "fields": [
        {
          "name": "alternateKey",
          "short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
          "type": "`$STRING`"
        },
        {
          "name": "client",
          "short": "Reference to the associated Client resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "clientRef",
          "short": "Client Reference property that is included in the decrypt API call.",
          "type": "`$STRING`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "decrypted",
          "short": "A Transcation can process muliple decryptions.",
          "type": "`$INTEGER`"
        },
        {
          "name": "deviceName",
          "short": "The name of the Device that generated the payload to decrypt.",
          "type": "`$STRING`"
        },
        {
          "name": "directPartner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "encrypted",
          "short": "A Transcation can process muliple encryptions.",
          "type": "`$INTEGER`"
        },
        {
          "name": "endDate",
          "short": "Timestamp from the end of the transaction.",
          "type": "`$STRING`"
        },
        {
          "name": "errCode",
          "short": "The error code that is sent in response to a failed decrypt API call.",
          "type": "`$STRING`"
        },
        {
          "name": "errMessage",
          "short": "The error messge that is sent in response to a failed decrypt API call.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "ipAddress",
          "short": "The IP address of the http client that makes the decrypt API call.",
          "type": "`$STRING`"
        },
        {
          "name": "isVirtual",
          "short": "Indicates if the Transaction came from a virtual Device.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "keyType",
          "short": "The type of cipher used during decrytion.",
          "type": "`$STRING`"
        },
        {
          "name": "location",
          "req": true,
          "short": "Reference to the associated Location resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "messageId",
          "short": "Message ID.",
          "type": "`$STRING`"
        },
        {
          "name": "method",
          "short": "The decryption cypher/method.",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "reference",
          "short": "The reference property that the Client includes in the decrypt API call.",
          "type": "`$STRING`"
        },
        {
          "name": "serialNumber",
          "short": "The serial number of the Device that generated the payload to decrypt.",
          "type": "`$STRING`"
        },
        {
          "name": "startDate",
          "short": "Timestamp from the beginning of the transaction.",
          "type": "`$STRING`"
        },
        {
          "name": "success",
          "short": "The success indicator.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "transactionSource",
          "short": "The source of the Transaction.",
          "type": "`$STRING`"
        }
      ],
      "name": "transaction",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/transactions",
              "parts": [
                "transactions"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "client_ref",
                    "orig": "client_ref",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "date_from",
                    "orig": "date_from",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "date_to",
                    "orig": "date_to",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "location",
                    "orig": "location",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "message_id",
                    "orig": "message_id",
                    "type": "`$STRING`"
                  },
                  {
                    "example": "nocount",
                    "kind": "query",
                    "name": "paging_mode",
                    "orig": "paging_mode",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "reference",
                    "orig": "reference",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "serial_number",
                    "orig": "serial_number",
                    "type": "`$STRING`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "kind": "query",
                    "name": "success",
                    "orig": "success",
                    "type": "`$BOOLEAN`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/transactions",
              "parts": [
                "transactions"
              ],
              "select": {
                "exist": [
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
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/transactions/{id}",
              "parts": [
                "transactions",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "update_result": {
      "fields": [
        {
          "name": "client",
          "short": "Reference to the associated Client resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "email",
          "short": "The User's email address.",
          "type": "`$STRING`"
        },
        {
          "name": "firstName",
          "short": "The User's name.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "ID of newly created resource",
          "type": "`$STRING`"
        },
        {
          "name": "isActive",
          "short": "This property indicates if the User account is active or disabled.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "kif",
          "short": "Reference to the associated KIF resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "lastName",
          "short": "The User's Surname.",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "phone",
          "short": "The User's phone number without dashes, spaces, or brackets.",
          "type": "`$STRING`"
        },
        {
          "name": "userName",
          "short": "The User's unique username.",
          "type": "`$STRING`"
        },
        {
          "name": "userRole",
          "short": "Reference to the associated User Role.",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "update_result",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {},
              "kind": "http",
              "method": "POST",
              "orig": "/users",
              "parts": [
                "users"
              ],
              "select": {},
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "list": {
          "input": "data",
          "name": "list",
          "points": [
            {
              "args": {
                "query": [
                  {
                    "kind": "query",
                    "name": "client",
                    "orig": "client",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "kif",
                    "orig": "kif",
                    "type": "`$STRING`"
                  },
                  {
                    "kind": "query",
                    "name": "partner",
                    "orig": "partner",
                    "type": "`$ANY`"
                  },
                  {
                    "example": 0,
                    "kind": "query",
                    "name": "skip",
                    "orig": "skip",
                    "type": "`$INTEGER`"
                  },
                  {
                    "example": 10,
                    "kind": "query",
                    "name": "take",
                    "orig": "take",
                    "type": "`$INTEGER`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/users",
              "parts": [
                "users"
              ],
              "select": {
                "exist": [
                  "client",
                  "kif",
                  "partner",
                  "skip",
                  "take"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body.data`"
              }
            }
          ]
        },
        "update": {
          "input": "data",
          "name": "update",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/clients/{id}",
              "parts": [
                "clients",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/devices/{id}",
              "parts": [
                "devices",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/locations/{id}",
              "parts": [
                "locations",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/partners/{id}",
              "parts": [
                "partners",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/shipments/{id}",
              "parts": [
                "shipments",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/transactions/{id}",
              "parts": [
                "transactions",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "PATCH",
              "orig": "/users/{id}",
              "parts": [
                "users",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    },
    "user": {
      "fields": [
        {
          "name": "client",
          "short": "Reference to the associated Client resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "created",
          "short": "Creation timestamp in ISO 8601 format.",
          "type": "`$STRING`"
        },
        {
          "name": "email",
          "short": "The User's email address.",
          "type": "`$STRING`"
        },
        {
          "name": "firstName",
          "short": "The User's name.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "short": "This resource's unique identifier.",
          "type": "`$STRING`"
        },
        {
          "name": "isActive",
          "short": "This property indicates if the User account is active or disabled.",
          "type": "`$BOOLEAN`"
        },
        {
          "name": "kif",
          "short": "Reference to the associated KIF resource.",
          "type": "`$OBJECT`"
        },
        {
          "name": "lastName",
          "short": "The User's Surname.",
          "type": "`$STRING`"
        },
        {
          "name": "modified",
          "short": "Last modified timestamp.",
          "type": "`$STRING`"
        },
        {
          "name": "partner",
          "short": "Reference to the associated Partner.",
          "type": "`$OBJECT`"
        },
        {
          "name": "phone",
          "short": "The User's phone number without dashes, spaces, or brackets.",
          "type": "`$STRING`"
        },
        {
          "name": "userName",
          "short": "The User's unique username.",
          "type": "`$STRING`"
        },
        {
          "name": "userRole",
          "short": "Reference to the associated User Role.",
          "type": "`$OBJECT`"
        },
        {
          "name": "version",
          "short": "The number of times that this resource has been updated.",
          "type": "`$INTEGER`"
        }
      ],
      "name": "user",
      "op": {
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/users/{id}",
              "parts": [
                "users",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/users/{id}",
              "parts": [
                "users",
                "{id}"
              ],
              "select": {
                "exist": [
                  "id"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

module.exports = {
  config
}

