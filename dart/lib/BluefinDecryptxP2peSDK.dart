// BluefinDecryptxP2pe Dart SDK

import 'entity/AttestationEntity.dart';
import 'entity/ClientEntity.dart';
import 'entity/CreateResultEntity.dart';
import 'entity/DecryptionEntity.dart';
import 'entity/DeviceEntity.dart';
import 'entity/DeviceBuildEntity.dart';
import 'entity/DeviceCustodyDetailEntity.dart';
import 'entity/DeviceCustodyListEntity.dart';
import 'entity/DeviceListEntity.dart';
import 'entity/DeviceReceiveResultEntity.dart';
import 'entity/DeviceRkiActivateResultEntity.dart';
import 'entity/DeviceStateEntity.dart';
import 'entity/DeviceTypeEntity.dart';
import 'entity/InjectKeyEntity.dart';
import 'entity/KifEntity.dart';
import 'entity/LocationEntity.dart';
import 'entity/PartnerEntity.dart';
import 'entity/ShipmentEntity.dart';
import 'entity/SuccessEntity.dart';
import 'entity/TransactionEntity.dart';
import 'entity/UpdateResultEntity.dart';
import 'entity/UserEntity.dart';


export 'BluefinDecryptxP2peTypes.dart';
export 'entity/AttestationEntity.dart';
export 'entity/ClientEntity.dart';
export 'entity/CreateResultEntity.dart';
export 'entity/DecryptionEntity.dart';
export 'entity/DeviceEntity.dart';
export 'entity/DeviceBuildEntity.dart';
export 'entity/DeviceCustodyDetailEntity.dart';
export 'entity/DeviceCustodyListEntity.dart';
export 'entity/DeviceListEntity.dart';
export 'entity/DeviceReceiveResultEntity.dart';
export 'entity/DeviceRkiActivateResultEntity.dart';
export 'entity/DeviceStateEntity.dart';
export 'entity/DeviceTypeEntity.dart';
export 'entity/InjectKeyEntity.dart';
export 'entity/KifEntity.dart';
export 'entity/LocationEntity.dart';
export 'entity/PartnerEntity.dart';
export 'entity/ShipmentEntity.dart';
export 'entity/SuccessEntity.dart';
export 'entity/TransactionEntity.dart';
export 'entity/UpdateResultEntity.dart';
export 'entity/UserEntity.dart';


// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'Config.dart';
import 'Spec.dart';
// BluefinDecryptxP2peEntityBase / BluefinDecryptxP2peError / BaseFeature are re-exported below;
// a Dart `export` needs no matching `import`, so importing them here too is an
// unused_import. Keep only the imports actually referenced in this file.
import 'utility/ErrUtility.dart';
import 'utility/Utility.dart';

export 'Config.dart' show Config, config;
export 'BluefinDecryptxP2peEntityBase.dart' show BluefinDecryptxP2peEntityBase;
export 'BluefinDecryptxP2peError.dart' show BluefinDecryptxP2peError;
export 'feature/base/BaseFeature.dart' show BaseFeature;
export 'utility/Utility.dart' show Utility;

final Utility stdutil = Utility();

class BluefinDecryptxP2peSDK {
  String mode = 'live';
  dynamic _options;
  final Utility _utility = Utility();
  List<dynamic> features = [];
  dynamic rootctx;

  // Feature activity tracking store (retry attempts, cache hits, spans, ...).
  final Map<String, dynamic> track = {};

  BluefinDecryptxP2peSDK([dynamic options]) {
    rootctx = _utility.makeContext({
      'client': this,
      'utility': _utility,
      'config': config.toMap(),
      'options': options,
      'shared': {},
    });

    _options = _utility.makeOptions(rootctx);

    final struct = _utility.struct;

    if (true == struct.getpath(_options, 'feature.test.active')) {
      mode = 'test';
    }

    rootctx.options = _options;

    features = [];

    final featureAdd = _utility.featureAdd;
    final featureInit = _utility.featureInit;

    // Add features in the resolved order (makeOptions puts an explicit List
    // order first, else defaults to test-first). Ordering matters: the
    // `test` feature installs the base mock transport and the transport
    // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is current,
    // so `test` must be added before them to sit at the base of the chain.
    final featureorder =
        struct.getpath(_options, '__derived__.featureorder') ?? [];
    for (final fname in featureorder) {
      final fopts = _options['feature'][fname];
      if (fopts is Map && true == fopts['active']) {
        featureAdd(rootctx, config.makeFeature(fname.toString()));
      }
    }

    if (null != _options['extend']) {
      for (final f in _options['extend']) {
        featureAdd(rootctx, f);
      }
    }

    for (final f in features) {
      featureInit(rootctx, f);
    }

    final featureHook = _utility.featureHook;
    featureHook(rootctx, 'PostConstruct');
  }

