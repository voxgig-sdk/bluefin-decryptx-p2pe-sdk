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
(0, node_test_1.describe)('DeviceCustodyDetailEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinDecryptxP2peSDK.test();
        const ent = testsdk.DeviceCustodyDetail();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
        for (const op of ['load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'device_custody_detail.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "completeDate": { "a": true, "fo": "date-time", "h": "Complete Date", "n": "completeDate", "r": false, "sh": "The date and time that the Custody change took place.", "t": "`$STRING`", "key$": "completeDate", "index$": 0 }, "created": { "a": true, "fo": "date-time", "h": "Created", "n": "created", "r": false, "sh": "Creation timestamp in ISO 8601 format.", "t": "`$STRING`", "key$": "created", "index$": 1 }, "createdBy": { "a": true, "h": "Created By", "n": "createdBy", "r": true, "sh": "Reference to the associated User resource.", "t": "`$OBJECT`", "key$": "createdBy", "index$": 2 }, "custodian": { "a": true, "h": "Custodian", "n": "custodian", "r": true, "sh": "Reference to the associated User resource.", "t": "`$OBJECT`", "key$": "custodian", "index$": 3 }, "device": { "a": true, "h": "Device", "n": "device", "r": false, "sh": "Reference to the associated Device resource.", "t": "`$OBJECT`", "key$": "device", "index$": 4 }, "id": { "a": true, "fo": "int64", "h": "Id", "n": "id", "r": false, "sh": "This resource's unique identifier.", "t": "`$INTEGER`", "key$": "id", "index$": 5 }, "location": { "a": true, "h": "Location", "n": "location", "r": true, "sh": "Reference to the associated Location resource.", "t": "`$OBJECT`", "key$": "location", "index$": 6 }, "modified": { "a": true, "fo": "date-time", "h": "Modified", "n": "modified", "r": false, "sh": "Last modified timestamp.", "t": "`$STRING`", "key$": "modified", "index$": 7 }, "modifiedBy": { "a": true, "h": "Modified By", "n": "modifiedBy", "r": true, "sh": "Reference to the associated User resource.", "t": "`$OBJECT`", "key$": "modifiedBy", "index$": 8 }, "notes": { "a": true, "h": "Notes", "n": "notes", "r": false, "sh": "Free form field that allows the Client associate notes with the Custody Change.", "t": "`$STRING`", "key$": "notes", "index$": 9 }, "status": { "a": true, "h": "Status", "n": "status", "r": false, "sh": "Reference to the associated Custody Status.", "t": "`$OBJECT`", "key$": "status", "index$": 10 }, "transferMethod": { "a": true, "h": "Transfer Method", "n": "transferMethod", "r": false, "sh": "Reference to the associated Transfer Method.", "t": "`$OBJECT`", "key$": "transferMethod", "index$": 11 }, "version": { "a": true, "h": "Version", "n": "version", "r": false, "sh": "The number of times that this resource has been updated.", "t": "`$INTEGER`", "key$": "version", "index$": 12 } }, "id": { "field": "id", "name": "id" }, "name": "device_custody_detail", "op": { "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /devices/{serialNumber}/{deviceType}/custody/{id}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "k": "param", "n": "device_type", "or": "device_type", "r": true, "t": "`$STRING`", "index$": 0 }, { "a": true, "k": "param", "n": "id", "or": "id", "r": true, "t": "`$STRING`", "index$": 1 }, { "a": true, "k": "param", "n": "serial_number", "or": "serial_number", "r": true, "t": "`$STRING`", "index$": 2 }] }, "k": "http", "m": "GET", "o": "/devices/{serialNumber}/{deviceType}/custody/{id}", "q": { "exist": ["device_type", "id", "serial_number"] }, "r": { "param": { "deviceType": "device_type", "serialNumber": "serial_number" } }, "s": [{ "lit": "devices" }, { "var": "serial_number" }, { "var": "device_type" }, { "lit": "custody" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [["$.main.kit.entity.device"]] }, "key$": "device_custody_detail", "name__orig": "device_custody_detail", "Name": "DeviceCustodyDetail", "name_": "device_custody_detail", "name-": "device-custody-detail", "NAME": "DEVICE_CUSTODY_DETAIL", "index$": 6 }, { "active": true, "entity": "device_custody_detail", "key$": "BasicDeviceCustodyDetailFlow", "kind": "basic", "name": "BasicDeviceCustodyDetailFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "device_custody_detail_ref01", "srcdatavar": "device_custody_detail_ref01_data", "suffix": "_dt0" }, "m": { "device_type": "device_type01", "id": "device_custody_detail01", "serial_number": "serial_number01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-device_custody_detail_ref01" } }], "index$": 0 }] }, 'DeviceCustodyDetail', { "GET /devices/{serialNumber}/{deviceType}/custody/{id}": { "protocol": "http", "parameters": [{ "name": "serialNumber", "in": "path", "description": "Device serial number.", "required": true, "schema": { "type": "string" }, "index$": 0 }, { "name": "deviceType", "in": "path", "description": "Device type name.", "required": true, "schema": { "type": "string" }, "index$": 1 }, { "name": "id", "in": "path", "description": "Custody id.", "required": true, "schema": { "type": "string" }, "index$": 2 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let device_custody_detail_ref01_data = Object.values(setup.data.existing.device_custody_detail)[0];
        // LOAD
        const device_custody_detail_ref01_ent = client.DeviceCustodyDetail();
        const device_custody_detail_ref01_match_dt0 = {};
        device_custody_detail_ref01_match_dt0.id = device_custody_detail_ref01_data.id;
        const device_custody_detail_ref01_data_dt0 = (await device_custody_detail_ref01_ent.load(device_custody_detail_ref01_match_dt0)).data();
        (0, node_assert_1.default)(device_custody_detail_ref01_data_dt0.id === device_custody_detail_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/device_custody_detail/DeviceCustodyDetailTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinDecryptxP2peSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['device_custody_detail01', 'device_custody_detail02', 'device_custody_detail03', 'device01', 'device02', 'device03', 'device_type01', 'serial_number01'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID': idmap,
        'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
        'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
    });
    idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_CUSTODY_DETAIL_ENTID'];
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
//# sourceMappingURL=DeviceCustodyDetailEntity.test.js.map