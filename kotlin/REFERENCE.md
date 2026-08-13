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
| `completeDate` | `String?` | No |  |
| `created` | `String?` | No |  |
| `device` | `Map<String, Any?>?` | No |  |
| `id` | `String?` | No |  |
| `name` | `String?` | No |  |
| `notes` | `String?` | No |  |

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
| `directPartner` | `Map<String, Any?>?` | No |  |
| `id` | `String?` | No |  |
| `isActive` | `Boolean?` | No |  |
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
| `activatedBy` | `Map<String, Any?>?` | Yes |  |
| `activationDate` | `String?` | No |  |
| `alternateKey` | `String?` | No |  |
| `auditNextDate` | `String?` | No |  |
| `auditNotificationDate` | `String?` | No |  |
| `client` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `createdBy` | `Map<String, Any?>?` | Yes |  |
| `deviceBuild` | `Map<String, Any?>?` | No |  |
| `deviceState` | `Map<String, Any?>?` | No |  |
| `deviceType` | `Map<String, Any?>?` | No |  |
| `errorCounter` | `Long?` | No |  |
| `errorLastDate` | `String?` | No |  |
| `id` | `String?` | No |  |
| `initializedBy` | `Map<String, Any?>?` | Yes |  |
| `initializedDate` | `String?` | No |  |
| `injectKey` | `Map<String, Any?>?` | No |  |
| `isVirtual` | `Boolean?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `lastActivityDate` | `String?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `modifiedBy` | `Map<String, Any?>?` | Yes |  |
| `name` | `String?` | No |  |
| `notes` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `serialNumber` | `String?` | No |  |
| `version` | `Long?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.device(null).create(mutableMapOf<String, Any?>(
    "activatedBy" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "createdBy" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "initializedBy" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "location" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "modifiedBy" to mapOf<String, Any?>()  // Map<String, Any?>?
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
| `appVersion` | `String?` | No |  |
| `buildNumber` | `String?` | No |  |
| `configFileName` | `String?` | No |  |
| `created` | `String?` | No |  |
| `deviceType` | `String?` | No |  |
| `firmwareVersion` | `String?` | No |  |
| `hardwareVersion` | `String?` | No |  |
| `id` | `Long?` | No |  |
| `isActive` | `Boolean?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `notes` | `String?` | No |  |
| `version` | `Long?` | No |  |
| `whiteListingBinRanges` | `String?` | No |  |
| `whiteListingUsed` | `Boolean?` | No |  |

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
| `completeDate` | `String?` | No |  |
| `created` | `String?` | No |  |
| `createdBy` | `Map<String, Any?>?` | Yes |  |
| `custodian` | `Map<String, Any?>?` | Yes |  |
| `device` | `Map<String, Any?>?` | No |  |
| `id` | `Long?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `modifiedBy` | `Map<String, Any?>?` | Yes |  |
| `notes` | `String?` | No |  |
| `status` | `Map<String, Any?>?` | No |  |
| `transferMethod` | `Map<String, Any?>?` | No |  |
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
| `completeDate` | `String?` | No |  |
| `created` | `String?` | No |  |
| `createdBy` | `Map<String, Any?>?` | Yes |  |
| `custodian` | `Map<String, Any?>?` | Yes |  |
| `device` | `Map<String, Any?>?` | No |  |
| `id` | `Long?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `modifiedBy` | `Map<String, Any?>?` | Yes |  |
| `notes` | `String?` | No |  |
| `status` | `Map<String, Any?>?` | No |  |
| `transferMethod` | `Map<String, Any?>?` | No |  |
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
| `deviceTypeMode` | `String?` | No |  |
| `hardwareVersion` | `String?` | No |  |
| `id` | `String?` | No |  |
| `isActive` | `Boolean?` | No |  |
| `manufacturer` | `String?` | No |  |
| `model` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `photoUrl` | `String?` | No |  |
| `productName` | `String?` | No |  |
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
| `isActive` | `Boolean?` | No |  |
| `isP2PE` | `Boolean?` | No |  |
| `keyType` | `String?` | No |  |
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
| `billingId` | `String?` | No |  |
| `city` | `String?` | No |  |
| `country` | `String?` | No |  |
| `created` | `String?` | No |  |
| `customReference` | `String?` | No |  |
| `id` | `String?` | No |  |
| `locationType` | `String?` | No |  |
| `mailAddress1` | `String?` | No |  |
| `mailAddress2` | `String?` | No |  |
| `mailCity` | `String?` | No |  |
| `mailCountry` | `String?` | No |  |
| `mailPostalCode` | `String?` | No |  |
| `mailStateProvince` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `nameOfBusiness` | `String?` | No |  |
| `notes` | `String?` | No |  |
| `postalCode` | `String?` | No |  |
| `stateProvince` | `String?` | No |  |
| `uniqueId` | `String?` | No |  |
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
| `billingId` | `String?` | No |  |
| `clientCanOrderEquipment` | `Boolean?` | No |  |
| `contact` | `Map<String, Any?>?` | No |  |
| `created` | `String?` | No |  |
| `id` | `String?` | No |  |
| `isActive` | `Boolean?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `modified` | `String?` | No |  |
| `name` | `String?` | No |  |
| `parent` | `Map<String, Any?>?` | No |  |
| `partnerId` | `String?` | No |  |
| `reference` | `String?` | No |  |
| `verificationPhrase` | `String?` | No |  |
| `version` | `Long?` | No |  |

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
| `dateReceived` | `String?` | No |  |
| `dateShipped` | `String?` | No |  |
| `dcKif` | `Map<String, Any?>?` | No |  |
| `id` | `String?` | No |  |
| `items` | `List<Any?>?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `modified` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `shipmentType` | `String?` | No |  |
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
| `alternateKey` | `String?` | No |  |
| `client` | `Map<String, Any?>?` | No |  |
| `clientRef` | `String?` | No |  |
| `created` | `String?` | No |  |
| `decrypted` | `Long?` | No |  |
| `deviceName` | `String?` | No |  |
| `directPartner` | `Map<String, Any?>?` | No |  |
| `encrypted` | `Long?` | No |  |
| `endDate` | `String?` | No |  |
| `errCode` | `String?` | No |  |
| `errMessage` | `String?` | No |  |
| `id` | `String?` | No |  |
| `ipAddress` | `String?` | No |  |
| `isVirtual` | `Boolean?` | No |  |
| `keyType` | `String?` | No |  |
| `location` | `Map<String, Any?>?` | Yes |  |
| `messageId` | `String?` | No |  |
| `method` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `reference` | `String?` | No |  |
| `serialNumber` | `String?` | No |  |
| `startDate` | `String?` | No |  |
| `success` | `Boolean?` | No |  |
| `transactionSource` | `String?` | No |  |

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
| `firstName` | `String?` | No |  |
| `id` | `String?` | No |  |
| `isActive` | `Boolean?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `lastName` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `phone` | `String?` | No |  |
| `userName` | `String?` | No |  |
| `userRole` | `Map<String, Any?>?` | No |  |
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
| `firstName` | `String?` | No |  |
| `id` | `String?` | No |  |
| `isActive` | `Boolean?` | No |  |
| `kif` | `Map<String, Any?>?` | No |  |
| `lastName` | `String?` | No |  |
| `modified` | `String?` | No |  |
| `partner` | `Map<String, Any?>?` | No |  |
| `phone` | `String?` | No |  |
| `userName` | `String?` | No |  |
| `userRole` | `Map<String, Any?>?` | No |  |
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

