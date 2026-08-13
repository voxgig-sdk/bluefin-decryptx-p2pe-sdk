// ignore_for_file: unused_import, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import '../../harness.dart';
import '../../utility.dart';

import '../../../lib/BluefinDecryptxP2peSDK.dart';
import '../../../lib/utility/voxgig_struct.dart' as vs;

void tests() {
  describe('LocationEntity', () {
    test('instance', (t) async {
      final testsdk = BluefinDecryptxP2peSDK.test();
      final ent = testsdk.Location();
      ok(null != ent);
    });

test('stream', (t) async {
      // stream() runs the list op through the full pipeline and yields each
      // result item. Seed two entities via test mode; with the `streaming`
      // feature active it yields the feature's incremental items, else it
      // falls back to the materialised items — either way every item yields.
      final seed = <String, dynamic>{
        'entity': {
          'location': {
            'strm01': <String, dynamic>{'id': 'strm01'},
            'strm02': <String, dynamic>{'id': 'strm02'},
          }
        }
      };

      final sdkopts = <String, dynamic>{};
      if (null != config.feature['streaming']) {
        sdkopts['feature'] = {
          'streaming': {'active': true}
        };
      }

      final testsdk = BluefinDecryptxP2peSDK.test(seed, sdkopts);
      final ent = testsdk.Location();

      final seen = [];
      await for (final item in ent.stream('list', <String, dynamic>{})) {
        seen.add(item);
      }
      equal(2, seen.length);

      // Fallback: with streaming inactive, stream() still yields both items
      // from the materialised result.
      final plainsdk = BluefinDecryptxP2peSDK.test(seed);
      final plainent = plainsdk.Location();
      final seen2 = [];
      await for (final item in plainent.stream('list', <String, dynamic>{})) {
        seen2.add(item);
      }
      equal(2, seen2.length);
    });


    test('basic', (t) async {

      final live = 'TRUE' == Platform.environment['BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'];
      for (final op in ['create', 'list', 'load', 'remove']) {
        if (maybeSkipControl(t, 'entityOp', 'location.' + op, live)) {
          return;
        }
      }

      final setup = basicSetup();
      // The basic flow consumes synthetic IDs and field values from the
      // fixture (entity TestData.json). Those don't exist on the live API.
      // Skip live runs unless the user provided a real ENTID env override.
      if (true == setup['syntheticOnly']) {
        t.skip('live entity test uses synthetic IDs from fixture — set BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID JSON to run live');
        return;
      }
      final client = setup['client'];
      final struct = setup['struct'];

      final isempty = struct.isempty;
      final select = struct.select;


      // CREATE
      final location_ref01_ent = client.Location();
      dynamic location_ref01_data = setup['data']['new']['location']['location_ref01'];

      location_ref01_data = (await location_ref01_ent.create(location_ref01_data)).data();
      ok(null != location_ref01_data['id']);


      // LIST
      final location_ref01_match = <String, dynamic>{};

      final location_ref01_list = (await location_ref01_ent.list(location_ref01_match)).map((e) => e.data()).toList();

      ok(!isempty(select(
          (location_ref01_list as List).map((e) => e.data()).toList(),
          {'id': location_ref01_data['id']})));


      // LOAD
      final location_ref01_match_dt0 = <String, dynamic>{};
      location_ref01_match_dt0['id'] = location_ref01_data['id'];
      final location_ref01_data_dt0 = (await location_ref01_ent.load(location_ref01_match_dt0)).data();
      ok(location_ref01_data_dt0['id'] == location_ref01_data['id']);


      // REMOVE
      final location_ref01_match_rm0 = <String, dynamic>{'id': location_ref01_data['id']};
      await location_ref01_ent.remove(location_ref01_match_rm0);


      // LIST
      final location_ref01_match_rt0 = <String, dynamic>{};

      final location_ref01_list_rt0 = (await location_ref01_ent.list(location_ref01_match_rt0)).map((e) => e.data()).toList();

      ok(isempty(select(
          (location_ref01_list_rt0 as List).map((e) => e.data()).toList(),
          {'id': location_ref01_data['id']})));


    });
  });
}


Map<String, dynamic> basicSetup([dynamic extra]) {
  final options = <String, dynamic>{};

  final entityDataFile = resolveTestPath(
      '../.sdk/test/entity/location/LocationTestData.json');

  final entityDataSource = File(entityDataFile).readAsStringSync();

  final entityData = jsonDecode(entityDataSource);

  options['entity'] = entityData['existing'];

  var client = BluefinDecryptxP2peSDK.test(options, extra);
  final struct = client.utility().struct;
  final merge = struct.merge;
  final transform = struct.transform;

  dynamic idmap = transform(
      <dynamic>['location01', 'location02', 'location03'],
      <String, dynamic>{
        '`\$PACK`': <dynamic>[
          '',
          <String, dynamic>{
            '`\$KEY`': '`\$COPY`',
            '`\$VAL`': <dynamic>['`\$FORMAT`', 'upper', '`\$COPY`'],
          }
        ]
      });

  // Detect whether the user provided a real ENTID JSON via env var. The
  // basic flow consumes synthetic IDs from the fixture file; without an
  // override those synthetic IDs reach the live API and 4xx. Surface this
  // to the test so it can skip rather than fail.
  final idmapEnvVal =
      Platform.environment['BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID'];
  final idmapOverridden =
      null != idmapEnvVal && idmapEnvVal.trim().startsWith('{');

  final env = envOverride({
    'BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID': idmap,
    'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
    'BLUEFIN_DECRYPTX_P2PE_APIKEY': 'NONE',
  });

  idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_LOCATION_ENTID'];

  final live = 'TRUE' == env['BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'];

  if (live) {
    client = BluefinDecryptxP2peSDK(merge([
      <String, dynamic>{
        'apikey': env['BLUEFIN_DECRYPTX_P2PE_APIKEY'],
      },
      extra
    ]));
  }

  final setup = <String, dynamic>{
    'idmap': idmap,
    'env': env,
    'options': options,
    'client': client,
    'struct': struct,
    'data': entityData,
    'explain': 'TRUE' == env['BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN'],
    'live': live,
    'syntheticOnly': live && !idmapOverridden,
    'now': DateTime.now().millisecondsSinceEpoch,
  };

  return setup;
}