  dynamic options() {
    return _utility.struct.clone(_options);
  }

  Utility utility() {
    return _utility;
  }

  Future<dynamic> prepare([dynamic fetchargs]) async {
    final utility = _utility;

    final makeContext = utility.makeContext;
    final makeFetchDef = utility.makeFetchDef;
    final prepareHeaders = utility.prepareHeaders;
    final prepareAuth = utility.prepareAuth;

    fetchargs = fetchargs ?? {};

    final ctx = makeContext({
      'opname': 'prepare',
      'ctrl': fetchargs['ctrl'] ?? {},
    }, rootctx);

    final options = _options;

    // Build spec directly from SDK options + user-provided fetch args.
    final spec = Spec({
      'base': options['base'],
      'prefix': options['prefix'],
      'suffix': options['suffix'],
      'path': fetchargs['path'] ?? '',
      'method': fetchargs['method'] ?? 'GET',
      'params': fetchargs['params'] ?? {},
      'query': fetchargs['query'] ?? {},
      'body': fetchargs['body'],
      'step': 'start',
    });

    ctx.spec = spec;

    spec.headers = prepareHeaders(ctx);

    // Merge user-provided headers over SDK defaults.
    if (fetchargs['headers'] is Map) {
      (fetchargs['headers'] as Map).forEach((key, val) {
        spec.headers[key] = val;
      });
    }

    // Apply SDK auth (apikey, auth prefix, etc.)
    final authResult = prepareAuth(ctx);
    if (iserr(authResult)) {
      return authResult;
    }

    return makeFetchDef(ctx);
  }

  Future<dynamic> direct([dynamic fetchargs]) async {
    final utility = _utility;
    final fetcher = utility.fetcher;
    final makeContext = utility.makeContext;

    final fetchdef = await prepare(fetchargs);
    if (iserr(fetchdef)) {
      return fetchdef;
    }

    final ctx = makeContext({
      'opname': 'direct',
      'ctrl': (fetchargs ?? {})['ctrl'] ?? {},
    }, rootctx);

    try {
      final dynamic fetched =
          await Future.value(fetcher(ctx, fetchdef['url'], fetchdef));

      if (null == fetched) {
        return {
          'ok': false,
          'err': ctx.error('direct_no_response', 'response: undefined')
        };
      } else if (iserr(fetched)) {
        return {'ok': false, 'err': fetched};
      }

      final status = fetched['status'];

      // No body responses (204 No Content, 304 Not Modified) and explicit
      // zero content-length must skip JSON parsing.
      final headers = fetched['headers'];
      final contentLength =
          headers is Map ? headers['content-length'] : null;
      final noBody = 204 == status ||
          304 == status ||
          '0' == (null == contentLength ? null : contentLength.toString());

      dynamic json;
      if (!noBody) {
        try {
          final jsonFn = fetched['json'];
          json = jsonFn is Function
              ? await Future.value(jsonFn())
              : fetched['json'];
        } catch (_parseErr) {
          // Body wasn't valid JSON — surface the raw response rather than
          // throwing. data stays null; callers can inspect status/headers.
          json = null;
        }
      }

      return {
        'ok': status is num && status >= 200 && status < 300,
        'status': status,
        'headers': fetched['headers'],
        'data': json,
      };
    } catch (err) {
      return {'ok': false, 'err': err};
    }
  }


  // Entity access: `client.Attestation().list()` / `client.Attestation().load({'id': ...})`.
  AttestationEntity Attestation([dynamic entopts]) {
    return AttestationEntity(this, entopts);
  }


  // Entity access: `client.Client().list()` / `client.Client().load({'id': ...})`.
  ClientEntity Client([dynamic entopts]) {
    return ClientEntity(this, entopts);
  }


  // Entity access: `client.CreateResult().list()` / `client.CreateResult().load({'id': ...})`.
  CreateResultEntity CreateResult([dynamic entopts]) {
    return CreateResultEntity(this, entopts);
  }


  // Entity access: `client.Decryption().list()` / `client.Decryption().load({'id': ...})`.
  DecryptionEntity Decryption([dynamic entopts]) {
    return DecryptionEntity(this, entopts);
  }


  // Entity access: `client.Device().list()` / `client.Device().load({'id': ...})`.
  DeviceEntity Device([dynamic entopts]) {
    return DeviceEntity(this, entopts);
  }


  // Entity access: `client.DeviceBuild().list()` / `client.DeviceBuild().load({'id': ...})`.
  DeviceBuildEntity DeviceBuild([dynamic entopts]) {
    return DeviceBuildEntity(this, entopts);
  }


