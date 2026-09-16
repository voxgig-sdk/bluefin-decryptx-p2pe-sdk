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
// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
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
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "format": "date-time", "name": "completeDate", "req": false, "short": "The date and time that the Custody change took place.", "type": "`$STRING`", "index$": 0 }, { "active": true, "format": "date-time", "name": "created", "req": false, "short": "Creation timestamp in ISO 8601 format.", "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "createdBy", "req": true, "short": "Reference to the associated User resource.", "type": "`$OBJECT`", "index$": 2 }, { "active": true, "name": "custodian", "req": true, "short": "Reference to the associated User resource.", "type": "`$OBJECT`", "index$": 3 }, { "active": true, "name": "device", "req": false, "short": "Reference to the associated Device resource.", "type": "`$OBJECT`", "index$": 4 }, { "active": true, "format": "int64", "name": "id", "req": false, "short": "This resource's unique identifier.", "type": "`$INTEGER`", "index$": 5 }, { "active": true, "name": "location", "req": true, "short": "Reference to the associated Location resource.", "type": "`$OBJECT`", "index$": 6 }, { "active": true, "format": "date-time", "name": "modified", "req": false, "short": "Last modified timestamp.", "type": "`$STRING`", "index$": 7 }, { "active": true, "name": "modifiedBy", "req": true, "short": "Reference to the associated User resource.", "type": "`$OBJECT`", "index$": 8 }, { "active": true, "name": "notes", "req": false, "short": "Free form field that allows the Client associate notes with the Custody Change.", "type": "`$STRING`", "index$": 9 }, { "active": true, "name": "status", "req": false, "short": "Reference to the associated Custody Status.", "type": "`$OBJECT`", "index$": 10 }, { "active": true, "name": "transferMethod", "req": false, "short": "Reference to the associated Transfer Method.", "type": "`$OBJECT`", "index$": 11 }, { "active": true, "name": "version", "req": false, "short": "The number of times that this resource has been updated.", "type": "`$INTEGER`", "index$": 12 }], "id": { "field": "id", "name": "id" }, "name": "device_custody_detail", "op": { "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "device_type", "orig": "device_type", "reqd": true, "type": "`$STRING`", "index$": 0 }, { "active": true, "kind": "param", "name": "id", "orig": "id", "reqd": true, "type": "`$STRING`", "index$": 1 }, { "active": true, "kind": "param", "name": "serial_number", "orig": "serial_number", "reqd": true, "type": "`$STRING`", "index$": 2 }] }, "contract": { "id": "GET /devices/{serialNumber}/{deviceType}/custody/{id}", "json": "{\"operationId\":\"get-custody\",\"parameters\":[{\"description\":\"Device serial number.\",\"in\":\"path\",\"name\":\"serialNumber\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Device type name.\",\"in\":\"path\",\"name\":\"deviceType\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"Custody id.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"completeDate\":{\"description\":\"The date and time that the Custody change took place.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"date-time\",\"type\":\"string\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"date-time\",\"type\":\"string\"},\"createdBy\":{\"description\":\"Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User's id.\",\"properties\":{\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced User's Name.\",\"example\":\"Joan Smith\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"custodian\":{\"description\":\"Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User's id.\",\"properties\":{\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced User's Name.\",\"example\":\"Joan Smith\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"device\":{\"description\":\"Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.\",\"properties\":{\"id\":{\"description\":\"The referenced Device's ID\",\"example\":\"73\",\"type\":\"string\"},\"serialNumber\":{\"description\":\"The referenced Device's serial number.\",\"example\":\"85000711\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":10,\"format\":\"int64\",\"type\":\"integer\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-05-08T20:14:45.000Z\",\"format\":\"date-time\",\"type\":\"string\"},\"modifiedBy\":{\"description\":\"Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User's id.\",\"properties\":{\"id\":{\"description\":\"The referenced User's ID.\",\"example\":\"56\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced User's Name.\",\"example\":\"Joan Smith\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"notes\":{\"description\":\"Free form field that allows the Client associate notes with the Custody Change.\",\"example\":\"Altering custody due to change of personel at site.\",\"type\":\"string\"},\"status\":{\"description\":\"Reference to the associated Custody Status. Can contain either the ID or Name.\",\"properties\":{\"id\":{\"description\":\"Custody Status ID\",\"example\":2,\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"Custody Status name\",\"example\":\"Received\",\"type\":\"string\"}},\"type\":\"object\"},\"transferMethod\":{\"description\":\"Reference to the associated Transfer Method. Can contain either the ID or Name.\",\"properties\":{\"id\":{\"description\":\"Transfer Method ID\",\"example\":3,\"format\":\"int64\",\"type\":\"integer\"},\"name\":{\"description\":\"Transfer Method name\",\"example\":\"Shipment\",\"type\":\"string\"}},\"type\":\"object\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Device Custody Details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/devices/{serialNumber}/{deviceType}/custody/{id}", "rename": { "param": { "deviceType": "device_type", "serialNumber": "serial_number" } }, "segments": [{ "lit": "devices" }, { "var": "serial_number" }, { "var": "device_type" }, { "lit": "custody" }, { "var": "id" }], "select": { "exist": ["device_type", "id", "serial_number"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [["device"]] }, "key$": "device_custody_detail", "name__orig": "device_custody_detail", "Name": "DeviceCustodyDetail", "name_": "device_custody_detail", "name-": "device-custody-detail", "NAME": "DEVICE_CUSTODY_DETAIL", "index$": 6 }, { "active": true, "entity": "device_custody_detail", "key$": "BasicDeviceCustodyDetailFlow", "kind": "basic", "name": "BasicDeviceCustodyDetailFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "device_custody_detail_ref01", "srcdatavar": "device_custody_detail_ref01_data", "suffix": "_dt0" }, "match": { "device_type": "device_type01", "id": "device_custody_detail01", "serial_number": "serial_number01" }, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-device_custody_detail_ref01" } }], "index$": 0 }] }, 'DeviceCustodyDetail');
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
    let idmap = transform(['device_custody_detail01', 'device_custody_detail02', 'device_custody_detail03', 'device01', 'device02', 'device03'], {
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