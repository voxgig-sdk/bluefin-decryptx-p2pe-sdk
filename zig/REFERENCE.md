# BluefinDecryptxP2pe Zig SDK Reference

Complete API reference for the BluefinDecryptxP2pe Zig SDK.


## BluefinDecryptxP2peSDK

### Constructor

```zig
const sdk = @import("sdk");
const h = sdk.h;

const client = sdk.BluefinDecryptxP2peSDK.new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`h.vnull()` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) *BluefinDecryptxP2peSDK`

Create a test client with mock features active. Both arguments may be
`h.vnull()`.

```zig
const client = sdk.test_sdk(h.vnull(), h.vnull());
```


### Instance Methods

#### `attestation(entopts: Value) *AttestationEntity`

Create a new `AttestationEntity` instance. Pass `h.vnull()` for no
initial options.

#### `client(entopts: Value) *ClientEntity`

Create a new `ClientEntity` instance. Pass `h.vnull()` for no
initial options.

#### `create_result(entopts: Value) *CreateResultEntity`

Create a new `CreateResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `decryption(entopts: Value) *DecryptionEntity`

Create a new `DecryptionEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device(entopts: Value) *DeviceEntity`

Create a new `DeviceEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_build(entopts: Value) *DeviceBuildEntity`

Create a new `DeviceBuildEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_custody_detail(entopts: Value) *DeviceCustodyDetailEntity`

Create a new `DeviceCustodyDetailEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_custody_list(entopts: Value) *DeviceCustodyListEntity`

Create a new `DeviceCustodyListEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_list(entopts: Value) *DeviceListEntity`

Create a new `DeviceListEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_receive_result(entopts: Value) *DeviceReceiveResultEntity`

Create a new `DeviceReceiveResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_rki_activate_result(entopts: Value) *DeviceRkiActivateResultEntity`

Create a new `DeviceRkiActivateResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_state(entopts: Value) *DeviceStateEntity`

Create a new `DeviceStateEntity` instance. Pass `h.vnull()` for no
initial options.

#### `device_type(entopts: Value) *DeviceTypeEntity`

Create a new `DeviceTypeEntity` instance. Pass `h.vnull()` for no
initial options.

#### `inject_key(entopts: Value) *InjectKeyEntity`

Create a new `InjectKeyEntity` instance. Pass `h.vnull()` for no
initial options.

#### `kif(entopts: Value) *KifEntity`

Create a new `KifEntity` instance. Pass `h.vnull()` for no
initial options.

#### `location(entopts: Value) *LocationEntity`

Create a new `LocationEntity` instance. Pass `h.vnull()` for no
initial options.

#### `partner(entopts: Value) *PartnerEntity`

Create a new `PartnerEntity` instance. Pass `h.vnull()` for no
initial options.

#### `shipment(entopts: Value) *ShipmentEntity`

Create a new `ShipmentEntity` instance. Pass `h.vnull()` for no
initial options.

#### `success(entopts: Value) *SuccessEntity`

Create a new `SuccessEntity` instance. Pass `h.vnull()` for no
initial options.

#### `transaction(entopts: Value) *TransactionEntity`

Create a new `TransactionEntity` instance. Pass `h.vnull()` for no
initial options.

#### `update_result(entopts: Value) *UpdateResultEntity`

Create a new `UpdateResultEntity` instance. Pass `h.vnull()` for no
initial options.

#### `user(entopts: Value) *UserEntity`

Create a new `UserEntity` instance. Pass `h.vnull()` for no
initial options.

#### `options_map() Value`

Return a deep copy of the current SDK options.

#### `get_utility() *Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value`
map with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch returns a map even on a non-2xx response — branch on
`h.get_bool(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) E!Value`

Prepare a fetch definition without sending. Returns the fetchdef (use
`catch`/`try` to handle the error union).


---

## AttestationEntity

```zig
const attestation = client.attestation(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `completeDate` | `[]const u8` | No | The date and time that the Attestation took place. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Value (object)` | No | Reference to the associated Device resource. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `name` | `[]const u8` | No | Text describing the attestation. |
| `notes` | `[]const u8` | No | Free form field that allows the Client associate notes with the Attestation. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.attestation(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.attestation(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.attestation(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("attestation_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ClientEntity

```zig
const client = client.client(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Value (object)` | No | Reference to the associated User resource. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Value (object)` | No | Reference to the associated Partner. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Value (object)` | Yes | Reference to the associated Location resource. |
| `mid` | `[]const u8` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The Client's name. |
| `partner` | `Value (object)` | No | Reference to the Client's root Partner. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | - | - |
| `created` | - | - | - | - |
| `directPartner` | - | - | - | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | - | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.client(h.vnull()).create(h.jo(&.{
    .{ "location", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.client(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.client(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("client_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.client(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("client_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## CreateResultEntity

```zig
const create_result = client.create_result(h.vnull());
```

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.create_result(h.vnull()).create(h.jo(&.{
    .{ "device_type", h.vstr("example_device_type") }, // []const u8
    .{ "serial_number", h.vstr("example_serial_number") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DecryptionEntity

```zig
const decryption = client.decryption(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.decryption(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceEntity

```zig
const device = client.device(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `activationDate` | `[]const u8` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `[]const u8` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `[]const u8` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `[]const u8` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Value (object)` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Value (object)` | No | Reference to the associated Device State resource. |
| `deviceType` | `Value (object)` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `i64` | No | The number times the Device has been in error. |
| `errorLastDate` | `[]const u8` | No | Timestamp from the last time that the Device had an error. |
| `id` | `[]const u8` | No | The Device's unique identifier. |
| `initializedBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `initializedDate` | `[]const u8` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Value (object)` | No | Reference to the associated Device resource. |
| `isVirtual` | `bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Value (object)` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `[]const u8` | No | Timestamp from the last time that the Device was used. |
| `location` | `Value (object)` | Yes | Reference to the associated Location resource. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `modifiedBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `name` | `[]const u8` | No | The Device's name. |
| `notes` | `[]const u8` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `serialNumber` | `[]const u8` | No | The Device's serial number. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.device(h.vnull()).create(h.jo(&.{
    .{ "activatedBy", h.omap() }, // Value (object)
    .{ "createdBy", h.omap() }, // Value (object)
    .{ "initializedBy", h.omap() }, // Value (object)
    .{ "location", h.omap() }, // Value (object)
    .{ "modifiedBy", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.device(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.device(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceBuildEntity

```zig
const device_build = client.device_build(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `[]const u8` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `[]const u8` | No | The Build Number. |
| `configFileName` | `[]const u8` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `[]const u8` | No | The Device Type Name. |
| `firmwareVersion` | `[]const u8` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `[]const u8` | No | A list of hardware versions that this Device Build covers. |
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The Device Builds's name. |
| `notes` | `[]const u8` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `i64` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `[]const u8` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.device_build(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.device_build(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_build_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceCustodyDetailEntity

```zig
const device_custody_detail = client.device_custody_detail(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `[]const u8` | No | The date and time that the Custody change took place. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `custodian` | `Value (object)` | Yes | Reference to the associated User resource. |
| `device` | `Value (object)` | No | Reference to the associated Device resource. |
| `id` | `i64` | No | This resource's unique identifier. |
| `location` | `Value (object)` | Yes | Reference to the associated Location resource. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `modifiedBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `notes` | `[]const u8` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Value (object)` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Value (object)` | No | Reference to the associated Transfer Method. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.device_custody_detail(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_custody_detail_id") }, .{ "device_type", h.vstr("device_type") }, .{ "serial_number", h.vstr("serial_number") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceCustodyListEntity

```zig
const device_custody_list = client.device_custody_list(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `[]const u8` | No | The date and time that the Custody change took place. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `custodian` | `Value (object)` | Yes | Reference to the associated User resource. |
| `device` | `Value (object)` | No | Reference to the associated Device resource. |
| `id` | `i64` | No | This resource's unique identifier. |
| `location` | `Value (object)` | Yes | Reference to the associated Location resource. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `modifiedBy` | `Value (object)` | Yes | Reference to the associated User resource. |
| `notes` | `[]const u8` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Value (object)` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Value (object)` | No | Reference to the associated Transfer Method. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.device_custody_list(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceListEntity

```zig
const device_list = client.device_list(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `Value (array)` | No | List of Devices. |
| `total` | `i64` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.device_list(h.vnull()).load(h.jo(&.{.{ "share_partner_to", h.vstr("share_partner_to") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceReceiveResultEntity

```zig
const device_receive_result = client.device_receive_result(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes | Indicates if the action succeeded. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.device_receive_result(h.vnull()).create(h.jo(&.{
    .{ "success", h.vbool(true) }, // bool
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```zig
const device_rki_activate_result = client.device_rki_activate_result(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.device_rki_activate_result(h.vnull()).create(h.jo(&.{
    .{ "success", h.vbool(true) }, // bool
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceStateEntity

```zig
const device_state = client.device_state(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No | Unique identifier for this Device state. |
| `name` | `[]const u8` | No | Descriptive name for this Device state. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.device_state(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## DeviceTypeEntity

```zig
const device_type = client.device_type(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `[]const u8` | No | The Device type. |
| `hardwareVersion` | `[]const u8` | No | The Device hardware version. |
| `id` | `[]const u8` | No | Unique idenifier. |
| `isActive` | `bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `[]const u8` | No | The Device manufacturer. |
| `model` | `[]const u8` | No | The Device model. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The DeviceType name. |
| `photoUrl` | `[]const u8` | No |  |
| `productName` | `[]const u8` | No | The Device name. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.device_type(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.device_type(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("device_type_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## InjectKeyEntity

```zig
const inject_key = client.inject_key(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `id` | `[]const u8` | No | unique idenifier |
| `isActive` | `bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `[]const u8` | No | The cipher type that the key works with. |
| `modified` | `[]const u8` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `[]const u8` | No | Key name. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.inject_key(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.inject_key(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("inject_key_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## KifEntity

```zig
const kif = client.kif(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No | This resource's unique identifier. |
| `name` | `[]const u8` | No | The KIF's name. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.kif(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## LocationEntity

```zig
const location = client.location(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `[]const u8` | No | The Location's street address. |
| `address2` | `[]const u8` | No | The Location's street address. |
| `billingId` | `[]const u8` | No | \? |
| `city` | `[]const u8` | No | The Location's city. |
| `country` | `[]const u8` | No | The Location's country. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `[]const u8` | No | A Partner specified reference for a location. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `locationType` | `[]const u8` | No | The Location's clasification. |
| `mailAddress1` | `[]const u8` | No | The Location's street address. |
| `mailAddress2` | `[]const u8` | No | The Location's street address. |
| `mailCity` | `[]const u8` | No | The Location's city. |
| `mailCountry` | `[]const u8` | No | The Location's street address. |
| `mailPostalCode` | `[]const u8` | No | The Location's postal code. |
| `mailStateProvince` | `[]const u8` | No | The Location's street state or province. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The Location's name. |
| `nameOfBusiness` | `[]const u8` | No | The name of the business at this location. |
| `notes` | `[]const u8` | No | Note for delivery driver. |
| `postalCode` | `[]const u8` | No | The Location's postal code. |
| `stateProvince` | `[]const u8` | No | The Location's street state or province. |
| `uniqueId` | `[]const u8` | No | Unique Identifier for the Location. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.location(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.location(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.location(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("location_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.location(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("location_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## PartnerEntity

```zig
const partner = client.partner(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `[]const u8` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Value (object)` | No | Reference to the associated User resource. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Value (object)` | Yes | Reference to the associated Location resource. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `name` | `[]const u8` | No | The Partner's name. |
| `parent` | `Value (object)` | No | Reference to the associated Partner. |
| `partnerId` | `[]const u8` | No | The Partner's id. |
| `reference` | `[]const u8` | No | The Partner's reference string. |
| `verificationPhrase` | `[]const u8` | No | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partnerId` | - | - | - |
| `reference` | - | - | - |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.partner(h.vnull()).create(h.jo(&.{
    .{ "location", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.partner(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.partner(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("partner_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## ShipmentEntity

```zig
const shipment = client.shipment(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `[]const u8` | No | The name of the courier. |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `[]const u8` | No | The date and time that a package is recieved. |
| `dateShipped` | `[]const u8` | No | The date and time that a package is shipped. |
| `dcKif` | `Value (object)` | No | Reference to the associated KIF resource. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `items` | `Value (array)` | No |  |
| `kif` | `Value (object)` | No | Reference to the associated KIF resource. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `shipmentType` | `[]const u8` | No | The type of shipment. |
| `tracking` | `[]const u8` | No | The courier's tracking number. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.shipment(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.shipment(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.shipment(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("shipment_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## SuccessEntity

```zig
const success = client.success(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.success(h.vnull()).create(h.jo(&.{
    .{ "share_partner_to", h.vstr("example_share_partner_to") }, // []const u8
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.success(h.vnull()).remove(h.jo(&.{.{ "share_partner_to", h.vstr("share_partner_to") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## TransactionEntity

```zig
const transaction = client.transaction(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `[]const u8` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `clientRef` | `[]const u8` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `i64` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `[]const u8` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Value (object)` | No | Reference to the associated Partner. |
| `encrypted` | `i64` | No | A Transcation can process muliple encryptions. |
| `endDate` | `[]const u8` | No | Timestamp from the end of the transaction. |
| `errCode` | `[]const u8` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `[]const u8` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `ipAddress` | `[]const u8` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `[]const u8` | No | The type of cipher used during decrytion. |
| `location` | `Value (object)` | Yes | Reference to the associated Location resource. |
| `messageId` | `[]const u8` | No | Message ID. |
| `method` | `[]const u8` | No | The decryption cypher/method. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `reference` | `[]const u8` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `[]const u8` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `[]const u8` | No | Timestamp from the beginning of the transaction. |
| `success` | `bool` | No | The success indicator. |
| `transactionSource` | `[]const u8` | No | The source of the Transaction. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.transaction(h.vnull()).create(h.jo(&.{
    .{ "location", h.omap() }, // Value (object)
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.transaction(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.transaction(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("transaction_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## UpdateResultEntity

```zig
const update_result = client.update_result(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `email` | `[]const u8` | No | The User's email address. |
| `firstName` | `[]const u8` | No | The User's name. |
| `id` | `[]const u8` | No | ID of newly created resource |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Value (object)` | No | Reference to the associated KIF resource. |
| `lastName` | `[]const u8` | No | The User's Surname. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `phone` | `[]const u8` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `[]const u8` | No | The User's unique username. |
| `userRole` | `Value (object)` | No | Reference to the associated User Role. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.update_result(h.vnull()).create(h.jo(&.{
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("create failed: {s}\n", .{e.msg}),
}
```

#### `list(reqmatch: Value, ctrl: Value) OpResult`

List entities matching the given criteria. The match is optional — pass `h.vnull()` to list all records. `.ok` is a `Value` array.

```zig
switch (client.update_result(h.vnull()).list(h.vnull(), h.vnull())) {
    .ok => |results| std.debug.print("{s}\n", .{h.stringify(results)}),
    .err => |e| std.debug.print("list failed: {s}\n", .{e.msg}),
}
```

#### `update(reqdata: Value, ctrl: Value) OpResult`

Update an existing entity. The data must include the entity id. `.ok` carries the updated entity data.

```zig
switch (client.update_result(h.vnull()).update(h.jo(&.{
    .{ "id", h.vstr("id") },
    // Fields to update
}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("update failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## UserEntity

```zig
const user = client.user(h.vnull());
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value (object)` | No | Reference to the associated Client resource. |
| `created` | `[]const u8` | No | Creation timestamp in ISO 8601 format. |
| `email` | `[]const u8` | No | The User's email address. |
| `firstName` | `[]const u8` | No | The User's name. |
| `id` | `[]const u8` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Value (object)` | No | Reference to the associated KIF resource. |
| `lastName` | `[]const u8` | No | The User's Surname. |
| `modified` | `[]const u8` | No | Last modified timestamp. |
| `partner` | `Value (object)` | No | Reference to the associated Partner. |
| `phone` | `[]const u8` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `[]const u8` | No | The User's unique username. |
| `userRole` | `Value (object)` | No | Reference to the associated User Role. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch: Value, ctrl: Value) OpResult`

Load a single entity matching the given criteria. `.ok` carries the entity data, `.err` the branded error.

```zig
switch (client.user(h.vnull()).load(h.jo(&.{.{ "id", h.vstr("user_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("load failed: {s}\n", .{e.msg}),
}
```

#### `remove(reqmatch: Value, ctrl: Value) OpResult`

Remove the entity matching the given criteria. `.err` on failure.

```zig
switch (client.user(h.vnull()).remove(h.jo(&.{.{ "id", h.vstr("user_id") }}), h.vnull())) {
    .ok => |result| std.debug.print("{s}\n", .{h.stringify(result)}),
    .err => |e| std.debug.print("remove failed: {s}\n", .{e.msg}),
}
```

### Common Methods

#### `data(args: ?Value) Value`

Get the entity data. Pass a map to set it.

#### `matchv(args: ?Value) Value`

Get the entity match criteria. Pass a map to set it.

#### `stream(action: []const u8, args: Value, callopts: Value) []Value`

Run an operation through the pipeline and materialise its result items.

#### `get_name() []const u8`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```zig
const client = sdk.BluefinDecryptxP2peSDK.new(h.jo(&.{
    .{ "feature", h.jo(&.{
        .{ "test", h.jo(&.{.{ "active", h.vbool(true) }}) },
    }) },
}));
```

