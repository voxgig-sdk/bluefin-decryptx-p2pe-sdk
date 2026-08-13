# BluefinDecryptxP2pe Scala SDK Reference

Complete API reference for the BluefinDecryptxP2pe Scala SDK.


## BluefinDecryptxP2peSDK

### Constructor

```scala
val client = new BluefinDecryptxP2peSDK(options)
```

Create a new SDK client instance. `options` is a `java.util.Map[String, Object]`.

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

```scala
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

#### `optionsMap() -> Map`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Map`

Make a direct HTTP request to any API endpoint. Returns a result
`java.util.Map[String, Object]` with `ok`, `status`, `headers`, and
`data` (or `err` on failure). This escape hatch never raises — branch on
`result.get("ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Object` | Request body (maps are JSON-serialized). |

**Returns:** `java.util.Map[String, Object]`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```scala
val attestation = client.attestation(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | No |  |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `java.util.Map[String, Object]` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.attestation(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.attestation(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.attestation(null).load(java.util.Map.of("id", "attestation_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Attestation` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Client

```scala
val client = client.client(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No |  |
| `directPartner` | `java.util.Map[String, Object]` | No |  |
| `id` | `String` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `location` | `java.util.Map[String, Object]` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `java.util.Map[String, Object]` | No |  |
| `version` | `java.lang.Long` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.client(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.client(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.client(null).load(java.util.Map.of("id", "client_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.client(null).remove(java.util.Map.of("id", "client_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## CreateResult

```scala
val createResult = client.createResult(null)
```

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.createResult(null).create(java.util.Map.of(
    "device_type", "example_device_type",  // String
    "serial_number", "example_serial_number"  // String
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Decryption

```scala
val decryption = client.decryption(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `java.lang.Boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.decryption(null).create(java.util.Map.of(
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Decryption` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Device

```scala
val device = client.device(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `java.util.Map[String, Object]` | Yes |  |
| `activationDate` | `String` | No |  |
| `alternateKey` | `String` | No |  |
| `auditNextDate` | `String` | No |  |
| `auditNotificationDate` | `String` | No |  |
| `client` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `java.util.Map[String, Object]` | Yes |  |
| `deviceBuild` | `java.util.Map[String, Object]` | No |  |
| `deviceState` | `java.util.Map[String, Object]` | No |  |
| `deviceType` | `java.util.Map[String, Object]` | No |  |
| `errorCounter` | `java.lang.Long` | No |  |
| `errorLastDate` | `String` | No |  |
| `id` | `String` | No |  |
| `initializedBy` | `java.util.Map[String, Object]` | Yes |  |
| `initializedDate` | `String` | No |  |
| `injectKey` | `java.util.Map[String, Object]` | No |  |
| `isVirtual` | `java.lang.Boolean` | No |  |
| `kif` | `java.util.Map[String, Object]` | No |  |
| `lastActivityDate` | `String` | No |  |
| `location` | `java.util.Map[String, Object]` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `java.util.Map[String, Object]` | Yes |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `partner` | `java.util.Map[String, Object]` | No |  |
| `serialNumber` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.device(null).create(java.util.Map.of(
    "activatedBy", java.util.Map.of(),  // java.util.Map[String, Object]
    "createdBy", java.util.Map.of(),  // java.util.Map[String, Object]
    "initializedBy", java.util.Map.of(),  // java.util.Map[String, Object]
    "location", java.util.Map.of(),  // java.util.Map[String, Object]
    "modifiedBy", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.device(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.device(null).load(java.util.Map.of("id", "device_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Device` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceBuild

```scala
val deviceBuild = client.deviceBuild(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `String` | No |  |
| `buildNumber` | `String` | No |  |
| `configFileName` | `String` | No |  |
| `created` | `String` | No |  |
| `deviceType` | `String` | No |  |
| `firmwareVersion` | `String` | No |  |
| `hardwareVersion` | `String` | No |  |
| `id` | `java.lang.Long` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |
| `whiteListingBinRanges` | `String` | No |  |
| `whiteListingUsed` | `java.lang.Boolean` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.deviceBuild(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.deviceBuild(null).load(java.util.Map.of("id", "device_build_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyDetail

```scala
val deviceCustodyDetail = client.deviceCustodyDetail(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `java.util.Map[String, Object]` | Yes |  |
| `custodian` | `java.util.Map[String, Object]` | Yes |  |
| `device` | `java.util.Map[String, Object]` | No |  |
| `id` | `java.lang.Long` | No |  |
| `location` | `java.util.Map[String, Object]` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `java.util.Map[String, Object]` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `java.util.Map[String, Object]` | No |  |
| `transferMethod` | `java.util.Map[String, Object]` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.deviceCustodyDetail(null).load(java.util.Map.of("id", "device_custody_detail_id", "device_type", "device_type", "serial_number", "serial_number"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyList

```scala
val deviceCustodyList = client.deviceCustodyList(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `java.util.Map[String, Object]` | Yes |  |
| `custodian` | `java.util.Map[String, Object]` | Yes |  |
| `device` | `java.util.Map[String, Object]` | No |  |
| `id` | `java.lang.Long` | No |  |
| `location` | `java.util.Map[String, Object]` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `java.util.Map[String, Object]` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `java.util.Map[String, Object]` | No |  |
| `transferMethod` | `java.util.Map[String, Object]` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.deviceCustodyList(null).list(null, null)
println(results)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceList

```scala
val deviceList = client.deviceList(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `java.util.List[Object]` | No |  |
| `total` | `java.lang.Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.deviceList(null).load(java.util.Map.of("share_partner_to", "share_partner_to"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceReceiveResult

```scala
val deviceReceiveResult = client.deviceReceiveResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `java.lang.Boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.deviceReceiveResult(null).create(java.util.Map.of(
    "success", true  // java.lang.Boolean
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceRkiActivateResult

```scala
val deviceRkiActivateResult = client.deviceRkiActivateResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `java.lang.Boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.deviceRkiActivateResult(null).create(java.util.Map.of(
    "success", true  // java.lang.Boolean
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceState

```scala
val deviceState = client.deviceState(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `java.lang.Long` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.deviceState(null).list(null, null)
println(results)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceState` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceType

```scala
val deviceType = client.deviceType(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `deviceTypeMode` | `String` | No |  |
| `hardwareVersion` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.deviceType(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.deviceType(null).load(java.util.Map.of("id", "device_type_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceType` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## InjectKey

```scala
val injectKey = client.injectKey(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `isP2PE` | `java.lang.Boolean` | No |  |
| `keyType` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.injectKey(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.injectKey(null).load(java.util.Map.of("id", "inject_key_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Kif

```scala
val kif = client.kif(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `java.lang.Long` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.kif(null).list(null, null)
println(results)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Kif` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Location

```scala
val location = client.location(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String` | No |  |
| `address2` | `String` | No |  |
| `billingId` | `String` | No |  |
| `city` | `String` | No |  |
| `country` | `String` | No |  |
| `created` | `String` | No |  |
| `customReference` | `String` | No |  |
| `id` | `String` | No |  |
| `locationType` | `String` | No |  |
| `mailAddress1` | `String` | No |  |
| `mailAddress2` | `String` | No |  |
| `mailCity` | `String` | No |  |
| `mailCountry` | `String` | No |  |
| `mailPostalCode` | `String` | No |  |
| `mailStateProvince` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `nameOfBusiness` | `String` | No |  |
| `notes` | `String` | No |  |
| `postalCode` | `String` | No |  |
| `stateProvince` | `String` | No |  |
| `uniqueId` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.location(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.location(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.location(null).load(java.util.Map.of("id", "location_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.location(null).remove(java.util.Map.of("id", "location_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Location` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Partner

```scala
val partner = client.partner(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No |  |
| `clientCanOrderEquipment` | `java.lang.Boolean` | No |  |
| `contact` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `location` | `java.util.Map[String, Object]` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `java.util.Map[String, Object]` | No |  |
| `partnerId` | `String` | No |  |
| `reference` | `String` | No |  |
| `verificationPhrase` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |

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

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.partner(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.partner(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.partner(null).load(java.util.Map.of("id", "partner_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Shipment

```scala
val shipment = client.shipment(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No |  |
| `client` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No |  |
| `dateReceived` | `String` | No |  |
| `dateShipped` | `String` | No |  |
| `dcKif` | `java.util.Map[String, Object]` | No |  |
| `id` | `String` | No |  |
| `items` | `java.util.List[Object]` | No |  |
| `kif` | `java.util.Map[String, Object]` | No |  |
| `modified` | `String` | No |  |
| `partner` | `java.util.Map[String, Object]` | No |  |
| `shipmentType` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.shipment(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.shipment(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.shipment(null).load(java.util.Map.of("id", "shipment_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Shipment` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Success

```scala
val success = client.success(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `java.lang.Boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.success(null).create(java.util.Map.of(
    "share_partner_to", "example_share_partner_to"  // String
), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.success(null).remove(java.util.Map.of("share_partner_to", "share_partner_to"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Success` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Transaction

```scala
val transaction = client.transaction(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No |  |
| `client` | `java.util.Map[String, Object]` | No |  |
| `clientRef` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `java.lang.Long` | No |  |
| `deviceName` | `String` | No |  |
| `directPartner` | `java.util.Map[String, Object]` | No |  |
| `encrypted` | `java.lang.Long` | No |  |
| `endDate` | `String` | No |  |
| `errCode` | `String` | No |  |
| `errMessage` | `String` | No |  |
| `id` | `String` | No |  |
| `ipAddress` | `String` | No |  |
| `isVirtual` | `java.lang.Boolean` | No |  |
| `keyType` | `String` | No |  |
| `location` | `java.util.Map[String, Object]` | Yes |  |
| `messageId` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `java.util.Map[String, Object]` | No |  |
| `reference` | `String` | No |  |
| `serialNumber` | `String` | No |  |
| `startDate` | `String` | No |  |
| `success` | `java.lang.Boolean` | No |  |
| `transactionSource` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.transaction(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.transaction(null).list(null, null)
println(results)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.transaction(null).load(java.util.Map.of("id", "transaction_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## UpdateResult

```scala
val updateResult = client.updateResult(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `kif` | `java.util.Map[String, Object]` | No |  |
| `lastName` | `String` | No |  |
| `partner` | `java.util.Map[String, Object]` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `java.util.Map[String, Object]` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.updateResult(null).create(java.util.Map.of(
), null)
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```scala
val results = client.updateResult(null).list(null, null)
println(results)
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```scala
val result = client.updateResult(null).update(java.util.Map.of(
    "id", "id"
), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## User

```scala
val user = client.user(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `java.lang.Boolean` | No |  |
| `kif` | `java.util.Map[String, Object]` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `java.util.Map[String, Object]` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `java.util.Map[String, Object]` | No |  |
| `version` | `java.lang.Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.user(null).load(java.util.Map.of("id", "user_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.user(null).remove(java.util.Map.of("id", "user_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `User` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```scala
val feature = new java.util.LinkedHashMap[String, Object]()
feature.put("test", java.util.Map.of("active", true))
val options = new java.util.LinkedHashMap[String, Object]()
options.put("feature", feature)
val client = new BluefinDecryptxP2peSDK(options)
```

