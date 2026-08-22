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
| `client` | `Map<String, Object>` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | The date and time that the Attestation took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Map<String, Object>` | No | Reference to the associated Device resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `name` | `String` | No | Text describing the attestation. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `Map<String, Object>` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Map<String, Object>` | Yes | Reference to the associated Location resource. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `Map<String, Object>` | No | Reference to the Client's root Partner. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `success` | `Boolean` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `activationDate` | `String` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Map<String, Object>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Map<String, Object>` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Map<String, Object>` | No | Reference to the associated Device State resource. |
| `deviceType` | `Map<String, Object>` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `Long` | No | The number times the Device has been in error. |
| `errorLastDate` | `String` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String` | No | The Device's unique identifier. |
| `initializedBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Map<String, Object>` | No | Reference to the associated Device resource. |
| `isVirtual` | `Boolean` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Map<String, Object>` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | No | Timestamp from the last time that the Device was used. |
| `location` | `Map<String, Object>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `name` | `String` | No | The Device's name. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `serialNumber` | `String` | No | The Device's serial number. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `appVersion` | `String` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String` | No | The Build Number. |
| `configFileName` | `String` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String` | No | The Device Type Name. |
| `firmwareVersion` | `String` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | No | A list of hardware versions that this Device Build covers. |
| `id` | `Long` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Device Builds's name. |
| `notes` | `String` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `Long` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `Boolean` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `custodian` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `device` | `Map<String, Object>` | No | Reference to the associated Device resource. |
| `id` | `Long` | No | This resource's unique identifier. |
| `location` | `Map<String, Object>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Map<String, Object>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Map<String, Object>` | No | Reference to the associated Transfer Method. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `custodian` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `device` | `Map<String, Object>` | No | Reference to the associated Device resource. |
| `id` | `Long` | No | This resource's unique identifier. |
| `location` | `Map<String, Object>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Map<String, Object>` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Map<String, Object>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Map<String, Object>` | No | Reference to the associated Transfer Method. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `data` | `List<Object>` | No | List of Devices. |
| `total` | `Long` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `Boolean` | Yes | Indicates if the action succeeded. |

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
| `success` | `Boolean` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `Long` | No | Unique identifier for this Device state. |
| `name` | `String` | No | Descriptive name for this Device state. |

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
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | No | The Device type. |
| `hardwareVersion` | `String` | No | The Device hardware version. |
| `id` | `String` | No | Unique idenifier. |
| `isActive` | `Boolean` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | No | The Device manufacturer. |
| `model` | `String` | No | The Device model. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The DeviceType name. |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No | The Device name. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | unique idenifier |
| `isActive` | `Boolean` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `Boolean` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | No | The cipher type that the key works with. |
| `modified` | `String` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | No | Key name. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `id` | `Long` | No | This resource's unique identifier. |
| `name` | `String` | No | The KIF's name. |

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
| `address1` | `String` | No | The Location's street address. |
| `address2` | `String` | No | The Location's street address. |
| `billingId` | `String` | No | \? |
| `city` | `String` | No | The Location's city. |
| `country` | `String` | No | The Location's country. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `String` | No | A Partner specified reference for a location. |
| `id` | `String` | No | This resource's unique identifier. |
| `locationType` | `String` | No | The Location's clasification. |
| `mailAddress1` | `String` | No | The Location's street address. |
| `mailAddress2` | `String` | No | The Location's street address. |
| `mailCity` | `String` | No | The Location's city. |
| `mailCountry` | `String` | No | The Location's street address. |
| `mailPostalCode` | `String` | No | The Location's postal code. |
| `mailStateProvince` | `String` | No | The Location's street state or province. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Location's name. |
| `nameOfBusiness` | `String` | No | The name of the business at this location. |
| `notes` | `String` | No | Note for delivery driver. |
| `postalCode` | `String` | No | The Location's postal code. |
| `stateProvince` | `String` | No | The Location's street state or province. |
| `uniqueId` | `String` | No | Unique Identifier for the Location. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `billingId` | `String` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `Boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Map<String, Object>` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Map<String, Object>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `carrier` | `String` | No | The name of the courier. |
| `client` | `Map<String, Object>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | No | The date and time that a package is recieved. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `dcKif` | `Map<String, Object>` | No | Reference to the associated KIF resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `items` | `List<Object>` | No |  |
| `kif` | `Map<String, Object>` | No | Reference to the associated KIF resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `shipmentType` | `String` | No | The type of shipment. |
| `tracking` | `String` | No | The courier's tracking number. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `success` | `Boolean` | No | Indicates if the action was a success. |

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
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Map<String, Object>` | No | Reference to the associated Client resource. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `Long` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `String` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `encrypted` | `Long` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `Boolean` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `location` | `Map<String, Object>` | Yes | Reference to the associated Location resource. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `partner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `success` | `Boolean` | No | The success indicator. |
| `transactionSource` | `String` | No | The source of the Transaction. |

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
| `client` | `Map<String, Object>` | No | Reference to the associated Client resource. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | ID of newly created resource |
| `isActive` | `Boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Map<String, Object>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `partner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Map<String, Object>` | No | Reference to the associated User Role. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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
| `client` | `Map<String, Object>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Map<String, Object>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Map<String, Object>` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Map<String, Object>` | No | Reference to the associated User Role. |
| `version` | `Long` | No | The number of times that this resource has been updated. |

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

