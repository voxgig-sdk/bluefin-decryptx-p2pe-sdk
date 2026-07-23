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
switch (client.attestation(h.vnull()).create(h.jo(&.{.{ "client", h.omap() }, .{ "complete_date", h.vstr("example_complete_date") }}), h.vnull())) {
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
| `client` |  |
| `complete_date` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `note` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `mid` |  |
| `modified` |  |
| `name` |  |
| `partner` |  |
| `version` |  |

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
| `success` |  |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activated_by` |  |
| `activation_date` |  |
| `alternate_key` |  |
| `audit_next_date` |  |
| `audit_notification_date` |  |
| `client` |  |
| `created` |  |
| `created_by` |  |
| `device_build` |  |
| `device_state` |  |
| `device_type` |  |
| `error_counter` |  |
| `error_last_date` |  |
| `id` |  |
| `initialized_by` |  |
| `initialized_date` |  |
| `inject_key` |  |
| `is_virtual` |  |
| `kif` |  |
| `last_activity_date` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `name` |  |
| `note` |  |
| `partner` |  |
| `serial_number` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `app_version` |  |
| `build_number` |  |
| `config_file_name` |  |
| `created` |  |
| `device_type` |  |
| `firmware_version` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `note` |  |
| `version` |  |
| `white_listing_bin_range` |  |
| `white_listing_used` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` |  |
| `total` |  |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` |  |
| `device_type_mode` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photo_url` |  |
| `product_name` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `is_p2_pe` |  |
| `key_type` |  |
| `modified` |  |
| `name` |  |
| `version` |  |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` |  |
| `address2` |  |
| `billing_id` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `custom_reference` |  |
| `id` |  |
| `location_type` |  |
| `mail_address1` |  |
| `mail_address2` |  |
| `mail_city` |  |
| `mail_country` |  |
| `mail_postal_code` |  |
| `mail_state_province` |  |
| `modified` |  |
| `name` |  |
| `name_of_business` |  |
| `note` |  |
| `postal_code` |  |
| `state_province` |  |
| `unique_id` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client_can_order_equipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partner_id` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `date_received` |  |
| `date_shipped` |  |
| `dc_kif` |  |
| `id` |  |
| `item` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipment_type` |  |
| `tracking` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternate_key` |  |
| `client` |  |
| `client_ref` |  |
| `created` |  |
| `decrypted` |  |
| `device_name` |  |
| `direct_partner` |  |
| `encrypted` |  |
| `end_date` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `is_virtual` |  |
| `key_type` |  |
| `location` |  |
| `message_id` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serial_number` |  |
| `start_date` |  |
| `success` |  |
| `transaction_source` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

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
| `client` | `Value (object)` |  |
| `complete_date` | `[]const u8` |  |
| `created` | `[]const u8` |  |
| `device` | `Value (object)` |  |
| `id` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `note` | `[]const u8` |  |

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
| `contact` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `direct_partner` | `Value (object)` |  |
| `id` | `[]const u8` |  |
| `is_active` | `bool` |  |
| `location` | `Value (object)` |  |
| `mid` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `version` | `i64` |  |

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
| `success` | `bool` |  |

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
| `activated_by` | `Value (object)` |  |
| `activation_date` | `[]const u8` |  |
| `alternate_key` | `[]const u8` |  |
| `audit_next_date` | `[]const u8` |  |
| `audit_notification_date` | `[]const u8` |  |
| `client` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `created_by` | `Value (object)` |  |
| `device_build` | `Value (object)` |  |
| `device_state` | `Value (object)` |  |
| `device_type` | `Value (object)` |  |
| `error_counter` | `i64` |  |
| `error_last_date` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `initialized_by` | `Value (object)` |  |
| `initialized_date` | `[]const u8` |  |
| `inject_key` | `Value (object)` |  |
| `is_virtual` | `bool` |  |
| `kif` | `Value (object)` |  |
| `last_activity_date` | `[]const u8` |  |
| `location` | `Value (object)` |  |
| `modified` | `[]const u8` |  |
| `modified_by` | `Value (object)` |  |
| `name` | `[]const u8` |  |
| `note` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `serial_number` | `[]const u8` |  |
| `version` | `i64` |  |

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
    .{ "activated_by", h.omap() }, // Value (object)
    .{ "created_by", h.omap() }, // Value (object)
    .{ "initialized_by", h.omap() }, // Value (object)
    .{ "location", h.omap() }, // Value (object)
    .{ "modified_by", h.omap() }, // Value (object)
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
| `app_version` | `[]const u8` |  |
| `build_number` | `[]const u8` |  |
| `config_file_name` | `[]const u8` |  |
| `created` | `[]const u8` |  |
| `device_type` | `[]const u8` |  |
| `firmware_version` | `[]const u8` |  |
| `hardware_version` | `[]const u8` |  |
| `id` | `i64` |  |
| `is_active` | `bool` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `note` | `[]const u8` |  |
| `version` | `i64` |  |
| `white_listing_bin_range` | `[]const u8` |  |
| `white_listing_used` | `bool` |  |

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
| `complete_date` | `[]const u8` |  |
| `created` | `[]const u8` |  |
| `created_by` | `Value (object)` |  |
| `custodian` | `Value (object)` |  |
| `device` | `Value (object)` |  |
| `id` | `i64` |  |
| `location` | `Value (object)` |  |
| `modified` | `[]const u8` |  |
| `modified_by` | `Value (object)` |  |
| `note` | `[]const u8` |  |
| `status` | `Value (object)` |  |
| `transfer_method` | `Value (object)` |  |
| `version` | `i64` |  |

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
| `complete_date` | `[]const u8` |  |
| `created` | `[]const u8` |  |
| `created_by` | `Value (object)` |  |
| `custodian` | `Value (object)` |  |
| `device` | `Value (object)` |  |
| `id` | `i64` |  |
| `location` | `Value (object)` |  |
| `modified` | `[]const u8` |  |
| `modified_by` | `Value (object)` |  |
| `note` | `[]const u8` |  |
| `status` | `Value (object)` |  |
| `transfer_method` | `Value (object)` |  |
| `version` | `i64` |  |

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
| `data` | `Value (array)` |  |
| `total` | `i64` |  |

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
| `success` | `bool` |  |

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
| `success` | `bool` |  |

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
| `id` | `i64` |  |
| `name` | `[]const u8` |  |

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
| `created` | `[]const u8` |  |
| `device_type_mode` | `[]const u8` |  |
| `hardware_version` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `is_active` | `bool` |  |
| `manufacturer` | `[]const u8` |  |
| `model` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `photo_url` | `[]const u8` |  |
| `product_name` | `[]const u8` |  |
| `version` | `i64` |  |

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
| `created` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `is_active` | `bool` |  |
| `is_p2_pe` | `bool` |  |
| `key_type` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `version` | `i64` |  |

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
| `id` | `i64` |  |
| `name` | `[]const u8` |  |

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
| `address1` | `[]const u8` |  |
| `address2` | `[]const u8` |  |
| `billing_id` | `[]const u8` |  |
| `city` | `[]const u8` |  |
| `country` | `[]const u8` |  |
| `created` | `[]const u8` |  |
| `custom_reference` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `location_type` | `[]const u8` |  |
| `mail_address1` | `[]const u8` |  |
| `mail_address2` | `[]const u8` |  |
| `mail_city` | `[]const u8` |  |
| `mail_country` | `[]const u8` |  |
| `mail_postal_code` | `[]const u8` |  |
| `mail_state_province` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `name_of_business` | `[]const u8` |  |
| `note` | `[]const u8` |  |
| `postal_code` | `[]const u8` |  |
| `state_province` | `[]const u8` |  |
| `unique_id` | `[]const u8` |  |
| `version` | `i64` |  |

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
| `billing_id` | `[]const u8` |  |
| `client_can_order_equipment` | `bool` |  |
| `contact` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `is_active` | `bool` |  |
| `location` | `Value (object)` |  |
| `modified` | `[]const u8` |  |
| `name` | `[]const u8` |  |
| `parent` | `Value (object)` |  |
| `partner_id` | `[]const u8` |  |
| `reference` | `[]const u8` |  |
| `verification_phrase` | `[]const u8` |  |
| `version` | `i64` |  |

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
| `carrier` | `[]const u8` |  |
| `client` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `date_received` | `[]const u8` |  |
| `date_shipped` | `[]const u8` |  |
| `dc_kif` | `Value (object)` |  |
| `id` | `[]const u8` |  |
| `item` | `Value (array)` |  |
| `kif` | `Value (object)` |  |
| `modified` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `shipment_type` | `[]const u8` |  |
| `tracking` | `[]const u8` |  |
| `version` | `i64` |  |

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
| `success` | `bool` |  |

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
| `alternate_key` | `[]const u8` |  |
| `client` | `Value (object)` |  |
| `client_ref` | `[]const u8` |  |
| `created` | `[]const u8` |  |
| `decrypted` | `i64` |  |
| `device_name` | `[]const u8` |  |
| `direct_partner` | `Value (object)` |  |
| `encrypted` | `i64` |  |
| `end_date` | `[]const u8` |  |
| `err_code` | `[]const u8` |  |
| `err_message` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `ip_address` | `[]const u8` |  |
| `is_virtual` | `bool` |  |
| `key_type` | `[]const u8` |  |
| `location` | `Value (object)` |  |
| `message_id` | `[]const u8` |  |
| `method` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `reference` | `[]const u8` |  |
| `serial_number` | `[]const u8` |  |
| `start_date` | `[]const u8` |  |
| `success` | `bool` |  |
| `transaction_source` | `[]const u8` |  |

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
| `client` | `Value (object)` |  |
| `email` | `[]const u8` |  |
| `first_name` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `is_active` | `bool` |  |
| `kif` | `Value (object)` |  |
| `last_name` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `phone` | `[]const u8` |  |
| `user_name` | `[]const u8` |  |
| `user_role` | `Value (object)` |  |
| `version` | `i64` |  |

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
| `client` | `Value (object)` |  |
| `created` | `[]const u8` |  |
| `email` | `[]const u8` |  |
| `first_name` | `[]const u8` |  |
| `id` | `[]const u8` |  |
| `is_active` | `bool` |  |
| `kif` | `Value (object)` |  |
| `last_name` | `[]const u8` |  |
| `modified` | `[]const u8` |  |
| `partner` | `Value (object)` |  |
| `phone` | `[]const u8` |  |
| `user_name` | `[]const u8` |  |
| `user_role` | `Value (object)` |  |
| `version` | `i64` |  |

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
