
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import '../utility/ErrUtility.dart';import '../BluefinDecryptxP2peEntityBase.dart';

// Typed models: see ../BluefinDecryptxP2peTypes.dart (InjectKey and the per-op request/match types).
class InjectKeyEntity extends BluefinDecryptxP2peEntityBase {
  InjectKeyEntity(dynamic client, dynamic entopts) : super(client, entopts) {
    name = 'inject_key';
    name_ = 'inject_key';
    Name = 'InjectKey';
  }

  InjectKeyEntity make() {
    return InjectKeyEntity(client, entopts());
  }


  /// Load a InjectKey by match (see InjectKeyLoadMatch in
  /// BluefinDecryptxP2peTypes.dart). Returns the entity data map (InjectKey).
  Future<dynamic> load([dynamic reqmatch, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'load',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqmatch': reqmatch ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resmatch) {
          matchVal = ctx.result.resmatch;
        }

        if (null != ctx.result.resdata) {
          dataVal = ctx.result.resdata;
        }
      }

      final out = done(ctx);

      // An operation resolves to the ENTITY, not the raw data — the record
      // has just been absorbed into this instance and is reached through
      // data(). `done` still runs: it completes the pipeline and raises on
      // failure, and when throwing is disabled it hands back the error
      // payload, which passes through unchanged. See AGENTS.md "Entity
      // operations return ENTITIES".
      return (null != ctx.result && true == ctx.result.ok) ? this : out;
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }



  /// List InjectKey entities by match (see InjectKeyListMatch in
  /// BluefinDecryptxP2peTypes.dart). Returns a list of InjectKey entity instances.
  Future<dynamic> list([dynamic reqmatch, dynamic ctrl]) async {
    final utility = this.utility;

    final makeContext = utility.makeContext;
    final done = utility.done;
    final error = utility.makeError;
    final featureHook = utility.featureHook;
    final makePoint = utility.makePoint;
    final makeRequest = utility.makeRequest;
    final makeResponse = utility.makeResponse;
    final makeResult = utility.makeResult;
    final makeSpec = utility.makeSpec;

    dynamic fres;

    final ctx = makeContext({
      'opname': 'list',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqmatch': reqmatch ?? {},
    }, entctx);

    try {

      fres = featureHook(ctx, 'PrePoint');
      if (fres is Future) {
        await fres;
      }

      ctx.out['point'] = makePoint(ctx);
      if (iserr(ctx.out['point'])) {
        return error(ctx, ctx.out['point']);
      }


      fres = featureHook(ctx, 'PreSpec');
      if (fres is Future) {
        await fres;
      }

      ctx.out['spec'] = makeSpec(ctx);
      if (iserr(ctx.out['spec'])) {
        return error(ctx, ctx.out['spec']);
      }


      fres = featureHook(ctx, 'PreRequest');
      if (fres is Future) {
        await fres;
      }

      ctx.out['request'] = await makeRequest(ctx);
      if (iserr(ctx.out['request'])) {
        return error(ctx, ctx.out['request']);
      }


      fres = featureHook(ctx, 'PreResponse');
      if (fres is Future) {
        await fres;
      }

      ctx.out['response'] = await makeResponse(ctx);
      if (iserr(ctx.out['response'])) {
        return error(ctx, ctx.out['response']);
      }


      fres = featureHook(ctx, 'PreResult');
      if (fres is Future) {
        await fres;
      }

      ctx.out['result'] = makeResult(ctx);
      if (iserr(ctx.out['result'])) {
        return error(ctx, ctx.out['result']);
      }


      fres = featureHook(ctx, 'PreDone');
      if (fres is Future) {
        await fres;
      }

      if (null != ctx.result) {
        if (null != ctx.result.resmatch) {
          matchVal = ctx.result.resmatch;
        }
      }

      return done(ctx);
    } catch (err) {

      fres = featureHook(ctx, 'PreUnexpected');
      if (fres is Future) {
        await fres;
      }

      final uerr = unexpected(ctx, err);

      if (null != uerr) {
        throw uerr;
      } else {
        // Off-happy-path (throw disabled).
        return null;
      }
    }
  }




}
