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
            .{ "slug", h.vstr("bluefin-decryptx-p2pe") },
            .{ "version", h.vstr("0.1.1") },
            .{ "target", h.vstr("zig") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "audit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "actor", h.vstr("anonymous") },
                    .{ "max", h.vnum(1000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sink", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "clienttrack", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "clientVersion", h.vstr("0.0.1") },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clientName", h.vstr("`$STRING`") },
                    .{ "clientVersion", h.vstr("`$STRING`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "sessionId", h.vstr("`$STRING`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "debug", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "max", h.vnum(100) },
                    .{ "redact", h.ja(&.{
                        h.vstr("authorization"),
                        h.vstr("cookie"),
                        h.vstr("set-cookie"),
                        h.vstr("api-key"),
                        h.vstr("apikey"),
                        h.vstr("x-api-key"),
                        h.vstr("idempotency-key"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "onEntry", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "idempotency", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "header", h.vstr("Idempotency-Key") },
                    .{ "methods", h.ja(&.{
                        h.vstr("POST"),
                        h.vstr("PUT"),
                        h.vstr("PATCH"),
                        h.vstr("DELETE"),
                    }) },
                    .{ "ops", h.ja(&.{
                        h.vstr("create"),
                        h.vstr("update"),
                        h.vstr("remove"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "keygen", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "log", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(true) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "level", h.vstr("`$STRING`") },
                    .{ "logger", h.vstr("`$ANY`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "metrics", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "paging", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "afterVar", h.vstr("after") },
                    .{ "cursorParam", h.vstr("cursor") },
                    .{ "firstVar", h.vstr("first") },
                    .{ "limitParam", h.vstr("limit") },
                    .{ "pageParam", h.vstr("page") },
                    .{ "startPage", h.vnum(1) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "limit", h.vstr("`$NUMBER`") },
                    .{ "ops", h.vstr("`$LIST`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "ratelimit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "burst", h.vnum(5) },
                    .{ "rate", h.vnum(5) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "retry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "factor", h.vnum(2) },
                    .{ "maxDelay", h.vnum(2000) },
                    .{ "minDelay", h.vnum(50) },
                    .{ "retries", h.vnum(2) },
                    .{ "statuses", h.ja(&.{
                        h.vnum(408),
                        h.vnum(425),
                        h.vnum(429),
                        h.vnum(500),
                        h.vnum(502),
                        h.vnum(503),
                        h.vnum(504),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "jitter", h.vstr("`$BOOLEAN`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "telemetry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "exporter", h.vstr("`$FUNCTION`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "entity", h.vstr("`$MAP`") },
                    .{ "net", h.vstr("`$MAP`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("base") },
            }) },
            .{ "timeout", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "ms", h.vnum(30000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clearTimer", h.vstr("`$FUNCTION`") },
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "setTimer", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://apis.p2pemanager.com/api/v1") },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
                .{ "basic", h.vbool(true) },
            }) },
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
                .{ "device_custody_list_item", h.omap() },
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
                .{ "virtual_device", h.omap() },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "attestation", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("completeDate") },
                        .{ "title", h.vstr("Complete Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The date and time that the Attestation took place.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("device") },
                        .{ "title", h.vstr("Device") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("devices") },
                        .{ "title", h.vstr("Devices") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Text describing the attestation.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Free form field that allows the Client associate notes with the Attestation.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("attestation") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/attestations") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("attestations") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("attestations"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/attestations") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("attestations") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("attestations"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/attestations/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("attestations") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("attestations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "client", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "title", h.vstr("Contact") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "title", h.vstr("Direct Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Client account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mid") },
                        .{ "title", h.vstr("Mid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Some Partners will have an merchant ids on their own software offerings.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Client's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the Client's root Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("client") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("partner"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "create_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("completeDate") },
                        .{ "title", h.vstr("Complete Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The date and time that the Custody change took place.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("custodian") },
                        .{ "title", h.vstr("Custodian") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Free form field that allows the Client associate notes with the Custody Change.") },
                    }),
                }) },
                .{ "name", h.vstr("create_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}/custody") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("serial_number") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("device_type") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("custody") },
                                    }),
                                }) },
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
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("deviceType") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serialNumber") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("$.main.kit.entity.device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "decryption", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("cbcVector") },
                        .{ "title", h.vstr("Cbc Vector") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Base64 or hex encoded initial vector obtained from device.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceType") },
                        .{ "title", h.vstr("Device Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The device Type.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("encoding") },
                        .{ "title", h.vstr("Encoding") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The payload encoding") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("encrypted") },
                        .{ "title", h.vstr("Encrypted") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "req", h.vbool(true) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("hasCcData") },
                        .{ "title", h.vstr("Has Cc Data") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A string (of up to 50 characters) that helps partners identify individual API calls.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sequenceNumber") },
                        .{ "title", h.vstr("Sequence Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Sequence number obtained from device in base 64 or hex encoded format.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("serialNumber") },
                        .{ "title", h.vstr("Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The serial number of the device.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("true if the payload decryption was successful.") },
                    }),
                }) },
                .{ "name", h.vstr("decryption") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/decryption") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("decryption") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("decryption"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("activatedBy") },
                        .{ "title", h.vstr("Activated By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("activationDate") },
                        .{ "title", h.vstr("Activation Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from when the Device was activated.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("alternateKey") },
                        .{ "title", h.vstr("Alternate Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("auditNextDate") },
                        .{ "title", h.vstr("Audit Next Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Date and time that the Device is due its next PCI Audit.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("auditNotificationDate") },
                        .{ "title", h.vstr("Audit Notification Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Date and time that a notification should be sent that a PCI audit is due.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("createdBy") },
                        .{ "title", h.vstr("Created By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceBuild") },
                        .{ "title", h.vstr("Device Build") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device Build resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceState") },
                        .{ "title", h.vstr("Device State") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device State resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceType") },
                        .{ "title", h.vstr("Device Type") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Device Type resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errorCounter") },
                        .{ "title", h.vstr("Error Counter") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number times the Device has been in error.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errorLastDate") },
                        .{ "title", h.vstr("Error Last Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the last time that the Device had an error.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("initializedBy") },
                        .{ "title", h.vstr("Initialized By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("initializedDate") },
                        .{ "title", h.vstr("Initialized Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from when the Device was initialized.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("injectKey") },
                        .{ "title", h.vstr("Inject Key") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isVirtual") },
                        .{ "title", h.vstr("Is Virtual") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("Indicates if a Device is Virtual (represents a Device shared with a partner).") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("kif") },
                        .{ "title", h.vstr("Kif") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated KIF resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastActivityDate") },
                        .{ "title", h.vstr("Last Activity Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the last time that the Device was used.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modifiedBy") },
                        .{ "title", h.vstr("Modified By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Arbitary note that can be attached to a Device entry.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("serialNumber") },
                        .{ "title", h.vstr("Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Device's serial number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("device") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("device_state") },
                                            .{ "orig", h.vstr("deviceState") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("kif") },
                                            .{ "orig", h.vstr("kif") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serialNumber") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("sorting_direction") },
                                            .{ "orig", h.vstr("sorting.direction") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vstr("asc") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("sorting_field") },
                                            .{ "orig", h.vstr("sorting.field") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vstr("serialnumber") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("serial_number") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("device_type") },
                                    }),
                                }) },
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
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("deviceType") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serialNumber") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_build", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("appVersion") },
                        .{ "title", h.vstr("App Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("If a Device Type has more than one Application Code version the supported version is specified here.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("buildNumber") },
                        .{ "title", h.vstr("Build Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Build Number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("configFileName") },
                        .{ "title", h.vstr("Config File Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the configuration file that is uploaded to the device.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceType") },
                        .{ "title", h.vstr("Device Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device Type Name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firmwareVersion") },
                        .{ "title", h.vstr("Firmware Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A list of firmware versions that this Device Build covers.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("hardwareVersion") },
                        .{ "title", h.vstr("Hardware Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A list of hardware versions that this Device Build covers.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the device build is still active and not succeeded by subsequent build.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device Builds's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Notes attached to the device build by Bluefin CISO.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("whiteListingBinRanges") },
                        .{ "title", h.vstr("White Listing Bin Ranges") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A comma separated list of BIN ranges that aren't encrypted by the terminal.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("whiteListingUsed") },
                        .{ "title", h.vstr("White Listing Used") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("device_build") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceBuilds") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("deviceBuilds") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceBuilds"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("deviceType") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceBuilds/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("deviceBuilds") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceBuilds"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_custody_detail", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("completeDate") },
                        .{ "title", h.vstr("Complete Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The date and time that the Custody change took place.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("createdBy") },
                        .{ "title", h.vstr("Created By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("custodian") },
                        .{ "title", h.vstr("Custodian") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("device") },
                        .{ "title", h.vstr("Device") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modifiedBy") },
                        .{ "title", h.vstr("Modified By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Free form field that allows the Client associate notes with the Custody Change.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("status") },
                        .{ "title", h.vstr("Status") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Custody Status.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("transferMethod") },
                        .{ "title", h.vstr("Transfer Method") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Transfer Method.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("device_custody_detail") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}/custody/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("serial_number") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("device_type") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("custody") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
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
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("deviceType") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serialNumber") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("id"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("$.main.kit.entity.device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "device_custody_list_item", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("completeDate") },
                        .{ "title", h.vstr("Complete Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The date and time that the Custody change took place.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("createdBy") },
                        .{ "title", h.vstr("Created By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("custodian") },
                        .{ "title", h.vstr("Custodian") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("device") },
                        .{ "title", h.vstr("Device") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("date-time") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modifiedBy") },
                        .{ "title", h.vstr("Modified By") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Free form field that allows the Client associate notes with the Custody Change.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("status") },
                        .{ "title", h.vstr("Status") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Custody Status.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("transferMethod") },
                        .{ "title", h.vstr("Transfer Method") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Transfer Method.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("device_custody_list_item") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/devices/{serialNumber}/{deviceType}/custody") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("serial_number") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("device_type") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("custody") },
                                    }),
                                }) },
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
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("device_type") },
                                            .{ "orig", h.vstr("deviceType") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serialNumber") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("device_type"),
                                        h.vstr("serial_number"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("$.main.kit.entity.device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "device_receive_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("serialNumber") },
                        .{ "title", h.vstr("Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The serial number of the Device that is shipped.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indicates if the action succeeded.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("tamperLabel") },
                        .{ "title", h.vstr("Tamper Label") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The code that is printed the tamper label of the Device that is shipped.") },
                    }),
                }) },
                .{ "name", h.vstr("device_receive_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices/receive") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("receive") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("receive"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_rki_activate_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("appVersion") },
                        .{ "title", h.vstr("App Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("If a Device Type has more than one Application Code version the supported version is specified here.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("buildName") },
                        .{ "title", h.vstr("Build Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device Builds's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("buildNumber") },
                        .{ "title", h.vstr("Build Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Build Number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("configFile") },
                        .{ "title", h.vstr("Config File") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("\\?") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firmwareVersion") },
                        .{ "title", h.vstr("Firmware Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A list of firmware versions that this Device Build covers.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("hardwareVersion") },
                        .{ "title", h.vstr("Hardware Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A list of hardware versions that this Device Build covers.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("serialNumber") },
                        .{ "title", h.vstr("Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("The referenced Device's serial number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Indicates if the RKI activation succeeded.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("whiteListingBinRanges") },
                        .{ "title", h.vstr("White Listing Bin Ranges") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("\\?") },
                    }),
                }) },
                .{ "name", h.vstr("device_rki_activate_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/devices/rki/activate") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("rki") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("activate") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("rki"),
                                    h.vstr("activate"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_state", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Unique identifier for this Device state.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Descriptive name for this Device state.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("device_state") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceStates") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("deviceStates") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceStates"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "device_type", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceTypeMode") },
                        .{ "title", h.vstr("Device Type Mode") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device type.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("hardwareVersion") },
                        .{ "title", h.vstr("Hardware Version") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device hardware version.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Unique idenifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the DeviceType is active.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("manufacturer") },
                        .{ "title", h.vstr("Manufacturer") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device manufacturer.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("model") },
                        .{ "title", h.vstr("Model") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device model.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The DeviceType name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("photoUrl") },
                        .{ "title", h.vstr("Photo Url") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("productName") },
                        .{ "title", h.vstr("Product Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("device_type") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceTypes") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("deviceTypes") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceTypes"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/deviceTypes/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("deviceTypes") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("deviceTypes"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "inject_key", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("unique idenifier") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("Active flag, inactive keys cannot be assigned to devices.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isP2PE") },
                        .{ "title", h.vstr("Is P2 Pe") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("Flags if a key is for a P2PE compliant cypher.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("keyType") },
                        .{ "title", h.vstr("Key Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The cipher type that the key works with.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Key name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("inject_key") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/injectKeys") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("injectKeys") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("injectKeys"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/injectKeys/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("injectKeys") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("injectKeys"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "kif", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                        .{ "format", h.vstr("int64") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The KIF's name.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("kif") },
                .{ "op", h.jo(&.{
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/kifs") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("kifs") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("kifs"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "location", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("address1") },
                        .{ "title", h.vstr("Address1") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("address2") },
                        .{ "title", h.vstr("Address2") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "title", h.vstr("Billing Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("\\?") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("city") },
                        .{ "title", h.vstr("City") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Location's city.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "title", h.vstr("Country") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Location's country.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("customReference") },
                        .{ "title", h.vstr("Custom Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A Partner specified reference for a location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("locationType") },
                        .{ "title", h.vstr("Location Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Location's clasification.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailAddress1") },
                        .{ "title", h.vstr("Mail Address1") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailAddress2") },
                        .{ "title", h.vstr("Mail Address2") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailCity") },
                        .{ "title", h.vstr("Mail City") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's city.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailCountry") },
                        .{ "title", h.vstr("Mail Country") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailPostalCode") },
                        .{ "title", h.vstr("Mail Postal Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's postal code.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailStateProvince") },
                        .{ "title", h.vstr("Mail State Province") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street state or province.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Location's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameOfBusiness") },
                        .{ "title", h.vstr("Name Of Business") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the business at this location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Note for delivery driver.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("postalCode") },
                        .{ "title", h.vstr("Postal Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's postal code.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("stateProvince") },
                        .{ "title", h.vstr("State Province") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street state or province.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("uniqueId") },
                        .{ "title", h.vstr("Unique Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Unique Identifier for the Location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("location") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/locations") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("locations") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/locations") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("locations") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("client"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/locations/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("locations") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/locations/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("locations") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "partner", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "title", h.vstr("Billing Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's billing identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("clientCanOrderEquipment") },
                        .{ "title", h.vstr("Client Can Order Equipment") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Partner is allowed to order Equipment.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "title", h.vstr("Contact") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "list", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Parter account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Partner's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("parent") },
                        .{ "title", h.vstr("Parent") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partnerId") },
                        .{ "title", h.vstr("Partner Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's id.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The Partner's reference string.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("verificationPhrase") },
                        .{ "title", h.vstr("Verification Phrase") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The verification phrase is a message that the Partner creates.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("partner") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "shipment", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("carrier") },
                        .{ "title", h.vstr("Carrier") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The name of the courier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("dateReceived") },
                        .{ "title", h.vstr("Date Received") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The date and time that a package is recieved.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("dateShipped") },
                        .{ "title", h.vstr("Date Shipped") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The date and time that a package is shipped.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("dcKif") },
                        .{ "title", h.vstr("Dc Kif") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated KIF resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("items") },
                        .{ "title", h.vstr("Items") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$ARRAY`") },
                            }) },
                        }) },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("kif") },
                        .{ "title", h.vstr("Kif") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated KIF resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("shipmentType") },
                        .{ "title", h.vstr("Shipment Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The type of shipment.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("tracking") },
                        .{ "title", h.vstr("Tracking") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The courier's tracking number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                        .{ "format", h.vstr("int32") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("shipment") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/shipments") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("shipments") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/shipments") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("shipments") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("kif") },
                                            .{ "orig", h.vstr("kif") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("mode") },
                                            .{ "orig", h.vstr("mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("kif"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/shipments/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("shipments") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "success", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("devices") },
                        .{ "title", h.vstr("Devices") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("An array of Device ids to share with partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sharePartnerFrom") },
                        .{ "title", h.vstr("Share Partner From") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("Indicates if the action was a success.") },
                    }),
                }) },
                .{ "name", h.vstr("success") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/virtualDevices/{sharePartnerTo}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("virtualDevices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("share_partner_to") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("virtualDevices"),
                                    h.vstr("{share_partner_to}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "sharePartnerTo", h.vstr("share_partner_to") },
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("share_partner_to") },
                                            .{ "orig", h.vstr("sharePartnerTo") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("share_partner_to"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/virtualDevices/{sharePartnerTo}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("virtualDevices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("share_partner_to") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("virtualDevices"),
                                    h.vstr("{share_partner_to}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "sharePartnerTo", h.vstr("share_partner_to") },
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("share_partner_to") },
                                            .{ "orig", h.vstr("sharePartnerTo") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("share_partner_to"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.ja(&.{
                        h.ja(&.{
                            h.vstr("$.main.kit.entity.virtual_device"),
                        }),
                    }) },
                }) },
            }) },
            .{ "transaction", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("alternateKey") },
                        .{ "title", h.vstr("Alternate Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("clientRef") },
                        .{ "title", h.vstr("Client Ref") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Client Reference property that is included in the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("decrypted") },
                        .{ "title", h.vstr("Decrypted") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("A Transcation can process muliple decryptions.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("device") },
                        .{ "title", h.vstr("Device") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceName") },
                        .{ "title", h.vstr("Device Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the Device that generated the payload to decrypt.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "title", h.vstr("Direct Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("encrypted") },
                        .{ "title", h.vstr("Encrypted") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("A Transcation can process muliple encryptions.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("endDate") },
                        .{ "title", h.vstr("End Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the end of the transaction.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errCode") },
                        .{ "title", h.vstr("Err Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The error code that is sent in response to a failed decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errMessage") },
                        .{ "title", h.vstr("Err Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The error messge that is sent in response to a failed decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("ipAddress") },
                        .{ "title", h.vstr("Ip Address") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The IP address of the http client that makes the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isVirtual") },
                        .{ "title", h.vstr("Is Virtual") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("Indicates if the Transaction came from a virtual Device.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("keyType") },
                        .{ "title", h.vstr("Key Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The type of cipher used during decrytion.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("messageId") },
                        .{ "title", h.vstr("Message Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Message ID.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("method") },
                        .{ "title", h.vstr("Method") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The decryption cypher/method.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "op", h.jo(&.{
                            .{ "create", h.jo(&.{
                                .{ "req", h.vbool(true) },
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The reference property that the Client includes in the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("serialNumber") },
                        .{ "title", h.vstr("Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The serial number of the Device that generated the payload to decrypt.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("startDate") },
                        .{ "title", h.vstr("Start Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the beginning of the transaction.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("The success indicator.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("transactionSource") },
                        .{ "title", h.vstr("Transaction Source") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The source of the Transaction.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("transaction") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/transactions") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("transactions") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("transactions") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("client_ref") },
                                            .{ "orig", h.vstr("clientRef") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("date_from") },
                                            .{ "orig", h.vstr("dateFrom") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("date_to") },
                                            .{ "orig", h.vstr("dateTo") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("location") },
                                            .{ "orig", h.vstr("location") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("message_id") },
                                            .{ "orig", h.vstr("messageId") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("paging_mode") },
                                            .{ "orig", h.vstr("paging.mode") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vstr("nocount") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("reference") },
                                            .{ "orig", h.vstr("reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("serial_number") },
                                            .{ "orig", h.vstr("serialNumber") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("success") },
                                            .{ "orig", h.vstr("success") },
                                            .{ "type", h.vstr("`$BOOLEAN`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/transactions/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("transactions") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "update_result", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("address1") },
                        .{ "title", h.vstr("Address1") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("address2") },
                        .{ "title", h.vstr("Address2") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("alternateKey") },
                        .{ "title", h.vstr("Alternate Key") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("auditNextDate") },
                        .{ "title", h.vstr("Audit Next Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Date and time that the Device is due its next PCI Audit.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("billingId") },
                        .{ "title", h.vstr("Billing Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("\\?") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("city") },
                        .{ "title", h.vstr("City") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's city.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("clientCanOrderEquipment") },
                        .{ "title", h.vstr("Client Can Order Equipment") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the Partner is allowed to order Equipment.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("clientRef") },
                        .{ "title", h.vstr("Client Ref") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Client Reference property that is included in the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("contact") },
                        .{ "title", h.vstr("Contact") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated User resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("country") },
                        .{ "title", h.vstr("Country") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Country.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("customReference") },
                        .{ "title", h.vstr("Custom Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("A Partner specified reference for a location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("dateShipped") },
                        .{ "title", h.vstr("Date Shipped") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The date and time that a package is shipped.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("decrypted") },
                        .{ "title", h.vstr("Decrypted") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("A Transcation can process muliple decryptions.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("device") },
                        .{ "title", h.vstr("Device") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceBuild") },
                        .{ "title", h.vstr("Device Build") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device Build resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("deviceType") },
                        .{ "title", h.vstr("Device Type") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device Type resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("directPartner") },
                        .{ "title", h.vstr("Direct Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "title", h.vstr("Email") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's email address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("encrypted") },
                        .{ "title", h.vstr("Encrypted") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("A Transcation can process muliple encryptions.") },
                        .{ "format", h.vstr("int32") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("endDate") },
                        .{ "title", h.vstr("End Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the end of the transaction.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errCode") },
                        .{ "title", h.vstr("Err Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The error code that is sent in response to a failed decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("errMessage") },
                        .{ "title", h.vstr("Err Message") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The error messge that is sent in response to a failed decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firstName") },
                        .{ "title", h.vstr("First Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("ID of newly created resource") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("injectKey") },
                        .{ "title", h.vstr("Inject Key") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Device resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("ipAddress") },
                        .{ "title", h.vstr("Ip Address") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The IP address of the http client that makes the decrypt API call.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$BOOLEAN`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$BOOLEAN`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("This property indicates if the User account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("items") },
                        .{ "title", h.vstr("Items") },
                        .{ "type", h.vstr("`$ARRAY`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("keyType") },
                        .{ "title", h.vstr("Key Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The type of cipher used during decrytion.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("kif") },
                        .{ "title", h.vstr("Kif") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated KIF resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastName") },
                        .{ "title", h.vstr("Last Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's Surname.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("location") },
                        .{ "title", h.vstr("Location") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "short", h.vstr("Reference to the associated Location resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("locationType") },
                        .{ "title", h.vstr("Location Type") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's clasification.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailAddress1") },
                        .{ "title", h.vstr("Mail Address1") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailAddress2") },
                        .{ "title", h.vstr("Mail Address2") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailCity") },
                        .{ "title", h.vstr("Mail City") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's city.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailCountry") },
                        .{ "title", h.vstr("Mail Country") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailPostalCode") },
                        .{ "title", h.vstr("Mail Postal Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's postal code.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mailStateProvince") },
                        .{ "title", h.vstr("Mail State Province") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street state or province.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("messageId") },
                        .{ "title", h.vstr("Message Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Message ID.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("method") },
                        .{ "title", h.vstr("Method") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The decryption cypher/method.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("mid") },
                        .{ "title", h.vstr("Mid") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Some Partners will have an merchant ids on their own software offerings.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("name") },
                        .{ "title", h.vstr("Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Client's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("nameOfBusiness") },
                        .{ "title", h.vstr("Name Of Business") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The name of the business at this location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("notes") },
                        .{ "title", h.vstr("Notes") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Arbitary note that can be attached to a Device entry.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("parent") },
                        .{ "title", h.vstr("Parent") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partnerId") },
                        .{ "title", h.vstr("Partner Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's id.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phone") },
                        .{ "title", h.vstr("Phone") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's phone number without dashes, spaces, or brackets.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("postalCode") },
                        .{ "title", h.vstr("Postal Code") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's postal code.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("reference") },
                        .{ "title", h.vstr("Reference") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Partner's reference string.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("sendWelcomeEmail") },
                        .{ "title", h.vstr("Send Welcome Email") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("If this property is set to '*true*' the newly created user will be sent a welcome email.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("serialNumber") },
                        .{ "title", h.vstr("Serial Number") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Device's serial number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("startDate") },
                        .{ "title", h.vstr("Start Date") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Timestamp from the beginning of the transaction.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("stateProvince") },
                        .{ "title", h.vstr("State Province") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The Location's street state or province.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("success") },
                        .{ "title", h.vstr("Success") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("The success indicator.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("tracking") },
                        .{ "title", h.vstr("Tracking") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The courier's tracking number.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("uniqueId") },
                        .{ "title", h.vstr("Unique Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Unique Identifier for the Location.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userName") },
                        .{ "title", h.vstr("User Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$STRING`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("The User's unique username.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userRole") },
                        .{ "title", h.vstr("User Role") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "req", h.vbool(true) },
                        .{ "op", h.jo(&.{
                            .{ "list", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                            .{ "update", h.jo(&.{
                                .{ "type", h.vstr("`$OBJECT`") },
                            }) },
                        }) },
                        .{ "short", h.vstr("Reference to the associated User Role.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("verificationPhrase") },
                        .{ "title", h.vstr("Verification Phrase") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The verification phrase is a message that the Partner creates.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("update_result") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/users") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.omap() },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "list", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("list") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body.data`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("client") },
                                            .{ "orig", h.vstr("client") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("kif") },
                                            .{ "orig", h.vstr("kif") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("partner") },
                                            .{ "orig", h.vstr("partner") },
                                            .{ "type", h.vstr("`$ANY`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "field", h.vbool(true) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.omap() },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "update", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("update") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/clients/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("clients") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("clients"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/devices/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("devices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("devices"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/locations/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("locations") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("locations"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/partners/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("partners") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("partners"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/shipments/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("shipments") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("shipments"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/transactions/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("transactions") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("transactions"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("PATCH") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "user", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("client") },
                        .{ "title", h.vstr("Client") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Client resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("created") },
                        .{ "title", h.vstr("Created") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Creation timestamp in ISO 8601 format.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("email") },
                        .{ "title", h.vstr("Email") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The User's email address.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("firstName") },
                        .{ "title", h.vstr("First Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The User's name.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("This resource's unique identifier.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("isActive") },
                        .{ "title", h.vstr("Is Active") },
                        .{ "type", h.vstr("`$BOOLEAN`") },
                        .{ "short", h.vstr("This property indicates if the User account is active or disabled.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("kif") },
                        .{ "title", h.vstr("Kif") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated KIF resource.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("lastName") },
                        .{ "title", h.vstr("Last Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The User's Surname.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("modified") },
                        .{ "title", h.vstr("Modified") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Last modified timestamp.") },
                        .{ "format", h.vstr("datetime") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("partner") },
                        .{ "title", h.vstr("Partner") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated Partner.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("phone") },
                        .{ "title", h.vstr("Phone") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The User's phone number without dashes, spaces, or brackets.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userName") },
                        .{ "title", h.vstr("User Name") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("The User's unique username.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("userRole") },
                        .{ "title", h.vstr("User Role") },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "short", h.vstr("Reference to the associated User Role.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("version") },
                        .{ "title", h.vstr("Version") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("The number of times that this resource has been updated.") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("user") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/users/{id}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("users") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("users"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
            .{ "virtual_device", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("data") },
                        .{ "title", h.vstr("Data") },
                        .{ "type", h.vstr("`$ARRAY`") },
                        .{ "short", h.vstr("List of Devices.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("total") },
                        .{ "title", h.vstr("Total") },
                        .{ "type", h.vstr("`$INTEGER`") },
                        .{ "short", h.vstr("Total number of Devices available (not the number of Users in the response).") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("virtual_device") },
                .{ "op", h.jo(&.{
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/virtualDevices/{sharePartnerTo}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("virtualDevices") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("virtualDevices"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "sharePartnerTo", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("sharePartnerTo") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "query", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("skip") },
                                            .{ "orig", h.vstr("skip") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(0) },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("sorting_direction") },
                                            .{ "orig", h.vstr("sorting.direction") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vstr("asc") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("sorting_field") },
                                            .{ "orig", h.vstr("sorting.field") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vstr("serialnumber") },
                                        }),
                                        h.jo(&.{
                                            .{ "name", h.vstr("take") },
                                            .{ "orig", h.vstr("take") },
                                            .{ "type", h.vstr("`$INTEGER`") },
                                            .{ "kind", h.vstr("query") },
                                            .{ "example", h.vnum(10) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                    }) },
                                }) },
                                .{ "response", h.jo(&.{
                                    .{ "kind", h.vstr("json") },
                                    .{ "media", h.vstr("application/json") },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// Value nodes are arena-allocated and reference-stable, so the shared value is
// genuinely one structure, not a copy.
var shared_config_val: ?Value = null;

/// The process-wide config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() Value {
    if (shared_config_val) |c| return c;
    const c = make_config();
    shared_config_val = c;
    return c;
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "cost")) return @import("../feature/cost.zig").CostFeature.make();
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
