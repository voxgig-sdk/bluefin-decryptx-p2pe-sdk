# BluefinDecryptxP2pe SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "BluefinDecryptxP2pe",
            "slug": "bluefin-decryptx-p2pe",
            "version": "0.1.1",
            "target": "py",
        },
        "feature": {
            "audit": {
        "options": {
          "active": False,
          "actor": "anonymous",
          "max": 1000,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sink": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "clienttrack": {
        "options": {
          "active": False,
          "clientVersion": "0.0.1",
        },
        "optspec": {
          "clientName": "`$STRING`",
          "clientVersion": "`$STRING`",
          "headers": "`$MAP`",
          "idgen": "`$FUNCTION`",
          "sessionId": "`$STRING`",
        },
        "strict": False,
        "transport": "none",
      },
            "debug": {
        "options": {
          "active": False,
          "max": 100,
          "redact": [
            "authorization",
            "cookie",
            "set-cookie",
            "api-key",
            "apikey",
            "x-api-key",
            "idempotency-key",
          ],
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "onEntry": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "idempotency": {
        "options": {
          "active": False,
          "header": "Idempotency-Key",
          "methods": [
            "POST",
            "PUT",
            "PATCH",
            "DELETE",
          ],
          "ops": [
            "create",
            "update",
            "remove",
          ],
        },
        "optspec": {
          "keygen": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "log": {
        "options": {
          "active": True,
        },
        "optspec": {
          "level": "`$STRING`",
          "logger": "`$ANY`",
        },
        "strict": False,
        "transport": "none",
      },
            "metrics": {
        "options": {
          "active": False,
        },
        "optspec": {
          "now": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "paging": {
        "options": {
          "active": False,
          "afterVar": "after",
          "cursorParam": "cursor",
          "firstVar": "first",
          "limitParam": "limit",
          "pageParam": "page",
          "startPage": 1,
        },
        "optspec": {
          "limit": "`$NUMBER`",
          "ops": "`$LIST`",
        },
        "strict": False,
        "transport": "none",
      },
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
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
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "telemetry": {
        "options": {
          "active": False,
        },
        "optspec": {
          "exporter": "`$FUNCTION`",
          "headers": "`$MAP`",
          "idgen": "`$FUNCTION`",
          "now": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "now": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://apis.p2pemanager.com/api/v1",
            "auth": {
                "prefix": "Basic",
                "basic": True,
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "attestation": {},
                "client": {},
                "create_result": {},
                "decryption": {},
                "device": {},
                "device_build": {},
                "device_custody_detail": {},
                "device_custody_list_item": {},
                "device_receive_result": {},
                "device_rki_activate_result": {},
                "device_state": {},
                "device_type": {},
                "inject_key": {},
                "kif": {},
                "location": {},
                "partner": {},
                "shipment": {},
                "success": {},
                "transaction": {},
                "update_result": {},
                "user": {},
                "virtual_device": {},
            },
        },
        "entity": {
      "attestation": {
        "fields": [
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "completeDate",
            "title": "Complete Date",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The date and time that the Attestation took place.",
            "format": "datetime",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "device",
            "title": "Device",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "devices",
            "title": "Devices",
            "type": "`$ARRAY`",
            "req": True,
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "Text describing the attestation.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Free form field that allows the Client associate notes with the Attestation.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "attestation",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/attestations",
                "segments": [
                  {
                    "lit": "attestations",
                  },
                ],
                "parts": [
                  "attestations",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/attestations",
                "segments": [
                  {
                    "lit": "attestations",
                  },
                ],
                "parts": [
                  "attestations",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                      "field": True,
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "client",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/attestations/{id}",
                "segments": [
                  {
                    "lit": "attestations",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "attestations",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "client": {
        "fields": [
          {
            "name": "contact",
            "title": "Contact",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
              "list": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "directPartner",
            "title": "Direct Partner",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Client account is active or disabled.",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "mid",
            "title": "Mid",
            "type": "`$STRING`",
            "short": "Some Partners will have an merchant ids on their own software offerings.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Client's name.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the Client's root Partner.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "client",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/clients",
                "segments": [
                  {
                    "lit": "clients",
                  },
                ],
                "parts": [
                  "clients",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/clients",
                "segments": [
                  {
                    "lit": "clients",
                  },
                ],
                "parts": [
                  "clients",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                      "field": True,
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "partner",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/clients/{id}",
                "segments": [
                  {
                    "lit": "clients",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "clients",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/clients/{id}",
                "segments": [
                  {
                    "lit": "clients",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "clients",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "create_result": {
        "fields": [
          {
            "name": "completeDate",
            "title": "Complete Date",
            "type": "`$STRING`",
            "short": "The date and time that the Custody change took place.",
            "format": "date-time",
          },
          {
            "name": "custodian",
            "title": "Custodian",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Free form field that allows the Client associate notes with the Custody Change.",
          },
        ],
        "name": "create_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/devices/{serialNumber}/{deviceType}/custody",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "var": "serial_number",
                  },
                  {
                    "var": "device_type",
                  },
                  {
                    "lit": "custody",
                  },
                ],
                "parts": [
                  "devices",
                  "{serial_number}",
                  "{device_type}",
                  "custody",
                ],
                "rename": {
                  "param": {
                    "deviceType": "device_type",
                    "serialNumber": "serial_number",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "device_type",
                      "orig": "deviceType",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                    {
                      "name": "serial_number",
                      "orig": "serialNumber",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "device_type",
                    "serial_number",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [
            [
              "$.main.kit.entity.device",
            ],
          ],
        },
      },
      "decryption": {
        "fields": [
          {
            "name": "cbcVector",
            "title": "Cbc Vector",
            "type": "`$STRING`",
            "short": "Base64 or hex encoded initial vector obtained from device.",
          },
          {
            "name": "deviceType",
            "title": "Device Type",
            "type": "`$STRING`",
            "req": True,
            "short": "The device Type.",
          },
          {
            "name": "encoding",
            "title": "Encoding",
            "type": "`$STRING`",
            "short": "The payload encoding",
          },
          {
            "name": "encrypted",
            "title": "Encrypted",
            "type": "`$ARRAY`",
            "req": True,
          },
          {
            "name": "hasCcData",
            "title": "Has Cc Data",
            "type": "`$STRING`",
            "short": "Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "A string (of up to 50 characters) that helps partners identify individual API calls.",
          },
          {
            "name": "sequenceNumber",
            "title": "Sequence Number",
            "type": "`$STRING`",
            "short": "Sequence number obtained from device in base 64 or hex encoded format.",
          },
          {
            "name": "serialNumber",
            "title": "Serial Number",
            "type": "`$STRING`",
            "req": True,
            "short": "The serial number of the device.",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "short": "true if the payload decryption was successful.",
          },
        ],
        "name": "decryption",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/decryption",
                "segments": [
                  {
                    "lit": "decryption",
                  },
                ],
                "parts": [
                  "decryption",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "device": {
        "fields": [
          {
            "name": "activatedBy",
            "title": "Activated By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "activationDate",
            "title": "Activation Date",
            "type": "`$STRING`",
            "short": "Timestamp from when the Device was activated.",
            "format": "datetime",
          },
          {
            "name": "alternateKey",
            "title": "Alternate Key",
            "type": "`$STRING`",
            "short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
          },
          {
            "name": "auditNextDate",
            "title": "Audit Next Date",
            "type": "`$STRING`",
            "short": "Date and time that the Device is due its next PCI Audit.",
            "format": "datetime",
          },
          {
            "name": "auditNotificationDate",
            "title": "Audit Notification Date",
            "type": "`$STRING`",
            "short": "Date and time that a notification should be sent that a PCI audit is due.",
            "format": "datetime",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "createdBy",
            "title": "Created By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "deviceBuild",
            "title": "Device Build",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device Build resource.",
          },
          {
            "name": "deviceState",
            "title": "Device State",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device State resource.",
          },
          {
            "name": "deviceType",
            "title": "Device Type",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Device Type resource.",
          },
          {
            "name": "errorCounter",
            "title": "Error Counter",
            "type": "`$INTEGER`",
            "short": "The number times the Device has been in error.",
          },
          {
            "name": "errorLastDate",
            "title": "Error Last Date",
            "type": "`$STRING`",
            "short": "Timestamp from the last time that the Device had an error.",
            "format": "datetime",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "The Device's unique identifier.",
          },
          {
            "name": "initializedBy",
            "title": "Initialized By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "initializedDate",
            "title": "Initialized Date",
            "type": "`$STRING`",
            "short": "Timestamp from when the Device was initialized.",
            "format": "datetime",
          },
          {
            "name": "injectKey",
            "title": "Inject Key",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "isVirtual",
            "title": "Is Virtual",
            "type": "`$BOOLEAN`",
            "short": "Indicates if a Device is Virtual (represents a Device shared with a partner).",
          },
          {
            "name": "kif",
            "title": "Kif",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated KIF resource.",
          },
          {
            "name": "lastActivityDate",
            "title": "Last Activity Date",
            "type": "`$STRING`",
            "short": "Timestamp from the last time that the Device was used.",
            "format": "datetime",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "modifiedBy",
            "title": "Modified By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The Device's name.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Arbitary note that can be attached to a Device entry.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "serialNumber",
            "title": "Serial Number",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Device's serial number.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "device",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/devices",
                "segments": [
                  {
                    "lit": "devices",
                  },
                ],
                "parts": [
                  "devices",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/devices",
                "segments": [
                  {
                    "lit": "devices",
                  },
                ],
                "parts": [
                  "devices",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "device_state",
                      "orig": "deviceState",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "kif",
                      "orig": "kif",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "serial_number",
                      "orig": "serialNumber",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "sorting_direction",
                      "orig": "sorting.direction",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "asc",
                    },
                    {
                      "name": "sorting_field",
                      "orig": "sorting.field",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "serialnumber",
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/devices/{serialNumber}/{deviceType}",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "var": "serial_number",
                  },
                  {
                    "var": "device_type",
                  },
                ],
                "parts": [
                  "devices",
                  "{serial_number}",
                  "{device_type}",
                ],
                "rename": {
                  "param": {
                    "deviceType": "device_type",
                    "serialNumber": "serial_number",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "device_type",
                      "orig": "deviceType",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                    {
                      "name": "serial_number",
                      "orig": "serialNumber",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "device_type",
                    "serial_number",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "GET",
                "orig": "/devices/{id}",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "devices",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "device_build": {
        "fields": [
          {
            "name": "appVersion",
            "title": "App Version",
            "type": "`$STRING`",
            "short": "If a Device Type has more than one Application Code version the supported version is specified here.",
          },
          {
            "name": "buildNumber",
            "title": "Build Number",
            "type": "`$STRING`",
            "short": "The Build Number.",
          },
          {
            "name": "configFileName",
            "title": "Config File Name",
            "type": "`$STRING`",
            "short": "The name of the configuration file that is uploaded to the device.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "date-time",
          },
          {
            "name": "deviceType",
            "title": "Device Type",
            "type": "`$STRING`",
            "short": "The Device Type Name.",
          },
          {
            "name": "firmwareVersion",
            "title": "Firmware Version",
            "type": "`$STRING`",
            "short": "A list of firmware versions that this Device Build covers.",
          },
          {
            "name": "hardwareVersion",
            "title": "Hardware Version",
            "type": "`$STRING`",
            "short": "A list of hardware versions that this Device Build covers.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the device build is still active and not succeeded by subsequent build.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "date-time",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The Device Builds's name.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Notes attached to the device build by Bluefin CISO.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
          {
            "name": "whiteListingBinRanges",
            "title": "White Listing Bin Ranges",
            "type": "`$STRING`",
            "short": "A comma separated list of BIN ranges that aren't encrypted by the terminal.",
          },
          {
            "name": "whiteListingUsed",
            "title": "White Listing Used",
            "type": "`$BOOLEAN`",
            "short": "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "device_build",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/deviceBuilds",
                "segments": [
                  {
                    "lit": "deviceBuilds",
                  },
                ],
                "parts": [
                  "deviceBuilds",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "device_type",
                      "orig": "deviceType",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/deviceBuilds/{id}",
                "segments": [
                  {
                    "lit": "deviceBuilds",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "deviceBuilds",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "device_custody_detail": {
        "fields": [
          {
            "name": "completeDate",
            "title": "Complete Date",
            "type": "`$STRING`",
            "short": "The date and time that the Custody change took place.",
            "format": "date-time",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "date-time",
          },
          {
            "name": "createdBy",
            "title": "Created By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "custodian",
            "title": "Custodian",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "device",
            "title": "Device",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "date-time",
          },
          {
            "name": "modifiedBy",
            "title": "Modified By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Free form field that allows the Client associate notes with the Custody Change.",
          },
          {
            "name": "status",
            "title": "Status",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Custody Status.",
          },
          {
            "name": "transferMethod",
            "title": "Transfer Method",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Transfer Method.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "device_custody_detail",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/devices/{serialNumber}/{deviceType}/custody/{id}",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "var": "serial_number",
                  },
                  {
                    "var": "device_type",
                  },
                  {
                    "lit": "custody",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "devices",
                  "{serial_number}",
                  "{device_type}",
                  "custody",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "deviceType": "device_type",
                    "serialNumber": "serial_number",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "device_type",
                      "orig": "deviceType",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                    {
                      "name": "serial_number",
                      "orig": "serialNumber",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "device_type",
                    "id",
                    "serial_number",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [
            [
              "$.main.kit.entity.device",
            ],
          ],
        },
      },
      "device_custody_list_item": {
        "fields": [
          {
            "name": "completeDate",
            "title": "Complete Date",
            "type": "`$STRING`",
            "short": "The date and time that the Custody change took place.",
            "format": "date-time",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "date-time",
          },
          {
            "name": "createdBy",
            "title": "Created By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "custodian",
            "title": "Custodian",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "device",
            "title": "Device",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "date-time",
          },
          {
            "name": "modifiedBy",
            "title": "Modified By",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Free form field that allows the Client associate notes with the Custody Change.",
          },
          {
            "name": "status",
            "title": "Status",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Custody Status.",
          },
          {
            "name": "transferMethod",
            "title": "Transfer Method",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Transfer Method.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "device_custody_list_item",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/devices/{serialNumber}/{deviceType}/custody",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "var": "serial_number",
                  },
                  {
                    "var": "device_type",
                  },
                  {
                    "lit": "custody",
                  },
                ],
                "parts": [
                  "devices",
                  "{serial_number}",
                  "{device_type}",
                  "custody",
                ],
                "rename": {
                  "param": {
                    "deviceType": "device_type",
                    "serialNumber": "serial_number",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "params": [
                    {
                      "name": "device_type",
                      "orig": "deviceType",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                    {
                      "name": "serial_number",
                      "orig": "serialNumber",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "device_type",
                    "serial_number",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [
            [
              "$.main.kit.entity.device",
            ],
          ],
        },
      },
      "device_receive_result": {
        "fields": [
          {
            "name": "serialNumber",
            "title": "Serial Number",
            "type": "`$STRING`",
            "req": True,
            "short": "The serial number of the Device that is shipped.",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "req": True,
            "short": "Indicates if the action succeeded.",
          },
          {
            "name": "tamperLabel",
            "title": "Tamper Label",
            "type": "`$STRING`",
            "req": True,
            "short": "The code that is printed the tamper label of the Device that is shipped.",
          },
        ],
        "name": "device_receive_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/devices/receive",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "lit": "receive",
                  },
                ],
                "parts": [
                  "devices",
                  "receive",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "device_rki_activate_result": {
        "fields": [
          {
            "name": "appVersion",
            "title": "App Version",
            "type": "`$STRING`",
            "short": "If a Device Type has more than one Application Code version the supported version is specified here.",
          },
          {
            "name": "buildName",
            "title": "Build Name",
            "type": "`$STRING`",
            "short": "The Device Builds's name.",
          },
          {
            "name": "buildNumber",
            "title": "Build Number",
            "type": "`$STRING`",
            "short": "The Build Number.",
          },
          {
            "name": "configFile",
            "title": "Config File",
            "type": "`$STRING`",
            "short": "\\?",
          },
          {
            "name": "firmwareVersion",
            "title": "Firmware Version",
            "type": "`$STRING`",
            "short": "A list of firmware versions that this Device Build covers.",
          },
          {
            "name": "hardwareVersion",
            "title": "Hardware Version",
            "type": "`$STRING`",
            "short": "A list of hardware versions that this Device Build covers.",
          },
          {
            "name": "serialNumber",
            "title": "Serial Number",
            "type": "`$STRING`",
            "req": True,
            "short": "The referenced Device's serial number.",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "req": True,
            "short": "Indicates if the RKI activation succeeded.",
          },
          {
            "name": "whiteListingBinRanges",
            "title": "White Listing Bin Ranges",
            "type": "`$STRING`",
            "short": "\\?",
          },
        ],
        "name": "device_rki_activate_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/devices/rki/activate",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "lit": "rki",
                  },
                  {
                    "lit": "activate",
                  },
                ],
                "parts": [
                  "devices",
                  "rki",
                  "activate",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "device_state": {
        "fields": [
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "Unique identifier for this Device state.",
            "format": "int64",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "Descriptive name for this Device state.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "device_state",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/deviceStates",
                "segments": [
                  {
                    "lit": "deviceStates",
                  },
                ],
                "parts": [
                  "deviceStates",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "device_type": {
        "fields": [
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "deviceTypeMode",
            "title": "Device Type Mode",
            "type": "`$STRING`",
            "short": "The Device type.",
          },
          {
            "name": "hardwareVersion",
            "title": "Hardware Version",
            "type": "`$STRING`",
            "short": "The Device hardware version.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "Unique idenifier.",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the DeviceType is active.",
          },
          {
            "name": "manufacturer",
            "title": "Manufacturer",
            "type": "`$STRING`",
            "short": "The Device manufacturer.",
          },
          {
            "name": "model",
            "title": "Model",
            "type": "`$STRING`",
            "short": "The Device model.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The DeviceType name.",
          },
          {
            "name": "photoUrl",
            "title": "Photo Url",
            "type": "`$STRING`",
          },
          {
            "name": "productName",
            "title": "Product Name",
            "type": "`$STRING`",
            "short": "The Device name.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "device_type",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/deviceTypes",
                "segments": [
                  {
                    "lit": "deviceTypes",
                  },
                ],
                "parts": [
                  "deviceTypes",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/deviceTypes/{id}",
                "segments": [
                  {
                    "lit": "deviceTypes",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "deviceTypes",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "inject_key": {
        "fields": [
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "unique idenifier",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "Active flag, inactive keys cannot be assigned to devices.",
          },
          {
            "name": "isP2PE",
            "title": "Is P2 Pe",
            "type": "`$BOOLEAN`",
            "short": "Flags if a key is for a P2PE compliant cypher.",
          },
          {
            "name": "keyType",
            "title": "Key Type",
            "type": "`$STRING`",
            "short": "The cipher type that the key works with.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "Key name.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "inject_key",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/injectKeys",
                "segments": [
                  {
                    "lit": "injectKeys",
                  },
                ],
                "parts": [
                  "injectKeys",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/injectKeys/{id}",
                "segments": [
                  {
                    "lit": "injectKeys",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "injectKeys",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "kif": {
        "fields": [
          {
            "name": "id",
            "title": "Id",
            "type": "`$INTEGER`",
            "short": "This resource's unique identifier.",
            "format": "int64",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The KIF's name.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "kif",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/kifs",
                "segments": [
                  {
                    "lit": "kifs",
                  },
                ],
                "parts": [
                  "kifs",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "location": {
        "fields": [
          {
            "name": "address1",
            "title": "Address1",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Location's street address.",
          },
          {
            "name": "address2",
            "title": "Address2",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "billingId",
            "title": "Billing Id",
            "type": "`$STRING`",
            "short": "\\?",
          },
          {
            "name": "city",
            "title": "City",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Location's city.",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "country",
            "title": "Country",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "The Location's country.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "customReference",
            "title": "Custom Reference",
            "type": "`$STRING`",
            "short": "A Partner specified reference for a location.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "locationType",
            "title": "Location Type",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Location's clasification.",
          },
          {
            "name": "mailAddress1",
            "title": "Mail Address1",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "mailAddress2",
            "title": "Mail Address2",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "mailCity",
            "title": "Mail City",
            "type": "`$STRING`",
            "short": "The Location's city.",
          },
          {
            "name": "mailCountry",
            "title": "Mail Country",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "mailPostalCode",
            "title": "Mail Postal Code",
            "type": "`$STRING`",
            "short": "The Location's postal code.",
          },
          {
            "name": "mailStateProvince",
            "title": "Mail State Province",
            "type": "`$STRING`",
            "short": "The Location's street state or province.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Location's name.",
          },
          {
            "name": "nameOfBusiness",
            "title": "Name Of Business",
            "type": "`$STRING`",
            "short": "The name of the business at this location.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Note for delivery driver.",
          },
          {
            "name": "postalCode",
            "title": "Postal Code",
            "type": "`$STRING`",
            "short": "The Location's postal code.",
          },
          {
            "name": "stateProvince",
            "title": "State Province",
            "type": "`$STRING`",
            "short": "The Location's street state or province.",
          },
          {
            "name": "uniqueId",
            "title": "Unique Id",
            "type": "`$STRING`",
            "short": "Unique Identifier for the Location.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "location",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/locations",
                "segments": [
                  {
                    "lit": "locations",
                  },
                ],
                "parts": [
                  "locations",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/locations",
                "segments": [
                  {
                    "lit": "locations",
                  },
                ],
                "parts": [
                  "locations",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                      "field": True,
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "client",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/locations/{id}",
                "segments": [
                  {
                    "lit": "locations",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "locations",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/locations/{id}",
                "segments": [
                  {
                    "lit": "locations",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "locations",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "partner": {
        "fields": [
          {
            "name": "billingId",
            "title": "Billing Id",
            "type": "`$STRING`",
            "short": "The Partner's billing identifier.",
          },
          {
            "name": "clientCanOrderEquipment",
            "title": "Client Can Order Equipment",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Partner is allowed to order Equipment.",
          },
          {
            "name": "contact",
            "title": "Contact",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
              "list": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Parter account is active or disabled.",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Partner's name.",
          },
          {
            "name": "parent",
            "title": "Parent",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "partnerId",
            "title": "Partner Id",
            "type": "`$STRING`",
            "short": "The Partner's id.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The Partner's reference string.",
          },
          {
            "name": "verificationPhrase",
            "title": "Verification Phrase",
            "type": "`$STRING`",
            "short": "The verification phrase is a message that the Partner creates.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "partner",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/partners",
                "segments": [
                  {
                    "lit": "partners",
                  },
                ],
                "parts": [
                  "partners",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/partners",
                "segments": [
                  {
                    "lit": "partners",
                  },
                ],
                "parts": [
                  "partners",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/partners/{id}",
                "segments": [
                  {
                    "lit": "partners",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "partners",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "shipment": {
        "fields": [
          {
            "name": "carrier",
            "title": "Carrier",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The name of the courier.",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "dateReceived",
            "title": "Date Received",
            "type": "`$STRING`",
            "short": "The date and time that a package is recieved.",
            "format": "datetime",
          },
          {
            "name": "dateShipped",
            "title": "Date Shipped",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The date and time that a package is shipped.",
            "format": "datetime",
          },
          {
            "name": "dcKif",
            "title": "Dc Kif",
            "type": "`$OBJECT`",
            "short": "Reference to the associated KIF resource.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "items",
            "title": "Items",
            "type": "`$ARRAY`",
            "op": {
              "create": {
                "req": True,
                "type": "`$ARRAY`",
              },
            },
          },
          {
            "name": "kif",
            "title": "Kif",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated KIF resource.",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "shipmentType",
            "title": "Shipment Type",
            "type": "`$STRING`",
            "short": "The type of shipment.",
          },
          {
            "name": "tracking",
            "title": "Tracking",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The courier's tracking number.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
            "format": "int32",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "shipment",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/shipments",
                "segments": [
                  {
                    "lit": "shipments",
                  },
                ],
                "parts": [
                  "shipments",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/shipments",
                "segments": [
                  {
                    "lit": "shipments",
                  },
                ],
                "parts": [
                  "shipments",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "kif",
                      "orig": "kif",
                      "type": "`$STRING`",
                      "kind": "query",
                      "reqd": True,
                      "field": True,
                    },
                    {
                      "name": "mode",
                      "orig": "mode",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "kif",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/shipments/{id}",
                "segments": [
                  {
                    "lit": "shipments",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "shipments",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "success": {
        "fields": [
          {
            "name": "devices",
            "title": "Devices",
            "type": "`$ARRAY`",
            "req": True,
            "short": "An array of Device ids to share with partner.",
          },
          {
            "name": "sharePartnerFrom",
            "title": "Share Partner From",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "short": "Indicates if the action was a success.",
          },
        ],
        "name": "success",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/virtualDevices/{sharePartnerTo}",
                "segments": [
                  {
                    "lit": "virtualDevices",
                  },
                  {
                    "var": "share_partner_to",
                  },
                ],
                "parts": [
                  "virtualDevices",
                  "{share_partner_to}",
                ],
                "rename": {
                  "param": {
                    "sharePartnerTo": "share_partner_to",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "share_partner_to",
                      "orig": "sharePartnerTo",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "share_partner_to",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/virtualDevices/{sharePartnerTo}",
                "segments": [
                  {
                    "lit": "virtualDevices",
                  },
                  {
                    "var": "share_partner_to",
                  },
                ],
                "parts": [
                  "virtualDevices",
                  "{share_partner_to}",
                ],
                "rename": {
                  "param": {
                    "sharePartnerTo": "share_partner_to",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "share_partner_to",
                      "orig": "sharePartnerTo",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "share_partner_to",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [
            [
              "$.main.kit.entity.virtual_device",
            ],
          ],
        },
      },
      "transaction": {
        "fields": [
          {
            "name": "alternateKey",
            "title": "Alternate Key",
            "type": "`$STRING`",
            "short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "clientRef",
            "title": "Client Ref",
            "type": "`$STRING`",
            "short": "Client Reference property that is included in the decrypt API call.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "decrypted",
            "title": "Decrypted",
            "type": "`$INTEGER`",
            "short": "A Transcation can process muliple decryptions.",
            "format": "int32",
          },
          {
            "name": "device",
            "title": "Device",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "deviceName",
            "title": "Device Name",
            "type": "`$STRING`",
            "short": "The name of the Device that generated the payload to decrypt.",
          },
          {
            "name": "directPartner",
            "title": "Direct Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "encrypted",
            "title": "Encrypted",
            "type": "`$INTEGER`",
            "short": "A Transcation can process muliple encryptions.",
            "format": "int32",
          },
          {
            "name": "endDate",
            "title": "End Date",
            "type": "`$STRING`",
            "short": "Timestamp from the end of the transaction.",
            "format": "datetime",
          },
          {
            "name": "errCode",
            "title": "Err Code",
            "type": "`$STRING`",
            "short": "The error code that is sent in response to a failed decrypt API call.",
          },
          {
            "name": "errMessage",
            "title": "Err Message",
            "type": "`$STRING`",
            "short": "The error messge that is sent in response to a failed decrypt API call.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "ipAddress",
            "title": "Ip Address",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The IP address of the http client that makes the decrypt API call.",
          },
          {
            "name": "isVirtual",
            "title": "Is Virtual",
            "type": "`$BOOLEAN`",
            "short": "Indicates if the Transaction came from a virtual Device.",
          },
          {
            "name": "keyType",
            "title": "Key Type",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The type of cipher used during decrytion.",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "messageId",
            "title": "Message Id",
            "type": "`$STRING`",
            "short": "Message ID.",
          },
          {
            "name": "method",
            "title": "Method",
            "type": "`$STRING`",
            "op": {
              "create": {
                "req": True,
                "type": "`$STRING`",
              },
            },
            "short": "The decryption cypher/method.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "op": {
              "create": {
                "req": True,
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "The reference property that the Client includes in the decrypt API call.",
          },
          {
            "name": "serialNumber",
            "title": "Serial Number",
            "type": "`$STRING`",
            "short": "The serial number of the Device that generated the payload to decrypt.",
          },
          {
            "name": "startDate",
            "title": "Start Date",
            "type": "`$STRING`",
            "short": "Timestamp from the beginning of the transaction.",
            "format": "datetime",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "short": "The success indicator.",
          },
          {
            "name": "transactionSource",
            "title": "Transaction Source",
            "type": "`$STRING`",
            "short": "The source of the Transaction.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "transaction",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/transactions",
                "segments": [
                  {
                    "lit": "transactions",
                  },
                ],
                "parts": [
                  "transactions",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/transactions",
                "segments": [
                  {
                    "lit": "transactions",
                  },
                ],
                "parts": [
                  "transactions",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "client_ref",
                      "orig": "clientRef",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "date_from",
                      "orig": "dateFrom",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "date_to",
                      "orig": "dateTo",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "location",
                      "orig": "location",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "message_id",
                      "orig": "messageId",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "paging_mode",
                      "orig": "paging.mode",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "nocount",
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "reference",
                      "orig": "reference",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "serial_number",
                      "orig": "serialNumber",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "success",
                      "orig": "success",
                      "type": "`$BOOLEAN`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/transactions/{id}",
                "segments": [
                  {
                    "lit": "transactions",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "transactions",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "update_result": {
        "fields": [
          {
            "name": "address1",
            "title": "Address1",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "address2",
            "title": "Address2",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "alternateKey",
            "title": "Alternate Key",
            "type": "`$STRING`",
            "short": "The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.",
          },
          {
            "name": "auditNextDate",
            "title": "Audit Next Date",
            "type": "`$STRING`",
            "short": "Date and time that the Device is due its next PCI Audit.",
            "format": "datetime",
          },
          {
            "name": "billingId",
            "title": "Billing Id",
            "type": "`$STRING`",
            "short": "\\?",
          },
          {
            "name": "city",
            "title": "City",
            "type": "`$STRING`",
            "short": "The Location's city.",
          },
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "clientCanOrderEquipment",
            "title": "Client Can Order Equipment",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the Partner is allowed to order Equipment.",
          },
          {
            "name": "clientRef",
            "title": "Client Ref",
            "type": "`$STRING`",
            "short": "Client Reference property that is included in the decrypt API call.",
          },
          {
            "name": "contact",
            "title": "Contact",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated User resource.",
          },
          {
            "name": "country",
            "title": "Country",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Country.",
          },
          {
            "name": "customReference",
            "title": "Custom Reference",
            "type": "`$STRING`",
            "short": "A Partner specified reference for a location.",
          },
          {
            "name": "dateShipped",
            "title": "Date Shipped",
            "type": "`$STRING`",
            "short": "The date and time that a package is shipped.",
            "format": "datetime",
          },
          {
            "name": "decrypted",
            "title": "Decrypted",
            "type": "`$INTEGER`",
            "short": "A Transcation can process muliple decryptions.",
            "format": "int32",
          },
          {
            "name": "device",
            "title": "Device",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "deviceBuild",
            "title": "Device Build",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device Build resource.",
          },
          {
            "name": "deviceType",
            "title": "Device Type",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device Type resource.",
          },
          {
            "name": "directPartner",
            "title": "Direct Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "email",
            "title": "Email",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's email address.",
          },
          {
            "name": "encrypted",
            "title": "Encrypted",
            "type": "`$INTEGER`",
            "short": "A Transcation can process muliple encryptions.",
            "format": "int32",
          },
          {
            "name": "endDate",
            "title": "End Date",
            "type": "`$STRING`",
            "short": "Timestamp from the end of the transaction.",
            "format": "datetime",
          },
          {
            "name": "errCode",
            "title": "Err Code",
            "type": "`$STRING`",
            "short": "The error code that is sent in response to a failed decrypt API call.",
          },
          {
            "name": "errMessage",
            "title": "Err Message",
            "type": "`$STRING`",
            "short": "The error messge that is sent in response to a failed decrypt API call.",
          },
          {
            "name": "firstName",
            "title": "First Name",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's name.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "ID of newly created resource",
          },
          {
            "name": "injectKey",
            "title": "Inject Key",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Device resource.",
          },
          {
            "name": "ipAddress",
            "title": "Ip Address",
            "type": "`$STRING`",
            "short": "The IP address of the http client that makes the decrypt API call.",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "req": True,
            "op": {
              "list": {
                "type": "`$BOOLEAN`",
              },
              "update": {
                "type": "`$BOOLEAN`",
              },
            },
            "short": "This property indicates if the User account is active or disabled.",
          },
          {
            "name": "items",
            "title": "Items",
            "type": "`$ARRAY`",
          },
          {
            "name": "keyType",
            "title": "Key Type",
            "type": "`$STRING`",
            "short": "The type of cipher used during decrytion.",
          },
          {
            "name": "kif",
            "title": "Kif",
            "type": "`$OBJECT`",
            "short": "Reference to the associated KIF resource.",
          },
          {
            "name": "lastName",
            "title": "Last Name",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's Surname.",
          },
          {
            "name": "location",
            "title": "Location",
            "type": "`$OBJECT`",
            "req": True,
            "short": "Reference to the associated Location resource.",
          },
          {
            "name": "locationType",
            "title": "Location Type",
            "type": "`$STRING`",
            "short": "The Location's clasification.",
          },
          {
            "name": "mailAddress1",
            "title": "Mail Address1",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "mailAddress2",
            "title": "Mail Address2",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "mailCity",
            "title": "Mail City",
            "type": "`$STRING`",
            "short": "The Location's city.",
          },
          {
            "name": "mailCountry",
            "title": "Mail Country",
            "type": "`$STRING`",
            "short": "The Location's street address.",
          },
          {
            "name": "mailPostalCode",
            "title": "Mail Postal Code",
            "type": "`$STRING`",
            "short": "The Location's postal code.",
          },
          {
            "name": "mailStateProvince",
            "title": "Mail State Province",
            "type": "`$STRING`",
            "short": "The Location's street state or province.",
          },
          {
            "name": "messageId",
            "title": "Message Id",
            "type": "`$STRING`",
            "short": "Message ID.",
          },
          {
            "name": "method",
            "title": "Method",
            "type": "`$STRING`",
            "short": "The decryption cypher/method.",
          },
          {
            "name": "mid",
            "title": "Mid",
            "type": "`$STRING`",
            "short": "Some Partners will have an merchant ids on their own software offerings.",
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "short": "The Client's name.",
          },
          {
            "name": "nameOfBusiness",
            "title": "Name Of Business",
            "type": "`$STRING`",
            "short": "The name of the business at this location.",
          },
          {
            "name": "notes",
            "title": "Notes",
            "type": "`$STRING`",
            "short": "Arbitary note that can be attached to a Device entry.",
          },
          {
            "name": "parent",
            "title": "Parent",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "partnerId",
            "title": "Partner Id",
            "type": "`$STRING`",
            "short": "The Partner's id.",
          },
          {
            "name": "phone",
            "title": "Phone",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's phone number without dashes, spaces, or brackets.",
          },
          {
            "name": "postalCode",
            "title": "Postal Code",
            "type": "`$STRING`",
            "short": "The Location's postal code.",
          },
          {
            "name": "reference",
            "title": "Reference",
            "type": "`$STRING`",
            "short": "The Partner's reference string.",
          },
          {
            "name": "sendWelcomeEmail",
            "title": "Send Welcome Email",
            "type": "`$BOOLEAN`",
            "short": "If this property is set to '*true*' the newly created user will be sent a welcome email.",
          },
          {
            "name": "serialNumber",
            "title": "Serial Number",
            "type": "`$STRING`",
            "short": "The Device's serial number.",
          },
          {
            "name": "startDate",
            "title": "Start Date",
            "type": "`$STRING`",
            "short": "Timestamp from the beginning of the transaction.",
            "format": "datetime",
          },
          {
            "name": "stateProvince",
            "title": "State Province",
            "type": "`$STRING`",
            "short": "The Location's street state or province.",
          },
          {
            "name": "success",
            "title": "Success",
            "type": "`$BOOLEAN`",
            "short": "The success indicator.",
          },
          {
            "name": "tracking",
            "title": "Tracking",
            "type": "`$STRING`",
            "short": "The courier's tracking number.",
          },
          {
            "name": "uniqueId",
            "title": "Unique Id",
            "type": "`$STRING`",
            "short": "Unique Identifier for the Location.",
          },
          {
            "name": "userName",
            "title": "User Name",
            "type": "`$STRING`",
            "req": True,
            "op": {
              "list": {
                "type": "`$STRING`",
              },
              "update": {
                "type": "`$STRING`",
              },
            },
            "short": "The User's unique username.",
          },
          {
            "name": "userRole",
            "title": "User Role",
            "type": "`$OBJECT`",
            "req": True,
            "op": {
              "list": {
                "type": "`$OBJECT`",
              },
              "update": {
                "type": "`$OBJECT`",
              },
            },
            "short": "Reference to the associated User Role.",
          },
          {
            "name": "verificationPhrase",
            "title": "Verification Phrase",
            "type": "`$STRING`",
            "short": "The verification phrase is a message that the Partner creates.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "update_result",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "kind": "http",
                "method": "POST",
                "orig": "/users",
                "segments": [
                  {
                    "lit": "users",
                  },
                ],
                "parts": [
                  "users",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/users",
                "segments": [
                  {
                    "lit": "users",
                  },
                ],
                "parts": [
                  "users",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.data`",
                },
                "args": {
                  "query": [
                    {
                      "name": "client",
                      "orig": "client",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "kif",
                      "orig": "kif",
                      "type": "`$STRING`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "partner",
                      "orig": "partner",
                      "type": "`$ANY`",
                      "kind": "query",
                      "field": True,
                    },
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "update": {
            "input": "data",
            "name": "update",
            "points": [
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/clients/{id}",
                "segments": [
                  {
                    "lit": "clients",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "clients",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/devices/{id}",
                "segments": [
                  {
                    "lit": "devices",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "devices",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/locations/{id}",
                "segments": [
                  {
                    "lit": "locations",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "locations",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/partners/{id}",
                "segments": [
                  {
                    "lit": "partners",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "partners",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/shipments/{id}",
                "segments": [
                  {
                    "lit": "shipments",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "shipments",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/transactions/{id}",
                "segments": [
                  {
                    "lit": "transactions",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "transactions",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "PATCH",
                "orig": "/users/{id}",
                "segments": [
                  {
                    "lit": "users",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "users",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "user": {
        "fields": [
          {
            "name": "client",
            "title": "Client",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Client resource.",
          },
          {
            "name": "created",
            "title": "Created",
            "type": "`$STRING`",
            "short": "Creation timestamp in ISO 8601 format.",
            "format": "datetime",
          },
          {
            "name": "email",
            "title": "Email",
            "type": "`$STRING`",
            "short": "The User's email address.",
          },
          {
            "name": "firstName",
            "title": "First Name",
            "type": "`$STRING`",
            "short": "The User's name.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
            "short": "This resource's unique identifier.",
          },
          {
            "name": "isActive",
            "title": "Is Active",
            "type": "`$BOOLEAN`",
            "short": "This property indicates if the User account is active or disabled.",
          },
          {
            "name": "kif",
            "title": "Kif",
            "type": "`$OBJECT`",
            "short": "Reference to the associated KIF resource.",
          },
          {
            "name": "lastName",
            "title": "Last Name",
            "type": "`$STRING`",
            "short": "The User's Surname.",
          },
          {
            "name": "modified",
            "title": "Modified",
            "type": "`$STRING`",
            "short": "Last modified timestamp.",
            "format": "datetime",
          },
          {
            "name": "partner",
            "title": "Partner",
            "type": "`$OBJECT`",
            "short": "Reference to the associated Partner.",
          },
          {
            "name": "phone",
            "title": "Phone",
            "type": "`$STRING`",
            "short": "The User's phone number without dashes, spaces, or brackets.",
          },
          {
            "name": "userName",
            "title": "User Name",
            "type": "`$STRING`",
            "short": "The User's unique username.",
          },
          {
            "name": "userRole",
            "title": "User Role",
            "type": "`$OBJECT`",
            "short": "Reference to the associated User Role.",
          },
          {
            "name": "version",
            "title": "Version",
            "type": "`$INTEGER`",
            "short": "The number of times that this resource has been updated.",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "user",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/users/{id}",
                "segments": [
                  {
                    "lit": "users",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "users",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/users/{id}",
                "segments": [
                  {
                    "lit": "users",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "users",
                  "{id}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "id",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "virtual_device": {
        "fields": [
          {
            "name": "data",
            "title": "Data",
            "type": "`$ARRAY`",
            "short": "List of Devices.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
          },
          {
            "name": "total",
            "title": "Total",
            "type": "`$INTEGER`",
            "short": "Total number of Devices available (not the number of Users in the response).",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "virtual_device",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/virtualDevices/{sharePartnerTo}",
                "segments": [
                  {
                    "lit": "virtualDevices",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "virtualDevices",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "sharePartnerTo": "id",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "sharePartnerTo",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                  "query": [
                    {
                      "name": "skip",
                      "orig": "skip",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 0,
                    },
                    {
                      "name": "sorting_direction",
                      "orig": "sorting.direction",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "asc",
                    },
                    {
                      "name": "sorting_field",
                      "orig": "sorting.field",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "serialnumber",
                    },
                    {
                      "name": "take",
                      "orig": "take",
                      "type": "`$INTEGER`",
                      "kind": "query",
                      "example": 10,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
