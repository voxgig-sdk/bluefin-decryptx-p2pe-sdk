# BluefinDecryptxP2pe Java SDK Reference

Complete API reference for the BluefinDecryptxP2pe Java SDK.


## BluefinDecryptxP2peSDK

### Constructor

```java
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```

Create a new SDK client instance. `options` is a `Map<String, Object>`.

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

```java
BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(null, null);
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
`Map<String, Object>` with `ok`, `status`, `headers`, and `data` (or
`err` on failure). This escape hatch never raises — branch on
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

**Returns:** `Map<String, Object>`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```java
SdkEntity attestation = client.attestation(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Object>` | No |  |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `Map<String, Object>` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.attestation(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.attestation(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.attestation(null).load(Map.of("id", "attestation_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Attestation` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Client

```java
SdkEntity client = client.client(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `directPartner` | `Map<String, Object>` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Boolean` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

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

```java
Object result = client.client(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.client(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.client(null).load(Map.of("id", "client_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.client(null).remove(Map.of("id", "client_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## CreateResult

```java
SdkEntity createResult = client.createResult(null);
```

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.createResult(null).create(Map.of(
    "device_type", "example_device_type",  // String
    "serial_number", "example_serial_number"  // String
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Decryption

```java
SdkEntity decryption = client.decryption(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.decryption(null).create(Map.of(
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Decryption` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Device

```java
SdkEntity device = client.device(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `Map<String, Object>` | Yes |  |
| `activationDate` | `String` | No |  |
| `alternateKey` | `String` | No |  |
| `auditNextDate` | `String` | No |  |
| `auditNotificationDate` | `String` | No |  |
| `client` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `Map<String, Object>` | Yes |  |
| `deviceBuild` | `Map<String, Object>` | No |  |
| `deviceState` | `Map<String, Object>` | No |  |
| `deviceType` | `Map<String, Object>` | No |  |
| `errorCounter` | `Long` | No |  |
| `errorLastDate` | `String` | No |  |
| `id` | `String` | No |  |
| `initializedBy` | `Map<String, Object>` | Yes |  |
| `initializedDate` | `String` | No |  |
| `injectKey` | `Map<String, Object>` | No |  |
| `isVirtual` | `Boolean` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `lastActivityDate` | `String` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `Map<String, Object>` | Yes |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `serialNumber` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.device(null).create(Map.of(
    "activatedBy", Map.of(),  // Map<String, Object>
    "createdBy", Map.of(),  // Map<String, Object>
    "initializedBy", Map.of(),  // Map<String, Object>
    "location", Map.of(),  // Map<String, Object>
    "modifiedBy", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.device(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.device(null).load(Map.of("id", "device_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Device` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceBuild

```java
SdkEntity deviceBuild = client.deviceBuild(null);
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
| `id` | `Long` | No |  |
| `isActive` | `Boolean` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `version` | `Long` | No |  |
| `whiteListingBinRanges` | `String` | No |  |
| `whiteListingUsed` | `Boolean` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceBuild(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceBuild(null).load(Map.of("id", "device_build_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyDetail

```java
SdkEntity deviceCustodyDetail = client.deviceCustodyDetail(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `Map<String, Object>` | Yes |  |
| `custodian` | `Map<String, Object>` | Yes |  |
| `device` | `Map<String, Object>` | No |  |
| `id` | `Long` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `Map<String, Object>` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `Map<String, Object>` | No |  |
| `transferMethod` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceCustodyDetail(null).load(Map.of("id", "device_custody_detail_id", "device_type", "device_type", "serial_number", "serial_number"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyList

```java
SdkEntity deviceCustodyList = client.deviceCustodyList(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `Map<String, Object>` | Yes |  |
| `custodian` | `Map<String, Object>` | Yes |  |
| `device` | `Map<String, Object>` | No |  |
| `id` | `Long` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `Map<String, Object>` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `Map<String, Object>` | No |  |
| `transferMethod` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceCustodyList(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceList

```java
SdkEntity deviceList = client.deviceList(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<Object>` | No |  |
| `total` | `Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceList(null).load(Map.of("share_partner_to", "share_partner_to"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceReceiveResult

```java
SdkEntity deviceReceiveResult = client.deviceReceiveResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.deviceReceiveResult(null).create(Map.of(
    "success", true  // Boolean
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceRkiActivateResult

```java
SdkEntity deviceRkiActivateResult = client.deviceRkiActivateResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.deviceRkiActivateResult(null).create(Map.of(
    "success", true  // Boolean
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceState

```java
SdkEntity deviceState = client.deviceState(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceState(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceState` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceType

```java
SdkEntity deviceType = client.deviceType(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `deviceTypeMode` | `String` | No |  |
| `hardwareVersion` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Boolean` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.deviceType(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.deviceType(null).load(Map.of("id", "device_type_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceType` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## InjectKey

```java
SdkEntity injectKey = client.injectKey(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Boolean` | No |  |
| `isP2PE` | `Boolean` | No |  |
| `keyType` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.injectKey(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.injectKey(null).load(Map.of("id", "inject_key_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Kif

```java
SdkEntity kif = client.kif(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Long` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.kif(null).list(null, null);
System.out.println(results);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Kif` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Location

```java
SdkEntity location = client.location(null);
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
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.location(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.location(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.location(null).load(Map.of("id", "location_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.location(null).remove(Map.of("id", "location_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Location` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Partner

```java
SdkEntity partner = client.partner(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No |  |
| `clientCanOrderEquipment` | `Boolean` | No |  |
| `contact` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Boolean` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Map<String, Object>` | No |  |
| `partnerId` | `String` | No |  |
| `reference` | `String` | No |  |
| `verificationPhrase` | `String` | No |  |
| `version` | `Long` | No |  |

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

```java
Object result = client.partner(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.partner(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.partner(null).load(Map.of("id", "partner_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Shipment

```java
SdkEntity shipment = client.shipment(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No |  |
| `client` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `dateReceived` | `String` | No |  |
| `dateShipped` | `String` | No |  |
| `dcKif` | `Map<String, Object>` | No |  |
| `id` | `String` | No |  |
| `items` | `List<Object>` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `shipmentType` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.shipment(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.shipment(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.shipment(null).load(Map.of("id", "shipment_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Shipment` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Success

```java
SdkEntity success = client.success(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.success(null).create(Map.of(
    "share_partner_to", "example_share_partner_to"  // String
), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.success(null).remove(Map.of("share_partner_to", "share_partner_to"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Success` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Transaction

```java
SdkEntity transaction = client.transaction(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No |  |
| `client` | `Map<String, Object>` | No |  |
| `clientRef` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `Long` | No |  |
| `deviceName` | `String` | No |  |
| `directPartner` | `Map<String, Object>` | No |  |
| `encrypted` | `Long` | No |  |
| `endDate` | `String` | No |  |
| `errCode` | `String` | No |  |
| `errMessage` | `String` | No |  |
| `id` | `String` | No |  |
| `ipAddress` | `String` | No |  |
| `isVirtual` | `Boolean` | No |  |
| `keyType` | `String` | No |  |
| `location` | `Map<String, Object>` | Yes |  |
| `messageId` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `reference` | `String` | No |  |
| `serialNumber` | `String` | No |  |
| `startDate` | `String` | No |  |
| `success` | `Boolean` | No |  |
| `transactionSource` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.transaction(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.transaction(null).list(null, null);
System.out.println(results);
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.transaction(null).load(Map.of("id", "transaction_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## UpdateResult

```java
SdkEntity updateResult = client.updateResult(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Object>` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Boolean` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `lastName` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```java
Object result = client.updateResult(null).create(Map.of(
), null);
```

#### `list(reqmatch, ctrl) -> Object`

List entities matching the given criteria. The match is optional — call `list(null, null)` to list all records. Returns an aggregate list and raises on error.

```java
Object results = client.updateResult(null).list(null, null);
System.out.println(results);
```

#### `update(reqdata, ctrl) -> Object`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```java
Object result = client.updateResult(null).update(Map.of(
    "id", "id"
), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## User

```java
SdkEntity user = client.user(null);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Map<String, Object>` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Boolean` | No |  |
| `kif` | `Map<String, Object>` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Map<String, Object>` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `Map<String, Object>` | No |  |
| `version` | `Long` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```java
Object result = client.user(null).load(Map.of("id", "user_id"), null);
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```java
Object result = client.user(null).remove(Map.of("id", "user_id"), null);
```

### Common Methods

#### `data(newdata...) -> Object`

Get or set the entity data.

#### `match(newmatch...) -> Object`

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

```java
Map<String, Object> feature = new java.util.LinkedHashMap<>();
feature.put("test", Map.of("active", true));
Map<String, Object> options = new java.util.LinkedHashMap<>();
options.put("feature", feature);
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```

