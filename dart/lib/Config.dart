import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
import 'feature/debug/DebugFeature.dart';
import 'feature/idempotency/IdempotencyFeature.dart';
import 'feature/log/LogFeature.dart';
import 'feature/metrics/MetricsFeature.dart';
import 'feature/paging/PagingFeature.dart';
import 'feature/ratelimit/RatelimitFeature.dart';
import 'feature/retry/RetryFeature.dart';
import 'feature/telemetry/TelemetryFeature.dart';
import 'feature/test/TestFeature.dart';
import 'feature/timeout/TimeoutFeature.dart';



// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'audit': () => AuditFeature(),
  'clienttrack': () => ClienttrackFeature(),
  'debug': () => DebugFeature(),
  'idempotency': () => IdempotencyFeature(),
  'log': () => LogFeature(),
  'metrics': () => MetricsFeature(),
  'paging': () => PagingFeature(),
  'ratelimit': () => RatelimitFeature(),
  'retry': () => RetryFeature(),
  'telemetry': () => TelemetryFeature(),
  'test': () => TestFeature(),
  'timeout': () => TimeoutFeature(),

};

// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. The named `show` imports above make each definition statically
// reachable, so an SDK carries exactly the plugin libraries its model
// selects - the same leanness the old side-effect registry bought, without
// a registry.
//
// Emitted UNCONDITIONALLY, empty when no group is active: SecretsFeature
// imports this name, and the feature source can be present in a tree whose
// model selects no plugin group at all. An emission conditional on the map
// having entries would make that tree fail `dart analyze`.
//
// ignore: non_constant_identifier_names
final Map<String, List<dynamic>> FEATURE_PLUGINS = <String, List<dynamic>>{
  
};

