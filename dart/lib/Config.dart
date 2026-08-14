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

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinDecryptxP2pe',
  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
    },

  };

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

    }
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'attestation': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'completeDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'device',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
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
                'res': '`body`',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'mid',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'activationDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'alternateKey',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'auditNextDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'auditNotificationDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'deviceBuild',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'deviceState',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'deviceType',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'errorCounter',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'errorLastDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'initializedBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'initializedDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'injectKey',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'isVirtual',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'kif',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lastActivityDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'serialNumber',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'buildNumber',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'configFileName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'deviceType',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firmwareVersion',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'hardwareVersion',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'whiteListingBinRanges',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'whiteListingUsed',
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
                'res': '`body`',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'custodian',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'device',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'notes',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'status',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'transferMethod',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'createdBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'custodian',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'device',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modifiedBy',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'notes',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'status',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'transferMethod',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
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
    'device_list': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'data',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'total',
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
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
    'device_type': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'deviceTypeMode',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'hardwareVersion',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'manufacturer',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'model',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'photoUrl',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'productName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'isP2PE',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'keyType',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'name',
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
    'location': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'address1',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'address2',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'billingId',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'city',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'country',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'customReference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'locationType',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailAddress1',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailAddress2',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailCity',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailCountry',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailPostalCode',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'mailStateProvince',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'nameOfBusiness',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'notes',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'postalCode',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'stateProvince',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'uniqueId',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'clientCanOrderEquipment',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'name',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'parent',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'partnerId',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'reference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'verificationPhrase',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'dateReceived',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'dateShipped',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'dcKif',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'items',
          'type': '`\$ARRAY`',
        },
        <String, dynamic>{
          'name': 'kif',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'shipmentType',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'tracking',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'client',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'clientRef',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'decrypted',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'deviceName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'directPartner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'encrypted',
          'type': '`\$INTEGER`',
        },
        <String, dynamic>{
          'name': 'endDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'errCode',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'errMessage',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'ipAddress',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isVirtual',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'keyType',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'messageId',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'method',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'reference',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'serialNumber',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'startDate',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'success',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'transactionSource',
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
                'res': '`body`',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'kif',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'phone',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
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
                'res': '`body`',
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'created',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'email',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'firstName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'isActive',
          'type': '`\$BOOLEAN`',
        },
        <String, dynamic>{
          'name': 'kif',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'lastName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'modified',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'partner',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'phone',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userName',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'userRole',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'version',
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
