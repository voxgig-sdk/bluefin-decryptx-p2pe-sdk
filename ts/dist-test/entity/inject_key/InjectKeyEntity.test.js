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
(0, node_test_1.describe)('InjectKeyEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinDecryptxP2peSDK.test();
        const ent = testsdk.InjectKey();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
        for (const op of ['list', 'load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'inject_key.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "created": { "a": true, "fo": "datetime", "h": "Created", "n": "created", "r": false, "sh": "Creation timestamp in ISO 8601 format.", "t": "`$STRING`", "key$": "created", "index$": 0 }, "id": { "a": true, "h": "Id", "n": "id", "r": false, "sh": "unique idenifier", "t": "`$STRING`", "key$": "id", "index$": 1 }, "isActive": { "a": true, "h": "Is Active", "n": "isActive", "r": false, "sh": "Active flag, inactive keys cannot be assigned to devices.", "t": "`$BOOLEAN`", "key$": "isActive", "index$": 2 }, "isP2PE": { "a": true, "h": "Is P2 Pe", "n": "isP2PE", "r": false, "sh": "Flags if a key is for a P2PE compliant cypher.", "t": "`$BOOLEAN`", "key$": "isP2PE", "index$": 3 }, "keyType": { "a": true, "h": "Key Type", "n": "keyType", "r": false, "sh": "The cipher type that the key works with.", "t": "`$STRING`", "key$": "keyType", "index$": 4 }, "modified": { "a": true, "fo": "datetime", "h": "Modified", "n": "modified", "r": false, "sh": "Last modified timestamp in ISO 8601 format.", "t": "`$STRING`", "key$": "modified", "index$": 5 }, "name": { "a": true, "h": "Name", "n": "name", "r": false, "sh": "Key name.", "t": "`$STRING`", "key$": "name", "index$": 6 }, "version": { "a": true, "h": "Version", "n": "version", "r": false, "sh": "The number of times that this resource has been updated.", "t": "`$INTEGER`", "key$": "version", "index$": 7 } }, "id": { "field": "id", "name": "id" }, "name": "inject_key", "op": { "list": { "input": "data", "name": "list", "points": [{ "a": true, "co": { "id": "GET /injectKeys", "source": "openapi3", "version": 2 }, "g": {}, "k": "http", "m": "GET", "o": "/injectKeys", "q": {}, "r": {}, "s": [{ "lit": "injectKeys" }], "t": { "req": "`reqdata`", "res": "`body.data`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /injectKeys/{id}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "k": "param", "n": "id", "or": "id", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "GET", "o": "/injectKeys/{id}", "q": { "exist": ["id"] }, "r": {}, "s": [{ "lit": "injectKeys" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "inject_key", "name__orig": "inject_key", "Name": "InjectKey", "name_": "inject_key", "name-": "inject-key", "NAME": "INJECT_KEY", "index$": 12 }, { "active": true, "entity": "inject_key", "key$": "BasicInjectKeyFlow", "kind": "basic", "name": "BasicInjectKeyFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": {}, "m": {}, "o": "list", "s": [], "v": [{ "apply": "ItemExists", "def": { "ref": "inject_key_ref01" } }], "index$": 0 }, { "a": true, "d": {}, "i": { "ref": "inject_key_ref01", "srcdatavar": "inject_key_ref01_data", "suffix": "_dt0" }, "m": { "id": "inject_key01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-inject_key_ref01" } }], "index$": 1 }] }, 'InjectKey', { "GET /injectKeys": { "protocol": "http", "parameters": [] }, "GET /injectKeys/{id}": { "protocol": "http", "parameters": [{ "name": "id", "in": "path", "description": "The Inject Key's unique identifier.", "required": true, "schema": { "type": "string" }, "index$": 0 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let inject_key_ref01_data = Object.values(setup.data.existing.inject_key)[0];
        // LIST
        const inject_key_ref01_ent = client.InjectKey();
        const inject_key_ref01_match = {};
        const inject_key_ref01_list = (await inject_key_ref01_ent.list(inject_key_ref01_match)).map((e) => e.data());
        // LOAD
        const inject_key_ref01_match_dt0 = {};
        inject_key_ref01_match_dt0.id = inject_key_ref01_data.id;
        const inject_key_ref01_data_dt0 = (await inject_key_ref01_ent.load(inject_key_ref01_match_dt0)).data();
        (0, node_assert_1.default)(inject_key_ref01_data_dt0.id === inject_key_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/inject_key/InjectKeyTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinDecryptxP2peSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['inject_key01', 'inject_key02', 'inject_key03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID': idmap,
        'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
        'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
    });
    idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_INJECT_KEY_ENTID'];
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
//# sourceMappingURL=InjectKeyEntity.test.js.map