# BluefinDecryptxP2pe Kotlin SDK Reference

Complete API reference for the BluefinDecryptxP2pe Kotlin SDK.


## BluefinDecryptxP2peSDK

### Constructor

```kotlin
val client = BluefinDecryptxP2peSDK(options)
```

Create a new SDK client instance. `options` is a `MutableMap<String, Any?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Map` | Custom headers for all requests. |
| `options["feature"]` | `Map` | Feature configuration. |
| `options["system"]` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `null`.

```kotlin
val client = BluefinDecryptxP2peSDK.testSDK(null, null)
```


### Instance Methods

#### `attestation(entopts)`

Create a new `Attestation` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `client(entopts)`

Create a new `Client` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `createResult(entopts)`

Create a new `CreateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `decryption(entopts)`

Create a new `Decryption` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `device(entopts)`

Create a new `Device` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceBuild(entopts)`

Create a new `DeviceBuild` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceCustodyDetail(entopts)`

Create a new `DeviceCustodyDetail` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceCustodyList(entopts)`

Create a new `DeviceCustodyList` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceList(entopts)`

Create a new `DeviceList` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceReceiveResult(entopts)`

Create a new `DeviceReceiveResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceRkiActivateResult(entopts)`

Create a new `DeviceRkiActivateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceState(entopts)`

Create a new `DeviceState` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `deviceType(entopts)`

Create a new `DeviceType` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `injectKey(entopts)`

Create a new `InjectKey` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `kif(entopts)`

Create a new `Kif` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `location(entopts)`

Create a new `Location` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `partner(entopts)`

Create a new `Partner` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `shipment(entopts)`

Create a new `Shipment` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `success(entopts)`

Create a new `Success` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `transaction(entopts)`

Create a new `Transaction` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `updateResult(entopts)`

Create a new `UpdateResult` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `user(entopts)`

