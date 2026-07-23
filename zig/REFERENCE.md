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
| `client` | `Value (object)` | No |  |
| `complete_date` | `[]const u8` | No |  |
| `created` | `[]const u8` | No |  |
| `device` | `Value (object)` | No |  |
| `id` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `note` | `[]const u8` | No |  |

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
| `contact` | `Value (object)` | No |  |
| `created` | `[]const u8` | No |  |
| `direct_partner` | `Value (object)` | No |  |
| `id` | `[]const u8` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `Value (object)` | Yes |  |
| `mid` | `[]const u8` | No |  |
| `modified` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `partner` | `Value (object)` | No |  |
| `version` | `i64` | No |  |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | - | - |
| `created` | - | - | - | - |
| `direct_partner` | - | - | - | - |
| `id` | - | - | - | - |
| `is_active` | - | - | - | - |
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
| `success` | `bool` | No |  |

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
| `activated_by` | `Value (object)` | Yes |  |
| `activation_date` | `[]const u8` | No |  |
| `alternate_key` | `[]const u8` | No |  |
| `audit_next_date` | `[]const u8` | No |  |
| `audit_notification_date` | `[]const u8` | No |  |
| `client` | `Value (object)` | No |  |
| `created` | `[]const u8` | No |  |
| `created_by` | `Value (object)` | Yes |  |
| `device_build` | `Value (object)` | No |  |
| `device_state` | `Value (object)` | No |  |
| `device_type` | `Value (object)` | No |  |
| `error_counter` | `i64` | No |  |
| `error_last_date` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `initialized_by` | `Value (object)` | Yes |  |
| `initialized_date` | `[]const u8` | No |  |
| `inject_key` | `Value (object)` | No |  |
| `is_virtual` | `bool` | No |  |
| `kif` | `Value (object)` | No |  |
| `last_activity_date` | `[]const u8` | No |  |
| `location` | `Value (object)` | Yes |  |
| `modified` | `[]const u8` | No |  |
| `modified_by` | `Value (object)` | Yes |  |
| `name` | `[]const u8` | No |  |
| `note` | `[]const u8` | No |  |
| `partner` | `Value (object)` | No |  |
| `serial_number` | `[]const u8` | No |  |
| `version` | `i64` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) OpResult`

Create a new entity with the given data. `.ok` carries the created entity data.

```zig
switch (client.device(h.vnull()).create(h.jo(&.{
    .{ "activated_by", h.omap() }, // Value (object)
    .{ "created_by", h.omap() }, // Value (object)
    .{ "initialized_by", h.omap() }, // Value (object)
    .{ "location", h.omap() }, // Value (object)
    .{ "modified_by", h.omap() }, // Value (object)
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
| `app_version` | `[]const u8` | No |  |
| `build_number` | `[]const u8` | No |  |
| `config_file_name` | `[]const u8` | No |  |
| `created` | `[]const u8` | No |  |
| `device_type` | `[]const u8` | No |  |
| `firmware_version` | `[]const u8` | No |  |
| `hardware_version` | `[]const u8` | No |  |
| `id` | `i64` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `note` | `[]const u8` | No |  |
| `version` | `i64` | No |  |
| `white_listing_bin_range` | `[]const u8` | No |  |
| `white_listing_used` | `bool` | No |  |

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
| `complete_date` | `[]const u8` | No |  |
| `created` | `[]const u8` | No |  |
| `created_by` | `Value (object)` | Yes |  |
| `custodian` | `Value (object)` | Yes |  |
| `device` | `Value (object)` | No |  |
| `id` | `i64` | No |  |
| `location` | `Value (object)` | Yes |  |
| `modified` | `[]const u8` | No |  |
| `modified_by` | `Value (object)` | Yes |  |
| `note` | `[]const u8` | No |  |
| `status` | `Value (object)` | No |  |
| `transfer_method` | `Value (object)` | No |  |
| `version` | `i64` | No |  |

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
| `complete_date` | `[]const u8` | No |  |
| `created` | `[]const u8` | No |  |
| `created_by` | `Value (object)` | Yes |  |
| `custodian` | `Value (object)` | Yes |  |
| `device` | `Value (object)` | No |  |
| `id` | `i64` | No |  |
| `location` | `Value (object)` | Yes |  |
| `modified` | `[]const u8` | No |  |
| `modified_by` | `Value (object)` | Yes |  |
| `note` | `[]const u8` | No |  |
| `status` | `Value (object)` | No |  |
| `transfer_method` | `Value (object)` | No |  |
| `version` | `i64` | No |  |

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
| `data` | `Value (array)` | No |  |
| `total` | `i64` | No |  |

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
| `success` | `bool` | Yes |  |

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
| `success` | `bool` | Yes |  |

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
| `id` | `i64` | No |  |
| `name` | `[]const u8` | No |  |

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
| `created` | `[]const u8` | No |  |
| `device_type_mode` | `[]const u8` | No |  |
| `hardware_version` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `is_active` | `bool` | No |  |
| `manufacturer` | `[]const u8` | No |  |
| `model` | `[]const u8` | No |  |
| `modified` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `photo_url` | `[]const u8` | No |  |
| `product_name` | `[]const u8` | No |  |
| `version` | `i64` | No |  |

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
| `created` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `is_active` | `bool` | No |  |
| `is_p2_pe` | `bool` | No |  |
| `key_type` | `[]const u8` | No |  |
| `modified` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `version` | `i64` | No |  |

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
| `id` | `i64` | No |  |
| `name` | `[]const u8` | No |  |

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
| `address1` | `[]const u8` | No |  |
| `address2` | `[]const u8` | No |  |
| `billing_id` | `[]const u8` | No |  |
| `city` | `[]const u8` | No |  |
| `country` | `[]const u8` | No |  |
| `created` | `[]const u8` | No |  |
| `custom_reference` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `location_type` | `[]const u8` | No |  |
| `mail_address1` | `[]const u8` | No |  |
| `mail_address2` | `[]const u8` | No |  |
| `mail_city` | `[]const u8` | No |  |
| `mail_country` | `[]const u8` | No |  |
| `mail_postal_code` | `[]const u8` | No |  |
| `mail_state_province` | `[]const u8` | No |  |
| `modified` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `name_of_business` | `[]const u8` | No |  |
| `note` | `[]const u8` | No |  |
| `postal_code` | `[]const u8` | No |  |
| `state_province` | `[]const u8` | No |  |
| `unique_id` | `[]const u8` | No |  |
| `version` | `i64` | No |  |

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
| `billing_id` | `[]const u8` | No |  |
| `client_can_order_equipment` | `bool` | No |  |
| `contact` | `Value (object)` | No |  |
| `created` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `Value (object)` | Yes |  |
| `modified` | `[]const u8` | No |  |
| `name` | `[]const u8` | No |  |
| `parent` | `Value (object)` | No |  |
| `partner_id` | `[]const u8` | No |  |
| `reference` | `[]const u8` | No |  |
| `verification_phrase` | `[]const u8` | No |  |
| `version` | `i64` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billing_id` | - | - | - |
| `client_can_order_equipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `is_active` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partner_id` | - | - | - |
| `reference` | - | - | - |
| `verification_phrase` | - | - | - |
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
| `carrier` | `[]const u8` | No |  |
| `client` | `Value (object)` | No |  |
| `created` | `[]const u8` | No |  |
| `date_received` | `[]const u8` | No |  |
| `date_shipped` | `[]const u8` | No |  |
| `dc_kif` | `Value (object)` | No |  |
| `id` | `[]const u8` | No |  |
| `item` | `Value (array)` | No |  |
| `kif` | `Value (object)` | No |  |
| `modified` | `[]const u8` | No |  |
| `partner` | `Value (object)` | No |  |
| `shipment_type` | `[]const u8` | No |  |
| `tracking` | `[]const u8` | No |  |
| `version` | `i64` | No |  |

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
| `success` | `bool` | No |  |

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
| `alternate_key` | `[]const u8` | No |  |
| `client` | `Value (object)` | No |  |
| `client_ref` | `[]const u8` | No |  |
| `created` | `[]const u8` | No |  |
| `decrypted` | `i64` | No |  |
| `device_name` | `[]const u8` | No |  |
| `direct_partner` | `Value (object)` | No |  |
| `encrypted` | `i64` | No |  |
| `end_date` | `[]const u8` | No |  |
| `err_code` | `[]const u8` | No |  |
| `err_message` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `ip_address` | `[]const u8` | No |  |
| `is_virtual` | `bool` | No |  |
| `key_type` | `[]const u8` | No |  |
| `location` | `Value (object)` | Yes |  |
| `message_id` | `[]const u8` | No |  |
| `method` | `[]const u8` | No |  |
| `partner` | `Value (object)` | No |  |
| `reference` | `[]const u8` | No |  |
| `serial_number` | `[]const u8` | No |  |
| `start_date` | `[]const u8` | No |  |
| `success` | `bool` | No |  |
| `transaction_source` | `[]const u8` | No |  |

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
| `client` | `Value (object)` | No |  |
| `email` | `[]const u8` | No |  |
| `first_name` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `Value (object)` | No |  |
| `last_name` | `[]const u8` | No |  |
| `partner` | `Value (object)` | No |  |
| `phone` | `[]const u8` | No |  |
| `user_name` | `[]const u8` | No |  |
| `user_role` | `Value (object)` | No |  |
| `version` | `i64` | No |  |

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
| `client` | `Value (object)` | No |  |
| `created` | `[]const u8` | No |  |
| `email` | `[]const u8` | No |  |
| `first_name` | `[]const u8` | No |  |
| `id` | `[]const u8` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `Value (object)` | No |  |
| `last_name` | `[]const u8` | No |  |
| `modified` | `[]const u8` | No |  |
| `partner` | `Value (object)` | No |  |
| `phone` | `[]const u8` | No |  |
| `user_name` | `[]const u8` | No |  |
| `user_role` | `Value (object)` | No |  |
| `version` | `i64` | No |  |

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

