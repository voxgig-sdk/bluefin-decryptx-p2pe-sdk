// BluefinDecryptxP2peSDK client (generated — mirrors the go/rust Main fragment).

const std = @import("std");
const vs = @import("voxgig-struct");
const h = @import("helpers.zig");
const errmod = @import("error.zig");
const types = @import("types.zig");
const ctxmod = @import("context.zig");
const utility_mod = @import("utility.zig");
const spec_mod = @import("spec.zig");
const config = @import("config.zig");

const Value = h.Value;
const E = errmod.E;
const Context = ctxmod.Context;
const CtxSpec = ctxmod.CtxSpec;
const Utility = utility_mod.Utility;
const Feature = types.Feature;
const OpResult = types.OpResult;
const Spec = spec_mod.Spec;

pub const BluefinDecryptxP2peSDK = struct {
    mode: []const u8 = "live",
    options: Value = .{ .null = {} },
    // NOT named `utility`, and NOT a name `zigVarName` can produce.
    //
    // Entity accessors are generated as methods on this same struct
    // (MainEntity_zig), so an API with an entity called `utility` collided
    // twice: Zig rejects a local binding that shadows the declaration, and
    // `sdk.utility` resolves to the FIELD, which made the generated accessor
    // unreachable.
    //
    // `zigVarName` lowercases every name it is given, so a field spelling with
    // an uppercase letter is one no entity name can ever reach - which is why
    // this is `sdkUtility` and not, say, `util_rt`, a name an entity called
    // `util-rt` would map straight onto. The public reader is `get_utility()`,
    // so this field is internal and free to be spelled this way.
    sdkUtility: *Utility,
    features: std.ArrayList(Feature),
    rootctx: ?*Context = null,

    pub fn new(options: Value) *BluefinDecryptxP2peSDK {
        const sdk = h.A().create(BluefinDecryptxP2peSDK) catch unreachable;
        sdk.* = .{
            .mode = "live",
            .options = h.vnull(),
            .sdkUtility = Utility.new(),
            .features = std.ArrayList(Feature).init(h.A()),
            .rootctx = null,
        };

        // The process-wide config (sdkgen rung L2): read-only on the request
        // path, so every client shares one rather than rebuilding it.
        const cfg = config.shared_config();

        const rootctx = sdk.sdkUtility.make_context(CtxSpec{
            .client = sdk,
            .utility = sdk.sdkUtility,
            .config = cfg,
            .options = options,
            .shared = h.omap(),
        }, null);

        const opts = sdk.sdkUtility.make_options(rootctx);
        sdk.options = opts;

        if (h.veq(h.getpath(&.{ "feature", "test", "active" }, opts), h.vbool(true))) {
            sdk.mode = "test";
        }

        rootctx.options = opts;
        sdk.rootctx = rootctx;

        // Add features in the resolved order (make_options puts an explicit
        // list order first, else defaults to test-first). Ordering matters:
        // the `test` feature installs the base mock transport and the
        // transport features (retry/cache/netsim/proxy/ratelimit) wrap
        // whatever is current, so `test` must be added before them to sit at
        // the base of the transport wrapper chain.
        const feature_opts = h.to_map(h.getp(opts, "feature"));
        const feature_order = h.getpath(&.{ "__derived__", "featureorder" }, opts);
        if (feature_opts == .object and feature_order == .array) {
            for (feature_order.array.data.items) |fname_v| {
                if (fname_v != .string) continue;
                const fname = fname_v.string;
                const fopts = h.getp(feature_opts, fname);
                if (fopts == .object) {
                    if (h.get_bool(fopts, "active") orelse false) {
                        sdk.sdkUtility.feature_add(rootctx, config.make_feature(fname));
                    }
                }
            }
        }

        // Initialize features.
        var snap = std.ArrayList(Feature).init(h.A());
        for (sdk.features.items) |f| snap.append(f) catch {};
        for (snap.items) |f| sdk.sdkUtility.feature_init(rootctx, f);

        sdk.sdkUtility.feature_hook(rootctx, "PostConstruct");

        return sdk;
    }

    pub fn options_map(self: *BluefinDecryptxP2peSDK) Value {
        return h.clone(self.options);
    }

    pub fn get_utility(self: *BluefinDecryptxP2peSDK) *Utility {
        return Utility.copy(self.sdkUtility);
    }

    pub fn get_root_ctx(self: *BluefinDecryptxP2peSDK) *Context {
        return self.rootctx orelse unreachable;
    }

    pub fn prepare(self: *BluefinDecryptxP2peSDK, fetchargs_in: Value) E!Value {

        const fetchargs: Value = switch (fetchargs_in) {
            .object => fetchargs_in,
            else => h.omap(),
        };

        const ctrl: Value = switch (h.to_map(h.getp(fetchargs, "ctrl"))) {
            .object => h.to_map(h.getp(fetchargs, "ctrl")),
            else => h.omap(),
        };

        const ctx = self.sdkUtility.make_context(CtxSpec{
            .opname = "prepare",
            .ctrl = ctrl,
        }, self.get_root_ctx());

        const options = self.options;

        const path = h.get_str(fetchargs, "path") orelse "";
        const method: []const u8 = blk: {
            const m = h.get_str(fetchargs, "method");
            break :blk if (m) |mm| (if (mm.len == 0) "GET" else mm) else "GET";
        };

        const params: Value = switch (h.to_map(h.getp(fetchargs, "params"))) {
            .object => h.to_map(h.getp(fetchargs, "params")),
            else => h.omap(),
        };
        const query: Value = switch (h.to_map(h.getp(fetchargs, "query"))) {
            .object => h.to_map(h.getp(fetchargs, "query")),
            else => h.omap(),
        };

        const headers = self.sdkUtility.prepare_headers(ctx);

        const specmap = h.jo(&.{
            .{ "base", h.getp(options, "base") },
            .{ "prefix", h.getp(options, "prefix") },
            .{ "suffix", h.getp(options, "suffix") },
            .{ "path", h.vstr(path) },
            .{ "method", h.vstr(method) },
            .{ "params", params },
            .{ "query", query },
            .{ "headers", headers },
            .{ "body", h.getp(fetchargs, "body") },
            .{ "step", h.vstr("start") },
        });
        const spec = Spec.make(specmap);
        ctx.spec = spec;

        // Merge user-provided headers.
        if (h.getp(fetchargs, "headers") == .object) {
            const uh = h.getp(fetchargs, "headers");
            var it = uh.object.iterator();
            while (it.next()) |kv| h.setp(spec.headers, kv.key_ptr.*, kv.value_ptr.*);
        }

        _ = try self.sdkUtility.prepare_auth(ctx);

        return self.sdkUtility.make_fetch_def(ctx);
    }

    // Raw endpoint access is operator-controllable, like every entity op.
    // Blocking it means denying BOTH the 'direct' and 'graphql' tokens,
    // since either one reaches the same endpoint.
    pub fn direct(self: *BluefinDecryptxP2peSDK, fetchargs_in: Value) Value {
        if (!self.op_allowed("direct")) return self.op_denied("direct");

        return self.raw_request(fetchargs_in);
    }

    // Is this raw-access op permitted by the SDK's allow.op option?
    fn op_allowed(self: *BluefinDecryptxP2peSDK, op: []const u8) bool {
        const allow: []const u8 = switch (h.getpath(&.{ "allow", "op" }, self.options)) {
            .string => |s| s,
            else => "",
        };
        return std.mem.indexOf(u8, allow, op) != null;
    }

    fn op_denied(self: *BluefinDecryptxP2peSDK, op: []const u8) Value {
        const allow: []const u8 = switch (h.getpath(&.{ "allow", "op" }, self.options)) {
            .string => |s| s,
            else => "",
        };
        const msg = std.fmt.allocPrint(h.A(),
            "BluefinDecryptxP2peSDK: {s}: operation not allowed by" ++
            " SDK option allow.op value: \"{s}\"", .{ op, allow }) catch "";
        return h.jo(&.{
            .{ "ok", h.vbool(false) },
            .{ "err", h.vstr(msg) },
        });
    }

    // Ungated request path shared by direct and graphql, each of which checks
    // its own allow.op token first. Private, rather than a flag on fetchargs:
    // a caller-supplied marker would let anyone opt straight back out of the
    // gate by passing it.
    fn raw_request(self: *BluefinDecryptxP2peSDK, fetchargs_in: Value) Value {

        const fetchdef = self.prepare(fetchargs_in) catch {
            return h.jo(&.{
                .{ "ok", h.vbool(false) },
                .{ "err", h.vstr(if (self.rootctx.?.pending_err) |e| e.msg else "prepare failed") },
            });
        };

        const fetchargs: Value = switch (fetchargs_in) {
            .object => fetchargs_in,
            else => h.omap(),
        };
        const ctrl: Value = switch (h.to_map(h.getp(fetchargs, "ctrl"))) {
            .object => h.to_map(h.getp(fetchargs, "ctrl")),
            else => h.omap(),
        };

        const ctx = self.sdkUtility.make_context(CtxSpec{
            .opname = "direct",
            .ctrl = ctrl,
        }, self.get_root_ctx());

        const url = h.get_str(fetchdef, "url") orelse "";
        const fetched = self.sdkUtility.fetch(ctx, url, fetchdef) catch {
            return h.jo(&.{
                .{ "ok", h.vbool(false) },
                .{ "err", h.vstr(if (ctx.pending_err) |e| e.msg else "fetch failed") },
            });
        };

        if (h.is_noval(fetched)) {
            return h.jo(&.{
                .{ "ok", h.vbool(false) },
                .{ "err", h.vstr("response: undefined") },
            });
        }

        if (fetched == .object) {
            const status = h.to_int(h.getp(fetched, "status"));
            const headers = h.getp(fetched, "headers");

            const content_length: []const u8 = switch (h.getp(headers, "content-length")) {
                .string => |s| s,
                .integer => |n| std.fmt.allocPrint(h.A(), "{d}", .{n}) catch "",
                else => "",
            };
            const no_body = status == 204 or status == 304 or std.mem.eql(u8, content_length, "0");

            const json_data: Value = if (no_body) h.vnull() else blk: {
                const jf = h.getp(fetched, "json");
                break :blk if (jf == .function) h.call_json(jf) else h.vnull();
            };

            return h.jo(&.{
                .{ "ok", h.vbool(200 <= status and status < 300) },
                .{ "status", h.vnum(status) },
                .{ "headers", headers },
                .{ "data", json_data },
            });
        }

        return h.jo(&.{
            .{ "ok", h.vbool(false) },
            .{ "err", h.vstr("invalid response type") },
        });
    }

    // Raw GraphQL access: the pressure valve that makes the generated
    // surface's deliberate omissions (per-call selection sets, typed filter
    // builders, batching, subscriptions) livable — the whole schema stays
    // reachable.
    //
    // Thin wrapper over the same prepare/fetch path direct uses, with the one
    // thing raw direct cannot do for GraphQL: a GraphQL failure rides HTTP
    // 200 as a top-level `errors` array, so status alone would report a
    // failed query as ok.
    //
    // NOTE: like direct, this bypasses the feature pipeline — no retry,
    // ratelimit or paging features apply.
    pub fn graphql(
        self: *BluefinDecryptxP2peSDK, query: []const u8, variables: Value, ctrl: Value,
    ) Value {
        if (!self.op_allowed("graphql")) return self.op_denied("graphql");

        const vars: Value = switch (variables) {
            .object => variables,
            else => h.omap(),
        };
        const ctl: Value = switch (ctrl) {
            .object => ctrl,
            else => h.omap(),
        };

        const res = self.raw_request(h.jo(&.{
            .{ "method", h.vstr("POST") },
            .{ "headers", h.jo(&.{.{ "content-type", h.vstr(utility_mod.GRAPHQL_CONTENT_TYPE) }}) },
            .{ "body", h.jo(&.{ .{ "query", h.vstr(query) }, .{ "variables", vars } }) },
            .{ "ctrl", ctl },
        }));

        if (res != .object) return res;

        // Errors are read BEFORE any status check: a GraphQL parse or
        // validation failure comes back as HTTP 400 carrying the standard
        // { errors: [...] } body, and the raw path represents a non-2xx as
        // ok:false with no err — so returning early on status would discard
        // the server's own diagnostics, which are the only useful part of
        // that response.
        const errors = h.getp(h.getp(res, "data"), "errors");

        if (errors == .array and 0 < errors.array.data.items.len) {
            const first = errors.array.data.items[0];
            const m: []const u8 = switch (h.getp(first, "message")) {
                .string => |x| if (x.len == 0) "graphql error" else x,
                else => "graphql error",
            };
            const msg = std.fmt.allocPrint(h.A(),
                "BluefinDecryptxP2peSDK: graphql: {s}", .{m}) catch "";
            h.setp(res, "ok", h.vbool(false));
            h.setp(res, "err", h.vstr(msg));
            h.setp(res, "graphql", errors);
        }

        return res;
    }


    /// Attestation entity bound to this client.
    pub fn attestation(self: *@This(), entopts: Value) *@import("../entity/attestation.zig").AttestationEntity {
        return @import("../entity/attestation.zig").AttestationEntity.new(self, entopts);
    }

    /// Client entity bound to this client.
    pub fn client(self: *@This(), entopts: Value) *@import("../entity/client.zig").ClientEntity {
        return @import("../entity/client.zig").ClientEntity.new(self, entopts);
    }

    /// CreateResult entity bound to this client.
    pub fn create_result(self: *@This(), entopts: Value) *@import("../entity/create_result.zig").CreateResultEntity {
        return @import("../entity/create_result.zig").CreateResultEntity.new(self, entopts);
    }

    /// Decryption entity bound to this client.
    pub fn decryption(self: *@This(), entopts: Value) *@import("../entity/decryption.zig").DecryptionEntity {
        return @import("../entity/decryption.zig").DecryptionEntity.new(self, entopts);
    }

    /// Device entity bound to this client.
    pub fn device(self: *@This(), entopts: Value) *@import("../entity/device.zig").DeviceEntity {
        return @import("../entity/device.zig").DeviceEntity.new(self, entopts);
    }

    /// DeviceBuild entity bound to this client.
    pub fn device_build(self: *@This(), entopts: Value) *@import("../entity/device_build.zig").DeviceBuildEntity {
        return @import("../entity/device_build.zig").DeviceBuildEntity.new(self, entopts);
    }

    /// DeviceCustodyDetail entity bound to this client.
    pub fn device_custody_detail(self: *@This(), entopts: Value) *@import("../entity/device_custody_detail.zig").DeviceCustodyDetailEntity {
        return @import("../entity/device_custody_detail.zig").DeviceCustodyDetailEntity.new(self, entopts);
    }

    /// DeviceCustodyList entity bound to this client.
    pub fn device_custody_list(self: *@This(), entopts: Value) *@import("../entity/device_custody_list.zig").DeviceCustodyListEntity {
        return @import("../entity/device_custody_list.zig").DeviceCustodyListEntity.new(self, entopts);
    }

    /// DeviceList entity bound to this client.
    pub fn device_list(self: *@This(), entopts: Value) *@import("../entity/device_list.zig").DeviceListEntity {
        return @import("../entity/device_list.zig").DeviceListEntity.new(self, entopts);
    }

    /// DeviceReceiveResult entity bound to this client.
    pub fn device_receive_result(self: *@This(), entopts: Value) *@import("../entity/device_receive_result.zig").DeviceReceiveResultEntity {
        return @import("../entity/device_receive_result.zig").DeviceReceiveResultEntity.new(self, entopts);
    }

    /// DeviceRkiActivateResult entity bound to this client.
    pub fn device_rki_activate_result(self: *@This(), entopts: Value) *@import("../entity/device_rki_activate_result.zig").DeviceRkiActivateResultEntity {
        return @import("../entity/device_rki_activate_result.zig").DeviceRkiActivateResultEntity.new(self, entopts);
    }

    /// DeviceState entity bound to this client.
    pub fn device_state(self: *@This(), entopts: Value) *@import("../entity/device_state.zig").DeviceStateEntity {
        return @import("../entity/device_state.zig").DeviceStateEntity.new(self, entopts);
    }

    /// DeviceType entity bound to this client.
    pub fn device_type(self: *@This(), entopts: Value) *@import("../entity/device_type.zig").DeviceTypeEntity {
        return @import("../entity/device_type.zig").DeviceTypeEntity.new(self, entopts);
    }

    /// InjectKey entity bound to this client.
    pub fn inject_key(self: *@This(), entopts: Value) *@import("../entity/inject_key.zig").InjectKeyEntity {
        return @import("../entity/inject_key.zig").InjectKeyEntity.new(self, entopts);
    }

    /// Kif entity bound to this client.
    pub fn kif(self: *@This(), entopts: Value) *@import("../entity/kif.zig").KifEntity {
        return @import("../entity/kif.zig").KifEntity.new(self, entopts);
    }

    /// Location entity bound to this client.
    pub fn location(self: *@This(), entopts: Value) *@import("../entity/location.zig").LocationEntity {
        return @import("../entity/location.zig").LocationEntity.new(self, entopts);
    }

    /// Partner entity bound to this client.
    pub fn partner(self: *@This(), entopts: Value) *@import("../entity/partner.zig").PartnerEntity {
        return @import("../entity/partner.zig").PartnerEntity.new(self, entopts);
    }

    /// Shipment entity bound to this client.
    pub fn shipment(self: *@This(), entopts: Value) *@import("../entity/shipment.zig").ShipmentEntity {
        return @import("../entity/shipment.zig").ShipmentEntity.new(self, entopts);
    }

    /// Success entity bound to this client.
    pub fn success(self: *@This(), entopts: Value) *@import("../entity/success.zig").SuccessEntity {
        return @import("../entity/success.zig").SuccessEntity.new(self, entopts);
    }

    /// Transaction entity bound to this client.
    pub fn transaction(self: *@This(), entopts: Value) *@import("../entity/transaction.zig").TransactionEntity {
        return @import("../entity/transaction.zig").TransactionEntity.new(self, entopts);
    }

    /// UpdateResult entity bound to this client.
    pub fn update_result(self: *@This(), entopts: Value) *@import("../entity/update_result.zig").UpdateResultEntity {
        return @import("../entity/update_result.zig").UpdateResultEntity.new(self, entopts);
    }

    /// User entity bound to this client.
    pub fn user(self: *@This(), entopts: Value) *@import("../entity/user.zig").UserEntity {
        return @import("../entity/user.zig").UserEntity.new(self, entopts);
    }

};

pub fn test_sdk(testopts_in: Value, sdkopts_in: Value) *BluefinDecryptxP2peSDK {
    const sdkopts: Value = switch (sdkopts_in) {
        .object => h.clone(sdkopts_in),
        else => h.omap(),
    };

    const testopts: Value = switch (testopts_in) {
        .object => h.clone(testopts_in),
        else => h.omap(),
    };
    h.setp(testopts, "active", h.vbool(true));

    // set_path mutates `sdkopts` in place; keep the ROOT (gotcha #8 — do not
    // rebind to the return of setpath).
    h.setpath(sdkopts, &.{ "feature", "test" }, testopts);

    const sdk = BluefinDecryptxP2peSDK.new(sdkopts);
    sdk.mode = "test";

    return sdk;
}
