<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

BluefinDecryptxP2peUtility::setRegistrar(function (BluefinDecryptxP2peUtility $u): void {
    $u->clean = [BluefinDecryptxP2peClean::class, 'call'];
    $u->done = [BluefinDecryptxP2peDone::class, 'call'];
    $u->make_error = [BluefinDecryptxP2peMakeError::class, 'call'];
    $u->feature_add = [BluefinDecryptxP2peFeatureAdd::class, 'call'];
    $u->feature_hook = [BluefinDecryptxP2peFeatureHook::class, 'call'];
    $u->feature_init = [BluefinDecryptxP2peFeatureInit::class, 'call'];
    $u->fetcher = [BluefinDecryptxP2peFetcher::class, 'call'];
    $u->make_fetch_def = [BluefinDecryptxP2peMakeFetchDef::class, 'call'];
    $u->make_context = [BluefinDecryptxP2peMakeContext::class, 'call'];
    $u->make_options = [BluefinDecryptxP2peMakeOptions::class, 'call'];
    $u->make_request = [BluefinDecryptxP2peMakeRequest::class, 'call'];
    $u->make_response = [BluefinDecryptxP2peMakeResponse::class, 'call'];
    $u->make_result = [BluefinDecryptxP2peMakeResult::class, 'call'];
    $u->make_point = [BluefinDecryptxP2peMakePoint::class, 'call'];
    $u->make_spec = [BluefinDecryptxP2peMakeSpec::class, 'call'];
    $u->make_url = [BluefinDecryptxP2peMakeUrl::class, 'call'];
    $u->param = [BluefinDecryptxP2peParam::class, 'call'];
    $u->prepare_auth = [BluefinDecryptxP2pePrepareAuth::class, 'call'];
    $u->prepare_body = [BluefinDecryptxP2pePrepareBody::class, 'call'];
    $u->prepare_headers = [BluefinDecryptxP2pePrepareHeaders::class, 'call'];
    $u->prepare_method = [BluefinDecryptxP2pePrepareMethod::class, 'call'];
    $u->prepare_params = [BluefinDecryptxP2pePrepareParams::class, 'call'];
    $u->prepare_path = [BluefinDecryptxP2pePreparePath::class, 'call'];
    $u->prepare_query = [BluefinDecryptxP2pePrepareQuery::class, 'call'];
    $u->result_basic = [BluefinDecryptxP2peResultBasic::class, 'call'];
    $u->result_body = [BluefinDecryptxP2peResultBody::class, 'call'];
    $u->result_headers = [BluefinDecryptxP2peResultHeaders::class, 'call'];
    $u->transform_request = [BluefinDecryptxP2peTransformRequest::class, 'call'];
    $u->transform_response = [BluefinDecryptxP2peTransformResponse::class, 'call'];
});
