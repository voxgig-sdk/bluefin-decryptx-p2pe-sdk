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
    'name': 'ProjectName',
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
          'active': true,
          'name': 'client',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'complete_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'note',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
      ],
      'name': 'attestation',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'client': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'contact',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'direct_partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mid',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 10,
        },
      ],
      'name': 'client',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
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
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
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
          'active': true,
          'name': 'success',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 0,
        },
      ],
      'name': 'decryption',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'activated_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'activation_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'alternate_key',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'audit_next_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'audit_notification_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'client',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device_build',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device_state',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device_type',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'error_counter',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'error_last_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 13,
        },
        <String, dynamic>{
          'active': true,
          'name': 'initialized_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 14,
        },
        <String, dynamic>{
          'active': true,
          'name': 'initialized_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 15,
        },
        <String, dynamic>{
          'active': true,
          'name': 'inject_key',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 16,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_virtual',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 17,
        },
        <String, dynamic>{
          'active': true,
          'name': 'kif',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 18,
        },
        <String, dynamic>{
          'active': true,
          'name': 'last_activity_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 19,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 20,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 21,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 22,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 23,
        },
        <String, dynamic>{
          'active': true,
          'name': 'note',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 24,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 25,
        },
        <String, dynamic>{
          'active': true,
          'name': 'serial_number',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 26,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 27,
        },
      ],
      'name': 'device',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'device_state',
                    'orig': 'device_state',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'kif',
                    'orig': 'kif',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'asc',
                    'kind': 'query',
                    'name': 'sorting_direction',
                    'orig': 'sorting_direction',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'serialnumber',
                    'kind': 'query',
                    'name': 'sorting_field',
                    'orig': 'sorting_field',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 1,
            },
          ],
          'key\$': 'load',
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
          'active': true,
          'name': 'app_version',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'build_number',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'config_file_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device_type',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'firmware_version',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'hardware_version',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'note',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'white_listing_bin_range',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 13,
        },
        <String, dynamic>{
          'active': true,
          'name': 'white_listing_used',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 14,
        },
      ],
      'name': 'device_build',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_custody_detail': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'complete_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'custodian',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'note',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'transfer_method',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 12,
        },
      ],
      'name': 'device_custody_detail',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 2,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
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
          'active': true,
          'name': 'complete_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'custodian',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified_by',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'note',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'status',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'transfer_method',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 12,
        },
      ],
      'name': 'device_custody_list',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'device_type',
                    'orig': 'device_type',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 1,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
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
          'active': true,
          'name': 'data',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'total',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 1,
        },
      ],
      'name': 'device_list',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'asc',
                    'kind': 'query',
                    'name': 'sorting_direction',
                    'orig': 'sorting_direction',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'serialnumber',
                    'kind': 'query',
                    'name': 'sorting_field',
                    'orig': 'sorting_field',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
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
          'active': true,
          'name': 'success',
          'req': true,
          'type': '`\$BOOLEAN`',
          'index\$': 0,
        },
      ],
      'name': 'device_receive_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_rki_activate_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'success',
          'req': true,
          'type': '`\$BOOLEAN`',
          'index\$': 0,
        },
      ],
      'name': 'device_rki_activate_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_state': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
      ],
      'name': 'device_state',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'device_type': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device_type_mode',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'hardware_version',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'manufacturer',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'model',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'photo_url',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'product_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 11,
        },
      ],
      'name': 'device_type',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'inject_key': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_p2_pe',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'key_type',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 7,
        },
      ],
      'name': 'inject_key',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'kif': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
      ],
      'name': 'kif',
      'op': <String, dynamic>{
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'location': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'address1',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'address2',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'billing_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'city',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'country',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'custom_reference',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location_type',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mail_address1',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mail_address2',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mail_city',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mail_country',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mail_postal_code',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 13,
        },
        <String, dynamic>{
          'active': true,
          'name': 'mail_state_province',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 14,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 15,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 16,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name_of_business',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 17,
        },
        <String, dynamic>{
          'active': true,
          'name': 'note',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 18,
        },
        <String, dynamic>{
          'active': true,
          'name': 'postal_code',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 19,
        },
        <String, dynamic>{
          'active': true,
          'name': 'state_province',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 20,
        },
        <String, dynamic>{
          'active': true,
          'name': 'unique_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 21,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 22,
        },
      ],
      'name': 'location',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'partner': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'billing_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'client_can_order_equipment',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'contact',
          'op': <String, dynamic>{
            'list': <String, dynamic>{
              'req': true,
              'type': '`\$OBJECT`',
            },
          },
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'parent',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reference',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'verification_phrase',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 13,
        },
      ],
      'name': 'partner',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'shipment': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'carrier',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'client',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'date_received',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'date_shipped',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'dc_kif',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'item',
          'req': false,
          'type': '`\$ARRAY`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'kif',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'shipment_type',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'tracking',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 13,
        },
      ],
      'name': 'shipment',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'kif',
                    'orig': 'kif',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'mode',
                    'orig': 'mode',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'success': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'success',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 0,
        },
      ],
      'name': 'success',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'share_partner_to',
                    'orig': 'share_partner_to',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
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
          'active': true,
          'name': 'alternate_key',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'client',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'client_ref',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'decrypted',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'device_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'direct_partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'encrypted',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'end_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'err_code',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'err_message',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'ip_address',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_virtual',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 13,
        },
        <String, dynamic>{
          'active': true,
          'name': 'key_type',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 14,
        },
        <String, dynamic>{
          'active': true,
          'name': 'location',
          'req': true,
          'type': '`\$OBJECT`',
          'index\$': 15,
        },
        <String, dynamic>{
          'active': true,
          'name': 'message_id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 16,
        },
        <String, dynamic>{
          'active': true,
          'name': 'method',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 17,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 18,
        },
        <String, dynamic>{
          'active': true,
          'name': 'reference',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 19,
        },
        <String, dynamic>{
          'active': true,
          'name': 'serial_number',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 20,
        },
        <String, dynamic>{
          'active': true,
          'name': 'start_date',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 21,
        },
        <String, dynamic>{
          'active': true,
          'name': 'success',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 22,
        },
        <String, dynamic>{
          'active': true,
          'name': 'transaction_source',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 23,
        },
      ],
      'name': 'transaction',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'client_ref',
                    'orig': 'client_ref',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'date_from',
                    'orig': 'date_from',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'date_to',
                    'orig': 'date_to',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'location',
                    'orig': 'location',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'message_id',
                    'orig': 'message_id',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 'nocount',
                    'kind': 'query',
                    'name': 'paging_mode',
                    'orig': 'paging_mode',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'reference',
                    'orig': 'reference',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'serial_number',
                    'orig': 'serial_number',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'success',
                    'orig': 'success',
                    'reqd': false,
                    'type': '`\$BOOLEAN`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'update_result': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'client',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'email',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'first_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'kif',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'last_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'phone',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'user_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'user_role',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 11,
        },
      ],
      'name': 'update_result',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{},
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'list': <String, dynamic>{
          'input': 'data',
          'name': 'list',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'query': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'client',
                    'orig': 'client',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'kif',
                    'orig': 'kif',
                    'reqd': false,
                    'type': '`\$STRING`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'kind': 'query',
                    'name': 'partner',
                    'orig': 'partner',
                    'reqd': false,
                    'type': '`\$ANY`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 0,
                    'kind': 'query',
                    'name': 'skip',
                    'orig': 'skip',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                  <String, dynamic>{
                    'active': true,
                    'example': 10,
                    'kind': 'query',
                    'name': 'take',
                    'orig': 'take',
                    'reqd': false,
                    'type': '`\$INTEGER`',
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'list',
        },
        'update': <String, dynamic>{
          'input': 'data',
          'name': 'update',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 1,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 2,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 3,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 4,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 5,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 6,
            },
          ],
          'key\$': 'update',
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
    'user': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'client',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'created',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'email',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'first_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'id',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'is_active',
          'req': false,
          'type': '`\$BOOLEAN`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'kif',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'last_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'modified',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'partner',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 9,
        },
        <String, dynamic>{
          'active': true,
          'name': 'phone',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 10,
        },
        <String, dynamic>{
          'active': true,
          'name': 'user_name',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 11,
        },
        <String, dynamic>{
          'active': true,
          'name': 'user_role',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 12,
        },
        <String, dynamic>{
          'active': true,
          'name': 'version',
          'req': false,
          'type': '`\$INTEGER`',
          'index\$': 13,
        },
      ],
      'name': 'user',
      'op': <String, dynamic>{
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
                  },
                ],
              },
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
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
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
