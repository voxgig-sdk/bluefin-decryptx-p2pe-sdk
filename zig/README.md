# BluefinDecryptxP2pe Zig SDK



The Zig SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Zig conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(h.vnull())` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
Zig has no central package registry, so this package is distributed as a
git tag (`zig/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)). Add it to
your `build.zig.zon` dependencies, or build from a source checkout:

```bash
cd zig && zig build
```

To depend on it from another project, add the tagged archive to
`build.zig.zon`:

```zig
.dependencies = .{
    .sdk = .{
        .url = "<repo-url>/archive/refs/tags/zig/vX.Y.Z.tar.gz",
        // .hash = "...", // filled in by `zig fetch`
    },
},
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```zig
const std = @import("std");
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinDecryptxP2peSDK.new(h.jo(&.{
    .{ "apikey", h.vstr(std.posix.getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY") orelse "") },
}));
```

### 2. List attestation records

`list()` returns an `OpResult` whose `.ok` is a `Value` array —
`switch` on it.

```zig
switch (client.attestation(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |attestations| std.debug.print("{s}\n", .{h.stringify(attestations)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()`'s `.ok` carries the bare record.

```zig
switch (client.device_custody_detail(h.vnull()).load(h.jo(&.{.{ "device_type", h.vstr("example_device_type") }, .{ "serial_number", h.vstr("example_serial_number") }, .{ "id", h.vstr("example_id") }}), h.vnull())) {
    .ok => |device_custody_detail| std.debug.print("{s}\n", .{h.stringify(device_custody_detail)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### 4. Create, update, and remove

```zig
// Create — .ok carries the created record
switch (client.attestation(h.vnull()).create(h.jo(&.{.{ "client", h.omap() }, .{ "completeDate", h.vstr("example_completeDate") }}), h.vnull())) {
    .ok => |created| std.debug.print("{s}\n", .{h.stringify(created)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const devicetypes = await client.DeviceType().list()
  console.log(devicetypes)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```zig
const result = client.direct(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("GET") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
}));

if (h.get_bool(result, "ok") orelse false) {
    std.debug.print("{d}\n", .{h.to_int(h.getp(result, "status"))}); // 200
    std.debug.print("{s}\n", .{h.stringify(h.getp(result, "data"))}); // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    std.debug.print("{s}\n", .{h.get_str(result, "err") orelse ""});
}
```

### Prepare a request without sending it

```zig
// prepare() returns the fetch definition (an error union — use `catch`/`try`).
const fetchdef = client.prepare(h.jo(&.{
    .{ "path", h.vstr("/api/resource/{id}") },
    .{ "method", h.vstr("DELETE") },
    .{ "params", h.jo(&.{.{ "id", h.vstr("example") }}) },
})) catch unreachable;

std.debug.print("{s}\n", .{h.get_str(fetchdef, "url") orelse ""});
std.debug.print("{s}\n", .{h.get_str(fetchdef, "method") orelse ""});
std.debug.print("{s}\n", .{h.stringify(h.getp(fetchdef, "headers"))});
```

### Use test mode

Create a mock client for unit testing — no server required:

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());

// Entity ops return an OpResult — .ok carries the record, .err the error.
switch (client.device_type(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |device_type| std.debug.print("{s}\n", .{h.stringify(device_type)}), // the mock record
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Point at a different server

Override the base URL to reach a local or staging server:

```zig
const client = sdk.BluefinDecryptxP2peSDK.new(h.jo(&.{
    .{ "base", h.vstr("http://localhost:8080") },
}));
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd zig && zig build test
```


## Reference

### BluefinDecryptxP2peSDK

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinDecryptxP2peSDK.new(options);
```

Creates a new SDK client. `options` is a `Value` map (`h.vnull()` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```zig
const client = sdk.test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`h.vnull()`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() Value` | Deep copy of the current SDK options. |
| `get_utility` | `() *Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) E!Value` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) Value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `attestation` | `(entopts: Value) *AttestationEntity` | Create an Attestation entity instance. |
| `client` | `(entopts: Value) *ClientEntity` | Create a Client entity instance. |
| `create_result` | `(entopts: Value) *CreateResultEntity` | Create a CreateResult entity instance. |
| `decryption` | `(entopts: Value) *DecryptionEntity` | Create a Decryption entity instance. |
| `device` | `(entopts: Value) *DeviceEntity` | Create a Device entity instance. |
| `device_build` | `(entopts: Value) *DeviceBuildEntity` | Create a DeviceBuild entity instance. |
| `device_custody_detail` | `(entopts: Value) *DeviceCustodyDetailEntity` | Create a DeviceCustodyDetail entity instance. |
| `device_custody_list` | `(entopts: Value) *DeviceCustodyListEntity` | Create a DeviceCustodyList entity instance. |
| `device_list` | `(entopts: Value) *DeviceListEntity` | Create a DeviceList entity instance. |
| `device_receive_result` | `(entopts: Value) *DeviceReceiveResultEntity` | Create a DeviceReceiveResult entity instance. |
| `device_rki_activate_result` | `(entopts: Value) *DeviceRkiActivateResultEntity` | Create a DeviceRkiActivateResult entity instance. |
| `device_state` | `(entopts: Value) *DeviceStateEntity` | Create a DeviceState entity instance. |
| `device_type` | `(entopts: Value) *DeviceTypeEntity` | Create a DeviceType entity instance. |
| `inject_key` | `(entopts: Value) *InjectKeyEntity` | Create an InjectKey entity instance. |
| `kif` | `(entopts: Value) *KifEntity` | Create a Kif entity instance. |
| `location` | `(entopts: Value) *LocationEntity` | Create a Location entity instance. |
| `partner` | `(entopts: Value) *PartnerEntity` | Create a Partner entity instance. |
| `shipment` | `(entopts: Value) *ShipmentEntity` | Create a Shipment entity instance. |
| `success` | `(entopts: Value) *SuccessEntity` | Create a Success entity instance. |
| `transaction` | `(entopts: Value) *TransactionEntity` | Create a Transaction entity instance. |
| `update_result` | `(entopts: Value) *UpdateResultEntity` | Create an UpdateResult entity instance. |
| `user` | `(entopts: Value) *UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) OpResult` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) OpResult` | List entities matching the criteria (`.ok` is a `Value` array). |
| `create` | `(reqdata: Value, ctrl: Value) OpResult` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) OpResult` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) OpResult` | Remove an entity. |
| `stream` | `(action: []const u8, args: Value, callopts: Value) []Value` | Run an op through the pipeline and materialise its result items. |
| `data` | `(args: ?Value) Value` | Get entity data (pass a map to set). |
| `matchv` | `(args: ?Value) Value` | Get entity match criteria (pass a map to set). |
| `get_name` | `() []const u8` | Return the entity name. |

### Result shape

Entity operations return an `OpResult` union — `switch` on it: `.ok`
carries the bare result data (a `Value` object for single-entity ops, a
`Value` array for `list`), `.err` carries the branded error pointer.

The `direct()` escape hatch returns a result `Value` map directly (no
error union) — even on a non-2xx response — that you branch on via
`h.get_bool(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error message.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `completeDate` | The date and time that the Attestation took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `name` | Text describing the attestation. |
| `notes` | Free form field that allows the Client associate notes with the Attestation. |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the Client's root Partner. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### CreateResult

| Field | Description |
| --- | --- |

Operations: Create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `success` | true if the payload decryption was successful. |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activatedBy` | Reference to the associated User resource. |
| `activationDate` | Timestamp from when the Device was activated. |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `deviceBuild` | Reference to the associated Device Build resource. |
| `deviceState` | Reference to the associated Device State resource. |
| `deviceType` | Reference to the associated Device Type resource. |
| `errorCounter` | The number times the Device has been in error. |
| `errorLastDate` | Timestamp from the last time that the Device had an error. |
| `id` | The Device's unique identifier. |
| `initializedBy` | Reference to the associated User resource. |
| `initializedDate` | Timestamp from when the Device was initialized. |
| `injectKey` | Reference to the associated Device resource. |
| `isVirtual` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | Reference to the associated KIF resource. |
| `lastActivityDate` | Timestamp from the last time that the Device was used. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `name` | The Device's name. |
| `notes` | Arbitary note that can be attached to a Device entry. |
| `partner` | Reference to the associated Partner. |
| `serialNumber` | The Device's serial number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | The Build Number. |
| `configFileName` | The name of the configuration file that is uploaded to the device. |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceType` | The Device Type Name. |
| `firmwareVersion` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | A list of hardware versions that this Device Build covers. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | Last modified timestamp. |
| `name` | The Device Builds's name. |
| `notes` | Notes attached to the device build by Bluefin CISO. |
| `version` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the action succeeded. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the RKI activation succeeded. |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` | Unique identifier for this Device state. |
| `name` | Descriptive name for this Device state. |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | The Device type. |
| `hardwareVersion` | The Device hardware version. |
| `id` | Unique idenifier. |
| `isActive` | This property indicates if the DeviceType is active. |
| `manufacturer` | The Device manufacturer. |
| `model` | The Device model. |
| `modified` | Last modified timestamp. |
| `name` | The DeviceType name. |
| `photoUrl` |  |
| `productName` | The Device name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | unique idenifier |
| `isActive` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | The cipher type that the key works with. |
| `modified` | Last modified timestamp in ISO 8601 format. |
| `name` | Key name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` | This resource's unique identifier. |
| `name` | The KIF's name. |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` | The Location's street address. |
| `address2` | The Location's street address. |
| `billingId` | \? |
| `city` | The Location's city. |
| `country` | The Location's country. |
| `created` | Creation timestamp in ISO 8601 format. |
| `customReference` | A Partner specified reference for a location. |
| `id` | This resource's unique identifier. |
| `locationType` | The Location's clasification. |
| `mailAddress1` | The Location's street address. |
| `mailAddress2` | The Location's street address. |
| `mailCity` | The Location's city. |
| `mailCountry` | The Location's street address. |
| `mailPostalCode` | The Location's postal code. |
| `mailStateProvince` | The Location's street state or province. |
| `modified` | Last modified timestamp. |
| `name` | The Location's name. |
| `nameOfBusiness` | The name of the business at this location. |
| `notes` | Note for delivery driver. |
| `postalCode` | The Location's postal code. |
| `stateProvince` | The Location's street state or province. |
| `uniqueId` | Unique Identifier for the Location. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partnerId` | The Partner's id. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` | The name of the courier. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | The date and time that a package is recieved. |
| `dateShipped` | The date and time that a package is shipped. |
| `dcKif` | Reference to the associated KIF resource. |
| `id` | This resource's unique identifier. |
| `items` |  |
| `kif` | Reference to the associated KIF resource. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `shipmentType` | The type of shipment. |
| `tracking` | The courier's tracking number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` | Indicates if the action was a success. |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | Reference to the associated Client resource. |
| `clientRef` | Client Reference property that is included in the decrypt API call. |
| `created` | Creation timestamp in ISO 8601 format. |
| `decrypted` | A Transcation can process muliple decryptions. |
| `deviceName` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | Reference to the associated Partner. |
| `encrypted` | A Transcation can process muliple encryptions. |
| `endDate` | Timestamp from the end of the transaction. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | The type of cipher used during decrytion. |
| `location` | Reference to the associated Location resource. |
| `messageId` | Message ID. |
| `method` | The decryption cypher/method. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | Timestamp from the beginning of the transaction. |
| `success` | The success indicator. |
| `transactionSource` | The source of the Transaction. |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | ID of newly created resource |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `const attestation = client.attestation(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value (object)` | Reference to the associated Client resource. |
| `completeDate` | `[]const u8` | The date and time that the Attestation took place. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `device` | `Value (object)` | Reference to the associated Device resource. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `name` | `[]const u8` | Text describing the attestation. |
| `notes` | `[]const u8` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```zig
switch (client.attestation(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("attestation_id") }}), h.vnull())) {
    .ok => |attestation| std.debug.print("{s}\n", .{h.stringify(attestation)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.attestation(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |attestations| std.debug.print("{s}\n", .{h.stringify(attestations)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.attestation(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |attestation| std.debug.print("{s}\n", .{h.stringify(attestation)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Client

Create an instance: `const client = client.client(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Value (object)` | Reference to the associated User resource. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Value (object)` | Reference to the associated Partner. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `Value (object)` | Reference to the associated Location resource. |
| `mid` | `[]const u8` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `name` | `[]const u8` | The Client's name. |
| `partner` | `Value (object)` | Reference to the Client's root Partner. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.client(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("client_id") }}), h.vnull())) {
    .ok => |client| std.debug.print("{s}\n", .{h.stringify(client)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.client(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |clients| std.debug.print("{s}\n", .{h.stringify(clients)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.client(h.vnull()).create(h.jo(&.{
    .{ "location", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |client| std.debug.print("{s}\n", .{h.stringify(client)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### CreateResult

Create an instance: `const create_result = client.create_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Example: Create

```zig
switch (client.create_result(h.vnull()).create(h.jo(&.{
    .{ "device_type", h.vstr("example_device_type") }, // []const u8
    .{ "serial_number", h.vstr("example_serial_number") }, // []const u8
}), h.vnull())) {
    .ok => |create_result| std.debug.print("{s}\n", .{h.stringify(create_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Decryption

Create an instance: `const decryption = client.decryption(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | true if the payload decryption was successful. |

#### Example: Create

```zig
switch (client.decryption(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |decryption| std.debug.print("{s}\n", .{h.stringify(decryption)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Device

Create an instance: `const device = client.device(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `Value (object)` | Reference to the associated User resource. |
| `activationDate` | `[]const u8` | Timestamp from when the Device was activated. |
| `alternateKey` | `[]const u8` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `[]const u8` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `[]const u8` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Value (object)` | Reference to the associated Client resource. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value (object)` | Reference to the associated User resource. |
| `deviceBuild` | `Value (object)` | Reference to the associated Device Build resource. |
| `deviceState` | `Value (object)` | Reference to the associated Device State resource. |
| `deviceType` | `Value (object)` | Reference to the associated Device Type resource. |
| `errorCounter` | `i64` | The number times the Device has been in error. |
| `errorLastDate` | `[]const u8` | Timestamp from the last time that the Device had an error. |
| `id` | `[]const u8` | The Device's unique identifier. |
| `initializedBy` | `Value (object)` | Reference to the associated User resource. |
| `initializedDate` | `[]const u8` | Timestamp from when the Device was initialized. |
| `injectKey` | `Value (object)` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Value (object)` | Reference to the associated KIF resource. |
| `lastActivityDate` | `[]const u8` | Timestamp from the last time that the Device was used. |
| `location` | `Value (object)` | Reference to the associated Location resource. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `modifiedBy` | `Value (object)` | Reference to the associated User resource. |
| `name` | `[]const u8` | The Device's name. |
| `notes` | `[]const u8` | Arbitary note that can be attached to a Device entry. |
| `partner` | `Value (object)` | Reference to the associated Partner. |
| `serialNumber` | `[]const u8` | The Device's serial number. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.device(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_id") }}), h.vnull())) {
    .ok => |device| std.debug.print("{s}\n", .{h.stringify(device)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.device(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |devices| std.debug.print("{s}\n", .{h.stringify(devices)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.device(h.vnull()).create(h.jo(&.{
    .{ "activatedBy", h.omap() }, // Value (object)
    .{ "createdBy", h.omap() }, // Value (object)
    .{ "initializedBy", h.omap() }, // Value (object)
    .{ "location", h.omap() }, // Value (object)
    .{ "modifiedBy", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |device| std.debug.print("{s}\n", .{h.stringify(device)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### DeviceBuild

Create an instance: `const device_build = client.device_build(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `[]const u8` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `[]const u8` | The Build Number. |
| `configFileName` | `[]const u8` | The name of the configuration file that is uploaded to the device. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `[]const u8` | The Device Type Name. |
| `firmwareVersion` | `[]const u8` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `[]const u8` | A list of hardware versions that this Device Build covers. |
| `id` | `i64` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `name` | `[]const u8` | The Device Builds's name. |
| `notes` | `[]const u8` | Notes attached to the device build by Bluefin CISO. |
| `version` | `i64` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `[]const u8` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```zig
switch (client.device_build(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_build_id") }}), h.vnull())) {
    .ok => |device_build| std.debug.print("{s}\n", .{h.stringify(device_build)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.device_build(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |device_builds| std.debug.print("{s}\n", .{h.stringify(device_builds)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### DeviceCustodyDetail

Create an instance: `const device_custody_detail = client.device_custody_detail(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `[]const u8` | The date and time that the Custody change took place. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value (object)` | Reference to the associated User resource. |
| `custodian` | `Value (object)` | Reference to the associated User resource. |
| `device` | `Value (object)` | Reference to the associated Device resource. |
| `id` | `i64` | This resource's unique identifier. |
| `location` | `Value (object)` | Reference to the associated Location resource. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `modifiedBy` | `Value (object)` | Reference to the associated User resource. |
| `notes` | `[]const u8` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Value (object)` | Reference to the associated Custody Status. |
| `transferMethod` | `Value (object)` | Reference to the associated Transfer Method. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.device_custody_detail(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_custody_detail_id") }, .{ "device_type", h.vstr("device_type") }, .{ "serial_number", h.vstr("serial_number") }}), h.vnull())) {
    .ok => |device_custody_detail| std.debug.print("{s}\n", .{h.stringify(device_custody_detail)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### DeviceCustodyList

Create an instance: `const device_custody_list = client.device_custody_list(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `[]const u8` | The date and time that the Custody change took place. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value (object)` | Reference to the associated User resource. |
| `custodian` | `Value (object)` | Reference to the associated User resource. |
| `device` | `Value (object)` | Reference to the associated Device resource. |
| `id` | `i64` | This resource's unique identifier. |
| `location` | `Value (object)` | Reference to the associated Location resource. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `modifiedBy` | `Value (object)` | Reference to the associated User resource. |
| `notes` | `[]const u8` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Value (object)` | Reference to the associated Custody Status. |
| `transferMethod` | `Value (object)` | Reference to the associated Transfer Method. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: List

```zig
switch (client.device_custody_list(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |device_custody_lists| std.debug.print("{s}\n", .{h.stringify(device_custody_lists)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### DeviceList

Create an instance: `const device_list = client.device_list(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `Value (array)` | List of Devices. |
| `total` | `i64` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```zig
switch (client.device_list(h.vnull()).load(h.jo(&.{.{ "share_partner_to", h.vstr("share_partner_to") }}), h.vnull())) {
    .ok => |device_list| std.debug.print("{s}\n", .{h.stringify(device_list)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


### DeviceReceiveResult

Create an instance: `const device_receive_result = client.device_receive_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the action succeeded. |

#### Example: Create

```zig
switch (client.device_receive_result(h.vnull()).create(h.jo(&.{
    .{ "success", h.vbool(true) }, // bool
}), h.vnull())) {
    .ok => |device_receive_result| std.debug.print("{s}\n", .{h.stringify(device_receive_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### DeviceRkiActivateResult

Create an instance: `const device_rki_activate_result = client.device_rki_activate_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the RKI activation succeeded. |

#### Example: Create

```zig
switch (client.device_rki_activate_result(h.vnull()).create(h.jo(&.{
    .{ "success", h.vbool(true) }, // bool
}), h.vnull())) {
    .ok => |device_rki_activate_result| std.debug.print("{s}\n", .{h.stringify(device_rki_activate_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### DeviceState

Create an instance: `const device_state = client.device_state(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` | Unique identifier for this Device state. |
| `name` | `[]const u8` | Descriptive name for this Device state. |

#### Example: List

```zig
switch (client.device_state(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |device_states| std.debug.print("{s}\n", .{h.stringify(device_states)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### DeviceType

Create an instance: `const device_type = client.device_type(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `[]const u8` | The Device type. |
| `hardwareVersion` | `[]const u8` | The Device hardware version. |
| `id` | `[]const u8` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `[]const u8` | The Device manufacturer. |
| `model` | `[]const u8` | The Device model. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `name` | `[]const u8` | The DeviceType name. |
| `photoUrl` | `[]const u8` |  |
| `productName` | `[]const u8` | The Device name. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.device_type(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_type_id") }}), h.vnull())) {
    .ok => |device_type| std.debug.print("{s}\n", .{h.stringify(device_type)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.device_type(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |device_types| std.debug.print("{s}\n", .{h.stringify(device_types)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### InjectKey

Create an instance: `const inject_key = client.inject_key(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `id` | `[]const u8` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `[]const u8` | The cipher type that the key works with. |
| `modified` | `[]const u8` | Last modified timestamp in ISO 8601 format. |
| `name` | `[]const u8` | Key name. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.inject_key(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("inject_key_id") }}), h.vnull())) {
    .ok => |inject_key| std.debug.print("{s}\n", .{h.stringify(inject_key)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.inject_key(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |inject_keys| std.debug.print("{s}\n", .{h.stringify(inject_keys)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### Kif

Create an instance: `const kif = client.kif(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` | This resource's unique identifier. |
| `name` | `[]const u8` | The KIF's name. |

#### Example: List

```zig
switch (client.kif(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |kifs| std.debug.print("{s}\n", .{h.stringify(kifs)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```


### Location

Create an instance: `const location = client.location(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `[]const u8` | The Location's street address. |
| `address2` | `[]const u8` | The Location's street address. |
| `billingId` | `[]const u8` | \? |
| `city` | `[]const u8` | The Location's city. |
| `country` | `[]const u8` | The Location's country. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `customReference` | `[]const u8` | A Partner specified reference for a location. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `locationType` | `[]const u8` | The Location's clasification. |
| `mailAddress1` | `[]const u8` | The Location's street address. |
| `mailAddress2` | `[]const u8` | The Location's street address. |
| `mailCity` | `[]const u8` | The Location's city. |
| `mailCountry` | `[]const u8` | The Location's street address. |
| `mailPostalCode` | `[]const u8` | The Location's postal code. |
| `mailStateProvince` | `[]const u8` | The Location's street state or province. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `name` | `[]const u8` | The Location's name. |
| `nameOfBusiness` | `[]const u8` | The name of the business at this location. |
| `notes` | `[]const u8` | Note for delivery driver. |
| `postalCode` | `[]const u8` | The Location's postal code. |
| `stateProvince` | `[]const u8` | The Location's street state or province. |
| `uniqueId` | `[]const u8` | Unique Identifier for the Location. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.location(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("location_id") }}), h.vnull())) {
    .ok => |location| std.debug.print("{s}\n", .{h.stringify(location)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.location(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |locations| std.debug.print("{s}\n", .{h.stringify(locations)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.location(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |location| std.debug.print("{s}\n", .{h.stringify(location)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Partner

Create an instance: `const partner = client.partner(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `[]const u8` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Value (object)` | Reference to the associated User resource. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `Value (object)` | Reference to the associated Location resource. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `name` | `[]const u8` | The Partner's name. |
| `parent` | `Value (object)` | Reference to the associated Partner. |
| `partnerId` | `[]const u8` | The Partner's id. |
| `reference` | `[]const u8` | The Partner's reference string. |
| `verificationPhrase` | `[]const u8` | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.partner(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("partner_id") }}), h.vnull())) {
    .ok => |partner| std.debug.print("{s}\n", .{h.stringify(partner)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.partner(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |partners| std.debug.print("{s}\n", .{h.stringify(partners)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.partner(h.vnull()).create(h.jo(&.{
    .{ "location", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |partner| std.debug.print("{s}\n", .{h.stringify(partner)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Shipment

Create an instance: `const shipment = client.shipment(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `[]const u8` | The name of the courier. |
| `client` | `Value (object)` | Reference to the associated Client resource. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `[]const u8` | The date and time that a package is recieved. |
| `dateShipped` | `[]const u8` | The date and time that a package is shipped. |
| `dcKif` | `Value (object)` | Reference to the associated KIF resource. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `items` | `Value (array)` |  |
| `kif` | `Value (object)` | Reference to the associated KIF resource. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `partner` | `Value (object)` | Reference to the associated Partner. |
| `shipmentType` | `[]const u8` | The type of shipment. |
| `tracking` | `[]const u8` | The courier's tracking number. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.shipment(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("shipment_id") }}), h.vnull())) {
    .ok => |shipment| std.debug.print("{s}\n", .{h.stringify(shipment)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.shipment(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |shipments| std.debug.print("{s}\n", .{h.stringify(shipments)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.shipment(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |shipment| std.debug.print("{s}\n", .{h.stringify(shipment)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Success

Create an instance: `const success = client.success(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the action was a success. |

#### Example: Create

```zig
switch (client.success(h.vnull()).create(h.jo(&.{
    .{ "share_partner_to", h.vstr("example_share_partner_to") }, // []const u8
}), h.vnull())) {
    .ok => |success| std.debug.print("{s}\n", .{h.stringify(success)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### Transaction

Create an instance: `const transaction = client.transaction(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `[]const u8` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Value (object)` | Reference to the associated Client resource. |
| `clientRef` | `[]const u8` | Client Reference property that is included in the decrypt API call. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `i64` | A Transcation can process muliple decryptions. |
| `deviceName` | `[]const u8` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Value (object)` | Reference to the associated Partner. |
| `encrypted` | `i64` | A Transcation can process muliple encryptions. |
| `endDate` | `[]const u8` | Timestamp from the end of the transaction. |
| `errCode` | `[]const u8` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `[]const u8` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `ipAddress` | `[]const u8` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `[]const u8` | The type of cipher used during decrytion. |
| `location` | `Value (object)` | Reference to the associated Location resource. |
| `messageId` | `[]const u8` | Message ID. |
| `method` | `[]const u8` | The decryption cypher/method. |
| `partner` | `Value (object)` | Reference to the associated Partner. |
| `reference` | `[]const u8` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `[]const u8` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `[]const u8` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `[]const u8` | The source of the Transaction. |

#### Example: Load

```zig
switch (client.transaction(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("transaction_id") }}), h.vnull())) {
    .ok => |transaction| std.debug.print("{s}\n", .{h.stringify(transaction)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### Example: List

```zig
switch (client.transaction(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |transactions| std.debug.print("{s}\n", .{h.stringify(transactions)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.transaction(h.vnull()).create(h.jo(&.{
    .{ "location", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |transaction| std.debug.print("{s}\n", .{h.stringify(transaction)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### UpdateResult

Create an instance: `const update_result = client.update_result(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value (object)` | Reference to the associated Client resource. |
| `email` | `[]const u8` | The User's email address. |
| `firstName` | `[]const u8` | The User's name. |
| `id` | `[]const u8` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `Value (object)` | Reference to the associated KIF resource. |
| `lastName` | `[]const u8` | The User's Surname. |
| `partner` | `Value (object)` | Reference to the associated Partner. |
| `phone` | `[]const u8` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `[]const u8` | The User's unique username. |
| `userRole` | `Value (object)` | Reference to the associated User Role. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: List

```zig
switch (client.update_result(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |update_results| std.debug.print("{s}\n", .{h.stringify(update_results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### Example: Create

```zig
switch (client.update_result(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |update_result| std.debug.print("{s}\n", .{h.stringify(update_result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```


### User

Create an instance: `const user = client.user(h.vnull());`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

Each operation returns an `OpResult` — `switch` on it: `.ok => |data|`
carries the result `Value`, `.err => |e|` carries the branded error.

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value (object)` | Reference to the associated Client resource. |
| `created` | `[]const u8` | Creation timestamp in ISO 8601 format. |
| `email` | `[]const u8` | The User's email address. |
| `firstName` | `[]const u8` | The User's name. |
| `id` | `[]const u8` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `Value (object)` | Reference to the associated KIF resource. |
| `lastName` | `[]const u8` | The User's Surname. |
| `modified` | `[]const u8` | Last modified timestamp. |
| `partner` | `Value (object)` | Reference to the associated Partner. |
| `phone` | `[]const u8` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `[]const u8` | The User's unique username. |
| `userRole` | `Value (object)` | Reference to the associated User Role. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```zig
switch (client.user(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("user_id") }}), h.vnull())) {
    .ok => |user| std.debug.print("{s}\n", .{h.stringify(user)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `Value`

The Zig SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port's
`JsonValue` (a JSON-shaped tagged union: `.string`, `.integer`,
`.float`, `.bool`, `.array`, `.object`, `.null`). This mirrors the
dynamic nature of the API and keeps the SDK flexible — no code generation is
needed when the API schema changes.

Build request maps with the `h.jo` / `h.ja` helpers and read fields back
with `h.getp` (or the typed `h.get_str` / `h.get_bool` / `h.to_int`
accessors); use `h.to_map` to safely coerce a value to a map.

### Module structure

```
zig/
├── root.zig                     -- Module root (re-exports the public surface)
├── build.zig                    -- Build + test wiring
├── core/                        -- Pipeline types, config, client (sdk.zig)
├── entity/                      -- Per-entity clients (one file each)
├── feature/                     -- Built-in features (base, test, log)
├── utility/                     -- Utilities + the vendored voxgig struct port
└── test/                        -- Test suites
```

The public API is re-exported from `root.zig`, so `@import("sdk")` reaches
the SDK client, `Value`, and the `h` (helpers) namespace directly. Import
entity or utility modules only when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const devicetype = client.DeviceType()
await devicetype.list()

// devicetype.data() now returns the devicetype data from the last `list`
// devicetype.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
