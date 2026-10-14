"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('AttestationEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinDecryptxP2peSDK.test();
        const ent = testsdk.Attestation();
        (0, node_assert_1.default)(null != ent);
    });
    class FailHook extends __1.BaseFeature {
        name = 'failhook';
        version = '0.0.1';
        active = true;
        unexpected = 0;
        init() { }
        PreSpec() { throw new Error('attestation hook failed'); }
        PreUnexpected() { this.unexpected++; }
    }
    (0, node_test_1.test)('stream-error', async () => {
        const offline = { net: { offline: true } };
        await node_assert_1.default.rejects(async () => {
            for await (const _item of __1.BluefinDecryptxP2peSDK.test(offline).Attestation().stream('list')) { }
        }, /offline/);
        for await (const _item of __1.BluefinDecryptxP2peSDK.test(offline).Attestation()
            .stream('list', undefined, { ctrl: { throw: false } })) { }
        if (null != __1.config.feature?.rbac) {
            const denied = __1.BluefinDecryptxP2peSDK.test(undefined, { feature: { rbac: { active: true, deny: true } } });
            await node_assert_1.default.rejects(async () => {
                for await (const _item of denied.Attestation().stream('list')) { }
            }, (err) => 'rbac_denied' === err.code);
        }
    });
    (0, node_test_1.test)('stream-ctrl', async () => {
        const explain = {};
        const ctrl = { explain };
        for await (const _item of __1.BluefinDecryptxP2peSDK.test().Attestation().stream('list', undefined, { ctrl })) { }
        node_assert_1.default.deepStrictEqual(Object.keys(ctrl), ['explain']);
        (0, node_assert_1.default)(explain === ctrl.explain && 0 < Object.keys(explain).length);
    });
    (0, node_test_1.test)('unexpected', async () => {
        const hook = new FailHook();
        const client = new __1.BluefinDecryptxP2peSDK({ feature: { test: { active: true } }, extend: [hook] });
        await node_assert_1.default.rejects(client.Attestation().list(), /hook failed/);
        (0, node_assert_1.default)(0 < hook.unexpected);
        const fired = hook.unexpected;
        node_assert_1.default.strictEqual(await client.Attestation().list(undefined, { throw: false }), undefined);
        (0, node_assert_1.default)(fired < hook.unexpected);
    });
    (0, node_test_1.test)('validate', async (t) => {
        if (null == __1.config.feature?.validate) {
            t.skip('feature not present in this SDK: validate');
            return;
        }
        const client = __1.BluefinDecryptxP2peSDK.test(undefined, { feature: { validate: { active: true } } });
        await node_assert_1.default.rejects(client.Attestation().list({ "client": 1 }), (err) => 'validate_failed' === err.code);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
        for (const op of ['create', 'list', 'load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'attestation.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "client": { "a": true, "h": "Client", "n": "client", "op": { "create": { "req": true, "type": "`$OBJECT`" } }, "r": false, "sh": "Reference to the associated Client resource.", "t": "`$OBJECT`", "key$": "client", "index$": 0 }, "completeDate": { "a": true, "fo": "datetime", "h": "Complete Date", "n": "completeDate", "op": { "create": { "req": true, "type": "`$STRING`" } }, "r": false, "sh": "The date and time that the Attestation took place.", "t": "`$STRING`", "key$": "completeDate", "index$": 1 }, "created": { "a": true, "fo": "datetime", "h": "Created", "n": "created", "r": false, "sh": "Creation timestamp in ISO 8601 format.", "t": "`$STRING`", "key$": "created", "index$": 2 }, "device": { "a": true, "h": "Device", "n": "device", "r": false, "sh": "Reference to the associated Device resource.", "t": "`$OBJECT`", "key$": "device", "index$": 3 }, "devices": { "a": true, "h": "Devices", "n": "devices", "r": true, "t": "`$ARRAY`", "key$": "devices", "index$": 4 }, "id": { "a": true, "h": "Id", "n": "id", "r": false, "sh": "This resource's unique identifier.", "t": "`$STRING`", "key$": "id", "index$": 5 }, "name": { "a": true, "h": "Name", "n": "name", "op": { "create": { "req": true, "type": "`$STRING`" } }, "r": false, "sh": "Text describing the attestation.", "t": "`$STRING`", "key$": "name", "index$": 6 }, "notes": { "a": true, "h": "Notes", "n": "notes", "r": false, "sh": "Free form field that allows the Client associate notes with the Attestation.", "t": "`$STRING`", "key$": "notes", "index$": 7 } }, "id": { "field": "id", "name": "id" }, "name": "attestation", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "bf": ["client", "completeDate", "devices", "name", "notes"], "co": { "id": "POST /attestations", "source": "openapi3", "version": 2 }, "g": {}, "k": "http", "m": "POST", "o": "/attestations", "q": {}, "r": {}, "rs": { "kind": "json", "media": "application/json" }, "s": [{ "lit": "attestations" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" }, "list": { "input": "data", "name": "list", "points": [{ "a": true, "co": { "id": "GET /attestations", "source": "openapi3", "version": 2 }, "g": { "query": [{ "a": true, "k": "query", "n": "client", "or": "client", "r": true, "t": "`$STRING`", "index$": 0 }, { "a": true, "ex": 0, "k": "query", "n": "skip", "or": "skip", "r": false, "t": "`$INTEGER`", "index$": 1 }, { "a": true, "ex": 10, "k": "query", "n": "take", "or": "take", "r": false, "t": "`$INTEGER`", "index$": 2 }] }, "k": "http", "m": "GET", "o": "/attestations", "q": { "exist": ["client"] }, "r": {}, "rs": { "kind": "json", "media": "application/json" }, "s": [{ "lit": "attestations" }], "t": { "req": "`reqdata`", "res": "`body.data`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /attestations/{id}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "k": "param", "n": "id", "or": "id", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "GET", "o": "/attestations/{id}", "q": { "exist": ["id"] }, "r": {}, "rs": { "kind": "json", "media": "application/json" }, "s": [{ "lit": "attestations" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "attestation", "name__orig": "attestation", "Name": "Attestation", "name_": "attestation", "name-": "attestation", "NAME": "ATTESTATION", "index$": 0 }, { "active": true, "entity": "attestation", "key$": "BasicAttestationFlow", "kind": "basic", "name": "BasicAttestationFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "attestation_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }, { "a": true, "d": {}, "i": {}, "m": {}, "o": "list", "s": [], "v": [{ "apply": "ItemExists", "def": { "ref": "attestation_ref01" } }], "index$": 1 }, { "a": true, "d": {}, "i": { "ref": "attestation_ref01", "srcdatavar": "attestation_ref01_data", "suffix": "_dt0" }, "m": { "id": "attestation01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-attestation_ref01" } }], "index$": 2 }] }, 'Attestation', { "POST /attestations": { "protocol": "http", "requestBody": { "description": "Attestation to be created.", "content": { "*/*": { "schema": { "required": ["client", "completeDate", "devices", "name"], "type": "object", "properties": { "name": { "maxLength": 255, "type": "string", "description": "Text describing the attestation.", "example": "2015 Attestation Atlanta Shop (Terminal 85000711)", "key$": "name" }, "completeDate": { "type": "string", "description": "The date and time that the Attestation took place.", "format": "datetime", "example": "2017-02-08T20:14:45.000Z", "key$": "completeDate" }, "client": { "type": "object", "properties": { "id": { "type": "string", "description": "The referenced Client's ID.", "example": "4684" }, "name": { "type": "string", "description": "The referenced Client's name.", "example": "The Tired Window" } }, "description": "Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/ClientReference", "key$": "client" }, "devices": { "type": "array", "items": { "required": ["serialNumber"], "type": "object", "properties": { "serialNumber": { "maxLength": 255, "type": "string", "description": "The serial number of Device undergoing Attestation.", "example": "85000711" } }, "x-ref": "#/components/schemas/AttestationDeviceCreate" }, "key$": "devices" }, "notes": { "type": "string", "description": "Free form field that allows the Client associate notes with the Attestation.", "example": "Terminal 85000711 meets all the attestation requirements.", "key$": "notes" } }, "x-ref": "#/components/schemas/AttestationCreate", "index$": 1 } } }, "required": true }, "parameters": [] }, "GET /attestations": { "protocol": "http", "parameters": [{ "name": "client", "in": "query", "description": "Filter the list by Client. The parameter value can be either a Client ID or Name.", "required": true, "schema": { "type": "string" }, "index$": 0 }, { "name": "take", "in": "query", "description": "The number of entries to include in the list.", "schema": { "type": "integer", "format": "int32", "default": 10 }, "index$": 1 }, { "name": "skip", "in": "query", "description": "The number of results to skip before listing entries.", "schema": { "type": "integer", "format": "int32", "default": 0 }, "index$": 2 }] }, "GET /attestations/{id}": { "protocol": "http", "parameters": [{ "name": "id", "in": "path", "description": "The Attestation's unique identifier.", "required": true, "schema": { "type": "string" }, "index$": 0 }] } }, { strict: LIVE_STRICT, t });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const attestation_ref01_ent = client.Attestation();
        let attestation_ref01_data = setup.data.new.attestation['attestation_ref01'];
        attestation_ref01_data = (await attestation_ref01_ent.create(attestation_ref01_data)).data();
        (0, node_assert_1.default)(null != attestation_ref01_data.id);
        // LIST
        const attestation_ref01_match = {};
        const attestation_ref01_list = (await attestation_ref01_ent.list(attestation_ref01_match)).map((e) => e.data());
        (0, node_assert_1.default)(!isempty(select(attestation_ref01_list, { id: attestation_ref01_data.id })));
        // LOAD
        const attestation_ref01_match_dt0 = {};
        attestation_ref01_match_dt0.id = attestation_ref01_data.id;
        const attestation_ref01_data_dt0 = (await attestation_ref01_ent.load(attestation_ref01_match_dt0)).data();
        (0, node_assert_1.default)(attestation_ref01_data_dt0.id === attestation_ref01_data.id);
    });
});
// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true;
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/attestation/AttestationTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinDecryptxP2peSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['attestation01', 'attestation02', 'attestation03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID': idmap,
        'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
        'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
    });
    idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_ATTESTATION_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.BluefinDecryptxP2peSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {
                apikey: env.BLUEFIN_DECRYPTX_P2PE_APIKEY,
                secret: env.BLUEFIN_DECRYPTX_P2PE_SECRET,
            },
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
    }
    const setup = {
        idmap,
        env,
        options,
        client,
        struct,
        data: entityData,
        explain: 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN,
        live,
        transport,
        now: Date.now(),
    };
    return setup;
}
//# sourceMappingURL=AttestationEntity.test.js.map