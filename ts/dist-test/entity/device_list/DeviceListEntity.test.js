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
(0, node_test_1.describe)('DeviceListEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinDecryptxP2peSDK.test();
        const ent = testsdk.DeviceList();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
        for (const op of ['load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'device_list.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "data", "req": false, "short": "List of Devices.", "type": "`$ARRAY`", "index$": 0 }, { "active": true, "name": "total", "req": false, "short": "Total number of Devices available (not the number of Users in the response).", "type": "`$INTEGER`", "index$": 1 }], "name": "device_list", "op": { "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "share_partner_to", "orig": "share_partner_to", "reqd": true, "type": "`$STRING`", "index$": 0 }], "query": [{ "active": true, "example": 0, "kind": "query", "name": "skip", "orig": "skip", "reqd": false, "type": "`$INTEGER`", "index$": 0 }, { "active": true, "example": "asc", "kind": "query", "name": "sorting_direction", "orig": "sorting_direction", "reqd": false, "type": "`$STRING`", "index$": 1 }, { "active": true, "example": "serialnumber", "kind": "query", "name": "sorting_field", "orig": "sorting_field", "reqd": false, "type": "`$STRING`", "index$": 2 }, { "active": true, "example": 10, "kind": "query", "name": "take", "orig": "take", "reqd": false, "type": "`$INTEGER`", "index$": 3 }] }, "contract": { "id": "GET /virtualDevices/{sharePartnerTo}", "json": "{\"operationId\":\"list-shared-devices\",\"parameters\":[{\"description\":\"Partner that the Devices have been shared with.\",\"in\":\"path\",\"name\":\"sharePartnerTo\",\"required\":true,\"schema\":{\"type\":\"string\"}},{\"description\":\"The number of entries to include in the list.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"Sorts the list by one of these fields.\",\"in\":\"query\",\"name\":\"sorting.field\",\"schema\":{\"default\":\"serialnumber\",\"enum\":[\"id\",\"version\",\"created\",\"modified\",\"serialnumber\",\"alternatekey\",\"name\",\"devicetype\",\"devicestate\",\"location.id\",\"location.name\",\"activationdate\",\"partner.id\",\"partner.name\",\"client.id\",\"client.name\",\"kif.id\",\"kif.name\"],\"type\":\"string\"}},{\"description\":\"Direction to sort list direction. Used in conjunction with sorting.field parameter.\",\"in\":\"query\",\"name\":\"sorting.direction\",\"schema\":{\"default\":\"asc\",\"enum\":[\"asc\",\"desc\"],\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Devices.\",\"items\":{\"properties\":{\"activationDate\":{\"description\":\"Timestamp from when the Device was activated.\",\"example\":\"2017-05-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"alternateKey\":{\"description\":\"The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. If there is a difference between the two, the serial number on the casing or packaging should be used as the alternative key and also in the alterntive key property of any related Shipments entries.\",\"example\":\"ID85000711\",\"type\":\"string\"},\"client\":{\"description\":\"Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Client's ID.\",\"example\":\"4684\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Client's name.\",\"example\":\"The Tired Window\",\"type\":\"string\"}},\"type\":\"object\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"deviceBuild\":{\"description\":\"Reference to the associated Device Build resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls the id, name and build number are included in the response.\",\"properties\":{\"buildNumber\":{\"description\":\"The referenced Device's Build number.\",\"example\":\"IDTECH-007\",\"type\":\"string\"},\"id\":{\"description\":\"The referenced Device Build's ID\",\"example\":\"1305\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Country's name.\",\"example\":\"SREDKey 2 - PTS 5.X\",\"type\":\"string\"}},\"type\":\"object\"},\"deviceState\":{\"description\":\"Reference to the associated Device State resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Device State's ID.\",\"example\":\"2\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Device State's name.\",\"example\":\"activated\",\"type\":\"string\"}},\"type\":\"object\"},\"deviceType\":{\"description\":\"Reference to the associated Device Type resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Device Type's ID.\",\"example\":\"23\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Device Type's name.\",\"example\":\"SREDKey\",\"type\":\"string\"}},\"type\":\"object\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":\"73\",\"type\":\"string\"},\"isVirtual\":{\"description\":\"Indicates if a Device is Virtual (represents a Device shared with a partner).\",\"example\":false,\"type\":\"boolean\"},\"kif\":{\"description\":\"Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced KIF's ID.\",\"example\":\"4\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced KIF's name.\",\"example\":\"Kriptithe Technologies\",\"type\":\"string\"}},\"type\":\"object\"},\"lastActivityDate\":{\"description\":\"Timestamp from when the Device was last active.\",\"example\":\"2017-05-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"location\":{\"description\":\"Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Location's ID.\",\"example\":\"33668\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Location's name.\",\"example\":\"The Tired Window Atlanta Downtown\",\"type\":\"string\"}},\"required\":[\"id\"],\"type\":\"object\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-05-08T20:14:45.000Z\",\"format\":\"datetime\",\"type\":\"string\"},\"name\":{\"description\":\"The Device's name.\",\"example\":\"Atlanta Downtown Front Desk 1\",\"type\":\"string\"},\"notes\":{\"description\":\"Arbitary note that can be attached to a Device entry.\",\"example\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\",\"type\":\"string\"},\"partner\":{\"description\":\"Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.\",\"properties\":{\"id\":{\"description\":\"The referenced Partner's ID.\",\"example\":\"6580\",\"type\":\"string\"},\"name\":{\"description\":\"The referenced Partner's name.\",\"example\":\"ASM Software\",\"type\":\"string\"}},\"type\":\"object\"},\"serialNumber\":{\"description\":\"The Device's serial number.\",\"example\":\"85000711\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Devices available (not the number of Users in the response).\",\"example\":1,\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Virtual Device list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/virtualDevices/{sharePartnerTo}", "rename": { "param": { "sharePartnerTo": "share_partner_to" } }, "segments": [{ "lit": "virtualDevices" }, { "var": "share_partner_to" }], "select": { "exist": ["share_partner_to", "skip", "sorting_direction", "sorting_field", "take"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [["virtual_device"]] }, "key$": "device_list", "name__orig": "device_list", "Name": "DeviceList", "name_": "device_list", "name-": "device-list", "NAME": "DEVICE_LIST", "index$": 8 }, { "active": true, "entity": "device_list", "key$": "BasicDeviceListFlow", "kind": "basic", "name": "BasicDeviceListFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": { "ref": "device_list_ref01", "srcdatavar": "device_list_ref01_data", "suffix": "_dt0" }, "match": { "id": "device_list01" }, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-device_list_ref01" } }], "index$": 0 }] }, 'DeviceList');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let device_list_ref01_data = Object.values(setup.data.existing.device_list)[0];
        // LOAD: skipped — no entity id field and load requires path params.
        // Entity-var is declared here so later flow steps still compile.
        const device_list_ref01_ent = client.DeviceList();
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/device_list/DeviceListTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinDecryptxP2peSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['device_list01', 'device_list02', 'device_list03', 'virtual_device01', 'virtual_device02', 'virtual_device03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_LIST_ENTID': idmap,
        'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
        'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
    });
    idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_LIST_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_LIST_ENTID'];
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
//# sourceMappingURL=DeviceListEntity.test.js.map