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

#### `deviceCustodyListItem(entopts)`

Create a new `DeviceCustodyListItem` entity instance (returns `SdkEntity`). Pass
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

#### `virtualDevice(entopts)`

Create a new `VirtualDevice` entity instance (returns `SdkEntity`). Pass
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
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `completeDate` | `String?` | No | The date and time that the Attestation took place. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Map<String, Any?>?` | No | Reference to the associated Device resource. |
| `devices` | `List<Any?>?` | Yes |  |
| `id` | `String?` | No | This resource's unique identifier. |
| `name` | `String?` | No | Text describing the attestation. |
| `notes` | `String?` | No | Free form field that allows the Client associate notes with the Attestation. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `client` | - | - | Yes |
| `completeDate` | - | - | Yes |
| `created` | - | - | - |
| `device` | - | - | - |
| `devices` | - | - | - |
| `id` | - | - | - |
| `name` | - | - | Yes |
| `notes` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.attestation(null).create(mutableMapOf<String, Any?>(
    "devices" to listOf<Any?>()  // List<Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.attestation(null).list(mutableMapOf<String, Any?>("client" to "example"), null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `contact` | `Map<String, Any?>?` | No | Reference to the associated User resource. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `id` | `String?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `mid` | `String?` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The Client's name. |
| `partner` | `Map<String, Any?>?` | No | Reference to the Client's root Partner. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | Yes | - |
| `created` | - | - | - | - |
| `directPartner` | - | - | Yes | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.client(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.client(null).list(mutableMapOf<String, Any?>("partner" to "example"), null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

```kotlin
val result = client.client(null).load(mutableMapOf<String, Any?>("id" to "client_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String?` | No | The date and time that the Custody change took place. |
| `custodian` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `notes` | `String?` | No | Free form field that allows the Client associate notes with the Custody Change. |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.createResult(null).create(mutableMapOf<String, Any?>(
    "device_type" to "example_device_type",  // String?
    "serial_number" to "example_serial_number",  // String?
    "custodian" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
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
| `cbcVector` | `String?` | No | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `String?` | Yes | The device Type. |
| `encoding` | `String?` | No | The payload encoding |
| `encrypted` | `List<Any?>?` | Yes |  |
| `hasCcData` | `String?` | No | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `String?` | No | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `String?` | No | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `String?` | Yes | The serial number of the device. |
| `success` | `Boolean?` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.decryption(null).create(mutableMapOf<String, Any?>(
    "deviceType" to "example_deviceType",  // String?
    "encrypted" to listOf<Any?>(),  // List<Any?>?
    "serialNumber" to "example_serialNumber"  // String?
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
| `activatedBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `activationDate` | `String?` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String?` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String?` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String?` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Map<String, Any?>?` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Map<String, Any?>?` | No | Reference to the associated Device State resource. |
| `deviceType` | `Map<String, Any?>?` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `Long?` | No | The number times the Device has been in error. |
| `errorLastDate` | `String?` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String?` | No | The Device's unique identifier. |
| `initializedBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String?` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Map<String, Any?>?` | No | Reference to the associated Device resource. |
| `isVirtual` | `Boolean?` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Map<String, Any?>?` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String?` | No | Timestamp from the last time that the Device was used. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `modified` | `String?` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `name` | `String?` | No | The Device's name. |
| `notes` | `String?` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `serialNumber` | `String?` | No | The Device's serial number. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `activatedBy` | - | - | - |
| `activationDate` | - | - | - |
| `alternateKey` | - | - | - |
| `auditNextDate` | - | - | - |
| `auditNotificationDate` | - | - | - |
| `client` | - | - | - |
| `created` | - | - | - |
| `createdBy` | - | - | - |
| `deviceBuild` | - | - | - |
| `deviceState` | - | - | - |
| `deviceType` | - | - | Yes |
| `errorCounter` | - | - | - |
| `errorLastDate` | - | - | - |
| `id` | - | - | - |
| `initializedBy` | - | - | - |
| `initializedDate` | - | - | - |
| `injectKey` | - | - | - |
| `isVirtual` | - | - | - |
| `kif` | - | - | Yes |
| `lastActivityDate` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `modifiedBy` | - | - | - |
| `name` | - | - | - |
| `notes` | - | - | - |
| `partner` | - | - | - |
| `serialNumber` | - | - | Yes |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

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

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.device(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `appVersion` | `String?` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String?` | No | The Build Number. |
| `configFileName` | `String?` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String?` | No | The Device Type Name. |
| `firmwareVersion` | `String?` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String?` | No | A list of hardware versions that this Device Build covers. |
| `id` | `Long?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The Device Builds's name. |
| `notes` | `String?` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String?` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `Boolean?` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.deviceBuild(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `completeDate` | `String?` | No | The date and time that the Custody change took place. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `custodian` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `device` | `Map<String, Any?>?` | No | Reference to the associated Device resource. |
| `id` | `Long?` | No | This resource's unique identifier. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `modified` | `String?` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `notes` | `String?` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Map<String, Any?>?` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Map<String, Any?>?` | No | Reference to the associated Transfer Method. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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

## DeviceCustodyListItem

```kotlin
val deviceCustodyListItem = client.deviceCustodyListItem(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String?` | No | The date and time that the Custody change took place. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `custodian` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `device` | `Map<String, Any?>?` | No | Reference to the associated Device resource. |
| `id` | `Long?` | No | This resource's unique identifier. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `modified` | `String?` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `notes` | `String?` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Map<String, Any?>?` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Map<String, Any?>?` | No | Reference to the associated Transfer Method. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.deviceCustodyListItem(null).list(mutableMapOf<String, Any?>("device_type" to "example", "serial_number" to "example"), null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyListItem` entity instance with the same options.

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
| `serialNumber` | `String?` | Yes | The serial number of the Device that is shipped. |
| `success` | `Boolean?` | Yes | Indicates if the action succeeded. |
| `tamperLabel` | `String?` | Yes | The code that is printed the tamper label of the Device that is shipped. |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.deviceReceiveResult(null).create(mutableMapOf<String, Any?>(
    "serialNumber" to "example_serialNumber",  // String?
    "success" to true,  // Boolean?
    "tamperLabel" to "example_tamperLabel"  // String?
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
| `appVersion` | `String?` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `String?` | No | The Device Builds's name. |
| `buildNumber` | `String?` | No | The Build Number. |
| `configFile` | `String?` | No | \? |
| `firmwareVersion` | `String?` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String?` | No | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `String?` | Yes | The referenced Device's serial number. |
| `success` | `Boolean?` | Yes | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `String?` | No | \? |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.deviceRkiActivateResult(null).create(mutableMapOf<String, Any?>(
    "serialNumber" to "example_serialNumber",  // String?
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
| `id` | `Long?` | No | Unique identifier for this Device state. |
| `name` | `String?` | No | Descriptive name for this Device state. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.deviceState(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
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
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String?` | No | The Device type. |
| `hardwareVersion` | `String?` | No | The Device hardware version. |
| `id` | `String?` | No | Unique idenifier. |
| `isActive` | `Boolean?` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `String?` | No | The Device manufacturer. |
| `model` | `String?` | No | The Device model. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The DeviceType name. |
| `photoUrl` | `String?` | No |  |
| `productName` | `String?` | No | The Device name. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.deviceType(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String?` | No | unique idenifier |
| `isActive` | `Boolean?` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `Boolean?` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String?` | No | The cipher type that the key works with. |
| `modified` | `String?` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `String?` | No | Key name. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.injectKey(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `id` | `Long?` | No | This resource's unique identifier. |
| `name` | `String?` | No | The KIF's name. |

### Operations

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.kif(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
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
| `address1` | `String?` | No | The Location's street address. |
| `address2` | `String?` | No | The Location's street address. |
| `billingId` | `String?` | No | \? |
| `city` | `String?` | No | The Location's city. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `country` | `String?` | No | The Location's country. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `String?` | No | A Partner specified reference for a location. |
| `id` | `String?` | No | This resource's unique identifier. |
| `locationType` | `String?` | No | The Location's clasification. |
| `mailAddress1` | `String?` | No | The Location's street address. |
| `mailAddress2` | `String?` | No | The Location's street address. |
| `mailCity` | `String?` | No | The Location's city. |
| `mailCountry` | `String?` | No | The Location's street address. |
| `mailPostalCode` | `String?` | No | The Location's postal code. |
| `mailStateProvince` | `String?` | No | The Location's street state or province. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The Location's name. |
| `nameOfBusiness` | `String?` | No | The name of the business at this location. |
| `notes` | `String?` | No | Note for delivery driver. |
| `postalCode` | `String?` | No | The Location's postal code. |
| `stateProvince` | `String?` | No | The Location's street state or province. |
| `uniqueId` | `String?` | No | Unique Identifier for the Location. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `address1` | - | - | Yes | - |
| `address2` | - | - | - | - |
| `billingId` | - | - | - | - |
| `city` | - | - | Yes | - |
| `client` | - | - | - | - |
| `country` | - | - | Yes | - |
| `created` | - | - | - | - |
| `customReference` | - | - | - | - |
| `id` | - | - | - | - |
| `locationType` | - | - | Yes | - |
| `mailAddress1` | - | - | - | - |
| `mailAddress2` | - | - | - | - |
| `mailCity` | - | - | - | - |
| `mailCountry` | - | - | - | - |
| `mailPostalCode` | - | - | - | - |
| `mailStateProvince` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `nameOfBusiness` | - | - | - | - |
| `notes` | - | - | - | - |
| `postalCode` | - | - | - | - |
| `stateProvince` | - | - | - | - |
| `uniqueId` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.location(null).create(mutableMapOf<String, Any?>(
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.location(null).list(mutableMapOf<String, Any?>("client" to "example"), null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

```kotlin
val result = client.location(null).load(mutableMapOf<String, Any?>("id" to "location_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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
| `billingId` | `String?` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `Boolean?` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Map<String, Any?>?` | No | Reference to the associated User resource. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `modified` | `String?` | No | Last modified timestamp. |
| `name` | `String?` | No | The Partner's name. |
| `parent` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `partnerId` | `String?` | No | The Partner's id. |
| `reference` | `String?` | No | The Partner's reference string. |
| `verificationPhrase` | `String?` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `contact` | - | Yes | Yes |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | Yes |
| `parent` | - | - | Yes |
| `partnerId` | - | - | - |
| `reference` | - | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.partner(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.partner(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `carrier` | `String?` | No | The name of the courier. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String?` | No | The date and time that a package is recieved. |
| `dateShipped` | `String?` | No | The date and time that a package is shipped. |
| `dcKif` | `Map<String, Any?>?` | No | Reference to the associated KIF resource. |
| `id` | `String?` | No | This resource's unique identifier. |
| `items` | `List<Any?>?` | No |  |
| `kif` | `Map<String, Any?>?` | No | Reference to the associated KIF resource. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `modified` | `String?` | No | Last modified timestamp. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `shipmentType` | `String?` | No | The type of shipment. |
| `tracking` | `String?` | No | The courier's tracking number. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `carrier` | - | - | Yes |
| `client` | - | - | Yes |
| `created` | - | - | - |
| `dateReceived` | - | - | - |
| `dateShipped` | - | - | Yes |
| `dcKif` | - | - | - |
| `id` | - | - | - |
| `items` | - | - | Yes |
| `kif` | - | - | Yes |
| `location` | - | - | - |
| `modified` | - | - | - |
| `partner` | - | - | Yes |
| `shipmentType` | - | - | - |
| `tracking` | - | - | Yes |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.shipment(null).create(mutableMapOf<String, Any?>(
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.shipment(null).list(mutableMapOf<String, Any?>("kif" to "example"), null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `devices` | `List<Any?>?` | Yes | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `Map<String, Any?>?` | Yes | Reference to the associated Partner. |
| `success` | `Boolean?` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.success(null).create(mutableMapOf<String, Any?>(
    "share_partner_to" to "example_share_partner_to",  // String?
    "devices" to listOf<Any?>(),  // List<Any?>?
    "sharePartnerFrom" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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
| `alternateKey` | `String?` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `clientRef` | `String?` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `Long?` | No | A Transcation can process muliple decryptions. |
| `device` | `Map<String, Any?>?` | Yes | Reference to the associated Device resource. |
| `deviceName` | `String?` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `encrypted` | `Long?` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String?` | No | Timestamp from the end of the transaction. |
| `errCode` | `String?` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String?` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String?` | No | This resource's unique identifier. |
| `ipAddress` | `String?` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `Boolean?` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String?` | No | The type of cipher used during decrytion. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `messageId` | `String?` | No | Message ID. |
| `method` | `String?` | No | The decryption cypher/method. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `reference` | `String?` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String?` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String?` | No | Timestamp from the beginning of the transaction. |
| `success` | `Boolean?` | No | The success indicator. |
| `transactionSource` | `String?` | No | The source of the Transaction. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `alternateKey` | - | - | - |
| `client` | - | - | Yes |
| `clientRef` | - | - | - |
| `created` | - | - | - |
| `decrypted` | - | - | - |
| `device` | - | - | - |
| `deviceName` | - | - | - |
| `directPartner` | - | - | - |
| `encrypted` | - | - | - |
| `endDate` | - | - | - |
| `errCode` | - | - | - |
| `errMessage` | - | - | - |
| `id` | - | - | - |
| `ipAddress` | - | - | Yes |
| `isVirtual` | - | - | - |
| `keyType` | - | - | Yes |
| `location` | - | - | - |
| `messageId` | - | - | - |
| `method` | - | - | Yes |
| `partner` | - | - | Yes |
| `reference` | - | - | - |
| `serialNumber` | - | - | - |
| `startDate` | - | - | - |
| `success` | - | - | - |
| `transactionSource` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.transaction(null).create(mutableMapOf<String, Any?>(
    "device" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "location" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.transaction(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

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
| `address1` | `String?` | No | The Location's street address. |
| `address2` | `String?` | No | The Location's street address. |
| `alternateKey` | `String?` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String?` | No | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `String?` | No | \? |
| `city` | `String?` | No | The Location's city. |
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `Boolean?` | No | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `String?` | No | Client Reference property that is included in the decrypt API call. |
| `contact` | `Map<String, Any?>?` | Yes | Reference to the associated User resource. |
| `country` | `Map<String, Any?>?` | No | Reference to the associated Country. |
| `customReference` | `String?` | No | A Partner specified reference for a location. |
| `dateShipped` | `String?` | No | The date and time that a package is shipped. |
| `decrypted` | `Long?` | No | A Transcation can process muliple decryptions. |
| `device` | `Map<String, Any?>?` | No | Reference to the associated Device resource. |
| `deviceBuild` | `Map<String, Any?>?` | No | Reference to the associated Device Build resource. |
| `deviceType` | `Map<String, Any?>?` | No | Reference to the associated Device Type resource. |
| `directPartner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `email` | `String?` | Yes | The User's email address. |
| `encrypted` | `Long?` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String?` | No | Timestamp from the end of the transaction. |
| `errCode` | `String?` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String?` | No | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `String?` | Yes | The User's name. |
| `id` | `String?` | No | ID of newly created resource |
| `injectKey` | `Map<String, Any?>?` | No | Reference to the associated Device resource. |
| `ipAddress` | `String?` | No | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `Boolean?` | Yes | This property indicates if the User account is active or disabled. |
| `items` | `List<Any?>?` | No |  |
| `keyType` | `String?` | No | The type of cipher used during decrytion. |
| `kif` | `Map<String, Any?>?` | No | Reference to the associated KIF resource. |
| `lastName` | `String?` | Yes | The User's Surname. |
| `location` | `Map<String, Any?>?` | Yes | Reference to the associated Location resource. |
| `locationType` | `String?` | No | The Location's clasification. |
| `mailAddress1` | `String?` | No | The Location's street address. |
| `mailAddress2` | `String?` | No | The Location's street address. |
| `mailCity` | `String?` | No | The Location's city. |
| `mailCountry` | `String?` | No | The Location's street address. |
| `mailPostalCode` | `String?` | No | The Location's postal code. |
| `mailStateProvince` | `String?` | No | The Location's street state or province. |
| `messageId` | `String?` | No | Message ID. |
| `method` | `String?` | No | The decryption cypher/method. |
| `mid` | `String?` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String?` | No | The Client's name. |
| `nameOfBusiness` | `String?` | No | The name of the business at this location. |
| `notes` | `String?` | No | Arbitary note that can be attached to a Device entry. |
| `parent` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `partnerId` | `String?` | No | The Partner's id. |
| `phone` | `String?` | Yes | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `String?` | No | The Location's postal code. |
| `reference` | `String?` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `Boolean?` | No | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `String?` | No | The Device's serial number. |
| `startDate` | `String?` | No | Timestamp from the beginning of the transaction. |
| `stateProvince` | `String?` | No | The Location's street state or province. |
| `success` | `Boolean?` | No | The success indicator. |
| `tracking` | `String?` | No | The courier's tracking number. |
| `uniqueId` | `String?` | No | Unique Identifier for the Location. |
| `userName` | `String?` | Yes | The User's unique username. |
| `userRole` | `Map<String, Any?>?` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String?` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | list | create | update |
| --- | --- | --- | --- |
| `address1` | - | - | - |
| `address2` | - | - | - |
| `alternateKey` | - | - | - |
| `auditNextDate` | - | - | - |
| `billingId` | - | - | - |
| `city` | - | - | - |
| `client` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `clientRef` | - | - | - |
| `contact` | - | - | - |
| `country` | - | - | - |
| `customReference` | - | - | - |
| `dateShipped` | - | - | - |
| `decrypted` | - | - | - |
| `device` | - | - | - |
| `deviceBuild` | - | - | - |
| `deviceType` | - | - | - |
| `directPartner` | - | - | - |
| `email` | Yes | - | Yes |
| `encrypted` | - | - | - |
| `endDate` | - | - | - |
| `errCode` | - | - | - |
| `errMessage` | - | - | - |
| `firstName` | Yes | - | Yes |
| `id` | - | - | - |
| `injectKey` | - | - | - |
| `ipAddress` | - | - | - |
| `isActive` | Yes | - | Yes |
| `items` | - | - | - |
| `keyType` | - | - | - |
| `kif` | - | - | - |
| `lastName` | Yes | - | Yes |
| `location` | - | - | - |
| `locationType` | - | - | - |
| `mailAddress1` | - | - | - |
| `mailAddress2` | - | - | - |
| `mailCity` | - | - | - |
| `mailCountry` | - | - | - |
| `mailPostalCode` | - | - | - |
| `mailStateProvince` | - | - | - |
| `messageId` | - | - | - |
| `method` | - | - | - |
| `mid` | - | - | - |
| `name` | - | - | - |
| `nameOfBusiness` | - | - | - |
| `notes` | - | - | - |
| `parent` | - | - | - |
| `partner` | - | - | - |
| `partnerId` | - | - | - |
| `phone` | Yes | - | Yes |
| `postalCode` | - | - | - |
| `reference` | - | - | - |
| `sendWelcomeEmail` | - | - | - |
| `serialNumber` | - | - | - |
| `startDate` | - | - | - |
| `stateProvince` | - | - | - |
| `success` | - | - | - |
| `tracking` | - | - | - |
| `uniqueId` | - | - | - |
| `userName` | Yes | - | Yes |
| `userRole` | Yes | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity and raises on error.

```kotlin
val result = client.updateResult(null).create(mutableMapOf<String, Any?>(
    "contact" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "email" to "example_email",  // String?
    "firstName" to "example_firstName",  // String?
    "isActive" to true,  // Boolean?
    "lastName" to "example_lastName",  // String?
    "location" to mapOf<String, Any?>(),  // Map<String, Any?>?
    "phone" to "example_phone",  // String?
    "userName" to "example_userName",  // String?
    "userRole" to mapOf<String, Any?>()  // Map<String, Any?>?
), null)
```

#### `list(reqmatch, ctrl) -> Any?`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns a list of entities, one per record, and raises on error.

```kotlin
val results = client.updateResult(null).list(null, null) as List<*>
for (item in results) {
    println((item as SdkEntity).data())
}
```

#### `update(reqdata, ctrl) -> Any?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity and raises on error.

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
| `client` | `Map<String, Any?>?` | No | Reference to the associated Client resource. |
| `created` | `String?` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String?` | No | The User's email address. |
| `firstName` | `String?` | No | The User's name. |
| `id` | `String?` | No | This resource's unique identifier. |
| `isActive` | `Boolean?` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Map<String, Any?>?` | No | Reference to the associated KIF resource. |
| `lastName` | `String?` | No | The User's Surname. |
| `modified` | `String?` | No | Last modified timestamp. |
| `partner` | `Map<String, Any?>?` | No | Reference to the associated Partner. |
| `phone` | `String?` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String?` | No | The User's unique username. |
| `userRole` | `Map<String, Any?>?` | No | Reference to the associated User Role. |
| `version` | `Long?` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

```kotlin
val result = client.user(null).load(mutableMapOf<String, Any?>("id" to "user_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Returns the entity, marked as deleted, and raises on error.

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

## VirtualDevice

```kotlin
val virtualDevice = client.virtualDevice(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<Any?>?` | No | List of Devices. |
| `id` | `String?` | No |  |
| `total` | `Long?` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity, whose record `data()` reads, and raises on error.

```kotlin
val result = client.virtualDevice(null).load(mutableMapOf<String, Any?>("id" to "virtual_device_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `VirtualDevice` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `audit` | 0.0.1 | Audit trail |
| `clienttrack` | 0.0.1 | Client tracking |
| `debug` | 0.0.1 | Debug capture |
| `idempotency` | 0.0.1 | Idempotency |
| `log` | 0.0.1 | Logging |
| `metrics` | 0.0.1 | Metrics |
| `paging` | 0.0.1 | Paging |
| `ratelimit` | 0.0.1 | Rate limiting |
| `retry` | 0.0.1 | Retry |
| `telemetry` | 0.0.1 | Telemetry |
| `test` | 0.0.1 | Test transport |
| `timeout` | 0.0.1 | Timeout |


Features are activated via the `feature` option:

```kotlin
val feature = mutableMapOf<String, Any?>(
    "audit" to mapOf("active" to true),
    "clienttrack" to mapOf("active" to true),
    "debug" to mapOf("active" to true),
    "idempotency" to mapOf("active" to true),
    "log" to mapOf("active" to true),
    "metrics" to mapOf("active" to true),
    "paging" to mapOf("active" to true),
    "ratelimit" to mapOf("active" to true),
    "retry" to mapOf("active" to true),
    "telemetry" to mapOf("active" to true),
    "test" to mapOf("active" to true),
    "timeout" to mapOf("active" to true),
)
val client = BluefinDecryptxP2peSDK(mutableMapOf<String, Any?>("feature" to feature))
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `debug`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Audit trail.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

| Option | Type |
|---|---|
| `now` | function |
| `sink` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client tracking.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

| Option | Type |
|---|---|
| `clientName` | string |
| `headers` | map |
| `idgen` | function |
| `sessionId` | string |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `debug`

Debug capture.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

| Option | Type |
|---|---|
| `now` | function |
| `onEntry` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.debug.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

| Option | Type |
|---|---|
| `keygen` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

| Option | Type |
|---|---|
| `level` | string |
| `logger` | any |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Metrics.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Paging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

| Option | Type |
|---|---|
| `limit` | number |
| `ops` | list |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Rate limiting.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Retry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Telemetry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `exporter` | function |
| `headers` | map |
| `idgen` | function |
| `now` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

Test transport.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Timeout.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `now` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

