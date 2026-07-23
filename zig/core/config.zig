// Generated API configuration (mirrors go/rust core/config).

const std = @import("std");
const h = @import("helpers.zig");
const types = @import("types.zig");
const Value = h.Value;
const Feature = types.Feature;

pub fn make_config() Value {
    return h.jo(&.{
        .{ "main", h.jo(&.{
            .{ "name", h.vstr("BluefinDecryptxP2pe") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://apis.p2pemanager.com/api/v1") },
            .{ "headers", h.jo(&.{
                .{ "content-type", h.vstr("application/json") },
            }) },
            .{ "entity", h.jo(&.{
                .{ "attestation", h.omap() },
                .{ "client", h.omap() },
                .{ "create_result", h.omap() },
                .{ "decryption", h.omap() },
                .{ "device", h.omap() },
                .{ "device_build", h.omap() },
                .{ "device_custody_detail", h.omap() },
                .{ "device_custody_list", h.omap() },
                .{ "device_list", h.omap() },
                .{ "device_receive_result", h.omap() },
                .{ "device_rki_activate_result", h.omap() },
                .{ "device_state", h.omap() },
                .{ "device_type", h.omap() },
                .{ "inject_key", h.omap() },
                .{ "kif", h.omap() },
                .{ "location", h.omap() },
                .{ "partner", h.omap() },
                .{ "shipment", h.omap() },
                .{ "success", h.omap() },
                .{ "transaction", h.omap() },
                .{ "update_result", h.omap() },
                .{ "user", h.omap() },
            }) },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "attestation", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("complete_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("note") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                }) },
                .{ "name", h.vstr("attestation") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/attestations") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("attestations"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/attestations") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("attestations"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/attestations/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("attestations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "client", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("contact") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("direct_partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mid") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(10) },
                    }),
                }) },
                .{ "name", h.vstr("client") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "create_result", h.jo(&.{
                .{ "fields", h.olist() },
                .{ "name", h.vstr("create_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("device_type") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serial_number") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}/custody") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{serial_number}"),
                                    h.vstr("{device_type}"),
                                    h.vstr("custody"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "deviceType", h.vstr("device_type") },
                                        .{ "serialNumber", h.vstr("serial_number") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "decryption", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("success") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(0) },
                    }),
                }) },
                .{ "name", h.vstr("decryption") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/decryption") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("decryption"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("activated_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("activation_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("alternate_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("audit_next_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("audit_notification_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device_build") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device_state") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device_type") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("error_counter") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("error_last_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(13) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("initialized_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(14) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("initialized_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(15) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("inject_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(16) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_virtual") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(17) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("kif") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(18) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("last_activity_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(19) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(20) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(21) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(22) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(23) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("note") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(24) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(25) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("serial_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(26) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(27) },
                    }),
                }) },
                .{ "name", h.vstr("device") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("device_state") },
                                            .{ "orig", h.vstr("device_state") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("kif") },
                                            .{ "orig", h.vstr("kif") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serial_number") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("asc") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("sorting_direction") },
                                            .{ "orig", h.vstr("sorting_direction") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("serialnumber") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("sorting_field") },
                                            .{ "orig", h.vstr("sorting_field") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("device_state"),
                                        h.vstr("kif"),
                                        h.vstr("partner"),
                                        h.vstr("serial_number"),
                                        h.vstr("skip"),
                                        h.vstr("sorting_direction"),
                                        h.vstr("sorting_field"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("device_type") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serial_number") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{serial_number}"),
                                    h.vstr("{device_type}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "deviceType", h.vstr("device_type") },
                                        .{ "serialNumber", h.vstr("serial_number") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "device_build", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("app_version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("build_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("config_file_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device_type") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("firmware_version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("hardware_version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("note") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("white_listing_bin_range") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(13) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("white_listing_used") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(14) },
                    }),
                }) },
                .{ "name", h.vstr("device_build") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("device_type") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceBuilds") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceBuilds"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceBuilds/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceBuilds"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_custody_detail", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("complete_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("custodian") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("note") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("transfer_method") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(12) },
                    }),
                }) },
                .{ "name", h.vstr("device_custody_detail") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("device_type") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serial_number") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(2) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}/custody/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{serial_number}"),
                                    h.vstr("{device_type}"),
                                    h.vstr("custody"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "deviceType", h.vstr("device_type") },
                                        .{ "serialNumber", h.vstr("serial_number") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("id"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "device_custody_list", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("complete_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("custodian") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified_by") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("note") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("status") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("transfer_method") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(12) },
                    }),
                }) },
                .{ "name", h.vstr("device_custody_list") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("device_type") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serial_number") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(1) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}/custody") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{serial_number}"),
                                    h.vstr("{device_type}"),
                                    h.vstr("custody"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "deviceType", h.vstr("device_type") },
                                        .{ "serialNumber", h.vstr("serial_number") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("serial_number"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "device_list", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("data") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("total") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(1) },
                    }),
                }) },
                .{ "name", h.vstr("device_list") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("share_partner_to") },
                                            .{ "orig", h.vstr("share_partner_to") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("asc") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("sorting_direction") },
                                            .{ "orig", h.vstr("sorting_direction") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("serialnumber") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("sorting_field") },
                                            .{ "orig", h.vstr("sorting_field") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/virtualDevices/{sharePartnerTo}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("virtualDevices"),
                                    h.vstr("{share_partner_to}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "sharePartnerTo", h.vstr("share_partner_to") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("share_partner_to"),
                                        h.vstr("skip"),
                                        h.vstr("sorting_direction"),
                                        h.vstr("sorting_field"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("virtual_device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "device_receive_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("success") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(0) },
                    }),
                }) },
                .{ "name", h.vstr("device_receive_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices/receive") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("receive"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_rki_activate_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("success") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(0) },
                    }),
                }) },
                .{ "name", h.vstr("device_rki_activate_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices/rki/activate") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("rki"),
                                    h.vstr("activate"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_state", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                }) },
                .{ "name", h.vstr("device_state") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceStates") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceStates"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_type", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device_type_mode") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("hardware_version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("manufacturer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("model") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("photo_url") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("product_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(11) },
                    }),
                }) },
                .{ "name", h.vstr("device_type") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceTypes") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceTypes"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceTypes/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceTypes"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "inject_key", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_p2_pe") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("key_type") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(7) },
                    }),
                }) },
                .{ "name", h.vstr("inject_key") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/injectKeys") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("injectKeys"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/injectKeys/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("injectKeys"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "kif", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                }) },
                .{ "name", h.vstr("kif") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/kifs") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("kifs"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "location", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("address1") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("address2") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("billing_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("city") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("country") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("custom_reference") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location_type") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mail_address1") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mail_address2") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mail_city") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mail_country") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mail_postal_code") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(13) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("mail_state_province") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(14) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(15) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(16) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name_of_business") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(17) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("note") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(18) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("postal_code") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(19) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("state_province") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(20) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("unique_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(21) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(22) },
                    }),
                }) },
                .{ "name", h.vstr("location") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/locations") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/locations") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/locations/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/locations/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "partner", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("billing_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client_can_order_equipment") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("contact") },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("parent") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reference") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("verification_phrase") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(13) },
                    }),
                }) },
                .{ "name", h.vstr("partner") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "shipment", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("carrier") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("date_received") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("date_shipped") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("dc_kif") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("item") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("kif") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("shipment_type") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("tracking") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(13) },
                    }),
                }) },
                .{ "name", h.vstr("shipment") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/shipments") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("kif") },
                                            .{ "orig", h.vstr("kif") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("mode") },
                                            .{ "orig", h.vstr("mode") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/shipments") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("kif"),
                                        h.vstr("mode"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/shipments/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "success", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("success") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(0) },
                    }),
                }) },
                .{ "name", h.vstr("success") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("share_partner_to") },
                                            .{ "orig", h.vstr("share_partner_to") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/virtualDevices/{sharePartnerTo}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("virtualDevices"),
                                    h.vstr("{share_partner_to}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "sharePartnerTo", h.vstr("share_partner_to") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("share_partner_to"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("share_partner_to") },
                                            .{ "orig", h.vstr("share_partner_to") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/virtualDevices/{sharePartnerTo}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("virtualDevices"),
                                    h.vstr("{share_partner_to}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "sharePartnerTo", h.vstr("share_partner_to") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("share_partner_to"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("virtual_device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "transaction", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("alternate_key") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client_ref") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("decrypted") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("device_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("direct_partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("encrypted") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("end_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("err_code") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("err_message") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("ip_address") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_virtual") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(13) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("key_type") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(14) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("location") },
                        .{ "req", h.vbool(true) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(15) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("message_id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(16) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("method") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(17) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(18) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("reference") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(19) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("serial_number") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(20) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("start_date") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(21) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("success") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(22) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("transaction_source") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(23) },
                    }),
                }) },
                .{ "name", h.vstr("transaction") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/transactions") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client_ref") },
                                            .{ "orig", h.vstr("client_ref") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("date_from") },
                                            .{ "orig", h.vstr("date_from") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("date_to") },
                                            .{ "orig", h.vstr("date_to") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("location") },
                                            .{ "orig", h.vstr("location") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("message_id") },
                                            .{ "orig", h.vstr("message_id") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vstr("nocount") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("paging_mode") },
                                            .{ "orig", h.vstr("paging_mode") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serial_number") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("success") },
                                            .{ "orig", h.vstr("success") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("client_ref"),
                                        h.vstr("date_from"),
                                        h.vstr("date_to"),
                                        h.vstr("location"),
                                        h.vstr("message_id"),
                                        h.vstr("paging_mode"),
                                        h.vstr("partner"),
                                        h.vstr("reference"),
                                        h.vstr("serial_number"),
                                        h.vstr("skip"),
                                        h.vstr("success"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "update_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("email") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("first_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("kif") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("last_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("phone") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("user_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("user_role") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(11) },
                    }),
                }) },
                .{ "name", h.vstr("update_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.omap() },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/users") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "select", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("kif") },
                                            .{ "orig", h.vstr("kif") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$ANY`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(0) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "example", h.vnum(10) },
                                            .{ "kind", h.vstr("query") },
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "reqd", h.vbool(false) },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                        h.vstr("kif"),
                                        h.vstr("partner"),
                                        h.vstr("skip"),
                                        h.vstr("take"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("list") },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/devices/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/locations/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(2) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(3) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/shipments/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(4) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/transactions/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(5) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(6) },
                            }),
                        }) },
                        .{ "key$", h.vstr("update") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "user", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("client") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("created") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("email") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("first_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("id") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("is_active") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("kif") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("last_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("modified") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("partner") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(9) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("phone") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(10) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("user_name") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(11) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("user_role") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(12) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("version") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "index$", h.vnum(13) },
                    }),
                }) },
                .{ "name", h.vstr("user") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "debug")) return @import("../feature/debug.zig").DebugFeature.make();
    if (std.mem.eql(u8, name, "idempotency")) return @import("../feature/idempotency.zig").IdempotencyFeature.make();
    if (std.mem.eql(u8, name, "log")) return @import("../feature/log.zig").LogFeature.make();
    if (std.mem.eql(u8, name, "metrics")) return @import("../feature/metrics.zig").MetricsFeature.make();
    if (std.mem.eql(u8, name, "netsim")) return @import("../feature/netsim.zig").NetsimFeature.make();
    if (std.mem.eql(u8, name, "paging")) return @import("../feature/paging.zig").PagingFeature.make();
    if (std.mem.eql(u8, name, "proxy")) return @import("../feature/proxy.zig").ProxyFeature.make();
    if (std.mem.eql(u8, name, "ratelimit")) return @import("../feature/ratelimit.zig").RatelimitFeature.make();
    if (std.mem.eql(u8, name, "rbac")) return @import("../feature/rbac.zig").RbacFeature.make();
    if (std.mem.eql(u8, name, "retry")) return @import("../feature/retry.zig").RetryFeature.make();
    if (std.mem.eql(u8, name, "streaming")) return @import("../feature/streaming.zig").StreamingFeature.make();
    if (std.mem.eql(u8, name, "telemetry")) return @import("../feature/telemetry.zig").TelemetryFeature.make();
    if (std.mem.eql(u8, name, "test")) return @import("../feature/test.zig").TestFeature.make();
    if (std.mem.eql(u8, name, "timeout")) return @import("../feature/timeout.zig").TimeoutFeature.make();
    return @import("../feature/base.zig").BaseFeature.make();
}