Create a new `User` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> MutableMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> MutableMap`

Make a direct HTTP request to any API endpoint. Returns a result
`MutableMap<String, Any?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Any?` | Request body (maps are JSON-serialized). |

**Returns:** `MutableMap<String, Any?>`

#### `prepare(fetchargs) -> MutableMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```kotlin
val attestation = client.attestation(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Any?>?` | No |  |
| `complete_date` | `String?` | No |  |
| `created` | `String?` | No |  |
| `device` | `Map<String, Any?>?` | No |  |
| `id` | `String?` | No |  |
| `name` | `String?` | No |  |
| `note` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.attestation(null).create(mutableMapOf<String, Any?>(
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.attestation(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.attestation(null).load(mutableMapOf<String, Any?>("id" to "attestation_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Attestation` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Client

```kotlin
val client = client.client(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `direct_partner` | `Map<String, Any?>?` | No |  |
| `id` | `String?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `mid` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `version` | `Long?` | No |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.client(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.client(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.client(null).load(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.client(null).remove(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## CreateResult

```kotlin
val createResult = client.createResult(null)
```

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.createResult(null).create(mutableMapOf<String, Any?>(
    "device_type" to "example_device_type",  // String?
    "serial_number" to "example_serial_number"  // String?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Decryption

```kotlin
val decryption = client.decryption(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.decryption(null).create(mutableMapOf<String, Any?>(
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Decryption` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Device

```kotlin
val device = client.device(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `Map<String, Any?>?` | Yes |  |
| `activation_date` | `String?` | No |  |
| `alternate_key` | `String?` | No |  |
| `audit_next_date` | `String?` | No |  |
| `audit_notification_date` | `String?` | No |  |
| `client` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `created_by` | `Map<String, Any?>?` | Yes |  |
| `device_build` | `Map<String, Any?>?` | No |  |
| `device_state` | `Map<String, Any?>?` | No |  |
| `device_type` | `Map<String, Any?>?` | No |  |
| `error_counter` | `Long?` | No |  |
| `error_last_date` | `String?` | No |  |
| `id` | `String?` | No |  |
| `initialized_by` | `Map<String, Any?>?` | Yes |  |
| `initialized_date` | `String?` | No |  |
| `inject_key` | `Map<String, Any?>?` | No |  |
| `is_virtual` | `Boolean?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `last_activity_date` | `String?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `modified_by` | `Map<String, Any?>?` | Yes |  |
| `name` | `String?` | No |  |
| `note` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `serial_number` | `String?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.device(null).create(mutableMapOf<String, Any?>(
    "activated_by" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "created_by" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "initialized_by" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "location" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "modified_by" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.device(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.device(null).load(mutableMapOf<String, Any?>("id" to "device_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Device` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceBuild

```kotlin
val deviceBuild = client.deviceBuild(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_version` | `String?` | No |  |
| `build_number` | `String?` | No |  |
| `config_file_name` | `String?` | No |  |
| `created` | `String?` | No |  |
| `device_type` | `String?` | No |  |
| `firmware_version` | `String?` | No |  |
| `hardware_version` | `String?` | No |  |
| `id` | `Long?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `note` | `String?` | No |  |
| `version` | `Long?` | No |  |
| `white_listing_bin_range` | `String?` | No |  |
| `white_listing_used` | `Boolean?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.deviceBuild(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.deviceBuild(null).load(mutableMapOf<String, Any?>("id" to "device_build_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceCustodyDetail

```kotlin
val deviceCustodyDetail = client.deviceCustodyDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `String?` | No |  |
| `created` | `String?` | No |  |
| `created_by` | `Map<String, Any?>?` | Yes |  |
| `custodian` | `Map<String, Any?>?` | Yes |  |
| `device` | `Map<String, Any?>?` | No |  |
| `id` | `Long?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `modified_by` | `Map<String, Any?>?` | Yes |  |
| `note` | `String?` | No |  |
| `status` | `Map<String, Any?>?` | No |  |
| `transfer_method` | `Map<String, Any?>?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.deviceCustodyDetail(null).load(mutableMapOf<String, Any?>("id" to "device_custody_detail_id", "device_type" to "device_type", "serial_number" to "serial_number"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceCustodyList

```kotlin
val deviceCustodyList = client.deviceCustodyList(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `String?` | No |  |
| `created` | `String?` | No |  |
| `created_by` | `Map<String, Any?>?` | Yes |  |
| `custodian` | `Map<String, Any?>?` | Yes |  |
| `device` | `Map<String, Any?>?` | No |  |
| `id` | `Long?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `modified_by` | `Map<String, Any?>?` | Yes |  |
| `note` | `String?` | No |  |
| `status` | `Map<String, Any?>?` | No |  |
| `transfer_method` | `Map<String, Any?>?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.deviceCustodyList(null).list(null, null)
println(results)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceList

```kotlin
val deviceList = client.deviceList(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<Any?>?` | No |  |
| `total` | `Long?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.deviceList(null).load(mutableMapOf<String, Any?>("share_partner_to" to "share_partner_to"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceList` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceReceiveResult

```kotlin
val deviceReceiveResult = client.deviceReceiveResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.deviceReceiveResult(null).create(mutableMapOf<String, Any?>(
    "success" to true  // Boolean?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceRkiActivateResult

```kotlin
val deviceRkiActivateResult = client.deviceRkiActivateResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean?` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.deviceRkiActivateResult(null).create(mutableMapOf<String, Any?>(
    "success" to true  // Boolean?
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceState

```kotlin
val deviceState = client.deviceState(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long?` | No |  |
| `name` | `String?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.deviceState(null).list(null, null)
println(results)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceState` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## DeviceType

```kotlin
val deviceType = client.deviceType(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String?` | No |  |
| `device_type_mode` | `String?` | No |  |
| `hardware_version` | `String?` | No |  |
| `id` | `String?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `manufacturer` | `String?` | No |  |
| `model` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `photo_url` | `String?` | No |  |
| `product_name` | `String?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.deviceType(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.deviceType(null).load(mutableMapOf<String, Any?>("id" to "device_type_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceType` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## InjectKey

```kotlin
val injectKey = client.injectKey(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String?` | No |  |
| `id` | `String?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `is_p2_pe` | `Boolean?` | No |  |
| `key_type` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.injectKey(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.injectKey(null).load(mutableMapOf<String, Any?>("id" to "inject_key_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKey` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Kif

```kotlin
val kif = client.kif(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long?` | No |  |
| `name` | `String?` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.kif(null).list(null, null)
println(results)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Kif` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Location

```kotlin
val location = client.location(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String?` | No |  |
| `address2` | `String?` | No |  |
| `billing_id` | `String?` | No |  |
| `city` | `String?` | No |  |
| `country` | `String?` | No |  |
| `created` | `String?` | No |  |
| `custom_reference` | `String?` | No |  |
| `id` | `String?` | No |  |
| `location_type` | `String?` | No |  |
| `mail_address1` | `String?` | No |  |
| `mail_address2` | `String?` | No |  |
| `mail_city` | `String?` | No |  |
| `mail_country` | `String?` | No |  |
| `mail_postal_code` | `String?` | No |  |
| `mail_state_province` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `name_of_business` | `String?` | No |  |
| `note` | `String?` | No |  |
| `postal_code` | `String?` | No |  |
| `state_province` | `String?` | No |  |
| `unique_id` | `String?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.location(null).create(mutableMapOf<String, Any?>(
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.location(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.location(null).load(mutableMapOf<String, Any?>("id" to "location_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.location(null).remove(mutableMapOf<String, Any?>("id" to "location_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Location` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Partner

```kotlin
val partner = client.partner(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `String?` | No |  |
| `client_can_order_equipment` | `Boolean?` | No |  |
| `contact` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `id` | `String?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `parent` | `Map<String, Any?>?` | No |  |
| `partner_id` | `String?` | No |  |
| `reference` | `String?` | No |  |
| `verification_phrase` | `String?` | No |  |
| `version` | `Long?` | No |  |

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

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.partner(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.partner(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.partner(null).load(mutableMapOf<String, Any?>("id" to "partner_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Shipment

```kotlin
val shipment = client.shipment(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String?` | No |  |
| `client` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `date_received` | `String?` | No |  |
| `date_shipped` | `String?` | No |  |
| `dc_kif` | `Map<String, Any?>?` | No |  |
| `id` | `String?` | No |  |
| `item` | `List<Any?>?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `modified` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `shipment_type` | `String?` | No |  |
| `tracking` | `String?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.shipment(null).create(mutableMapOf<String, Any?>(
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.shipment(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.shipment(null).load(mutableMapOf<String, Any?>("id" to "shipment_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Shipment` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Success

```kotlin
val success = client.success(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.success(null).create(mutableMapOf<String, Any?>(
    "share_partner_to" to "example_share_partner_to"  // String?
), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.success(null).remove(mutableMapOf<String, Any?>("share_partner_to" to "share_partner_to"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Success` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Transaction

```kotlin
val transaction = client.transaction(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `String?` | No |  |
| `client` | `Map<String, Any?>?` | No |  |
| `client_ref` | `String?` | No |  |
| `created` | `String?` | No |  |
| `decrypted` | `Long?` | No |  |
| `device_name` | `String?` | No |  |
| `direct_partner` | `Map<String, Any?>?` | No |  |
| `encrypted` | `Long?` | No |  |
| `end_date` | `String?` | No |  |
| `err_code` | `String?` | No |  |
| `err_message` | `String?` | No |  |
| `id` | `String?` | No |  |
| `ip_address` | `String?` | No |  |
| `is_virtual` | `Boolean?` | No |  |
| `key_type` | `String?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `message_id` | `String?` | No |  |
| `method` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `reference` | `String?` | No |  |
| `serial_number` | `String?` | No |  |
| `start_date` | `String?` | No |  |
| `success` | `Boolean?` | No |  |
| `transaction_source` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.transaction(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.transaction(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.transaction(null).load(mutableMapOf<String, Any?>("id" to "transaction_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## UpdateResult

```kotlin
val updateResult = client.updateResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Any?>?` | No |  |
| `email` | `String?` | No |  |
| `first_name` | `String?` | No |  |
| `id` | `String?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `last_name` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `phone` | `String?` | No |  |
| `user_name` | `String?` | No |  |
| `user_role` | `Map<String, Any?>?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.updateResult(null).create(mutableMapOf<String, Any?>(
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```kotlin
val results = client.updateResult(null).list(null, null)
println(results)
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```kotlin
val result = client.updateResult(null).update(mutableMapOf<String, Any?>(
    "id" to "id"
), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## User

```kotlin
val user = client.user(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `email` | `String?` | No |  |
| `first_name` | `String?` | No |  |
| `id` | `String?` | No |  |
| `is_active` | `Boolean?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `last_name` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `phone` | `String?` | No |  |
| `user_name` | `String?` | No |  |
| `user_role` | `Map<String, Any?>?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.user(null).load(mutableMapOf<String, Any?>("id" to "user_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.user(null).remove(mutableMapOf<String, Any?>("id" to "user_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `User` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```kotlin
val feature = mutableMapOf<String, Any?>(
    "test" to mapOf("active" to true),
)
val client = BluefinDecryptxP2peSDK(mutableMapOf<String, Any?>("feature" to feature))
```

