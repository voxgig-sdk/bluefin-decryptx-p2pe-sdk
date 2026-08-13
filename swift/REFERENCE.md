# BluefinDecryptxP2pe Swift SDK Reference

Complete API reference for the BluefinDecryptxP2pe Swift SDK.


## BluefinDecryptxP2peSDK

### Constructor

```swift
let client = BluefinDecryptxP2peSDK(options)
```

Create a new SDK client instance. `options` is a `VMap` of `Value`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `VMap` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `VMap` | Custom headers for all requests. |
| `options["feature"]` | `VMap` | Feature configuration. |
| `options["system"]` | `VMap` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```swift
let client = BluefinDecryptxP2peSDK.testSDK(nil, nil)
```


### Instance Methods

#### `Attestation(entopts)`

Create a new `Attestation` entity instance. Pass `nil` for no initial
options.

#### `Client(entopts)`

Create a new `Client` entity instance. Pass `nil` for no initial
options.

#### `CreateResult(entopts)`

Create a new `CreateResult` entity instance. Pass `nil` for no initial
options.

#### `Decryption(entopts)`

Create a new `Decryption` entity instance. Pass `nil` for no initial
options.

#### `Device(entopts)`

Create a new `Device` entity instance. Pass `nil` for no initial
options.

#### `DeviceBuild(entopts)`

Create a new `DeviceBuild` entity instance. Pass `nil` for no initial
options.

#### `DeviceCustodyDetail(entopts)`

Create a new `DeviceCustodyDetail` entity instance. Pass `nil` for no initial
options.

#### `DeviceCustodyList(entopts)`

Create a new `DeviceCustodyList` entity instance. Pass `nil` for no initial
options.

#### `DeviceList(entopts)`

Create a new `DeviceList` entity instance. Pass `nil` for no initial
options.

#### `DeviceReceiveResult(entopts)`

Create a new `DeviceReceiveResult` entity instance. Pass `nil` for no initial
options.

#### `DeviceRkiActivateResult(entopts)`

Create a new `DeviceRkiActivateResult` entity instance. Pass `nil` for no initial
options.

#### `DeviceState(entopts)`

Create a new `DeviceState` entity instance. Pass `nil` for no initial
options.

#### `DeviceType(entopts)`

Create a new `DeviceType` entity instance. Pass `nil` for no initial
options.

#### `InjectKey(entopts)`

Create a new `InjectKey` entity instance. Pass `nil` for no initial
options.

#### `Kif(entopts)`

Create a new `Kif` entity instance. Pass `nil` for no initial
options.

#### `Location(entopts)`

Create a new `Location` entity instance. Pass `nil` for no initial
options.

#### `Partner(entopts)`

Create a new `Partner` entity instance. Pass `nil` for no initial
options.

#### `Shipment(entopts)`

Create a new `Shipment` entity instance. Pass `nil` for no initial
options.

#### `Success(entopts)`

Create a new `Success` entity instance. Pass `nil` for no initial
options.

#### `Transaction(entopts)`

Create a new `Transaction` entity instance. Pass `nil` for no initial
options.

#### `UpdateResult(entopts)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial
options.

#### `User(entopts)`

Create a new `User` entity instance. Pass `nil` for no initial
options.

#### `optionsMap() -> VMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> VMap`

Make a direct HTTP request to any API endpoint. Returns a result `VMap`
with `ok`, `status`, `headers`, and `data` (or `err` on failure).
This escape hatch never throws — branch on `result.entries["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `VMap` | Path parameter values. |
| `fetchargs["query"]` | `VMap` | Query string parameters. |
| `fetchargs["headers"]` | `VMap` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `VMap`

#### `prepare(fetchargs) throws -> VMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## Attestation

```swift
let attestation = client.Attestation()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `VMap` | No |  |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `VMap` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Attestation().create(VMap([
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Attestation().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Attestation().load(VMap([("id", .string("attestation_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Attestation` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Client

```swift
let client = client.Client()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `VMap` | No |  |
| `created` | `String` | No |  |
| `directPartner` | `VMap` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `location` | `VMap` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `VMap` | No |  |
| `version` | `Int` | No |  |

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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Client().create(VMap([
    ("location", .map(VMap()))  // VMap
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Client().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Client().load(VMap([("id", .string("client_id"))]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.Client().remove(VMap([("id", .string("client_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Client` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## CreateResult