class Config {
  BaseFeature makeFeature(String fn) {
    final fc = FEATURE_CLASS[fn];
    if (null == fc) {
      // TODO: errors etc
      throw StateError('Unknown feature: ' + fn);
    }
    return fc();
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  bool hasFeature(String fn) => null != FEATURE_CLASS[fn];

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinDecryptxP2pe',
        'slug': 'bluefin-decryptx-p2pe',
    'version': '0.1.1',
    'target': 'dart',

  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'audit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'actor': 'anonymous',
        'max': 1000,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sink': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
      'optspec': <String, dynamic>{
        'clientName': '`\$STRING`',
        'clientVersion': '`\$STRING`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'sessionId': '`\$STRING`',
      },
      'strict': false,
      'transport': 'none',
    },
    'debug': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'max': 100,
        'redact': <dynamic>[
          'authorization',
          'cookie',
          'set-cookie',
          'api-key',
          'apikey',
          'x-api-key',
          'idempotency-key',
        ],
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'onEntry': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'idempotency': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'header': 'Idempotency-Key',
        'methods': <dynamic>[
          'POST',
          'PUT',
          'PATCH',
          'DELETE',
        ],
        'ops': <dynamic>[
          'create',
          'update',
          'remove',
        ],
      },
      'optspec': <String, dynamic>{
        'keygen': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'optspec': <String, dynamic>{
        'level': '`\$STRING`',
        'logger': '`\$ANY`',
      },
      'strict': false,
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'paging': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'afterVar': 'after',
        'cursorParam': 'cursor',
        'firstVar': 'first',
        'limitParam': 'limit',
        'pageParam': 'page',
        'startPage': 1,
      },
      'optspec': <String, dynamic>{
        'limit': '`\$NUMBER`',
        'ops': '`\$LIST`',
      },
      'strict': false,
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'retry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'factor': 2,
        'maxDelay': 2000,
        'minDelay': 50,
        'retries': 2,
        'statuses': <dynamic>[
          408,
          425,
          429,
          500,
          502,
          503,
          504,
        ],
      },
      'optspec': <String, dynamic>{
        'jitter': '`\$BOOLEAN`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'exporter': '`\$FUNCTION`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'entity': '`\$MAP`',
        'net': '`\$MAP`',
      },
      'strict': false,
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
      'optspec': <String, dynamic>{
        'clearTimer': '`\$FUNCTION`',
        'setTimer': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },

  };

  // Rendered whole from the canonical config definition rather than assembled
  // slot by slot. Assembling it here meant `options.server` - the OpenAPI
  // server-variable defaults - was simply absent from this branch, so a
  // templated server URL produced a different config either side of the
  // threshold.
  final Map<String, dynamic> options = <String, dynamic>{
    'base': 'https://apis.p2pemanager.com/api/v1',
    'auth': <String, dynamic>{
      'prefix': 'Basic',
      'basic': true,
    },
    'headers': <String, dynamic>{
      'content-type': 'application/json',
    },
    'entity': <String, dynamic>{
      'attestation': <String, dynamic>{},
      'client': <String, dynamic>{},
      'create_result': <String, dynamic>{},
      'decryption': <String, dynamic>{},
      'device': <String, dynamic>{},
      'device_build': <String, dynamic>{},
      'device_custody_detail': <String, dynamic>{},
      'device_custody_list_item': <String, dynamic>{},
      'device_receive_result': <String, dynamic>{},
      'device_rki_activate_result': <String, dynamic>{},
      'device_state': <String, dynamic>{},
      'device_type': <String, dynamic>{},
      'inject_key': <String, dynamic>{},
      'kif': <String, dynamic>{},
      'location': <String, dynamic>{},
      'partner': <String, dynamic>{},
      'shipment': <String, dynamic>{},
      'success': <String, dynamic>{},
      'transaction': <String, dynamic>{},
      'update_result': <String, dynamic>{},
      'user': <String, dynamic>{},
      'virtual_device': <String, dynamic>{},
    },
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'attestation': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'completeDate',
          'title': 'Complete Date',
          'type': '`\$STRING`',
          'short': 'The date and time that the Attestation took place.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'device',
          'title': 'Device',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device resource.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'Text describing the attestation.',
        },
        <String, dynamic>{
          'name': 'notes',
          'title': 'Notes',
          'type': '`\$STRING`',
          'short': 'Free form field that allows the Client associate notes with the Attestation.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'attestation',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/attestations',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'attestations',
                },
              ],
              'parts': <dynamic>[
                'attestations',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/attestations',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'attestations',
                },
              ],
              'parts': <dynamic>[
                'attestations',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/attestations/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'attestations',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'attestations',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'client': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'contact',
          'title': 'Contact',
          'type': '`\$OBJECT`',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'title': 'Direct Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the Client account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'location',
          'title': 'Location',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated Location resource.',
        },
        <String, dynamic>{
          'name': 'mid',
          'title': 'Mid',
          'type': '`\$STRING`',
          'short': 'Some Partners will have an merchant ids on their own software offerings.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Client\'s name.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the Client\'s root Partner.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'client',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/clients',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
              ],
              'parts': <dynamic>[
                'clients',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
              ],
              'parts': <dynamic>[
                'clients',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/clients/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'create_result': <String, dynamic>{
      'fields': <dynamic>[],
      'name': 'create_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices/{serialNumber}/{deviceType}/custody',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'var': 'serial_number',
                },
                <String, dynamic>{
                  'var': 'device_type',
                },
                <String, dynamic>{
                  'lit': 'custody',
                },
              ],
              'parts': <dynamic>[
                'devices',
                '{serial_number}',
                '{device_type}',
                'custody',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'deviceType': 'device_type',
                  'serialNumber': 'serial_number',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'device_type',
                    'orig': 'device_type',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'serial_number',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            '\$.main.kit.entity.device',
          ],
        ],
      },
    },
    'decryption': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'success',
          'title': 'Success',
          'type': '`\$BOOLEAN`',
          'short': 'true if the payload decryption was successful.',
        },
      ],
      'name': 'decryption',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/decryption',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'decryption',
                },
              ],
              'parts': <dynamic>[
                'decryption',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'activatedBy',
          'title': 'Activated By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'activationDate',
          'title': 'Activation Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from when the Device was activated.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'alternateKey',
          'title': 'Alternate Key',
          'type': '`\$STRING`',
          'short': 'The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device\'s casing or its packaging.',
        },
        <String, dynamic>{
          'name': 'auditNextDate',
          'title': 'Audit Next Date',
          'type': '`\$STRING`',
          'short': 'Date and time that the Device is due its next PCI Audit.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'auditNotificationDate',
          'title': 'Audit Notification Date',
          'type': '`\$STRING`',
          'short': 'Date and time that a notification should be sent that a PCI audit is due.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'title': 'Created By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'deviceBuild',
          'title': 'Device Build',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device Build resource.',
        },
        <String, dynamic>{
          'name': 'deviceState',
          'title': 'Device State',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device State resource.',
        },
        <String, dynamic>{
          'name': 'deviceType',
          'title': 'Device Type',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device Type resource.',
        },
        <String, dynamic>{
          'name': 'errorCounter',
          'title': 'Error Counter',
          'type': '`\$INTEGER`',
          'short': 'The number times the Device has been in error.',
        },
        <String, dynamic>{
          'name': 'errorLastDate',
          'title': 'Error Last Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from the last time that the Device had an error.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'The Device\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'initializedBy',
          'title': 'Initialized By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'initializedDate',
          'title': 'Initialized Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from when the Device was initialized.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'injectKey',
          'title': 'Inject Key',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device resource.',
        },
        <String, dynamic>{
          'name': 'isVirtual',
          'title': 'Is Virtual',
          'type': '`\$BOOLEAN`',
          'short': 'Indicates if a Device is Virtual (represents a Device shared with a partner).',
        },
        <String, dynamic>{
          'name': 'kif',
          'title': 'Kif',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated KIF resource.',
        },
        <String, dynamic>{
          'name': 'lastActivityDate',
          'title': 'Last Activity Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from the last time that the Device was used.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'location',
          'title': 'Location',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated Location resource.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'title': 'Modified By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Device\'s name.',
        },
        <String, dynamic>{
          'name': 'notes',
          'title': 'Notes',
          'type': '`\$STRING`',
          'short': 'Arbitary note that can be attached to a Device entry.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'serialNumber',
          'title': 'Serial Number',
          'type': '`\$STRING`',
          'short': 'The Device\'s serial number.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'device',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
              ],
              'parts': <dynamic>[
                'devices',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
              ],
              'parts': <dynamic>[
                'devices',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'device_state',
                    'orig': 'device_state',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'kif',
                    'orig': 'kif',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'sorting_direction',
                    'orig': 'sorting_direction',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'example': 'asc',
                  },
                  <String, dynamic>{
                    'name': 'sorting_field',
                    'orig': 'sorting_field',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'example': 'serialnumber',
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'device_state',
                  'kif',
                  'partner',
                  'serial_number',
                  'skip',
                  'sorting_direction',
                  'sorting_field',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{serialNumber}/{deviceType}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'var': 'serial_number',
                },
                <String, dynamic>{
                  'var': 'device_type',
                },
              ],
              'parts': <dynamic>[
                'devices',
                '{serial_number}',
                '{device_type}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'deviceType': 'device_type',
                  'serialNumber': 'serial_number',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'device_type',
                    'orig': 'device_type',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'serial_number',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'devices',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_build': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'appVersion',
          'title': 'App Version',
          'type': '`\$STRING`',
          'short': 'If a Device Type has more than one Application Code version the supported version is specified here.',
        },
        <String, dynamic>{
          'name': 'buildNumber',
          'title': 'Build Number',
          'type': '`\$STRING`',
          'short': 'The Build Number.',
        },
        <String, dynamic>{
          'name': 'configFileName',
          'title': 'Config File Name',
          'type': '`\$STRING`',
          'short': 'The name of the configuration file that is uploaded to the device.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'deviceType',
          'title': 'Device Type',
          'type': '`\$STRING`',
          'short': 'The Device Type Name.',
        },
        <String, dynamic>{
          'name': 'firmwareVersion',
          'title': 'Firmware Version',
          'type': '`\$STRING`',
          'short': 'A list of firmware versions that this Device Build covers.',
        },
        <String, dynamic>{
          'name': 'hardwareVersion',
          'title': 'Hardware Version',
          'type': '`\$STRING`',
          'short': 'A list of hardware versions that this Device Build covers.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the device build is still active and not succeeded by subsequent build.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Device Builds\'s name.',
        },
        <String, dynamic>{
          'name': 'notes',
          'title': 'Notes',
          'type': '`\$STRING`',
          'short': 'Notes attached to the device build by Bluefin CISO.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
        <String, dynamic>{
          'name': 'whiteListingBinRanges',
          'title': 'White Listing Bin Ranges',
          'type': '`\$STRING`',
          'short': 'A comma separated list of BIN ranges that aren\'t encrypted by the terminal.',
        },
        <String, dynamic>{
          'name': 'whiteListingUsed',
          'title': 'White Listing Used',
          'type': '`\$BOOLEAN`',
          'short': 'This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren\'t encrypted by the terminal.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'device_build',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceBuilds',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'deviceBuilds',
                },
              ],
              'parts': <dynamic>[
                'deviceBuilds',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'device_type',
                    'orig': 'device_type',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceBuilds/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'deviceBuilds',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'deviceBuilds',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_custody_detail': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'completeDate',
          'title': 'Complete Date',
          'type': '`\$STRING`',
          'short': 'The date and time that the Custody change took place.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'title': 'Created By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'custodian',
          'title': 'Custodian',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'device',
          'title': 'Device',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device resource.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'location',
          'title': 'Location',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated Location resource.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'title': 'Modified By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'notes',
          'title': 'Notes',
          'type': '`\$STRING`',
          'short': 'Free form field that allows the Client associate notes with the Custody Change.',
        },
        <String, dynamic>{
          'name': 'status',
          'title': 'Status',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Custody Status.',
        },
        <String, dynamic>{
          'name': 'transferMethod',
          'title': 'Transfer Method',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Transfer Method.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'device_custody_detail',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{serialNumber}/{deviceType}/custody/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'var': 'serial_number',
                },
                <String, dynamic>{
                  'var': 'device_type',
                },
                <String, dynamic>{
                  'lit': 'custody',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'devices',
                '{serial_number}',
                '{device_type}',
                'custody',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'deviceType': 'device_type',
                  'serialNumber': 'serial_number',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'device_type',
                    'orig': 'device_type',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'id',
                  'serial_number',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            '\$.main.kit.entity.device',
          ],
        ],
      },
    },
    'device_custody_list_item': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'completeDate',
          'title': 'Complete Date',
          'type': '`\$STRING`',
          'short': 'The date and time that the Custody change took place.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'title': 'Created By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'custodian',
          'title': 'Custodian',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'device',
          'title': 'Device',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Device resource.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'location',
          'title': 'Location',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated Location resource.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'date-time',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'title': 'Modified By',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'notes',
          'title': 'Notes',
          'type': '`\$STRING`',
          'short': 'Free form field that allows the Client associate notes with the Custody Change.',
        },
        <String, dynamic>{
          'name': 'status',
          'title': 'Status',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Custody Status.',
        },
        <String, dynamic>{
          'name': 'transferMethod',
          'title': 'Transfer Method',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Transfer Method.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'device_custody_list_item',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{serialNumber}/{deviceType}/custody',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'var': 'serial_number',
                },
                <String, dynamic>{
                  'var': 'device_type',
                },
                <String, dynamic>{
                  'lit': 'custody',
                },
              ],
              'parts': <dynamic>[
                'devices',
                '{serial_number}',
                '{device_type}',
                'custody',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'deviceType': 'device_type',
                  'serialNumber': 'serial_number',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'device_type',
                    'orig': 'device_type',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'serial_number',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            '\$.main.kit.entity.device',
          ],
        ],
      },
    },
    'device_receive_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'success',
          'title': 'Success',
          'type': '`\$BOOLEAN`',
          'req': true,
          'short': 'Indicates if the action succeeded.',
        },
      ],
      'name': 'device_receive_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices/receive',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'lit': 'receive',
                },
              ],
              'parts': <dynamic>[
                'devices',
                'receive',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_rki_activate_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'success',
          'title': 'Success',
          'type': '`\$BOOLEAN`',
          'req': true,
          'short': 'Indicates if the RKI activation succeeded.',
        },
      ],
      'name': 'device_rki_activate_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices/rki/activate',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'lit': 'rki',
                },
                <String, dynamic>{
                  'lit': 'activate',
                },
              ],
              'parts': <dynamic>[
                'devices',
                'rki',
                'activate',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_state': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'Unique identifier for this Device state.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'Descriptive name for this Device state.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'device_state',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceStates',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'deviceStates',
                },
              ],
              'parts': <dynamic>[
                'deviceStates',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_type': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'deviceTypeMode',
          'title': 'Device Type Mode',
          'type': '`\$STRING`',
          'short': 'The Device type.',
        },
        <String, dynamic>{
          'name': 'hardwareVersion',
          'title': 'Hardware Version',
          'type': '`\$STRING`',
          'short': 'The Device hardware version.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'Unique idenifier.',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the DeviceType is active.',
        },
        <String, dynamic>{
          'name': 'manufacturer',
          'title': 'Manufacturer',
          'type': '`\$STRING`',
          'short': 'The Device manufacturer.',
        },
        <String, dynamic>{
          'name': 'model',
          'title': 'Model',
          'type': '`\$STRING`',
          'short': 'The Device model.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The DeviceType name.',
        },
        <String, dynamic>{
          'name': 'photoUrl',
          'title': 'Photo Url',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productName',
          'title': 'Product Name',
          'type': '`\$STRING`',
          'short': 'The Device name.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'device_type',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceTypes',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'deviceTypes',
                },
              ],
              'parts': <dynamic>[
                'deviceTypes',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceTypes/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'deviceTypes',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'deviceTypes',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'inject_key': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'unique idenifier',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'Active flag, inactive keys cannot be assigned to devices.',
        },
        <String, dynamic>{
          'name': 'isP2PE',
          'title': 'Is P2 Pe',
          'type': '`\$BOOLEAN`',
          'short': 'Flags if a key is for a P2PE compliant cypher.',
        },
        <String, dynamic>{
          'name': 'keyType',
          'title': 'Key Type',
          'type': '`\$STRING`',
          'short': 'The cipher type that the key works with.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'Key name.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'inject_key',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/injectKeys',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'injectKeys',
                },
              ],
              'parts': <dynamic>[
                'injectKeys',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/injectKeys/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'injectKeys',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'injectKeys',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'kif': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$INTEGER`',
          'short': 'This resource\'s unique identifier.',
          'format': 'int64',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The KIF\'s name.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'kif',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/kifs',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'kifs',
                },
              ],
              'parts': <dynamic>[
                'kifs',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'location': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'address1',
          'title': 'Address1',
          'type': '`\$STRING`',
          'short': 'The Location\'s street address.',
        },
        <String, dynamic>{
          'name': 'address2',
          'title': 'Address2',
          'type': '`\$STRING`',
          'short': 'The Location\'s street address.',
        },
        <String, dynamic>{
          'name': 'billingId',
          'title': 'Billing Id',
          'type': '`\$STRING`',
          'short': '\\?',
        },
        <String, dynamic>{
          'name': 'city',
          'title': 'City',
          'type': '`\$STRING`',
          'short': 'The Location\'s city.',
        },
        <String, dynamic>{
          'name': 'country',
          'title': 'Country',
          'type': '`\$STRING`',
          'short': 'The Location\'s country.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'customReference',
          'title': 'Custom Reference',
          'type': '`\$STRING`',
          'short': 'A Partner specified reference for a location.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'locationType',
          'title': 'Location Type',
          'type': '`\$STRING`',
          'short': 'The Location\'s clasification.',
        },
        <String, dynamic>{
          'name': 'mailAddress1',
          'title': 'Mail Address1',
          'type': '`\$STRING`',
          'short': 'The Location\'s street address.',
        },
        <String, dynamic>{
          'name': 'mailAddress2',
          'title': 'Mail Address2',
          'type': '`\$STRING`',
          'short': 'The Location\'s street address.',
        },
        <String, dynamic>{
          'name': 'mailCity',
          'title': 'Mail City',
          'type': '`\$STRING`',
          'short': 'The Location\'s city.',
        },
        <String, dynamic>{
          'name': 'mailCountry',
          'title': 'Mail Country',
          'type': '`\$STRING`',
          'short': 'The Location\'s street address.',
        },
        <String, dynamic>{
          'name': 'mailPostalCode',
          'title': 'Mail Postal Code',
          'type': '`\$STRING`',
          'short': 'The Location\'s postal code.',
        },
        <String, dynamic>{
          'name': 'mailStateProvince',
          'title': 'Mail State Province',
          'type': '`\$STRING`',
          'short': 'The Location\'s street state or province.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Location\'s name.',
        },
        <String, dynamic>{
          'name': 'nameOfBusiness',
          'title': 'Name Of Business',
          'type': '`\$STRING`',
          'short': 'The name of the business at this location.',
        },
        <String, dynamic>{
          'name': 'notes',
          'title': 'Notes',
          'type': '`\$STRING`',
          'short': 'Note for delivery driver.',
        },
        <String, dynamic>{
          'name': 'postalCode',
          'title': 'Postal Code',
          'type': '`\$STRING`',
          'short': 'The Location\'s postal code.',
        },
        <String, dynamic>{
          'name': 'stateProvince',
          'title': 'State Province',
          'type': '`\$STRING`',
          'short': 'The Location\'s street state or province.',
        },
        <String, dynamic>{
          'name': 'uniqueId',
          'title': 'Unique Id',
          'type': '`\$STRING`',
          'short': 'Unique Identifier for the Location.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'location',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/locations',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'locations',
                },
              ],
              'parts': <dynamic>[
                'locations',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/locations',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'locations',
                },
              ],
              'parts': <dynamic>[
                'locations',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/locations/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'locations',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'locations',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/locations/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'locations',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'locations',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'partner': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'billingId',
          'title': 'Billing Id',
          'type': '`\$STRING`',
          'short': 'The Partner\'s billing identifier.',
        },
        <String, dynamic>{
          'name': 'clientCanOrderEquipment',
          'title': 'Client Can Order Equipment',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the Partner is allowed to order Equipment.',
        },
        <String, dynamic>{
          'name': 'contact',
          'title': 'Contact',
          'type': '`\$OBJECT`',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated User resource.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the Parter account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'location',
          'title': 'Location',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated Location resource.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'name',
          'title': 'Name',
          'type': '`\$STRING`',
          'short': 'The Partner\'s name.',
        },
        <String, dynamic>{
          'name': 'parent',
          'title': 'Parent',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'partnerId',
          'title': 'Partner Id',
          'type': '`\$STRING`',
          'short': 'The Partner\'s id.',
        },
        <String, dynamic>{
          'name': 'reference',
          'title': 'Reference',
          'type': '`\$STRING`',
          'short': 'The Partner\'s reference string.',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'title': 'Verification Phrase',
          'type': '`\$STRING`',
          'short': 'The verification phrase is a message that the Partner creates.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'partner',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/partners',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
              ],
              'parts': <dynamic>[
                'partners',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
              ],
              'parts': <dynamic>[
                'partners',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'shipment': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'carrier',
          'title': 'Carrier',
          'type': '`\$STRING`',
          'short': 'The name of the courier.',
        },
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'dateReceived',
          'title': 'Date Received',
          'type': '`\$STRING`',
          'short': 'The date and time that a package is recieved.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'dateShipped',
          'title': 'Date Shipped',
          'type': '`\$STRING`',
          'short': 'The date and time that a package is shipped.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'dcKif',
          'title': 'Dc Kif',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated KIF resource.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'items',
          'title': 'Items',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'kif',
          'title': 'Kif',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated KIF resource.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'shipmentType',
          'title': 'Shipment Type',
          'type': '`\$STRING`',
          'short': 'The type of shipment.',
        },
        <String, dynamic>{
          'name': 'tracking',
          'title': 'Tracking',
          'type': '`\$STRING`',
          'short': 'The courier\'s tracking number.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
          'format': 'int32',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'shipment',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/shipments',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'shipments',
                },
              ],
              'parts': <dynamic>[
                'shipments',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/shipments',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'shipments',
                },
              ],
              'parts': <dynamic>[
                'shipments',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'kif',
                    'orig': 'kif',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'reqd': true,
                  },
                  <String, dynamic>{
                    'name': 'mode',
                    'orig': 'mode',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'kif',
                  'mode',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/shipments/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'shipments',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'shipments',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'success': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'success',
          'title': 'Success',
          'type': '`\$BOOLEAN`',
          'short': 'Indicates if the action was a success.',
        },
      ],
      'name': 'success',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/virtualDevices/{sharePartnerTo}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'virtualDevices',
                },
                <String, dynamic>{
                  'var': 'share_partner_to',
                },
              ],
              'parts': <dynamic>[
                'virtualDevices',
                '{share_partner_to}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'sharePartnerTo': 'share_partner_to',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'share_partner_to',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/virtualDevices/{sharePartnerTo}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'virtualDevices',
                },
                <String, dynamic>{
                  'var': 'share_partner_to',
                },
              ],
              'parts': <dynamic>[
                'virtualDevices',
                '{share_partner_to}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'sharePartnerTo': 'share_partner_to',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'share_partner_to',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            '\$.main.kit.entity.virtual_device',
          ],
        ],
      },
    },
    'transaction': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'alternateKey',
          'title': 'Alternate Key',
          'type': '`\$STRING`',
          'short': 'The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device\'s casing or its packaging.',
        },
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'clientRef',
          'title': 'Client Ref',
          'type': '`\$STRING`',
          'short': 'Client Reference property that is included in the decrypt API call.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'decrypted',
          'title': 'Decrypted',
          'type': '`\$INTEGER`',
          'short': 'A Transcation can process muliple decryptions.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'deviceName',
          'title': 'Device Name',
          'type': '`\$STRING`',
          'short': 'The name of the Device that generated the payload to decrypt.',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'title': 'Direct Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'encrypted',
          'title': 'Encrypted',
          'type': '`\$INTEGER`',
          'short': 'A Transcation can process muliple encryptions.',
          'format': 'int32',
        },
        <String, dynamic>{
          'name': 'endDate',
          'title': 'End Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from the end of the transaction.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'errCode',
          'title': 'Err Code',
          'type': '`\$STRING`',
          'short': 'The error code that is sent in response to a failed decrypt API call.',
        },
        <String, dynamic>{
          'name': 'errMessage',
          'title': 'Err Message',
          'type': '`\$STRING`',
          'short': 'The error messge that is sent in response to a failed decrypt API call.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'ipAddress',
          'title': 'Ip Address',
          'type': '`\$STRING`',
          'short': 'The IP address of the http client that makes the decrypt API call.',
        },
        <String, dynamic>{
          'name': 'isVirtual',
          'title': 'Is Virtual',
          'type': '`\$BOOLEAN`',
          'short': 'Indicates if the Transaction came from a virtual Device.',
        },
        <String, dynamic>{
          'name': 'keyType',
          'title': 'Key Type',
          'type': '`\$STRING`',
          'short': 'The type of cipher used during decrytion.',
        },
        <String, dynamic>{
          'name': 'location',
          'title': 'Location',
          'type': '`\$OBJECT`',
          'req': true,
          'short': 'Reference to the associated Location resource.',
        },
        <String, dynamic>{
          'name': 'messageId',
          'title': 'Message Id',
          'type': '`\$STRING`',
          'short': 'Message ID.',
        },
        <String, dynamic>{
          'name': 'method',
          'title': 'Method',
          'type': '`\$STRING`',
          'short': 'The decryption cypher/method.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'reference',
          'title': 'Reference',
          'type': '`\$STRING`',
          'short': 'The reference property that the Client includes in the decrypt API call.',
        },
        <String, dynamic>{
          'name': 'serialNumber',
          'title': 'Serial Number',
          'type': '`\$STRING`',
          'short': 'The serial number of the Device that generated the payload to decrypt.',
        },
        <String, dynamic>{
          'name': 'startDate',
          'title': 'Start Date',
          'type': '`\$STRING`',
          'short': 'Timestamp from the beginning of the transaction.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'success',
          'title': 'Success',
          'type': '`\$BOOLEAN`',
          'short': 'The success indicator.',
        },
        <String, dynamic>{
          'name': 'transactionSource',
          'title': 'Transaction Source',
          'type': '`\$STRING`',
          'short': 'The source of the Transaction.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'transaction',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/transactions',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
              ],
              'parts': <dynamic>[
                'transactions',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
              ],
              'parts': <dynamic>[
                'transactions',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'client_ref',
                    'orig': 'client_ref',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'date_from',
                    'orig': 'date_from',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'date_to',
                    'orig': 'date_to',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'location',
                    'orig': 'location',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'message_id',
                    'orig': 'message_id',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'paging_mode',
                    'orig': 'paging_mode',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'example': 'nocount',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'success',
                    'orig': 'success',
                    'type': '`\$BOOLEAN`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'client_ref',
                  'date_from',
                  'date_to',
                  'location',
                  'message_id',
                  'paging_mode',
                  'partner',
                  'reference',
                  'serial_number',
                  'skip',
                  'success',
                  'take',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'transactions',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'update_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'email',
          'title': 'Email',
          'type': '`\$STRING`',
          'short': 'The User\'s email address.',
        },
        <String, dynamic>{
          'name': 'firstName',
          'title': 'First Name',
          'type': '`\$STRING`',
          'short': 'The User\'s name.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'ID of newly created resource',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the User account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'kif',
          'title': 'Kif',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated KIF resource.',
        },
        <String, dynamic>{
          'name': 'lastName',
          'title': 'Last Name',
          'type': '`\$STRING`',
          'short': 'The User\'s Surname.',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'phone',
          'title': 'Phone',
          'type': '`\$STRING`',
          'short': 'The User\'s phone number without dashes, spaces, or brackets.',
        },
        <String, dynamic>{
          'name': 'userName',
          'title': 'User Name',
          'type': '`\$STRING`',
          'short': 'The User\'s unique username.',
        },
        <String, dynamic>{
          'name': 'userRole',
          'title': 'User Role',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated User Role.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'update_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/users',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
              ],
              'parts': <dynamic>[
                'users',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{},
              'select': <String, dynamic>{},
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/users',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
              ],
              'parts': <dynamic>[
                'users',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'kif',
                    'orig': 'kif',
                    'type': '`\$STRING`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$ANY`',
                    'kind': 'query',
                  },
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'kif',
                  'partner',
                  'skip',
                  'take',
                ],
              },
            },
          ],
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/clients/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'clients',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/devices/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'devices',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'devices',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/locations/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'locations',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'locations',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/partners/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'partners',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/shipments/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'shipments',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'shipments',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/transactions/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'transactions',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'transactions',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/users/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'user': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'client',
          'title': 'Client',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Client resource.',
        },
        <String, dynamic>{
          'name': 'created',
          'title': 'Created',
          'type': '`\$STRING`',
          'short': 'Creation timestamp in ISO 8601 format.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'email',
          'title': 'Email',
          'type': '`\$STRING`',
          'short': 'The User\'s email address.',
        },
        <String, dynamic>{
          'name': 'firstName',
          'title': 'First Name',
          'type': '`\$STRING`',
          'short': 'The User\'s name.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
          'short': 'This resource\'s unique identifier.',
        },
        <String, dynamic>{
          'name': 'isActive',
          'title': 'Is Active',
          'type': '`\$BOOLEAN`',
          'short': 'This property indicates if the User account is active or disabled.',
        },
        <String, dynamic>{
          'name': 'kif',
          'title': 'Kif',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated KIF resource.',
        },
        <String, dynamic>{
          'name': 'lastName',
          'title': 'Last Name',
          'type': '`\$STRING`',
          'short': 'The User\'s Surname.',
        },
        <String, dynamic>{
          'name': 'modified',
          'title': 'Modified',
          'type': '`\$STRING`',
          'short': 'Last modified timestamp.',
          'format': 'datetime',
        },
        <String, dynamic>{
          'name': 'partner',
          'title': 'Partner',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated Partner.',
        },
        <String, dynamic>{
          'name': 'phone',
          'title': 'Phone',
          'type': '`\$STRING`',
          'short': 'The User\'s phone number without dashes, spaces, or brackets.',
        },
        <String, dynamic>{
          'name': 'userName',
          'title': 'User Name',
          'type': '`\$STRING`',
          'short': 'The User\'s unique username.',
        },
        <String, dynamic>{
          'name': 'userRole',
          'title': 'User Role',
          'type': '`\$OBJECT`',
          'short': 'Reference to the associated User Role.',
        },
        <String, dynamic>{
          'name': 'version',
          'title': 'Version',
          'type': '`\$INTEGER`',
          'short': 'The number of times that this resource has been updated.',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'user',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/users/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/users/{id}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'users',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'virtual_device': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'data',
          'title': 'Data',
          'type': '`\$ARRAY`',
          'short': 'List of Devices.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'total',
          'title': 'Total',
          'type': '`\$INTEGER`',
          'short': 'Total number of Devices available (not the number of Users in the response).',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'virtual_device',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/virtualDevices/{sharePartnerTo}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'virtualDevices',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'virtualDevices',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'sharePartnerTo': 'id',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'share_partner_to',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 0,
                  },
                  <String, dynamic>{
                    'name': 'sorting_direction',
                    'orig': 'sorting_direction',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'example': 'asc',
                  },
                  <String, dynamic>{
                    'name': 'sorting_field',
                    'orig': 'sorting_field',
                    'type': '`\$STRING`',
                    'kind': 'query',
                    'example': 'serialnumber',
                  },
                  <String, dynamic>{
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                    'kind': 'query',
                    'example': 10,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'skip',
                  'sorting_direction',
                  'sorting_field',
                  'take',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
  };

  // The pipeline context carries the config as a plain map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'main': main,
        'feature': feature,
        'options': options,
        'entity': entity,
      };
}

final config = Config();
