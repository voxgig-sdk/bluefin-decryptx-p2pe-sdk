# BluefinDecryptxP2pe Scala SDK



The Scala SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Scala conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. The generated SDK is a
plain-source scala-cli project (no build tool, no third-party runtime
dependencies). Install it from the GitHub release tag
(`scala/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or from a source
checkout — compile it with scala-cli:

```bash
cd scala && scala-cli compile .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```scala
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK

val options = new java.util.LinkedHashMap[String, Object]()
options.put("apikey", System.getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"))
val client = new BluefinDecryptxP2peSDK(options)
```

### 2. List attestation records

`list(null, null)` returns an aggregate list of records (as `Object`, an
aggregate list) and raises on error.

```scala
try {
    val attestationList = client.attestation(null).list(null, null)
    println(attestationList)
}
catch {
    case err: RuntimeException => println("list failed: " + err.getMessage)
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the bare record (as `Object`) and raises on error.

```scala
try {
    val deviceCustodyDetail = client.deviceCustodyDetail(null).load(java.util.Map.of("device_type", "example_device_type", "serial_number", "example_serial_number", "id", "example_id"), null)
    println(deviceCustodyDetail)
}
catch {
    case err: RuntimeException => println("load failed: " + err.getMessage)
}
```

### 4. Create, update, and remove

```scala
// Create — returns the bare created record (as Object)
val created = client.attestation(null).create(java.util.Map.of("client", java.util.Map.of(), "complete_date", "example_complete_date"), null)

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

```scala
val result = client.direct(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "GET",
    "params", java.util.Map.of("id", "example")))

if (java.lang.Boolean.TRUE == result.get("ok")) {
    println(result.get("status"))  // 200
    println(result.get("data"))    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both — an absent key simply reads as null.
    println("status=" + result.get("status") + " err=" + result.get("err"))
}
```

### Prepare a request without sending it

```scala
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "DELETE",
    "params", java.util.Map.of("id", "example")))

println(fetchdef.get("url"))
println(fetchdef.get("method"))
println(fetchdef.get("headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```scala
val client = BluefinDecryptxP2peSDK.testSDK(null, null)

// Entity ops return the bare record and raise on error.
val deviceType = client.deviceType(null).list(null, null)
// deviceType holds the mock response record
println(deviceType)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```scala
val mockFetch: java.util.function.BiFunction[String, java.util.Map[String, Object], Object] =
    (url, init) => {
        val res = new java.util.LinkedHashMap[String, Object]()
        res.put("status", java.lang.Integer.valueOf(200))
        res.put("statusText", "OK")
        res.put("headers", new java.util.LinkedHashMap[String, Object]())
        res.put("json", (() => java.util.Map.of("id", "mock01")): java.util.function.Supplier[Object])
        res
    }

val options = new java.util.LinkedHashMap[String, Object]()
options.put("base", "http://localhost:8080")
options.put("system", java.util.Map.of("fetch", mockFetch))
val client = new BluefinDecryptxP2peSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd scala && make test
```


## Reference

### BluefinDecryptxP2peSDK

```scala
val client = new BluefinDecryptxP2peSDK(options)
```

Creates a new SDK client. `options` is a `java.util.Map[String, Object]`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```scala
val client = BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Map` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `attestation` | `(entopts) -> SdkEntity` | Create an Attestation entity instance. |
| `client` | `(entopts) -> SdkEntity` | Create a Client entity instance. |
| `createResult` | `(entopts) -> SdkEntity` | Create a CreateResult entity instance. |
| `decryption` | `(entopts) -> SdkEntity` | Create a Decryption entity instance. |
| `device` | `(entopts) -> SdkEntity` | Create a Device entity instance. |
| `deviceBuild` | `(entopts) -> SdkEntity` | Create a DeviceBuild entity instance. |
| `deviceCustodyDetail` | `(entopts) -> SdkEntity` | Create a DeviceCustodyDetail entity instance. |
| `deviceCustodyList` | `(entopts) -> SdkEntity` | Create a DeviceCustodyList entity instance. |
| `deviceList` | `(entopts) -> SdkEntity` | Create a DeviceList entity instance. |
| `deviceReceiveResult` | `(entopts) -> SdkEntity` | Create a DeviceReceiveResult entity instance. |
| `deviceRkiActivateResult` | `(entopts) -> SdkEntity` | Create a DeviceRkiActivateResult entity instance. |
| `deviceState` | `(entopts) -> SdkEntity` | Create a DeviceState entity instance. |
| `deviceType` | `(entopts) -> SdkEntity` | Create a DeviceType entity instance. |
| `injectKey` | `(entopts) -> SdkEntity` | Create an InjectKey entity instance. |
| `kif` | `(entopts) -> SdkEntity` | Create a Kif entity instance. |
| `location` | `(entopts) -> SdkEntity` | Create a Location entity instance. |
| `partner` | `(entopts) -> SdkEntity` | Create a Partner entity instance. |
| `shipment` | `(entopts) -> SdkEntity` | Create a Shipment entity instance. |
| `success` | `(entopts) -> SdkEntity` | Create a Success entity instance. |
| `transaction` | `(entopts) -> SdkEntity` | Create a Transaction entity instance. |
| `updateResult` | `(entopts) -> SdkEntity` | Create an UpdateResult entity instance. |
| `user` | `(entopts) -> SdkEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Object` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Object` | List entities matching the criteria (an aggregate list). Raises on error. |
| `create` | `(reqdata, ctrl) -> Object` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> Object` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> Object` | Remove an entity. Raises on error. |
| `data` | `(newdata*) -> Object` | Get or set entity data. |
| `matchArgs` | `(newmatch*) -> Object` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Object` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`java.util.Map[String, Object]` you branch on via `result.get("ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Object` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Operations: create, list, load.

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

Operations: create, list, load, remove.

API path: `/clients`

#### CreateResult

| Field | Description |
| --- | --- |

Operations: create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

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

Operations: create, list, load.

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

Operations: list, load.

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

Operations: load.

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

Operations: list.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` |  |
| `total` |  |

Operations: load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: list.

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

Operations: list, load.

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

Operations: list, load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: list.

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

Operations: create, list, load, remove.

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

Operations: create, list, load.

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

Operations: create, list, load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create, remove.

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

Operations: create, list, load.

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

Operations: create, list, update.

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

Operations: load, remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `val attestation = client.attestation(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` |  |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `device` | `java.util.Map[String, Object]` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |

#### Example: Load

```scala
val attestation = client.attestation(null).load(java.util.Map.of("id", "attestation_id"), null)
```

#### Example: List

```scala
val attestationList = client.attestation(null).list(null, null)
```

#### Example: Create

```scala
val attestation = client.attestation(null).create(java.util.Map.of(
), null)
```


### Client

Create an instance: `val client = client.client(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `direct_partner` | `java.util.Map[String, Object]` |  |
| `id` | `String` |  |
| `is_active` | `java.lang.Boolean` |  |
| `location` | `java.util.Map[String, Object]` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val client = client.client(null).load(java.util.Map.of("id", "client_id"), null)
```

#### Example: List

```scala
val clientList = client.client(null).list(null, null)
```

#### Example: Create

```scala
val client = client.client(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### CreateResult

Create an instance: `val createResult = client.createResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Example: Create

```scala
val createResult = client.createResult(null).create(java.util.Map.of(
    "device_type", "example_device_type",  // String
    "serial_number", "example_serial_number"  // String
), null)
```


### Decryption

Create an instance: `val decryption = client.decryption(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` |  |

#### Example: Create

```scala
val decryption = client.decryption(null).create(java.util.Map.of(
), null)
```


### Device

Create an instance: `val device = client.device(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `java.util.Map[String, Object]` |  |
| `activation_date` | `String` |  |
| `alternate_key` | `String` |  |
| `audit_next_date` | `String` |  |
| `audit_notification_date` | `String` |  |
| `client` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `created_by` | `java.util.Map[String, Object]` |  |
| `device_build` | `java.util.Map[String, Object]` |  |
| `device_state` | `java.util.Map[String, Object]` |  |
| `device_type` | `java.util.Map[String, Object]` |  |
| `error_counter` | `java.lang.Long` |  |
| `error_last_date` | `String` |  |
| `id` | `String` |  |
| `initialized_by` | `java.util.Map[String, Object]` |  |
| `initialized_date` | `String` |  |
| `inject_key` | `java.util.Map[String, Object]` |  |
| `is_virtual` | `java.lang.Boolean` |  |
| `kif` | `java.util.Map[String, Object]` |  |
| `last_activity_date` | `String` |  |
| `location` | `java.util.Map[String, Object]` |  |
| `modified` | `String` |  |
| `modified_by` | `java.util.Map[String, Object]` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `serial_number` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val device = client.device(null).load(java.util.Map.of("id", "device_id"), null)
```

#### Example: List

```scala
val deviceList = client.device(null).list(null, null)
```

#### Example: Create

```scala
val device = client.device(null).create(java.util.Map.of(
    "activated_by", java.util.Map.of(),  // java.util.Map[String, Object]
    "created_by", java.util.Map.of(),  // java.util.Map[String, Object]
    "initialized_by", java.util.Map.of(),  // java.util.Map[String, Object]
    "location", java.util.Map.of(),  // java.util.Map[String, Object]
    "modified_by", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### DeviceBuild

Create an instance: `val deviceBuild = client.deviceBuild(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_version` | `String` |  |
| `build_number` | `String` |  |
| `config_file_name` | `String` |  |
| `created` | `String` |  |
| `device_type` | `String` |  |
| `firmware_version` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `java.lang.Long` |  |
| `is_active` | `java.lang.Boolean` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `version` | `java.lang.Long` |  |
| `white_listing_bin_range` | `String` |  |
| `white_listing_used` | `java.lang.Boolean` |  |

#### Example: Load

```scala
val deviceBuild = client.deviceBuild(null).load(java.util.Map.of("id", "device_build_id"), null)
```

#### Example: List

```scala
val deviceBuildList = client.deviceBuild(null).list(null, null)
```


### DeviceCustodyDetail

Create an instance: `val deviceCustodyDetail = client.deviceCustodyDetail(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `java.util.Map[String, Object]` |  |
| `custodian` | `java.util.Map[String, Object]` |  |
| `device` | `java.util.Map[String, Object]` |  |
| `id` | `java.lang.Long` |  |
| `location` | `java.util.Map[String, Object]` |  |
| `modified` | `String` |  |
| `modified_by` | `java.util.Map[String, Object]` |  |
| `note` | `String` |  |
| `status` | `java.util.Map[String, Object]` |  |
| `transfer_method` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val deviceCustodyDetail = client.deviceCustodyDetail(null).load(java.util.Map.of("id", "device_custody_detail_id", "device_type", "device_type", "serial_number", "serial_number"), null)
```


### DeviceCustodyList

Create an instance: `val deviceCustodyList = client.deviceCustodyList(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `java.util.Map[String, Object]` |  |
| `custodian` | `java.util.Map[String, Object]` |  |
| `device` | `java.util.Map[String, Object]` |  |
| `id` | `java.lang.Long` |  |
| `location` | `java.util.Map[String, Object]` |  |
| `modified` | `String` |  |
| `modified_by` | `java.util.Map[String, Object]` |  |
| `note` | `String` |  |
| `status` | `java.util.Map[String, Object]` |  |
| `transfer_method` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: List

```scala
val deviceCustodyListList = client.deviceCustodyList(null).list(null, null)
```


### DeviceList

Create an instance: `val deviceList = client.deviceList(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `java.util.List[Object]` |  |
| `total` | `java.lang.Long` |  |

#### Example: Load

```scala
val deviceList = client.deviceList(null).load(java.util.Map.of("share_partner_to", "share_partner_to"), null)
```


### DeviceReceiveResult

Create an instance: `val deviceReceiveResult = client.deviceReceiveResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` |  |

#### Example: Create

```scala
val deviceReceiveResult = client.deviceReceiveResult(null).create(java.util.Map.of(
    "success", true  // java.lang.Boolean
), null)
```


### DeviceRkiActivateResult

Create an instance: `val deviceRkiActivateResult = client.deviceRkiActivateResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` |  |

#### Example: Create

```scala
val deviceRkiActivateResult = client.deviceRkiActivateResult(null).create(java.util.Map.of(
    "success", true  // java.lang.Boolean
), null)
```


### DeviceState

Create an instance: `val deviceState = client.deviceState(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `java.lang.Long` |  |
| `name` | `String` |  |

#### Example: List

```scala
val deviceStateList = client.deviceState(null).list(null, null)
```


### DeviceType

Create an instance: `val deviceType = client.deviceType(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `device_type_mode` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `String` |  |
| `is_active` | `java.lang.Boolean` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photo_url` | `String` |  |
| `product_name` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val deviceType = client.deviceType(null).load(java.util.Map.of("id", "device_type_id"), null)
```

#### Example: List

```scala
val deviceTypeList = client.deviceType(null).list(null, null)
```


### InjectKey

Create an instance: `val injectKey = client.injectKey(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `java.lang.Boolean` |  |
| `is_p2_pe` | `java.lang.Boolean` |  |
| `key_type` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val injectKey = client.injectKey(null).load(java.util.Map.of("id", "inject_key_id"), null)
```

#### Example: List

```scala
val injectKeyList = client.injectKey(null).list(null, null)
```


### Kif

Create an instance: `val kif = client.kif(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `java.lang.Long` |  |
| `name` | `String` |  |

#### Example: List

```scala
val kifList = client.kif(null).list(null, null)
```


### Location

Create an instance: `val location = client.location(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `String` |  |
| `address2` | `String` |  |
| `billing_id` | `String` |  |
| `city` | `String` |  |
| `country` | `String` |  |
| `created` | `String` |  |
| `custom_reference` | `String` |  |
| `id` | `String` |  |
| `location_type` | `String` |  |
| `mail_address1` | `String` |  |
| `mail_address2` | `String` |  |
| `mail_city` | `String` |  |
| `mail_country` | `String` |  |
| `mail_postal_code` | `String` |  |
| `mail_state_province` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `name_of_business` | `String` |  |
| `note` | `String` |  |
| `postal_code` | `String` |  |
| `state_province` | `String` |  |
| `unique_id` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val location = client.location(null).load(java.util.Map.of("id", "location_id"), null)
```

#### Example: List

```scala
val locationList = client.location(null).list(null, null)
```

#### Example: Create

```scala
val location = client.location(null).create(java.util.Map.of(
), null)
```


### Partner

Create an instance: `val partner = client.partner(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client_can_order_equipment` | `java.lang.Boolean` |  |
| `contact` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `java.lang.Boolean` |  |
| `location` | `java.util.Map[String, Object]` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `java.util.Map[String, Object]` |  |
| `partner_id` | `String` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val partner = client.partner(null).load(java.util.Map.of("id", "partner_id"), null)
```

#### Example: List

```scala
val partnerList = client.partner(null).list(null, null)
```

#### Example: Create

```scala
val partner = client.partner(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### Shipment

Create an instance: `val shipment = client.shipment(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `date_received` | `String` |  |
| `date_shipped` | `String` |  |
| `dc_kif` | `java.util.Map[String, Object]` |  |
| `id` | `String` |  |
| `item` | `java.util.List[Object]` |  |
| `kif` | `java.util.Map[String, Object]` |  |
| `modified` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `shipment_type` | `String` |  |
| `tracking` | `String` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val shipment = client.shipment(null).load(java.util.Map.of("id", "shipment_id"), null)
```

#### Example: List

```scala
val shipmentList = client.shipment(null).list(null, null)
```

#### Example: Create

```scala
val shipment = client.shipment(null).create(java.util.Map.of(
), null)
```


### Success

Create an instance: `val success = client.success(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` |  |

#### Example: Create

```scala
val success = client.success(null).create(java.util.Map.of(
    "share_partner_to", "example_share_partner_to"  // String
), null)
```


### Transaction

Create an instance: `val transaction = client.transaction(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `String` |  |
| `client` | `java.util.Map[String, Object]` |  |
| `client_ref` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `java.lang.Long` |  |
| `device_name` | `String` |  |
| `direct_partner` | `java.util.Map[String, Object]` |  |
| `encrypted` | `java.lang.Long` |  |
| `end_date` | `String` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `String` |  |
| `ip_address` | `String` |  |
| `is_virtual` | `java.lang.Boolean` |  |
| `key_type` | `String` |  |
| `location` | `java.util.Map[String, Object]` |  |
| `message_id` | `String` |  |
| `method` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `reference` | `String` |  |
| `serial_number` | `String` |  |
| `start_date` | `String` |  |
| `success` | `java.lang.Boolean` |  |
| `transaction_source` | `String` |  |

#### Example: Load

```scala
val transaction = client.transaction(null).load(java.util.Map.of("id", "transaction_id"), null)
```

#### Example: List

```scala
val transactionList = client.transaction(null).list(null, null)
```

#### Example: Create

```scala
val transaction = client.transaction(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### UpdateResult

Create an instance: `val updateResult = client.updateResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `java.lang.Boolean` |  |
| `kif` | `java.util.Map[String, Object]` |  |
| `last_name` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: List

```scala
val updateResultList = client.updateResult(null).list(null, null)
```

#### Example: Create

```scala
val updateResult = client.updateResult(null).create(java.util.Map.of(
), null)
```


### User

Create an instance: `val user = client.user(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `java.lang.Boolean` |  |
| `kif` | `java.util.Map[String, Object]` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `java.util.Map[String, Object]` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `java.util.Map[String, Object]` |  |
| `version` | `java.lang.Long` |  |

#### Example: Load

```scala
val user = client.user(null).load(java.util.Map.of("id", "user_id"), null)
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

### Data as maps

The Scala SDK uses a loose object model — `java.util.Map[String, Object]`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`java.util.Map[String, Object]`. A `BluefinDecryptxP2peTypes.scala` module of
reference `case class` types is also generated for editor documentation.

### Project structure

```
scala/
├── project.scala               -- scala-cli project config (Scala 3, no deps)
├── core/                        -- Main SDK client, config, entity base, error type
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Utility functions and the vendored struct library
└── sdktest/                     -- Generated per-entity tests (scala-cli mains)
```

The main client class (`BluefinDecryptxP2peSDK`, package `voxgig.bluefindecryptxp2pesdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is a dependency-free scala-cli project: JSON parsing is
the vendored `utility/Json.java`, HTTP transport is the JDK
`java.net.http.HttpClient`, and the struct library is inlined under
`utility/struct`.

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