```swift
let createResult = client.CreateResult()
```

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.CreateResult().create(VMap([
    ("device_type", .string("example_device_type")),  // String
    ("serial_number", .string("example_serial_number"))  // String
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Decryption

```swift
let decryption = client.Decryption()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Decryption().create(VMap([
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Decryption` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Device

```swift
let device = client.Device()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `VMap` | Yes |  |
| `activationDate` | `String` | No |  |
| `alternateKey` | `String` | No |  |
| `auditNextDate` | `String` | No |  |
| `auditNotificationDate` | `String` | No |  |
| `client` | `VMap` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `VMap` | Yes |  |
| `deviceBuild` | `VMap` | No |  |
| `deviceState` | `VMap` | No |  |
| `deviceType` | `VMap` | No |  |
| `errorCounter` | `Int` | No |  |
| `errorLastDate` | `String` | No |  |
| `id` | `String` | No |  |
| `initializedBy` | `VMap` | Yes |  |
| `initializedDate` | `String` | No |  |
| `injectKey` | `VMap` | No |  |
| `isVirtual` | `Bool` | No |  |
| `kif` | `VMap` | No |  |
| `lastActivityDate` | `String` | No |  |
| `location` | `VMap` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `VMap` | Yes |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `partner` | `VMap` | No |  |
| `serialNumber` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Device().create(VMap([
    ("activatedBy", .map(VMap())),  // VMap
    ("createdBy", .map(VMap())),  // VMap
    ("initializedBy", .map(VMap())),  // VMap
    ("location", .map(VMap())),  // VMap
    ("modifiedBy", .map(VMap()))  // VMap
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Device().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Device().load(VMap([("id", .string("device_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Device` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceBuild

```swift
let deviceBuild = client.DeviceBuild()
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
| `id` | `Int` | No |  |
| `isActive` | `Bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `version` | `Int` | No |  |
| `whiteListingBinRanges` | `String` | No |  |
| `whiteListingUsed` | `Bool` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.DeviceBuild().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.DeviceBuild().load(VMap([("id", .string("device_build_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyDetail

```swift
let deviceCustodyDetail = client.DeviceCustodyDetail()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `VMap` | Yes |  |
| `custodian` | `VMap` | Yes |  |
| `device` | `VMap` | No |  |
| `id` | `Int` | No |  |
| `location` | `VMap` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `VMap` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `VMap` | No |  |
| `transferMethod` | `VMap` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.DeviceCustodyDetail().load(VMap([("id", .string("device_custody_detail_id")), ("device_type", .string("device_type")), ("serial_number", .string("serial_number"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceCustodyList

```swift
let deviceCustodyList = client.DeviceCustodyList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `VMap` | Yes |  |
| `custodian` | `VMap` | Yes |  |
| `device` | `VMap` | No |  |
| `id` | `Int` | No |  |
| `location` | `VMap` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `VMap` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `VMap` | No |  |
| `transferMethod` | `VMap` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.DeviceCustodyList().list(nil, nil)
print(results)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceList

```swift
let deviceList = client.DeviceList()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `[Value]` | No |  |
| `total` | `Int` | No |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.DeviceList().load(VMap([("share_partner_to", .string("share_partner_to"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceList` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceReceiveResult

```swift
let deviceReceiveResult = client.DeviceReceiveResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.DeviceReceiveResult().create(VMap([
    ("success", .bool(true))  // Bool
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceRkiActivateResult

```swift
let deviceRkiActivateResult = client.DeviceRkiActivateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | Yes |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.DeviceRkiActivateResult().create(VMap([
    ("success", .bool(true))  // Bool
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceState

```swift
let deviceState = client.DeviceState()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Int` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.DeviceState().list(nil, nil)
print(results)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceState` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## DeviceType

```swift
let deviceType = client.DeviceType()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `deviceTypeMode` | `String` | No |  |
| `hardwareVersion` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.DeviceType().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.DeviceType().load(VMap([("id", .string("device_type_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceType` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## InjectKey

```swift
let injectKey = client.InjectKey()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `isP2PE` | `Bool` | No |  |
| `keyType` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.InjectKey().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.InjectKey().load(VMap([("id", .string("inject_key_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKey` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Kif

```swift
let kif = client.Kif()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Int` | No |  |
| `name` | `String` | No |  |

### Operations

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Kif().list(nil, nil)
print(results)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Kif` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Location

```swift
let location = client.Location()
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
| `version` | `Int` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Location().create(VMap([
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Location().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Location().load(VMap([("id", .string("location_id"))]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.Location().remove(VMap([("id", .string("location_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Location` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Partner

```swift
let partner = client.Partner()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No |  |
| `clientCanOrderEquipment` | `Bool` | No |  |
| `contact` | `VMap` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `location` | `VMap` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `VMap` | No |  |
| `partnerId` | `String` | No |  |
| `reference` | `String` | No |  |
| `verificationPhrase` | `String` | No |  |
| `version` | `Int` | No |  |

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

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Partner().create(VMap([
    ("location", .map(VMap()))  // VMap
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Partner().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Partner().load(VMap([("id", .string("partner_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Partner` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Shipment

```swift
let shipment = client.Shipment()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No |  |
| `client` | `VMap` | No |  |
| `created` | `String` | No |  |
| `dateReceived` | `String` | No |  |
| `dateShipped` | `String` | No |  |
| `dcKif` | `VMap` | No |  |
| `id` | `String` | No |  |
| `items` | `[Value]` | No |  |
| `kif` | `VMap` | No |  |
| `modified` | `String` | No |  |
| `partner` | `VMap` | No |  |
| `shipmentType` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Shipment().create(VMap([
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Shipment().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Shipment().load(VMap([("id", .string("shipment_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Shipment` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Success

```swift
let success = client.Success()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Success().create(VMap([
    ("share_partner_to", .string("example_share_partner_to"))  // String
]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.Success().remove(VMap([("share_partner_to", .string("share_partner_to"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Success` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Transaction

```swift
let transaction = client.Transaction()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No |  |
| `client` | `VMap` | No |  |
| `clientRef` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `Int` | No |  |
| `deviceName` | `String` | No |  |
| `directPartner` | `VMap` | No |  |
| `encrypted` | `Int` | No |  |
| `endDate` | `String` | No |  |
| `errCode` | `String` | No |  |
| `errMessage` | `String` | No |  |
| `id` | `String` | No |  |
| `ipAddress` | `String` | No |  |
| `isVirtual` | `Bool` | No |  |
| `keyType` | `String` | No |  |
| `location` | `VMap` | Yes |  |
| `messageId` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `VMap` | No |  |
| `reference` | `String` | No |  |
| `serialNumber` | `String` | No |  |
| `startDate` | `String` | No |  |
| `success` | `Bool` | No |  |
| `transactionSource` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.Transaction().create(VMap([
    ("location", .map(VMap()))  // VMap
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.Transaction().list(nil, nil)
print(results)
```

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.Transaction().load(VMap([("id", .string("transaction_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `Transaction` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## UpdateResult

```swift
let updateResult = client.UpdateResult()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `VMap` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `kif` | `VMap` | No |  |
| `lastName` | `String` | No |  |
| `partner` | `VMap` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `VMap` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `create(reqdata, ctrl) throws -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```swift
let result = try client.UpdateResult().create(VMap([
]), nil)
```

#### `list(reqmatch, ctrl) throws -> Value`

List entities matching the given criteria. The match is optional — call `list(nil, nil)` to list all records. Returns a Value list and throws on error.

```swift
let results = try client.UpdateResult().list(nil, nil)
print(results)
```

#### `update(reqdata, ctrl) throws -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```swift
let result = try client.UpdateResult().update(VMap([
    ("id", .string("id"))
]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResult` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## User

```swift
let user = client.User()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `VMap` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `kif` | `VMap` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `VMap` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `VMap` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `load(reqmatch, ctrl) throws -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```swift
let result = try client.User().load(VMap([("id", .string("user_id"))]), nil)
```

#### `remove(reqmatch, ctrl) throws -> Value`

Remove the entity matching the given criteria. Throws on error.

```swift
let result = try client.User().remove(VMap([("id", .string("user_id"))]), nil)
```

### Common Methods

#### `data(newdata?) -> Value`

Get or set the entity data.

#### `matchv(newmatch?) -> Value`

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

```swift
let feature = VMap()
feature.entries["test"] = .map([("active", .bool(true))])
let options = VMap()
options.entries["feature"] = .map(feature)
let client = BluefinDecryptxP2peSDK(options)
```

