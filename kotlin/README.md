# BluefinDecryptxP2pe Kotlin SDK



The Kotlin SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Kotlin conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. Install it from the GitHub
release tag (`kotlin/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout — build the library with Gradle:

```bash
cd kotlin && gradle build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```kotlin
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK

val client = BluefinDecryptxP2peSDK(mutableMapOf<String, Any?>(
    "apikey" to System.getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
))
```

### 2. List attestation records

`list(null, null)` returns an aggregate list of records (as `Any?`, an
aggregate list) and raises on error.

```kotlin
try {
    val attestationList = client.attestation(null).list(null, null)
    println(attestationList)
}
catch (err: RuntimeException) {
    println("list failed: " + err.message)
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the bare record (as `Any?`) and raises on error.

```kotlin
try {
    val deviceCustodyDetail = client.deviceCustodyDetail(null).load(mutableMapOf<String, Any?>("device_type" to "example_device_type", "serial_number" to "example_serial_number", "id" to "example_id"), null)
    println(deviceCustodyDetail)
}
catch (err: RuntimeException) {
    println("load failed: " + err.message)
}
```

### 4. Create, update, and remove

```kotlin
// Create — returns the bare created record (as Any?)
val created = client.attestation(null).create(mutableMapOf<String, Any?>("client" to mapOf<String, Any?>(), "complete_date" to "example_complete_date"), null)

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

```kotlin
val result = client.direct(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "GET",
    "params" to mapOf("id" to "example")))

if (result["ok"] == true) {
    println(result["status"])  // 200
    println(result["data"])    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as null.
    println("" + result["status"] + " " + result["err"])
}
```

### Prepare a request without sending it

```kotlin
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(mutableMapOf<String, Any?>(
    "path" to "/api/resource/{id}",
    "method" to "DELETE",
    "params" to mapOf("id" to "example")))

println(fetchdef["url"])
println(fetchdef["method"])
println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```kotlin
val client = BluefinDecryptxP2peSDK.testSDK(null, null)

// Entity ops return the bare record and raise on error.
val deviceType = client.deviceType(null).list(null, null)
// deviceType holds the mock response record
println(deviceType)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```kotlin
val mockFetch = java.util.function.BiFunction<String, MutableMap<String, Any?>, Any?> { url, init ->
    mutableMapOf<String, Any?>(
        "status" to 200,
        "statusText" to "OK",
        "headers" to mutableMapOf<String, Any?>(),
        "json" to java.util.function.Supplier<Any?> { mapOf("id" to "mock01") },
    )
}

val client = BluefinDecryptxP2peSDK(mutableMapOf<String, Any?>(
    "base" to "http://localhost:8080",
    "system" to mapOf("fetch" to mockFetch),
))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd kotlin && gradle test
```


## Reference

### BluefinDecryptxP2peSDK

```kotlin
val client = BluefinDecryptxP2peSDK(options)
```

Creates a new SDK client. `options` is a `MutableMap<String, Any?>`.

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

```kotlin
val client = BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> MutableMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> MutableMap` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> MutableMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
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
| `load` | `(reqmatch, ctrl) -> Any?` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Any?` | List entities matching the criteria (an aggregate list). Raises on error. |
| `create` | `(reqdata, ctrl) -> Any?` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> Any?` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> Any?` | Remove an entity. Raises on error. |
| `data` | `(vararg newdata) -> Any?` | Get or set entity data. |
| `match` | `(vararg newmatch) -> Any?` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `name` | `val: String` | The entity name. |

### Result shape

Entity operations return the bare result data (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Any?` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`MutableMap<String, Any?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Any?` | Parsed JSON response body. |

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
| `client` | `Map<String, Any?>?` |  |
| `complete_date` | `String?` |  |
| `created` | `String?` |  |
| `device` | `Map<String, Any?>?` |  |
| `id` | `String?` |  |
| `name` | `String?` |  |
| `note` | `String?` |  |

#### Example: Load

```kotlin
val attestation = client.attestation(null).load(mutableMapOf<String, Any?>("id" to "attestation_id"), null)
```

#### Example: List

```kotlin
val attestationList = client.attestation(null).list(null, null)
```

#### Example: Create

```kotlin
val attestation = client.attestation(null).create(mutableMapOf<String, Any?>(
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
| `contact` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `direct_partner` | `Map<String, Any?>?` |  |
| `id` | `String?` |  |
| `is_active` | `Boolean?` |  |
| `location` | `Map<String, Any?>?` |  |
| `mid` | `String?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val client = client.client(null).load(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

#### Example: List

```kotlin
val clientList = client.client(null).list(null, null)
```

#### Example: Create

```kotlin
val client = client.client(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```


### CreateResult

Create an instance: `val createResult = client.createResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Example: Create

```kotlin
val createResult = client.createResult(null).create(mutableMapOf<String, Any?>(
    "device_type" to "example_device_type",  // String?
    "serial_number" to "example_serial_number"  // String?
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
| `success` | `Boolean?` |  |

#### Example: Create

```kotlin
val decryption = client.decryption(null).create(mutableMapOf<String, Any?>(
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
| `activated_by` | `Map<String, Any?>?` |  |
| `activation_date` | `String?` |  |
| `alternate_key` | `String?` |  |
| `audit_next_date` | `String?` |  |
| `audit_notification_date` | `String?` |  |
| `client` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `created_by` | `Map<String, Any?>?` |  |
| `device_build` | `Map<String, Any?>?` |  |
| `device_state` | `Map<String, Any?>?` |  |
| `device_type` | `Map<String, Any?>?` |  |
| `error_counter` | `Long?` |  |
| `error_last_date` | `String?` |  |
| `id` | `String?` |  |
| `initialized_by` | `Map<String, Any?>?` |  |
| `initialized_date` | `String?` |  |
| `inject_key` | `Map<String, Any?>?` |  |
| `is_virtual` | `Boolean?` |  |
| `kif` | `Map<String, Any?>?` |  |
| `last_activity_date` | `String?` |  |
| `location` | `Map<String, Any?>?` |  |
| `modified` | `String?` |  |
| `modified_by` | `Map<String, Any?>?` |  |
| `name` | `String?` |  |
| `note` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `serial_number` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val device = client.device(null).load(mutableMapOf<String, Any?>("id" to "device_id"), null)
```

#### Example: List

```kotlin
val deviceList = client.device(null).list(null, null)
```

#### Example: Create

```kotlin
val device = client.device(null).create(mutableMapOf<String, Any?>(
    "activated_by" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "created_by" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "initialized_by" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "location" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "modified_by" to mapOf<String, Any?>()  // Map<String, Any?>?
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
| `app_version` | `String?` |  |
| `build_number` | `String?` |  |
| `config_file_name` | `String?` |  |
| `created` | `String?` |  |
| `device_type` | `String?` |  |
| `firmware_version` | `String?` |  |
| `hardware_version` | `String?` |  |
| `id` | `Long?` |  |
| `is_active` | `Boolean?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `note` | `String?` |  |
| `version` | `Long?` |  |
| `white_listing_bin_range` | `String?` |  |
| `white_listing_used` | `Boolean?` |  |

#### Example: Load

```kotlin
val deviceBuild = client.deviceBuild(null).load(mutableMapOf<String, Any?>("id" to "device_build_id"), null)
```

#### Example: List

```kotlin
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
| `complete_date` | `String?` |  |
| `created` | `String?` |  |
| `created_by` | `Map<String, Any?>?` |  |
| `custodian` | `Map<String, Any?>?` |  |
| `device` | `Map<String, Any?>?` |  |
| `id` | `Long?` |  |
| `location` | `Map<String, Any?>?` |  |
| `modified` | `String?` |  |
| `modified_by` | `Map<String, Any?>?` |  |
| `note` | `String?` |  |
| `status` | `Map<String, Any?>?` |  |
| `transfer_method` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val deviceCustodyDetail = client.deviceCustodyDetail(null).load(mutableMapOf<String, Any?>("id" to "device_custody_detail_id", "device_type" to "device_type", "serial_number" to "serial_number"), null)
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
| `complete_date` | `String?` |  |
| `created` | `String?` |  |
| `created_by` | `Map<String, Any?>?` |  |
| `custodian` | `Map<String, Any?>?` |  |
| `device` | `Map<String, Any?>?` |  |
| `id` | `Long?` |  |
| `location` | `Map<String, Any?>?` |  |
| `modified` | `String?` |  |
| `modified_by` | `Map<String, Any?>?` |  |
| `note` | `String?` |  |
| `status` | `Map<String, Any?>?` |  |
| `transfer_method` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: List

```kotlin
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
| `data` | `List<Any?>?` |  |
| `total` | `Long?` |  |

#### Example: Load

```kotlin
val deviceList = client.deviceList(null).load(mutableMapOf<String, Any?>("share_partner_to" to "share_partner_to"), null)
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
| `success` | `Boolean?` |  |

#### Example: Create

```kotlin
val deviceReceiveResult = client.deviceReceiveResult(null).create(mutableMapOf<String, Any?>(
    "success" to true  // Boolean?
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
| `success` | `Boolean?` |  |

#### Example: Create

```kotlin
val deviceRkiActivateResult = client.deviceRkiActivateResult(null).create(mutableMapOf<String, Any?>(
    "success" to true  // Boolean?
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
| `id` | `Long?` |  |
| `name` | `String?` |  |

#### Example: List

```kotlin
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
| `created` | `String?` |  |
| `device_type_mode` | `String?` |  |
| `hardware_version` | `String?` |  |
| `id` | `String?` |  |
| `is_active` | `Boolean?` |  |
| `manufacturer` | `String?` |  |
| `model` | `String?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `photo_url` | `String?` |  |
| `product_name` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val deviceType = client.deviceType(null).load(mutableMapOf<String, Any?>("id" to "device_type_id"), null)
```

#### Example: List

```kotlin
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
| `created` | `String?` |  |
| `id` | `String?` |  |
| `is_active` | `Boolean?` |  |
| `is_p2_pe` | `Boolean?` |  |
| `key_type` | `String?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val injectKey = client.injectKey(null).load(mutableMapOf<String, Any?>("id" to "inject_key_id"), null)
```

#### Example: List

```kotlin
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
| `id` | `Long?` |  |
| `name` | `String?` |  |

#### Example: List

```kotlin
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
| `address1` | `String?` |  |
| `address2` | `String?` |  |
| `billing_id` | `String?` |  |
| `city` | `String?` |  |
| `country` | `String?` |  |
| `created` | `String?` |  |
| `custom_reference` | `String?` |  |
| `id` | `String?` |  |
| `location_type` | `String?` |  |
| `mail_address1` | `String?` |  |
| `mail_address2` | `String?` |  |
| `mail_city` | `String?` |  |
| `mail_country` | `String?` |  |
| `mail_postal_code` | `String?` |  |
| `mail_state_province` | `String?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `name_of_business` | `String?` |  |
| `note` | `String?` |  |
| `postal_code` | `String?` |  |
| `state_province` | `String?` |  |
| `unique_id` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val location = client.location(null).load(mutableMapOf<String, Any?>("id" to "location_id"), null)
```

#### Example: List

```kotlin
val locationList = client.location(null).list(null, null)
```

#### Example: Create

```kotlin
val location = client.location(null).create(mutableMapOf<String, Any?>(
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
| `billing_id` | `String?` |  |
| `client_can_order_equipment` | `Boolean?` |  |
| `contact` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `id` | `String?` |  |
| `is_active` | `Boolean?` |  |
| `location` | `Map<String, Any?>?` |  |
| `modified` | `String?` |  |
| `name` | `String?` |  |
| `parent` | `Map<String, Any?>?` |  |
| `partner_id` | `String?` |  |
| `reference` | `String?` |  |
| `verification_phrase` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val partner = client.partner(null).load(mutableMapOf<String, Any?>("id" to "partner_id"), null)
```

#### Example: List

```kotlin
val partnerList = client.partner(null).list(null, null)
```

#### Example: Create

```kotlin
val partner = client.partner(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
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
| `carrier` | `String?` |  |
| `client` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `date_received` | `String?` |  |
| `date_shipped` | `String?` |  |
| `dc_kif` | `Map<String, Any?>?` |  |
| `id` | `String?` |  |
| `item` | `List<Any?>?` |  |
| `kif` | `Map<String, Any?>?` |  |
| `modified` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `shipment_type` | `String?` |  |
| `tracking` | `String?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val shipment = client.shipment(null).load(mutableMapOf<String, Any?>("id" to "shipment_id"), null)
```

#### Example: List

```kotlin
val shipmentList = client.shipment(null).list(null, null)
```

#### Example: Create

```kotlin
val shipment = client.shipment(null).create(mutableMapOf<String, Any?>(
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
| `success` | `Boolean?` |  |

#### Example: Create

```kotlin
val success = client.success(null).create(mutableMapOf<String, Any?>(
    "share_partner_to" to "example_share_partner_to"  // String?
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
| `alternate_key` | `String?` |  |
| `client` | `Map<String, Any?>?` |  |
| `client_ref` | `String?` |  |
| `created` | `String?` |  |
| `decrypted` | `Long?` |  |
| `device_name` | `String?` |  |
| `direct_partner` | `Map<String, Any?>?` |  |
| `encrypted` | `Long?` |  |
| `end_date` | `String?` |  |
| `err_code` | `String?` |  |
| `err_message` | `String?` |  |
| `id` | `String?` |  |
| `ip_address` | `String?` |  |
| `is_virtual` | `Boolean?` |  |
| `key_type` | `String?` |  |
| `location` | `Map<String, Any?>?` |  |
| `message_id` | `String?` |  |
| `method` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `reference` | `String?` |  |
| `serial_number` | `String?` |  |
| `start_date` | `String?` |  |
| `success` | `Boolean?` |  |
| `transaction_source` | `String?` |  |

#### Example: Load

```kotlin
val transaction = client.transaction(null).load(mutableMapOf<String, Any?>("id" to "transaction_id"), null)
```

#### Example: List

```kotlin
val transactionList = client.transaction(null).list(null, null)
```

#### Example: Create

```kotlin
val transaction = client.transaction(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
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
| `client` | `Map<String, Any?>?` |  |
| `email` | `String?` |  |
| `first_name` | `String?` |  |
| `id` | `String?` |  |
| `is_active` | `Boolean?` |  |
| `kif` | `Map<String, Any?>?` |  |
| `last_name` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `phone` | `String?` |  |
| `user_name` | `String?` |  |
| `user_role` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: List

```kotlin
val updateResultList = client.updateResult(null).list(null, null)
```

#### Example: Create

```kotlin
val updateResult = client.updateResult(null).create(mutableMapOf<String, Any?>(
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
| `client` | `Map<String, Any?>?` |  |
| `created` | `String?` |  |
| `email` | `String?` |  |
| `first_name` | `String?` |  |
| `id` | `String?` |  |
| `is_active` | `Boolean?` |  |
| `kif` | `Map<String, Any?>?` |  |
| `last_name` | `String?` |  |
| `modified` | `String?` |  |
| `partner` | `Map<String, Any?>?` |  |
| `phone` | `String?` |  |
| `user_name` | `String?` |  |
| `user_role` | `Map<String, Any?>?` |  |
| `version` | `Long?` |  |

#### Example: Load

```kotlin
val user = client.user(null).load(mutableMapOf<String, Any?>("id" to "user_id"), null)
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

The Kotlin SDK uses a loose object model — `MutableMap<String, Any?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`MutableMap<String, Any?>`. A `BluefinDecryptxP2peTypes.kt` module of
reference `data class` types is also generated for editor documentation.

### Project structure

```
kotlin/
├── build.gradle.kts            -- Gradle build (compiles core/, utility/, feature/, entity/)
├── settings.gradle.kts         -- Gradle project settings
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- JUnit test suites
```

The main client class (`BluefinDecryptxP2peSDK`, package `voxgig.bluefindecryptxp2pesdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed.

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
