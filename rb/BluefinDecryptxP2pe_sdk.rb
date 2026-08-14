# BluefinDecryptxP2pe SDK

require_relative 'utility/struct/voxgig_struct'
require_relative 'core/utility_type'
require_relative 'core/spec'
require_relative 'core/helpers'

# Load utility registration
require_relative 'utility/register'

# Load config and features
require_relative 'config'
require_relative 'feature/base_feature'
require_relative 'features'

# Load typed models (Struct value objects).
require_relative 'BluefinDecryptxP2pe_types'


class BluefinDecryptxP2peSDK
  attr_accessor :mode, :features, :options

  def initialize(options = {})
    @mode = "live"
    @features = []
    @options = nil

    utility = BluefinDecryptxP2peUtility.new
    @_utility = utility

    config = BluefinDecryptxP2peConfig.shared_config

    @_rootctx = utility.make_context.call({
      "client" => self,
      "utility" => utility,
      "config" => config,
      "options" => options || {},
      "shared" => {},
    }, nil)

    @options = utility.make_options.call(@_rootctx)

    if VoxgigStruct.getpath(@options, "feature.test.active") == true
      @mode = "test"
    end

    @_rootctx.options = @options

    # Add features in the resolved order (make_options puts an explicit array
    # order first, else defaults to test-first). Ordering matters: the `test`
    # feature installs the base mock transport and the transport features
    # (retry/cache/netsim/proxy/ratelimit) wrap whatever is current, so `test`
    # must be added before them to sit at the base of the chain.
    feature_opts = BluefinDecryptxP2peHelpers.to_map(VoxgigStruct.getprop(@options, "feature"))
    if feature_opts
      featureorder = VoxgigStruct.getpath(@options, "__derived__.featureorder")
      if featureorder.is_a?(Array)
        featureorder.each do |fname|
          fopts = BluefinDecryptxP2peHelpers.to_map(feature_opts[fname])
          if fopts && fopts["active"] == true
            utility.feature_add.call(@_rootctx, BluefinDecryptxP2peFeatures.make_feature(fname))
          end
        end
      end
    end

    # Add extension features.
    extend_val = VoxgigStruct.getprop(@options, "extend")
    if extend_val.is_a?(Array)
      extend_val.each do |f|
        if f.respond_to?(:get_name)
          utility.feature_add.call(@_rootctx, f)
        end
      end
    end

    # Initialize features.
    @features.each do |f|
      utility.feature_init.call(@_rootctx, f)
    end

    utility.feature_hook.call(@_rootctx, "PostConstruct")
  end

  def options_map
    out = VoxgigStruct.clone(@options)
    out.is_a?(Hash) ? out : {}
  end

  def get_utility
    BluefinDecryptxP2peUtility.copy(@_utility)
  end

  def get_root_ctx
    @_rootctx
  end

  def prepare(fetchargs = {})
    utility = @_utility
    fetchargs ||= {}

    ctrl = BluefinDecryptxP2peHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "prepare",
      "ctrl" => ctrl,
    }, @_rootctx)

    opts = @options
    path = VoxgigStruct.getprop(fetchargs, "path") || ""
    path = "" unless path.is_a?(String)
    method_val = VoxgigStruct.getprop(fetchargs, "method") || "GET"
    method_val = "GET" unless method_val.is_a?(String)
    params = BluefinDecryptxP2peHelpers.to_map(VoxgigStruct.getprop(fetchargs, "params")) || {}
    query = BluefinDecryptxP2peHelpers.to_map(VoxgigStruct.getprop(fetchargs, "query")) || {}
    headers = utility.prepare_headers.call(ctx)

    base = VoxgigStruct.getprop(opts, "base") || ""
    base = "" unless base.is_a?(String)
    prefix = VoxgigStruct.getprop(opts, "prefix") || ""
    prefix = "" unless prefix.is_a?(String)
    suffix = VoxgigStruct.getprop(opts, "suffix") || ""
    suffix = "" unless suffix.is_a?(String)

    ctx.spec = BluefinDecryptxP2peSpec.new({
      "base" => base, "prefix" => prefix, "suffix" => suffix,
      "path" => path, "method" => method_val,
      "params" => params, "query" => query, "headers" => headers,
      "body" => VoxgigStruct.getprop(fetchargs, "body"),
      "step" => "start",
    })

    # Merge user-provided headers.
    uh = VoxgigStruct.getprop(fetchargs, "headers")
    if uh.is_a?(Hash)
      uh.each { |k, v| ctx.spec.headers[k] = v }
    end

    _, err = utility.prepare_auth.call(ctx)
    raise err if err

    # make_fetch_def returns a (fetchdef, err) tuple; destructure it and
    # return just the fetchdef Hash (raising on error) so callers — including
    # direct(), which indexes fetchdef["url"] — receive a Hash, mirroring the
    # ts/py prepare().
    fetchdef, fd_err = utility.make_fetch_def.call(ctx)
    raise fd_err if fd_err

    fetchdef
  end

  # Raw endpoint access is operator-controllable, like every entity op.
  # Blocking it means denying BOTH the 'direct' and 'graphql' tokens, since
  # either one reaches the same endpoint.
  def direct(fetchargs = {})
    return op_denied("direct") unless op_allowed?("direct")

    raw_request(fetchargs)
  end

  # Is this raw-access op permitted by the SDK's allow.op option?
  def op_allowed?(op)
    allow_op = VoxgigStruct.getpath(@options, "allow.op")
    allow_op.is_a?(String) && allow_op.include?(op)
  end

  def op_denied(op)
    allow_op = VoxgigStruct.getpath(@options, "allow.op")
    {
      "ok" => false,
      "err" => BluefinDecryptxP2peError.new(
        "#{op}_allow",
        "BluefinDecryptxP2peSDK: #{op}: operation not allowed by" \
        " SDK option allow.op value: \"#{allow_op}\""),
    }
  end

  # Ungated request path shared by direct and graphql, each of which checks
  # its own allow.op token first. Separate, rather than a flag on fetchargs:
  # a caller-supplied marker would let anyone opt straight back out of the
  # gate by passing it.
  def raw_request(fetchargs = {})
    utility = @_utility

    # direct() is the raw-HTTP escape hatch: it always returns a result hash
    # ({ "ok" => ..., ... }) and never raises. prepare() raises on error, so
    # trap that and surface it in the hash.
    begin
      fetchdef = prepare(fetchargs)
    rescue BluefinDecryptxP2peError => err
      return { "ok" => false, "err" => err }
    end

    fetchargs ||= {}
    ctrl = BluefinDecryptxP2peHelpers.to_map(VoxgigStruct.getprop(fetchargs, "ctrl")) || {}

    ctx = utility.make_context.call({
      "opname" => "direct",
      "ctrl" => ctrl,
    }, @_rootctx)

    url = fetchdef["url"] || ""
    fetched, fetch_err = utility.fetcher.call(ctx, url, fetchdef)

    return { "ok" => false, "err" => fetch_err } if fetch_err

    if fetched.nil?
      return {
        "ok" => false,
        "err" => ctx.make_error("direct_no_response", "response: undefined"),
      }
    end

    if fetched.is_a?(Hash)
      status = BluefinDecryptxP2peHelpers.to_int(VoxgigStruct.getprop(fetched, "status"))
      headers = VoxgigStruct.getprop(fetched, "headers") || {}

      # No-body responses (204, 304) and explicit zero content-length must
      # skip JSON parsing — calling json() on an empty body errors.
      content_length = headers.is_a?(Hash) ? headers["content-length"] : nil
      no_body = status == 204 || status == 304 || content_length.to_s == "0"

      json_data = nil
      unless no_body
        jf = VoxgigStruct.getprop(fetched, "json")
        if jf.is_a?(Proc)
          begin
            json_data = jf.call
          rescue StandardError
            # Non-JSON body — leave data nil, keep status/headers.
            json_data = nil
          end
        end
      end

      return {
        "ok" => status >= 200 && status < 300,
        "status" => status,
        "headers" => headers,
        "data" => json_data,
      }
    end

    return {
      "ok" => false,
      "err" => ctx.make_error("direct_invalid", "invalid response type"),
    }
  end

  # Raw GraphQL access: the pressure valve that makes the generated surface's
  # deliberate omissions (per-call selection sets, typed filter builders,
  # batching, subscriptions) livable — the whole schema stays reachable.
  #
  # Thin wrapper over the same prepare/fetch path direct uses, with the one
  # thing raw direct cannot do for GraphQL: a GraphQL failure rides HTTP 200
  # as a top-level `errors` array, so status alone would report a failed
  # query as ok.
  #
  # NOTE: like direct, this bypasses the feature pipeline — no retry,
  # ratelimit or paging features apply.
  def graphql(query, variables = nil, ctrl = nil)
    return op_denied("graphql") unless op_allowed?("graphql")

    res = raw_request({
      "method" => "POST",
      "headers" => { "content-type" => "application/json" },
      "body" => { "query" => query, "variables" => variables || {} },
      "ctrl" => ctrl || {},
    })

    # Errors are read BEFORE any status check: a GraphQL parse or validation
    # failure comes back as HTTP 400 carrying the standard { errors: [...] }
    # body, and the raw path represents a non-2xx as ok:false with no err —
    # so returning early on status would discard the server's own
    # diagnostics, which are the only useful part of that response.
    errors = VoxgigStruct.getpath(res, "data.errors")

    if errors.is_a?(Array) && !errors.empty?
      first = errors[0].is_a?(Hash) ? errors[0] : {}
      msg = first["message"]
      msg = "graphql error" if msg.nil? || msg.to_s.empty?
      res["ok"] = false
      res["err"] = BluefinDecryptxP2peError.new(
        "graphql_error", "BluefinDecryptxP2peSDK: graphql: #{msg}")
      res["graphql"] = errors
    end

    res
  end


  # Canonical facade: client.Attestation.list / client.Attestation.load({ "id" => ... })
  def Attestation(data = nil)
    require_relative 'entity/attestation_entity'
    AttestationEntity.new(self, data)
  end


  # Canonical facade: client.Client.list / client.Client.load({ "id" => ... })
  def Client(data = nil)
    require_relative 'entity/client_entity'
    ClientEntity.new(self, data)
  end


  # Canonical facade: client.CreateResult.list / client.CreateResult.load({ "id" => ... })
  def CreateResult(data = nil)
    require_relative 'entity/create_result_entity'
    CreateResultEntity.new(self, data)
  end


  # Canonical facade: client.Decryption.list / client.Decryption.load({ "id" => ... })
  def Decryption(data = nil)
    require_relative 'entity/decryption_entity'
    DecryptionEntity.new(self, data)
  end


  # Canonical facade: client.Device.list / client.Device.load({ "id" => ... })
  def Device(data = nil)
    require_relative 'entity/device_entity'
    DeviceEntity.new(self, data)
  end


  # Canonical facade: client.DeviceBuild.list / client.DeviceBuild.load({ "id" => ... })
  def DeviceBuild(data = nil)
    require_relative 'entity/device_build_entity'
    DeviceBuildEntity.new(self, data)
  end


  # Canonical facade: client.DeviceCustodyDetail.list / client.DeviceCustodyDetail.load({ "id" => ... })
  def DeviceCustodyDetail(data = nil)
    require_relative 'entity/device_custody_detail_entity'
    DeviceCustodyDetailEntity.new(self, data)
  end


  # Canonical facade: client.DeviceCustodyList.list / client.DeviceCustodyList.load({ "id" => ... })
  def DeviceCustodyList(data = nil)
    require_relative 'entity/device_custody_list_entity'
    DeviceCustodyListEntity.new(self, data)
  end


  # Canonical facade: client.DeviceList.list / client.DeviceList.load({ "id" => ... })
  def DeviceList(data = nil)
    require_relative 'entity/device_list_entity'
    DeviceListEntity.new(self, data)
  end


  # Canonical facade: client.DeviceReceiveResult.list / client.DeviceReceiveResult.load({ "id" => ... })
  def DeviceReceiveResult(data = nil)
    require_relative 'entity/device_receive_result_entity'
    DeviceReceiveResultEntity.new(self, data)
  end


  # Canonical facade: client.DeviceRkiActivateResult.list / client.DeviceRkiActivateResult.load({ "id" => ... })
  def DeviceRkiActivateResult(data = nil)
    require_relative 'entity/device_rki_activate_result_entity'
    DeviceRkiActivateResultEntity.new(self, data)
  end


  # Canonical facade: client.DeviceState.list / client.DeviceState.load({ "id" => ... })
  def DeviceState(data = nil)
    require_relative 'entity/device_state_entity'
    DeviceStateEntity.new(self, data)
  end


  # Canonical facade: client.DeviceType.list / client.DeviceType.load({ "id" => ... })
  def DeviceType(data = nil)
    require_relative 'entity/device_type_entity'
    DeviceTypeEntity.new(self, data)
  end


  # Canonical facade: client.InjectKey.list / client.InjectKey.load({ "id" => ... })
  def InjectKey(data = nil)
    require_relative 'entity/inject_key_entity'
    InjectKeyEntity.new(self, data)
  end


  # Canonical facade: client.Kif.list / client.Kif.load({ "id" => ... })
  def Kif(data = nil)
    require_relative 'entity/kif_entity'
    KifEntity.new(self, data)
  end


  # Canonical facade: client.Location.list / client.Location.load({ "id" => ... })
  def Location(data = nil)
    require_relative 'entity/location_entity'
    LocationEntity.new(self, data)
  end


  # Canonical facade: client.Partner.list / client.Partner.load({ "id" => ... })
  def Partner(data = nil)
    require_relative 'entity/partner_entity'
    PartnerEntity.new(self, data)
  end


  # Canonical facade: client.Shipment.list / client.Shipment.load({ "id" => ... })
  def Shipment(data = nil)
    require_relative 'entity/shipment_entity'
    ShipmentEntity.new(self, data)
  end


  # Canonical facade: client.Success.list / client.Success.load({ "id" => ... })
  def Success(data = nil)
    require_relative 'entity/success_entity'
    SuccessEntity.new(self, data)
  end


  # Canonical facade: client.Transaction.list / client.Transaction.load({ "id" => ... })
  def Transaction(data = nil)
    require_relative 'entity/transaction_entity'
    TransactionEntity.new(self, data)
  end


  # Canonical facade: client.UpdateResult.list / client.UpdateResult.load({ "id" => ... })
  def UpdateResult(data = nil)
    require_relative 'entity/update_result_entity'
    UpdateResultEntity.new(self, data)
  end


  # Canonical facade: client.User.list / client.User.load({ "id" => ... })
  def User(data = nil)
    require_relative 'entity/user_entity'
    UserEntity.new(self, data)
  end



  def self.test(testopts = nil, sdkopts = nil)
    sdkopts = sdkopts || {}
    sdkopts = VoxgigStruct.clone(sdkopts)
    sdkopts = {} unless sdkopts.is_a?(Hash)

    testopts = testopts || {}
    testopts = VoxgigStruct.clone(testopts)
    testopts = {} unless testopts.is_a?(Hash)
    testopts["active"] = true

    VoxgigStruct.setpath(sdkopts, "feature.test", testopts)

    sdk = BluefinDecryptxP2peSDK.new(sdkopts)
    sdk.mode = "test"
    sdk
  end
end
