import 'feature/base/BaseFeature.dart';
import 'feature/test/TestFeature.dart';


// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'test': () => TestFeature(),

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
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
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
      'device_custody_list': <String, dynamic>{},
      'device_list': <String, dynamic>{},
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
    },
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'attestation': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'completeDate',
          'short': 'The date and time that the Attestation took place.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'device',
          'short': 'Reference to the associated Device resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'Text describing the attestation.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'short': 'Free form field that allows the Client associate notes with the Attestation.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'attestation',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/attestations',
              'parts': <dynamic>[
                'attestations',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/attestations',
              'parts': <dynamic>[
                'attestations',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/attestations/{id}',
              'parts': <dynamic>[
                'attestations',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the Client account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'short': 'Reference to the associated Location resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'mid',
          'short': 'Some Partners will have an merchant ids on their own software offerings.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Client\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the Client\'s root Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'client',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/clients',
              'parts': <dynamic>[
                'clients',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients',
              'parts': <dynamic>[
                'clients',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/clients/{id}',
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/clients/{id}',
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices/{serialNumber}/{deviceType}/custody',
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'serial_number',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'device',
          ],
        ],
      },
    },
    'decryption': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'success',
          'short': 'true if the payload decryption was successful.',
          'type': '`\$BOOLEAN`',
        },
      ],
      'name': 'decryption',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/decryption',
              'parts': <dynamic>[
                'decryption',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
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
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'activationDate',
          'short': 'Timestamp from when the Device was activated.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'alternateKey',
          'short': 'The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device\'s casing or its packaging.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'auditNextDate',
          'short': 'Date and time that the Device is due its next PCI Audit.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'auditNotificationDate',
          'short': 'Date and time that a notification should be sent that a PCI audit is due.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'deviceBuild',
          'short': 'Reference to the associated Device Build resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'deviceState',
          'short': 'Reference to the associated Device State resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'deviceType',
          'short': 'Reference to the associated Device Type resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'errorCounter',
          'short': 'The number times the Device has been in error.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'errorLastDate',
          'short': 'Timestamp from the last time that the Device had an error.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'The Device\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'initializedBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'initializedDate',
          'short': 'Timestamp from when the Device was initialized.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'injectKey',
          'short': 'Reference to the associated Device resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'isVirtual',
          'short': 'Indicates if a Device is Virtual (represents a Device shared with a partner).',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'kif',
          'short': 'Reference to the associated KIF resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lastActivityDate',
          'short': 'Timestamp from the last time that the Device was used.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'short': 'Reference to the associated Location resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Device\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'short': 'Arbitary note that can be attached to a Device entry.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'serialNumber',
          'short': 'The Device\'s serial number.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'device',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices',
              'parts': <dynamic>[
                'devices',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'device_state',
                    'orig': 'device_state',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'kif',
                    'orig': 'kif',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 'asc',
                    'kind': 'query',
                    'name': 'sorting_direction',
                    'orig': 'sorting_direction',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 'serialnumber',
                    'kind': 'query',
                    'name': 'sorting_field',
                    'orig': 'sorting_field',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices',
              'parts': <dynamic>[
                'devices',
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{serialNumber}/{deviceType}',
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'serial_number',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{id}',
              'parts': <dynamic>[
                'devices',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'device',
          ],
        ],
      },
    },
    'device_build': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'appVersion',
          'short': 'If a Device Type has more than one Application Code version the supported version is specified here.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'buildNumber',
          'short': 'The Build Number.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'configFileName',
          'short': 'The name of the configuration file that is uploaded to the device.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'deviceType',
          'short': 'The Device Type Name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firmwareVersion',
          'short': 'A list of firmware versions that this Device Build covers.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'hardwareVersion',
          'short': 'A list of hardware versions that this Device Build covers.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the device build is still active and not succeeded by subsequent build.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Device Builds\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'short': 'Notes attached to the device build by Bluefin CISO.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'whiteListingBinRanges',
          'short': 'A comma separated list of BIN ranges that aren\'t encrypted by the terminal.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'whiteListingUsed',
          'short': 'This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren\'t encrypted by the terminal.',
          'type': '`\$BOOLEAN`',
        },
      ],
      'name': 'device_build',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceBuilds',
              'parts': <dynamic>[
                'deviceBuilds',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceBuilds/{id}',
              'parts': <dynamic>[
                'deviceBuilds',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'The date and time that the Custody change took place.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'custodian',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'device',
          'short': 'Reference to the associated Device resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'short': 'Reference to the associated Location resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'notes',
          'short': 'Free form field that allows the Client associate notes with the Custody Change.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'status',
          'short': 'Reference to the associated Custody Status.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'transferMethod',
          'short': 'Reference to the associated Transfer Method.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'device_custody_detail',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{serialNumber}/{deviceType}/custody/{id}',
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'id',
                  'serial_number',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'device',
          ],
        ],
      },
    },
    'device_custody_list': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'completeDate',
          'short': 'The date and time that the Custody change took place.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'custodian',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'device',
          'short': 'Reference to the associated Device resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'short': 'Reference to the associated Location resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'req': true,
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'notes',
          'short': 'Free form field that allows the Client associate notes with the Custody Change.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'status',
          'short': 'Reference to the associated Custody Status.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'transferMethod',
          'short': 'Reference to the associated Transfer Method.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'device_custody_list',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/devices/{serialNumber}/{deviceType}/custody',
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
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'device_type',
                  'serial_number',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'device',
          ],
        ],
      },
    },
    'device_list': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'data',
          'short': 'List of Devices.',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'total',
          'short': 'Total number of Devices available (not the number of Users in the response).',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'device_list',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 'asc',
                    'kind': 'query',
                    'name': 'sorting_direction',
                    'orig': 'sorting_direction',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 'serialnumber',
                    'kind': 'query',
                    'name': 'sorting_field',
                    'orig': 'sorting_field',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/virtualDevices/{sharePartnerTo}',
              'parts': <dynamic>[
                'virtualDevices',
                '{share_partner_to}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'sharePartnerTo': 'share_partner_to',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'share_partner_to',
                  'skip',
                  'sorting_direction',
                  'sorting_field',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'virtual_device',
          ],
        ],
      },
    },
    'device_receive_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'success',
          'req': true,
          'short': 'Indicates if the action succeeded.',
          'type': '`\$BOOLEAN`',
        },
      ],
      'name': 'device_receive_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices/receive',
              'parts': <dynamic>[
                'devices',
                'receive',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
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
          'req': true,
          'short': 'Indicates if the RKI activation succeeded.',
          'type': '`\$BOOLEAN`',
        },
      ],
      'name': 'device_rki_activate_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/devices/rki/activate',
              'parts': <dynamic>[
                'devices',
                'rki',
                'activate',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
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
          'short': 'Unique identifier for this Device state.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'Descriptive name for this Device state.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'device_state',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceStates',
              'parts': <dynamic>[
                'deviceStates',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
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
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'deviceTypeMode',
          'short': 'The Device type.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'hardwareVersion',
          'short': 'The Device hardware version.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'Unique idenifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the DeviceType is active.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'manufacturer',
          'short': 'The Device manufacturer.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'model',
          'short': 'The Device model.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The DeviceType name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'photoUrl',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productName',
          'short': 'The Device name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'device_type',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceTypes',
              'parts': <dynamic>[
                'deviceTypes',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/deviceTypes/{id}',
              'parts': <dynamic>[
                'deviceTypes',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'unique idenifier',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'Active flag, inactive keys cannot be assigned to devices.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'isP2PE',
          'short': 'Flags if a key is for a P2PE compliant cypher.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'keyType',
          'short': 'The cipher type that the key works with.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'Key name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'inject_key',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/injectKeys',
              'parts': <dynamic>[
                'injectKeys',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/injectKeys/{id}',
              'parts': <dynamic>[
                'injectKeys',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'This resource\'s unique identifier.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The KIF\'s name.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'kif',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'GET',
              'orig': '/kifs',
              'parts': <dynamic>[
                'kifs',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
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
          'short': 'The Location\'s street address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'address2',
          'short': 'The Location\'s street address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'billingId',
          'short': '\\?',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'city',
          'short': 'The Location\'s city.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'short': 'The Location\'s country.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'customReference',
          'short': 'A Partner specified reference for a location.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'locationType',
          'short': 'The Location\'s clasification.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailAddress1',
          'short': 'The Location\'s street address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailAddress2',
          'short': 'The Location\'s street address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailCity',
          'short': 'The Location\'s city.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailCountry',
          'short': 'The Location\'s street address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailPostalCode',
          'short': 'The Location\'s postal code.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailStateProvince',
          'short': 'The Location\'s street state or province.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Location\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameOfBusiness',
          'short': 'The name of the business at this location.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'short': 'Note for delivery driver.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'postalCode',
          'short': 'The Location\'s postal code.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'stateProvince',
          'short': 'The Location\'s street state or province.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'uniqueId',
          'short': 'Unique Identifier for the Location.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'location',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/locations',
              'parts': <dynamic>[
                'locations',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/locations',
              'parts': <dynamic>[
                'locations',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/locations/{id}',
              'parts': <dynamic>[
                'locations',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/locations/{id}',
              'parts': <dynamic>[
                'locations',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'The Partner\'s billing identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'clientCanOrderEquipment',
          'short': 'This property indicates if the Partner is allowed to order Equipment.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'contact',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'short': 'Reference to the associated User resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the Parter account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'short': 'Reference to the associated Location resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'short': 'The Partner\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'parent',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partnerId',
          'short': 'The Partner\'s id.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reference',
          'short': 'The Partner\'s reference string.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'short': 'The verification phrase is a message that the Partner creates.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'partner',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/partners',
              'parts': <dynamic>[
                'partners',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners',
              'parts': <dynamic>[
                'partners',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/partners/{id}',
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'The name of the courier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'dateReceived',
          'short': 'The date and time that a package is recieved.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'dateShipped',
          'short': 'The date and time that a package is shipped.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'dcKif',
          'short': 'Reference to the associated KIF resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'items',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'kif',
          'short': 'Reference to the associated KIF resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'shipmentType',
          'short': 'The type of shipment.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'tracking',
          'short': 'The courier\'s tracking number.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'shipment',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/shipments',
              'parts': <dynamic>[
                'shipments',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'kif',
                    'orig': 'kif',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'mode',
                    'orig': 'mode',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/shipments',
              'parts': <dynamic>[
                'shipments',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'kif',
                  'mode',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/shipments/{id}',
              'parts': <dynamic>[
                'shipments',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'Indicates if the action was a success.',
          'type': '`\$BOOLEAN`',
        },
      ],
      'name': 'success',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/virtualDevices/{sharePartnerTo}',
              'parts': <dynamic>[
                'virtualDevices',
                '{share_partner_to}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'sharePartnerTo': 'share_partner_to',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'share_partner_to',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/virtualDevices/{sharePartnerTo}',
              'parts': <dynamic>[
                'virtualDevices',
                '{share_partner_to}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'sharePartnerTo': 'share_partner_to',
                },
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'share_partner_to',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[
          <dynamic>[
            'virtual_device',
          ],
        ],
      },
    },
    'transaction': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'alternateKey',
          'short': 'The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device\'s casing or its packaging.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'clientRef',
          'short': 'Client Reference property that is included in the decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'decrypted',
          'short': 'A Transcation can process muliple decryptions.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'deviceName',
          'short': 'The name of the Device that generated the payload to decrypt.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'encrypted',
          'short': 'A Transcation can process muliple encryptions.',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'endDate',
          'short': 'Timestamp from the end of the transaction.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'errCode',
          'short': 'The error code that is sent in response to a failed decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'errMessage',
          'short': 'The error messge that is sent in response to a failed decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'ipAddress',
          'short': 'The IP address of the http client that makes the decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isVirtual',
          'short': 'Indicates if the Transaction came from a virtual Device.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'keyType',
          'short': 'The type of cipher used during decrytion.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'short': 'Reference to the associated Location resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'messageId',
          'short': 'Message ID.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'method',
          'short': 'The decryption cypher/method.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'short': 'The reference property that the Client includes in the decrypt API call.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'serialNumber',
          'short': 'The serial number of the Device that generated the payload to decrypt.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'startDate',
          'short': 'Timestamp from the beginning of the transaction.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'success',
          'short': 'The success indicator.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'transactionSource',
          'short': 'The source of the Transaction.',
          'type': '`\$STRING`',
        },
      ],
      'name': 'transaction',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/transactions',
              'parts': <dynamic>[
                'transactions',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client_ref',
                    'orig': 'client_ref',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'date_from',
                    'orig': 'date_from',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'date_to',
                    'orig': 'date_to',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'location',
                    'orig': 'location',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'message_id',
                    'orig': 'message_id',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 'nocount',
                    'kind': 'query',
                    'name': 'paging_mode',
                    'orig': 'paging_mode',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'success',
                    'orig': 'success',
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions',
              'parts': <dynamic>[
                'transactions',
              ],
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
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/transactions/{id}',
              'parts': <dynamic>[
                'transactions',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'email',
          'short': 'The User\'s email address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'short': 'The User\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'ID of newly created resource',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the User account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'kif',
          'short': 'Reference to the associated KIF resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'short': 'The User\'s Surname.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'phone',
          'short': 'The User\'s phone number without dashes, spaces, or brackets.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userName',
          'short': 'The User\'s unique username.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'short': 'Reference to the associated User Role.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'update_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{},
              'kind': 'http',
              'method': 'POST',
              'orig': '/users',
              'parts': <dynamic>[
                'users',
              ],
              'select': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'kif',
                    'orig': 'kif',
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'type': '`\$ANY`',
                  },
                  <String, dynamic>{
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'type': '`\$INTEGER`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/users',
              'parts': <dynamic>[
                'users',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'client',
                  'kif',
                  'partner',
                  'skip',
                  'take',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body.data`',
              },
            },
          ],
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/clients/{id}',
              'parts': <dynamic>[
                'clients',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/devices/{id}',
              'parts': <dynamic>[
                'devices',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/locations/{id}',
              'parts': <dynamic>[
                'locations',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/partners/{id}',
              'parts': <dynamic>[
                'partners',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/shipments/{id}',
              'parts': <dynamic>[
                'shipments',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/transactions/{id}',
              'parts': <dynamic>[
                'transactions',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'PATCH',
              'orig': '/users/{id}',
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
          'short': 'Reference to the associated Client resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'short': 'Creation timestamp in ISO 8601 format.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'email',
          'short': 'The User\'s email address.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'short': 'The User\'s name.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'short': 'This resource\'s unique identifier.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'short': 'This property indicates if the User account is active or disabled.',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'kif',
          'short': 'Reference to the associated KIF resource.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'short': 'The User\'s Surname.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'short': 'Last modified timestamp.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'short': 'Reference to the associated Partner.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'phone',
          'short': 'The User\'s phone number without dashes, spaces, or brackets.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userName',
          'short': 'The User\'s unique username.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'short': 'Reference to the associated User Role.',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
          'short': 'The number of times that this resource has been updated.',
          'type': '`\$INTEGER`',
        },
      ],
      'name': 'user',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/users/{id}',
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/users/{id}',
              'parts': <dynamic>[
                'users',
                '{id}',
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
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
