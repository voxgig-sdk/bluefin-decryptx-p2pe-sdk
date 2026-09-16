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
(0, node_test_1.describe)('DeviceBuildEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinDecryptxP2peSDK.test();
        const ent = testsdk.DeviceBuild();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
        for (const op of ['list', 'load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'device_build.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": [{ "active": true, "name": "appVersion", "req": false, "short": "If a Device Type has more than one Application Code version the supported version is specified here.", "type": "`$STRING`", "index$": 0 }, { "active": true, "name": "buildNumber", "req": false, "short": "The Build Number.", "type": "`$STRING`", "index$": 1 }, { "active": true, "name": "configFileName", "req": false, "short": "The name of the configuration file that is uploaded to the device.", "type": "`$STRING`", "index$": 2 }, { "active": true, "format": "date-time", "name": "created", "req": false, "short": "Creation timestamp in ISO 8601 format.", "type": "`$STRING`", "index$": 3 }, { "active": true, "name": "deviceType", "req": false, "short": "The Device Type Name.", "type": "`$STRING`", "index$": 4 }, { "active": true, "name": "firmwareVersion", "req": false, "short": "A list of firmware versions that this Device Build covers.", "type": "`$STRING`", "index$": 5 }, { "active": true, "name": "hardwareVersion", "req": false, "short": "A list of hardware versions that this Device Build covers.", "type": "`$STRING`", "index$": 6 }, { "active": true, "format": "int64", "name": "id", "req": false, "short": "This resource's unique identifier.", "type": "`$INTEGER`", "index$": 7 }, { "active": true, "name": "isActive", "req": false, "short": "This property indicates if the device build is still active and not succeeded by subsequent build.", "type": "`$BOOLEAN`", "index$": 8 }, { "active": true, "format": "date-time", "name": "modified", "req": false, "short": "Last modified timestamp.", "type": "`$STRING`", "index$": 9 }, { "active": true, "name": "name", "req": false, "short": "The Device Builds's name.", "type": "`$STRING`", "index$": 10 }, { "active": true, "name": "notes", "req": false, "short": "Notes attached to the device build by Bluefin CISO.", "type": "`$STRING`", "index$": 11 }, { "active": true, "name": "version", "req": false, "short": "The number of times that this resource has been updated.", "type": "`$INTEGER`", "index$": 12 }, { "active": true, "name": "whiteListingBinRanges", "req": false, "short": "A comma separated list of BIN ranges that aren't encrypted by the terminal.", "type": "`$STRING`", "index$": 13 }, { "active": true, "name": "whiteListingUsed", "req": false, "short": "This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal.", "type": "`$BOOLEAN`", "index$": 14 }], "id": { "field": "id", "name": "id" }, "name": "device_build", "op": { "list": { "input": "data", "name": "list", "points": [{ "active": true, "args": { "query": [{ "active": true, "kind": "query", "name": "device_type", "orig": "device_type", "reqd": false, "type": "`$STRING`", "index$": 0 }, { "active": true, "example": 0, "kind": "query", "name": "skip", "orig": "skip", "reqd": false, "type": "`$INTEGER`", "index$": 1 }, { "active": true, "example": 10, "kind": "query", "name": "take", "orig": "take", "reqd": false, "type": "`$INTEGER`", "index$": 2 }] }, "contract": { "id": "GET /deviceBuilds", "json": "{\"operationId\":\"list-deviceBuilds\",\"parameters\":[{\"description\":\"Filter by Device Type. The parameter value must be the Device Type name, Device Type ID is not supported.\",\"in\":\"query\",\"name\":\"deviceType\",\"schema\":{\"type\":\"string\"}},{\"description\":\"The number of entries to include in the response.\",\"in\":\"query\",\"name\":\"take\",\"schema\":{\"default\":10,\"format\":\"int32\",\"type\":\"integer\"}},{\"description\":\"The number of results to skip before listing entries.\",\"in\":\"query\",\"name\":\"skip\",\"schema\":{\"default\":0,\"format\":\"int32\",\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"data\":{\"description\":\"List of Device Builds.\",\"items\":{\"properties\":{\"appVersion\":{\"description\":\"If a Device Type has more than one Application Code version the supported version is specified here.\",\"example\":\"N/A\",\"type\":\"string\"},\"buildNumber\":{\"description\":\"The Build Number.\",\"example\":\"IDTECH-007\",\"type\":\"string\"},\"configFileName\":{\"description\":\"The name of the configuration file that is uploaded to the device.\",\"example\":\"4.234.72\",\"type\":\"string\"},\"deviceType\":{\"description\":\"The Device Type Name.\",\"example\":\"SREDKey 2\",\"type\":\"string\"},\"firmwareVersion\":{\"description\":\"A list of firmware versions that this Device Build covers.\",\"example\":\"SREDKEY2 FW v1.00.xxx.xxxx.S\",\"type\":\"string\"},\"hardwareVersion\":{\"description\":\"A list of hardware versions that this Device Build covers.\",\"example\":\"80172001(With MSR), 80172002(Without MSR)\",\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":1305,\"format\":\"int64\",\"type\":\"integer\"},\"isActive\":{\"description\":\"This property indicates if the device build is still active and not succeeded by subsequent build.\",\"example\":true,\"type\":\"boolean\"},\"name\":{\"description\":\"The User's name.\",\"example\":\"SREDKey 2 - PTS 5.X\",\"type\":\"string\"},\"whiteListingBinRanges\":{\"description\":\"A comma separated list of BIN ranges that aren't encrypted by the terminal. This configuration has no impact on Decryptx processing. It is used for reporting only.\",\"example\":\"410000\",\"type\":\"string\"},\"whiteListingUsed\":{\"description\":\"This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. This configuration has no impact on Decryptx processing. It is used for reporting only.\",\"example\":true,\"type\":\"boolean\"}},\"type\":\"object\"},\"type\":\"array\"},\"total\":{\"description\":\"Total number of Device Builds available (not the number of Device Builds in the response).\",\"type\":\"integer\"}},\"type\":\"object\"}}},\"description\":\"Device Builds list\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"409\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"errorCode\":{\"example\":7409,\"type\":\"integer\"},\"errors\":{\"items\":{\"properties\":{\"[attribute name]\":{\"description\":\"Error object that is output when an API call fails validation.\",\"properties\":{\"attribute\":{\"description\":\"The name of the attribute that failed validation.\",\"example\":\"mailCountry\",\"type\":\"string\"},\"errorCode\":{\"description\":\"Error code\",\"example\":1002,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Mail country has an incorrect length\",\"type\":\"string\"}},\"type\":\"object\"}},\"type\":\"object\"},\"type\":\"array\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Data validation constraints.\",\"type\":\"string\"},\"uuid\":{\"example\":\"995ce120-d42c-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Invalid data\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/deviceBuilds", "segments": [{ "lit": "deviceBuilds" }], "select": { "exist": ["device_type", "skip", "take"] }, "transform": { "req": "`reqdata`", "res": "`body.data`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "active": true, "args": { "params": [{ "active": true, "kind": "param", "name": "id", "orig": "id", "reqd": true, "type": "`$STRING`", "index$": 0 }] }, "contract": { "id": "GET /deviceBuilds/{id}", "json": "{\"operationId\":\"get-deviceBuild\",\"parameters\":[{\"description\":\"The Device Build's unique identifier.\",\"in\":\"path\",\"name\":\"id\",\"required\":true,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"properties\":{\"appVersion\":{\"description\":\"If a Device Type has more than one Application Code version the supported version is specified here.\",\"example\":\"N/A\",\"type\":\"string\"},\"buildNumber\":{\"description\":\"The Build Number.\",\"example\":\"IDTECH-007\",\"type\":\"string\"},\"configFileName\":{\"description\":\"The name of the configuration file that is uploaded to the device.\",\"example\":\"4.234.72\",\"type\":\"string\"},\"created\":{\"description\":\"Creation timestamp in ISO 8601 format.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"date-time\",\"type\":\"string\"},\"deviceType\":{\"description\":\"The Device Type Name.\",\"example\":\"SREDKey 2\",\"type\":\"string\"},\"firmwareVersion\":{\"description\":\"A list of firmware versions that this Device Build covers.\",\"example\":\"SREDKEY2 FW v1.00.xxx.xxxx.S\",\"type\":\"string\"},\"hardwareVersion\":{\"description\":\"A list of hardware versions that this Device Build covers.\",\"example\":\"80172001(With MSR), 80172002(Without MSR)\",\"type\":\"string\"},\"id\":{\"description\":\"This resource's unique identifier.\",\"example\":1305,\"format\":\"int64\",\"type\":\"integer\"},\"isActive\":{\"description\":\"This property indicates if the device build is still active and not succeeded by subsequent build.\",\"example\":true,\"type\":\"boolean\"},\"modified\":{\"description\":\"Last modified timestamp.\",\"example\":\"2017-02-08T20:14:45.000Z\",\"format\":\"date-time\",\"type\":\"string\"},\"name\":{\"description\":\"The Device Builds's name.\",\"example\":\"SREDKey 2 - PTS 5.X\",\"type\":\"string\"},\"notes\":{\"description\":\"Notes attached to the device build by Bluefin CISO.\",\"example\":\"Firmware only device - Bluefin build ordered with Encryption enabled from Manufacturer\",\"type\":\"string\"},\"version\":{\"description\":\"The number of times that this resource has been updated.\",\"example\":3,\"type\":\"integer\"},\"whiteListingBinRanges\":{\"description\":\"A comma separated list of BIN ranges that aren't encrypted by the terminal. This configuration has no impact on Decryptx processing. It is used for reporting only.\",\"example\":\"410000\",\"type\":\"string\"},\"whiteListingUsed\":{\"description\":\"This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. This configuration has no impact on Decryptx processing. It is used for reporting only.\",\"example\":true,\"type\":\"boolean\"}},\"type\":\"object\"}}},\"description\":\"Device Build details\"},\"401\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output for unauthoised API calls.\",\"properties\":{\"errorCode\":{\"example\":7401,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Unauthenticated request.\",\"type\":\"string\"},\"uuid\":{\"example\":\"fe9d7890-d429-11e7-bcff-49e075da4e68\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Unauthorized\"},\"403\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when the an authoised API call lacks permissions to access the resource that it is requesting.\",\"properties\":{\"errorCode\":{\"example\":7403,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Permission denied.\",\"type\":\"string\"},\"uuid\":{\"example\":\"971a99a0-d429-11e7-b9e1-edee15522512\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Forbidden\"},\"404\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a resource cannot be found.\",\"properties\":{\"errorCode\":{\"example\":7404,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the error message.\",\"example\":\"Requested resource cannot be found.\",\"type\":\"string\"},\"uuid\":{\"example\":\"a7518f50-d428-11e7-a87d-7fe171ffa82f\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Not found\"},\"500\":{\"content\":{\"application/json\":{\"schema\":{\"description\":\"Error object that is output when a server error is encountered.\",\"properties\":{\"errorCode\":{\"example\":1005,\"type\":\"integer\"},\"message\":{\"description\":\"Human readable description of the validation error.\",\"example\":\"Unknown Error\",\"type\":\"string\"}},\"type\":\"object\"}}},\"description\":\"Internal server error\"}},\"security\":[{\"basic\":[]}],\"securitySchemes\":{\"ApiKeyAuth\":{\"in\":\"header\",\"name\":\"Authorization\",\"type\":\"apiKey\"},\"basic\":{\"scheme\":\"basic\",\"type\":\"http\"}},\"securitySource\":\"definition\"}", "source": "openapi3", "version": 1 }, "kind": "http", "method": "GET", "orig": "/deviceBuilds/{id}", "segments": [{ "lit": "deviceBuilds" }, { "var": "id" }], "select": { "exist": ["id"] }, "transform": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "device_build", "name__orig": "device_build", "Name": "DeviceBuild", "name_": "device_build", "name-": "device-build", "NAME": "DEVICE_BUILD", "index$": 5 }, { "active": true, "entity": "device_build", "key$": "BasicDeviceBuildFlow", "kind": "basic", "name": "BasicDeviceBuildFlow", "param": {}, "step": [{ "active": true, "data": {}, "input": {}, "match": {}, "op": "list", "spec": [], "valid": [{ "apply": "ItemExists", "def": { "ref": "device_build_ref01" } }], "index$": 0 }, { "active": true, "data": {}, "input": { "ref": "device_build_ref01", "srcdatavar": "device_build_ref01_data", "suffix": "_dt0" }, "match": { "id": "device_build01" }, "op": "load", "spec": [], "valid": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-device_build_ref01" } }], "index$": 1 }] }, 'DeviceBuild');
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let device_build_ref01_data = Object.values(setup.data.existing.device_build)[0];
        // LIST
        const device_build_ref01_ent = client.DeviceBuild();
        const device_build_ref01_match = {};
        const device_build_ref01_list = (await device_build_ref01_ent.list(device_build_ref01_match)).map((e) => e.data());
        // LOAD
        const device_build_ref01_match_dt0 = {};
        device_build_ref01_match_dt0.id = device_build_ref01_data.id;
        const device_build_ref01_data_dt0 = (await device_build_ref01_ent.load(device_build_ref01_match_dt0)).data();
        (0, node_assert_1.default)(device_build_ref01_data_dt0.id === device_build_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/device_build/DeviceBuildTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinDecryptxP2peSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['device_build01', 'device_build02', 'device_build03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID': idmap,
        'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
        'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
    });
    idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_DEVICE_BUILD_ENTID'];
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
//# sourceMappingURL=DeviceBuildEntity.test.js.map