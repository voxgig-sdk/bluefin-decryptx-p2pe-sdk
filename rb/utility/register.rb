# BluefinDecryptxP2pe SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

BluefinDecryptxP2peUtility.registrar = ->(u) {
  u.clean = BluefinDecryptxP2peUtilities::Clean
  u.done = BluefinDecryptxP2peUtilities::Done
  u.make_error = BluefinDecryptxP2peUtilities::MakeError
  u.feature_add = BluefinDecryptxP2peUtilities::FeatureAdd
  u.feature_hook = BluefinDecryptxP2peUtilities::FeatureHook
  u.feature_init = BluefinDecryptxP2peUtilities::FeatureInit
  u.fetcher = BluefinDecryptxP2peUtilities::Fetcher
  u.make_fetch_def = BluefinDecryptxP2peUtilities::MakeFetchDef
  u.make_context = BluefinDecryptxP2peUtilities::MakeContext
  u.make_options = BluefinDecryptxP2peUtilities::MakeOptions
  u.make_request = BluefinDecryptxP2peUtilities::MakeRequest
  u.make_response = BluefinDecryptxP2peUtilities::MakeResponse
  u.make_result = BluefinDecryptxP2peUtilities::MakeResult
  u.make_point = BluefinDecryptxP2peUtilities::MakePoint
  u.make_spec = BluefinDecryptxP2peUtilities::MakeSpec
  u.make_url = BluefinDecryptxP2peUtilities::MakeUrl
  u.param = BluefinDecryptxP2peUtilities::Param
  u.prepare_auth = BluefinDecryptxP2peUtilities::PrepareAuth
  u.prepare_body = BluefinDecryptxP2peUtilities::PrepareBody
  u.prepare_headers = BluefinDecryptxP2peUtilities::PrepareHeaders
  u.prepare_method = BluefinDecryptxP2peUtilities::PrepareMethod
  u.prepare_params = BluefinDecryptxP2peUtilities::PrepareParams
  u.prepare_path = BluefinDecryptxP2peUtilities::PreparePath
  u.prepare_query = BluefinDecryptxP2peUtilities::PrepareQuery
  u.result_basic = BluefinDecryptxP2peUtilities::ResultBasic
  u.result_body = BluefinDecryptxP2peUtilities::ResultBody
  u.result_headers = BluefinDecryptxP2peUtilities::ResultHeaders
  u.transform_request = BluefinDecryptxP2peUtilities::TransformRequest
  u.transform_response = BluefinDecryptxP2peUtilities::TransformResponse
}
