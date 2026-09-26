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
(0, node_test_1.describe)('ShipmentEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('BLUEFIN_DECRYPTX_P2PE_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.BluefinDecryptxP2peSDK.test();
        const ent = testsdk.Shipment();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
        for (const op of ['create', 'list', 'load']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'shipment.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "carrier": { "a": true, "h": "Carrier", "n": "carrier", "r": false, "sh": "The name of the courier.", "t": "`$STRING`", "key$": "carrier", "index$": 0 }, "client": { "a": true, "h": "Client", "n": "client", "r": false, "sh": "Reference to the associated Client resource.", "t": "`$OBJECT`", "key$": "client", "index$": 1 }, "created": { "a": true, "fo": "datetime", "h": "Created", "n": "created", "r": false, "sh": "Creation timestamp in ISO 8601 format.", "t": "`$STRING`", "key$": "created", "index$": 2 }, "dateReceived": { "a": true, "fo": "datetime", "h": "Date Received", "n": "dateReceived", "r": false, "sh": "The date and time that a package is recieved.", "t": "`$STRING`", "key$": "dateReceived", "index$": 3 }, "dateShipped": { "a": true, "fo": "datetime", "h": "Date Shipped", "n": "dateShipped", "r": false, "sh": "The date and time that a package is shipped.", "t": "`$STRING`", "key$": "dateShipped", "index$": 4 }, "dcKif": { "a": true, "h": "Dc Kif", "n": "dcKif", "r": false, "sh": "Reference to the associated KIF resource.", "t": "`$OBJECT`", "key$": "dcKif", "index$": 5 }, "id": { "a": true, "h": "Id", "n": "id", "r": false, "sh": "This resource's unique identifier.", "t": "`$STRING`", "key$": "id", "index$": 6 }, "items": { "a": true, "h": "Items", "n": "items", "r": false, "t": "`$ARRAY`", "key$": "items", "index$": 7 }, "kif": { "a": true, "h": "Kif", "n": "kif", "r": false, "sh": "Reference to the associated KIF resource.", "t": "`$OBJECT`", "key$": "kif", "index$": 8 }, "modified": { "a": true, "fo": "datetime", "h": "Modified", "n": "modified", "r": false, "sh": "Last modified timestamp.", "t": "`$STRING`", "key$": "modified", "index$": 9 }, "partner": { "a": true, "h": "Partner", "n": "partner", "r": false, "sh": "Reference to the associated Partner.", "t": "`$OBJECT`", "key$": "partner", "index$": 10 }, "shipmentType": { "a": true, "h": "Shipment Type", "n": "shipmentType", "r": false, "sh": "The type of shipment.", "t": "`$STRING`", "key$": "shipmentType", "index$": 11 }, "tracking": { "a": true, "h": "Tracking", "n": "tracking", "r": false, "sh": "The courier's tracking number.", "t": "`$STRING`", "key$": "tracking", "index$": 12 }, "version": { "a": true, "fo": "int32", "h": "Version", "n": "version", "r": false, "sh": "The number of times that this resource has been updated.", "t": "`$INTEGER`", "key$": "version", "index$": 13 } }, "id": { "field": "id", "name": "id" }, "name": "shipment", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "co": { "id": "POST /shipments", "source": "openapi3", "version": 2 }, "g": {}, "k": "http", "m": "POST", "o": "/shipments", "q": {}, "r": {}, "s": [{ "lit": "shipments" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" }, "list": { "input": "data", "name": "list", "points": [{ "a": true, "co": { "id": "GET /shipments", "source": "openapi3", "version": 2 }, "g": { "query": [{ "a": true, "k": "query", "n": "kif", "or": "kif", "r": true, "t": "`$STRING`", "index$": 0 }, { "a": true, "k": "query", "n": "mode", "or": "mode", "r": false, "t": "`$STRING`", "index$": 1 }, { "a": true, "ex": 0, "k": "query", "n": "skip", "or": "skip", "r": false, "t": "`$INTEGER`", "index$": 2 }, { "a": true, "ex": 10, "k": "query", "n": "take", "or": "take", "r": false, "t": "`$INTEGER`", "index$": 3 }] }, "k": "http", "m": "GET", "o": "/shipments", "q": { "exist": ["kif", "mode", "skip", "take"] }, "r": {}, "s": [{ "lit": "shipments" }], "t": { "req": "`reqdata`", "res": "`body.data`" }, "index$": 0 }], "key$": "list" }, "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /shipments/{id}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "k": "param", "n": "id", "or": "id", "r": true, "t": "`$STRING`", "index$": 0 }] }, "k": "http", "m": "GET", "o": "/shipments/{id}", "q": { "exist": ["id"] }, "r": {}, "s": [{ "lit": "shipments" }, { "var": "id" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "shipment", "name__orig": "shipment", "Name": "Shipment", "name_": "shipment", "name-": "shipment", "NAME": "SHIPMENT", "index$": 16 }, { "active": true, "entity": "shipment", "key$": "BasicShipmentFlow", "kind": "basic", "name": "BasicShipmentFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "shipment_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }, { "a": true, "d": {}, "i": {}, "m": {}, "o": "list", "s": [], "v": [{ "apply": "ItemExists", "def": { "ref": "shipment_ref01" } }], "index$": 1 }, { "a": true, "d": {}, "i": { "ref": "shipment_ref01", "srcdatavar": "shipment_ref01_data", "suffix": "_dt0" }, "m": { "id": "shipment01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-shipment_ref01" } }], "index$": 2 }] }, 'Shipment', { "POST /shipments": { "protocol": "http", "requestBody": { "description": "Shipment to be created.", "content": { "*/*": { "schema": { "required": ["carrier", "client", "dateShipped", "items", "kif", "location", "partner", "tracking"], "type": "object", "properties": { "partner": { "type": "object", "properties": { "id": { "description": "The referenced Partner's ID.", "example": "6580", "type": "string" }, "name": { "description": "The referenced Partner's name.", "example": "ASM Software", "type": "string" } }, "description": "Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/PartnerReference" }, "client": { "type": "object", "properties": { "id": { "description": "The referenced Client's ID.", "example": "4684", "type": "string" }, "name": { "description": "The referenced Client's name.", "example": "The Tired Window", "type": "string" } }, "description": "Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/ClientReference" }, "location": { "required": ["id"], "type": "object", "properties": { "id": { "type": "string", "description": "The referenced Location's ID.", "example": "33668" }, "customReference": { "type": "string", "description": "A custom refernce to location object. This value can be set", "example": "ASD234" }, "name": { "type": "string", "description": "The referenced Location's name.", "example": "The Tired Window Atlanta Downtown" } }, "description": "Reference to the associated Location resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/LocationWithCustomReference" }, "kif": { "type": "object", "properties": { "id": { "description": "The referenced KIF's ID.", "example": "4", "type": "string" }, "name": { "description": "The referenced KIF's name.", "example": "Kriptithe Technologies", "type": "string" } }, "description": "Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/KifReference" }, "dcKif": { "type": "object", "properties": { "id": { "description": "The referenced KIF's ID.", "example": "4", "type": "string" }, "name": { "description": "The referenced KIF's name.", "example": "Kriptithe Technologies", "type": "string" } }, "description": "Reference to the associated KIF resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.", "x-ref": "#/components/schemas/KifReference" }, "carrier": { "type": "string", "description": "The name of the courier.", "enum": ["UPS", "FedEx"] }, "tracking": { "maxLength": 255, "type": "string", "description": "The courier's tracking number.", "example": "1Z999AA10123456784" }, "dateShipped": { "type": "string", "description": "The date and time that a package is shipped.", "format": "datetime", "example": "2017-02-08T20:14:45.000Z" }, "items": { "type": "array", "items": { "type": "object", "properties": { "tamperLabel": { "maxLength": 255, "type": "string", "description": "The code that is printed the tamper label of the Device that is shipped.", "example": "BF120877" }, "serialNumber": { "maxLength": 255, "type": "string", "description": "The serial number of the Device that is shipped.", "example": "85000711" } }, "x-ref": "#/components/schemas/ShipmentItemCreate" } } }, "x-ref": "#/components/schemas/ShipmentCreate" } } }, "required": true }, "parameters": [] }, "GET /shipments": { "protocol": "http", "parameters": [{ "name": "kif", "in": "query", "description": "Filter the list by KIF. The parameter value can be either a KIF ID or Name.", "required": true, "schema": { "type": "string" }, "index$": 0 }, { "name": "mode", "in": "query", "description": "Filter the list by shipment mode.", "schema": { "type": "string", "enum": ["inTransit", "received"] }, "index$": 1 }, { "name": "take", "in": "query", "description": "The number of entries to include in the list.", "schema": { "type": "integer", "format": "int32", "default": 10 }, "index$": 2 }, { "name": "skip", "in": "query", "description": "The number of results to skip before listing entries.", "schema": { "type": "integer", "format": "int32", "default": 0 }, "index$": 3 }] }, "GET /shipments/{id}": { "protocol": "http", "parameters": [{ "name": "id", "in": "path", "description": "The Shipment's unique identifier.", "required": true, "schema": { "type": "string" }, "index$": 0 }] } });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const shipment_ref01_ent = client.Shipment();
        let shipment_ref01_data = setup.data.new.shipment['shipment_ref01'];
        shipment_ref01_data = (await shipment_ref01_ent.create(shipment_ref01_data)).data();
        (0, node_assert_1.default)(null != shipment_ref01_data.id);
        // LIST
        const shipment_ref01_match = {};
        const shipment_ref01_list = (await shipment_ref01_ent.list(shipment_ref01_match)).map((e) => e.data());
        (0, node_assert_1.default)(!isempty(select(shipment_ref01_list, { id: shipment_ref01_data.id })));
        // LOAD
        const shipment_ref01_match_dt0 = {};
        shipment_ref01_match_dt0.id = shipment_ref01_data.id;
        const shipment_ref01_data_dt0 = (await shipment_ref01_ent.load(shipment_ref01_match_dt0)).data();
        (0, node_assert_1.default)(shipment_ref01_data_dt0.id === shipment_ref01_data.id);
    });
});
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/shipment/ShipmentTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.BluefinDecryptxP2peSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['shipment01', 'shipment02', 'shipment03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID': idmap,
        'BLUEFIN_DECRYPTX_P2PE_TEST_LIVE': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_TEST_EXPLAIN': 'FALSE',
        'BLUEFIN_DECRYPTX_P2PE_APIKEY': '',
        'BLUEFIN_DECRYPTX_P2PE_SECRET': '',
    });
    idmap = env['BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID'];
    const live = 'TRUE' === env.BLUEFIN_DECRYPTX_P2PE_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['BLUEFIN_DECRYPTX_P2PE_TEST_SHIPMENT_ENTID'];
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
//# sourceMappingURL=ShipmentEntity.test.js.map