  // Entity access: `client.DeviceCustodyDetail().list()` / `client.DeviceCustodyDetail().load({'id': ...})`.
  DeviceCustodyDetailEntity DeviceCustodyDetail([dynamic entopts]) {
    return DeviceCustodyDetailEntity(this, entopts);
  }


  // Entity access: `client.DeviceCustodyList().list()` / `client.DeviceCustodyList().load({'id': ...})`.
  DeviceCustodyListEntity DeviceCustodyList([dynamic entopts]) {
    return DeviceCustodyListEntity(this, entopts);
  }


  // Entity access: `client.DeviceList().list()` / `client.DeviceList().load({'id': ...})`.
  DeviceListEntity DeviceList([dynamic entopts]) {
    return DeviceListEntity(this, entopts);
  }


  // Entity access: `client.DeviceReceiveResult().list()` / `client.DeviceReceiveResult().load({'id': ...})`.
  DeviceReceiveResultEntity DeviceReceiveResult([dynamic entopts]) {
    return DeviceReceiveResultEntity(this, entopts);
  }


  // Entity access: `client.DeviceRkiActivateResult().list()` / `client.DeviceRkiActivateResult().load({'id': ...})`.
  DeviceRkiActivateResultEntity DeviceRkiActivateResult([dynamic entopts]) {
    return DeviceRkiActivateResultEntity(this, entopts);
  }


  // Entity access: `client.DeviceState().list()` / `client.DeviceState().load({'id': ...})`.
  DeviceStateEntity DeviceState([dynamic entopts]) {
    return DeviceStateEntity(this, entopts);
  }


  // Entity access: `client.DeviceType().list()` / `client.DeviceType().load({'id': ...})`.
  DeviceTypeEntity DeviceType([dynamic entopts]) {
    return DeviceTypeEntity(this, entopts);
  }


  // Entity access: `client.InjectKey().list()` / `client.InjectKey().load({'id': ...})`.
  InjectKeyEntity InjectKey([dynamic entopts]) {
    return InjectKeyEntity(this, entopts);
  }


  // Entity access: `client.Kif().list()` / `client.Kif().load({'id': ...})`.
  KifEntity Kif([dynamic entopts]) {
    return KifEntity(this, entopts);
  }


  // Entity access: `client.Location().list()` / `client.Location().load({'id': ...})`.
  LocationEntity Location([dynamic entopts]) {
    return LocationEntity(this, entopts);
  }


  // Entity access: `client.Partner().list()` / `client.Partner().load({'id': ...})`.
  PartnerEntity Partner([dynamic entopts]) {
    return PartnerEntity(this, entopts);
  }


  // Entity access: `client.Shipment().list()` / `client.Shipment().load({'id': ...})`.
  ShipmentEntity Shipment([dynamic entopts]) {
    return ShipmentEntity(this, entopts);
  }


  // Entity access: `client.Success().list()` / `client.Success().load({'id': ...})`.
  SuccessEntity Success([dynamic entopts]) {
    return SuccessEntity(this, entopts);
  }


  // Entity access: `client.Transaction().list()` / `client.Transaction().load({'id': ...})`.
  TransactionEntity Transaction([dynamic entopts]) {
    return TransactionEntity(this, entopts);
  }


  // Entity access: `client.UpdateResult().list()` / `client.UpdateResult().load({'id': ...})`.
  UpdateResultEntity UpdateResult([dynamic entopts]) {
    return UpdateResultEntity(this, entopts);
  }


  // Entity access: `client.User().list()` / `client.User().load({'id': ...})`.
  UserEntity User([dynamic entopts]) {
    return UserEntity(this, entopts);
  }



  static BluefinDecryptxP2peSDK test([dynamic testoptsarg, dynamic sdkoptsarg]) {
    final struct = stdutil.struct;
    final setpath = struct.setpath;
    final getdef = struct.getdef;
    final clone = struct.clone;
    final setprop = struct.setprop;

    final sdkopts = getdef(clone(sdkoptsarg), {});
    final testopts = getdef(clone(testoptsarg), {});
    setprop(testopts, 'active', true);
    setpath(sdkopts, 'feature.test', testopts);

    final testsdk = BluefinDecryptxP2peSDK(sdkopts);
    testsdk.mode = 'test';

    return testsdk;
  }

  BluefinDecryptxP2peSDK tester([dynamic testopts, dynamic sdkopts]) {
    return BluefinDecryptxP2peSDK.test(testopts, sdkopts);
  }

  Map<String, dynamic> toJSON() {
    return {'name': 'BluefinDecryptxP2pe'};
  }

  @override
  String toString() {
    return 'BluefinDecryptxP2pe ' + _utility.struct.jsonify(toJSON());
  }
}

typedef SDK = BluefinDecryptxP2peSDK;
