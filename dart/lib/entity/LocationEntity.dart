
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import '../utility/ErrUtility.dart';import '../BluefinDecryptxP2peEntityBase.dart';

// Typed models: see ../BluefinDecryptxP2peTypes.dart (Location and the per-op request/match types).
class LocationEntity extends BluefinDecryptxP2peEntityBase {
  LocationEntity(dynamic client, dynamic entopts) : super(client, entopts) {
    name = 'location';
    name_ = 'location';
    Name = 'Location';
  }

  LocationEntity make() {
    return LocationEntity(client, entopts());
  }


  /// Load a Location by match (see LocationLoadMatch in
  /// BluefinDecryptxP2peTypes.dart). Returns the entity data map (Location).
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



  /// List Location entities by match (see LocationListMatch in
  /// BluefinDecryptxP2peTypes.dart). Returns a list of Location entity instances.
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



  /// Create a Location (see LocationCreateData in
  /// BluefinDecryptxP2peTypes.dart). Returns the entity data map (Location).
  Future<dynamic> create([dynamic reqdata, dynamic ctrl]) async {
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
      'opname': 'create',
      'ctrl': ctrl ?? {},
      'match': matchVal,
      'data': dataVal,
      'reqdata': reqdata ?? {},
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
        if (null != ctx.result.resdata) {
          dataVal = ctx.result.resdata;
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




  /// Remove a Location by match (see LocationRemoveMatch in
  /// BluefinDecryptxP2peTypes.dart). Returns the entity data map (Location).
  Future<dynamic> remove([dynamic reqmatch, dynamic ctrl]) async {
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
      'opname': 'remove',
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
