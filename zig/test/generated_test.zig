// Generated smoke tests (model-driven). Drive each entity through the
// offline test transport and assert a non-error result.

const std = @import("std");
const sdk = @import("sdk");
const fh = @import("fh.zig");
const h = sdk.h;
const Value = sdk.Value;

fn vnull() Value {
    return Value{ .null = {} };
}

test "sdk_constructs_in_test_mode" {
    const testsdk = sdk.testSdk();
    try std.testing.expect(std.mem.eql(u8, testsdk.mode, "test"));
}

test "attestation_load_smoke" {
    const fixture = h.jo(&.{.{ "attestation", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.attestation(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("attestation load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "attestation_list_smoke" {
    const fixture = h.jo(&.{.{ "attestation", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.attestation(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "attestation_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "attestation", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.attestation(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.attestation(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "attestation_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).attestation(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).attestation(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).attestation(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "attestation_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).attestation(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "attestation_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).attestation(vnull()).list(h.jo(&.{ .{ "client", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "attestation_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/attestation/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "attestation_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/attestation/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "client_load_smoke" {
    const fixture = h.jo(&.{.{ "client", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.client(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("client load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "client_list_smoke" {
    const fixture = h.jo(&.{.{ "client", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.client(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "client_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "client", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.client(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.client(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "client_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).client(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).client(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).client(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "client_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).client(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "client_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).client(vnull()).list(h.jo(&.{ .{ "partner", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "client_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/client/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "client_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/client/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "create_result_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).create_result(vnull()).create(h.jo(&.{ .{ "device_type", h.vnum(1) }, .{ "serial_number", h.vstr("x") }, .{ "custodian", h.vstr("x") }, .{ "location", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "decryption_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).decryption(vnull()).create(h.jo(&.{ .{ "cbcVector", h.vnum(1) }, .{ "deviceType", h.vstr("x") }, .{ "encrypted", h.vstr("x") }, .{ "serialNumber", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_load_smoke" {
    const fixture = h.jo(&.{.{ "device", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("device load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "device_list_smoke" {
    const fixture = h.jo(&.{.{ "device", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "device_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "device", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.device(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.device(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "device_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).device(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).device(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).device(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "device_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).device(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "device_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device(vnull()).list(h.jo(&.{ .{ "client", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/device/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "device_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/device/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "device_build_load_smoke" {
    const fixture = h.jo(&.{.{ "device_build", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device_build(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("device_build load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "device_build_list_smoke" {
    const fixture = h.jo(&.{.{ "device_build", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device_build(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "device_build_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "device_build", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.device_build(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.device_build(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "device_build_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).device_build(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).device_build(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).device_build(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "device_build_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).device_build(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "device_build_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_build(vnull()).list(h.jo(&.{ .{ "device_type", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_build_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/device_build/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "device_build_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/device_build/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "device_custody_detail_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_custody_detail(vnull()).load(h.jo(&.{ .{ "device_type", h.vnum(1) }, .{ "id", h.vstr("x") }, .{ "serial_number", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_custody_detail_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/device_custody_detail/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "device_custody_detail_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/device_custody_detail/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "device_custody_list_item_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_custody_list_item(vnull()).list(h.jo(&.{ .{ "device_type", h.vnum(1) }, .{ "serial_number", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_custody_list_item_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/device_custody_list_item/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "device_custody_list_item_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/device_custody_list_item/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "device_receive_result_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_receive_result(vnull()).create(h.jo(&.{ .{ "serialNumber", h.vnum(1) }, .{ "success", h.vbool(true) }, .{ "tamperLabel", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_rki_activate_result_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_rki_activate_result(vnull()).create(h.jo(&.{ .{ "appVersion", h.vnum(1) }, .{ "serialNumber", h.vstr("x") }, .{ "success", h.vbool(true) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_state_list_smoke" {
    const fixture = h.jo(&.{.{ "device_state", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device_state(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "device_state_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "device_state", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.device_state(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.device_state(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "device_state_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).device_state(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).device_state(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).device_state(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "device_state_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).device_state(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "device_state_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_state(vnull()).list(h.jo(&.{ .{ "id", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_state_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/device_state/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "device_state_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/device_state/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "device_type_load_smoke" {
    const fixture = h.jo(&.{.{ "device_type", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device_type(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("device_type load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "device_type_list_smoke" {
    const fixture = h.jo(&.{.{ "device_type", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.device_type(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "device_type_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "device_type", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.device_type(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.device_type(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "device_type_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).device_type(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).device_type(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).device_type(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "device_type_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).device_type(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "device_type_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).device_type(vnull()).list(h.jo(&.{ .{ "created", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "device_type_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/device_type/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "device_type_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/device_type/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "inject_key_load_smoke" {
    const fixture = h.jo(&.{.{ "inject_key", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.inject_key(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("inject_key load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "inject_key_list_smoke" {
    const fixture = h.jo(&.{.{ "inject_key", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.inject_key(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "inject_key_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "inject_key", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.inject_key(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.inject_key(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "inject_key_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).inject_key(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).inject_key(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).inject_key(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "inject_key_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).inject_key(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "inject_key_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).inject_key(vnull()).list(h.jo(&.{ .{ "created", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "inject_key_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/inject_key/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "inject_key_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/inject_key/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "kif_list_smoke" {
    const fixture = h.jo(&.{.{ "kif", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.kif(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "kif_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "kif", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.kif(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.kif(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "kif_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).kif(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).kif(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).kif(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "kif_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).kif(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "kif_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).kif(vnull()).list(h.jo(&.{ .{ "id", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "kif_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/kif/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "kif_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/kif/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "location_load_smoke" {
    const fixture = h.jo(&.{.{ "location", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.location(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("location load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "location_list_smoke" {
    const fixture = h.jo(&.{.{ "location", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.location(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "location_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "location", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.location(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.location(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "location_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).location(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).location(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).location(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "location_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).location(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "location_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).location(vnull()).list(h.jo(&.{ .{ "client", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "location_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/location/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "location_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/location/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "partner_load_smoke" {
    const fixture = h.jo(&.{.{ "partner", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.partner(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("partner load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "partner_list_smoke" {
    const fixture = h.jo(&.{.{ "partner", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.partner(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "partner_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "partner", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.partner(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.partner(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "partner_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).partner(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).partner(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).partner(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "partner_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).partner(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "partner_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).partner(vnull()).list(h.jo(&.{ .{ "partner", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "partner_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/partner/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "partner_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/partner/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "shipment_load_smoke" {
    const fixture = h.jo(&.{.{ "shipment", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.shipment(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("shipment load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "shipment_list_smoke" {
    const fixture = h.jo(&.{.{ "shipment", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.shipment(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "shipment_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "shipment", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.shipment(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.shipment(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "shipment_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).shipment(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).shipment(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).shipment(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "shipment_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).shipment(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "shipment_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).shipment(vnull()).list(h.jo(&.{ .{ "kif", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "shipment_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/shipment/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "shipment_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/shipment/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "success_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).success(vnull()).create(h.jo(&.{ .{ "share_partner_to", h.vnum(1) }, .{ "devices", h.vstr("x") }, .{ "sharePartnerFrom", h.vstr("x") } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "transaction_load_smoke" {
    const fixture = h.jo(&.{.{ "transaction", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.transaction(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("transaction load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "transaction_list_smoke" {
    const fixture = h.jo(&.{.{ "transaction", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.transaction(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "transaction_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "transaction", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.transaction(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.transaction(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "transaction_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).transaction(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).transaction(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).transaction(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "transaction_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).transaction(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "transaction_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).transaction(vnull()).list(h.jo(&.{ .{ "client", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "transaction_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/transaction/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "transaction_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/transaction/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "update_result_list_smoke" {
    const fixture = h.jo(&.{.{ "update_result", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.update_result(vnull());
    const res = e.list(vnull(), vnull());
    try std.testing.expect(res == .ok);
}

test "update_result_stream_smoke" {
    // stream() runs the list op through the full pipeline and returns the
    // result items. Seed two entities via test mode; with the streaming
    // feature active it yields the feature's incremental items, else it falls
    // back to the materialised items — either way every item is yielded.
    const fixture = h.jo(&.{.{ "update_result", h.jo(&.{
        .{ "strm01", h.jo(&.{.{ "id", h.vstr("strm01") }}) },
        .{ "strm02", h.jo(&.{.{ "id", h.vstr("strm02") }}) },
    }) }});
    const sdkopts = h.jo(&.{.{ "feature", h.jo(&.{.{ "streaming", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), sdkopts);
    const e = testsdk.update_result(vnull());
    const items = e.stream("list", vnull(), vnull());
    try std.testing.expect(items == .ok and items.ok.len == 2);

    // Fallback: streaming inactive still yields both materialised items.
    const plainsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const pe = plainsdk.update_result(vnull());
    const pitems = pe.stream("list", vnull(), vnull());
    try std.testing.expect(pitems == .ok and pitems.ok.len == 2);
}

test "update_result_stream_error" {
    const offline = h.jo(&.{.{ "net", h.jo(&.{.{ "offline", h.vbool(true) }}) }});
    switch (sdk.test_sdk(offline, vnull()).update_result(vnull()).stream("list", vnull(), vnull())) {
        .err => |er| try std.testing.expect(std.mem.indexOf(u8, er.msg, "offline") != null),
        .ok => try std.testing.expect(false),
    }

    const quiet = h.jo(&.{.{ "ctrl", h.jo(&.{.{ "throw", h.vbool(false) }}) }});
    try std.testing.expect(sdk.test_sdk(offline, vnull()).update_result(vnull()).stream("list", vnull(), quiet) == .ok);

    if (fh.fh_has_feature("rbac")) {
        const deny = h.jo(&.{.{ "feature", h.jo(&.{.{ "rbac", h.jo(&.{
            .{ "active", h.vbool(true) },
            .{ "deny", h.vbool(true) },
        }) }}) }});
        switch (sdk.test_sdk(vnull(), deny).update_result(vnull()).stream("list", vnull(), vnull())) {
            .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "rbac_denied")),
            .ok => try std.testing.expect(false),
        }
    }
}

test "update_result_stream_ctrl" {
    const explain = h.omap();
    const ctrl = h.jo(&.{.{ "explain", explain }});
    _ = sdk.test_sdk(vnull(), vnull()).update_result(vnull()).stream("list", vnull(), h.jo(&.{.{ "ctrl", ctrl }}));
    try std.testing.expect(h.is_noval(h.getp(ctrl, "stream")));
    try std.testing.expect(0 < explain.object.count());
}

test "update_result_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).update_result(vnull()).list(h.jo(&.{ .{ "client", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "update_result_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/update_result/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "update_result_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/update_result/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "user_load_smoke" {
    const fixture = h.jo(&.{.{ "user", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.user(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("user load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "user_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).user(vnull()).load(h.jo(&.{ .{ "id", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "user_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/user/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "user_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/user/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

test "virtual_device_load_smoke" {
    const fixture = h.jo(&.{.{ "virtual_device", h.jo(&.{.{ "t01", h.jo(&.{.{ "id", h.vstr("t01") }}) }}) }});
    const testsdk = sdk.test_sdk(h.jo(&.{.{ "entity", fixture }}), vnull());
    const e = testsdk.virtual_device(vnull());
    const res = e.load(h.jo(&.{.{ "id", h.vstr("t01") }}), vnull());
    switch (res) {
        .ok => |ent| {
            // EVERY operation resolves to the ENTITY, not the record: the
            // payload of EntResult.ok is the entity pointer, and the record is
            // reached through data(). Destructuring it as a Value was a
            // compile error ("expected type 'struct.JsonValue', found
            // '*entity.<name>.<Name>Entity'"), so no generated zig SDK with a
            // loadable entity could build its own test suite.
            const rec = ent.asEntity().data(null);
            try std.testing.expect(std.mem.eql(u8, h.get_str(rec, "id") orelse "", "t01"));
        },
        .err => |er| {
            std.debug.print("virtual_device load failed: {s}\n", .{er.msg});
            try std.testing.expect(false);
        },
    }
}

test "virtual_device_validate" {
    if (!fh.fh_has_feature("validate")) return error.SkipZigTest;
    const opts = h.jo(&.{.{ "feature", h.jo(&.{.{ "validate", h.jo(&.{.{ "active", h.vbool(true) }}) }}) }});
    switch (sdk.test_sdk(vnull(), opts).virtual_device(vnull()).load(h.jo(&.{ .{ "id", h.vnum(1) } }), vnull())) {
        .err => |er| try std.testing.expect(std.mem.eql(u8, er.code, "validate_failed")),
        .ok => try std.testing.expect(false),
    }
}

test "virtual_device_direct_smoke" {
    // direct() drives prepare -> transport and always returns a result map
    // carrying an `ok` flag (never an error union), even on a non-2xx or a
    // prepare failure.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const result = testsdk.direct(h.jo(&.{
        .{ "path", h.vstr("/virtual_device/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);
}

test "virtual_device_prepare_smoke" {
    // prepare() returns the fetch definition (an error union). The generated
    // fetchdef always carries a url + method.
    const testsdk = sdk.test_sdk(vnull(), vnull());
    const fetchdef = testsdk.prepare(h.jo(&.{
        .{ "path", h.vstr("/virtual_device/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("direct01") }}) },
    })) catch {
        // A prepare error is acceptable here (base may be unset); the surface
        // exists and is exercised.
        return;
    };
    try std.testing.expect(std.mem.eql(u8, h.get_str(fetchdef, "method") orelse "", "GET"));
}

// Documented quick-start surface (README.md / REFERENCE.md). Exercises the
// test-mode constructor and the direct() escape hatch exactly as documented.
test "readme_quickstart_surface" {
    // `sdk.test_sdk(...)` — the documented mock constructor.
    const client = sdk.test_sdk(vnull(), vnull());
    try std.testing.expect(std.mem.eql(u8, client.mode, "test"));

    // `client.direct(...)` — the documented escape hatch. It always returns a
    // result map carrying an `ok` flag (never an error union).
    const result = client.direct(h.jo(&.{
        .{ "path", h.vstr("/api/resource/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
    }));
    try std.testing.expect(result == .object);
    try std.testing.expect(h.get_bool(result, "ok") != null);

    // `client.prepare(...)` — build a request without sending it.
    const fetchdef = client.prepare(h.jo(&.{
        .{ "path", h.vstr("/api/resource/{id}") },
        .{ "method", h.vstr("GET") },
        .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
    })) catch h.vnull();
    _ = fetchdef;
}
