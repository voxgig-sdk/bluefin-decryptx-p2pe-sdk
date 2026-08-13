# BluefinDecryptxP2pe Lua SDK Reference

Complete API reference for the BluefinDecryptxP2pe Lua SDK.


## BluefinDecryptxP2peSDK

### Constructor

```lua
local sdk = require("bluefin-decryptx-p2pe_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Attestation(data)`

Create a new `Attestation` entity instance. Pass `nil` for no initial data.

#### `Client(data)`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `CreateResult(data)`

Create a new `CreateResult` entity instance. Pass `nil` for no initial data.

#### `Decryption(data)`

Create a new `Decryption` entity instance. Pass `nil` for no initial data.

#### `Device(data)`

Create a new `Device` entity instance. Pass `nil` for no initial data.

#### `DeviceBuild(data)`

Create a new `DeviceBuild` entity instance. Pass `nil` for no initial data.

#### `DeviceCustodyDetail(data)`

Create a new `DeviceCustodyDetail` entity instance. Pass `nil` for no initial data.

#### `DeviceCustodyList(data)`

Create a new `DeviceCustodyList` entity instance. Pass `nil` for no initial data.

#### `DeviceList(data)`

Create a new `DeviceList` entity instance. Pass `nil` for no initial data.

#### `DeviceReceiveResult(data)`

Create a new `DeviceReceiveResult` entity instance. Pass `nil` for no initial data.

#### `DeviceRkiActivateResult(data)`

Create a new `DeviceRkiActivateResult` entity instance. Pass `nil` for no initial data.

#### `DeviceState(data)`

Create a new `DeviceState` entity instance. Pass `nil` for no initial data.

#### `DeviceType(data)`

Create a new `DeviceType` entity instance. Pass `nil` for no initial data.

#### `InjectKey(data)`

Create a new `InjectKey` entity instance. Pass `nil` for no initial data.

#### `Kif(data)`

Create a new `Kif` entity instance. Pass `nil` for no initial data.

#### `Location(data)`

Create a new `Location` entity instance. Pass `nil` for no initial data.

#### `Partner(data)`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `Shipment(data)`

Create a new `Shipment` entity instance. Pass `nil` for no initial data.

#### `Success(data)`

Create a new `Success` entity instance. Pass `nil` for no initial data.

#### `Transaction(data)`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `UpdateResult(data)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `User(data)`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## AttestationEntity

```lua
local attestation = client:Attestation(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `table` | No |  |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `table` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Attestation():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Attestation():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Attestation():load({ id = "attestation_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AttestationEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ClientEntity

```lua
local client_ = client:Client(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `table` | No |  |
| `created` | `string` | No |  |
| `directPartner` | `table` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `location` | `table` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `table` | No |  |
| `version` | `number` | No |  |

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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Client():create({
  location = --[[ table ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Client():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Client():load({ id = "client_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Client():remove({ id = "client_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ClientEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## CreateResultEntity

```lua
local create_result = client:CreateResult(nil)
```

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:CreateResult():create({
  device_type = --[[ string ]],
  serial_number = --[[ string ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `CreateResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DecryptionEntity

```lua
local decryption = client:Decryption(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Decryption():create({
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DecryptionEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceEntity

```lua
local device = client:Device(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `table` | Yes |  |
| `activationDate` | `string` | No |  |
| `alternateKey` | `string` | No |  |
| `auditNextDate` | `string` | No |  |
| `auditNotificationDate` | `string` | No |  |
| `client` | `table` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `table` | Yes |  |
| `deviceBuild` | `table` | No |  |
| `deviceState` | `table` | No |  |
| `deviceType` | `table` | No |  |
| `errorCounter` | `number` | No |  |
| `errorLastDate` | `string` | No |  |
| `id` | `string` | No |  |
| `initializedBy` | `table` | Yes |  |
| `initializedDate` | `string` | No |  |
| `injectKey` | `table` | No |  |
| `isVirtual` | `boolean` | No |  |
| `kif` | `table` | No |  |
| `lastActivityDate` | `string` | No |  |
| `location` | `table` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `table` | Yes |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `partner` | `table` | No |  |
| `serialNumber` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Device():create({
  activatedBy = --[[ table ]],
  createdBy = --[[ table ]],
  initializedBy = --[[ table ]],
  location = --[[ table ]],
  modifiedBy = --[[ table ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Device():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Device():load({ id = "device_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceBuildEntity

```lua
local device_build = client:DeviceBuild(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `string` | No |  |
| `buildNumber` | `string` | No |  |
| `configFileName` | `string` | No |  |
| `created` | `string` | No |  |
| `deviceType` | `string` | No |  |
| `firmwareVersion` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `number` | No |  |
| `isActive` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `version` | `number` | No |  |
| `whiteListingBinRanges` | `string` | No |  |
| `whiteListingUsed` | `boolean` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:DeviceBuild():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:DeviceBuild():load({ id = "device_build_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceBuildEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceCustodyDetailEntity

```lua
local device_custody_detail = client:DeviceCustodyDetail(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `table` | Yes |  |
| `custodian` | `table` | Yes |  |
| `device` | `table` | No |  |
| `id` | `number` | No |  |
| `location` | `table` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `table` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `table` | No |  |
| `transferMethod` | `table` | No |  |
| `version` | `number` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:DeviceCustodyDetail():load({ id = "device_custody_detail_id", device_type = "device_type", serial_number = "serial_number" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyDetailEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceCustodyListEntity

```lua
local device_custody_list = client:DeviceCustodyList(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `table` | Yes |  |
| `custodian` | `table` | Yes |  |
| `device` | `table` | No |  |
| `id` | `number` | No |  |
| `location` | `table` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `table` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `table` | No |  |
| `transferMethod` | `table` | No |  |
| `version` | `number` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:DeviceCustodyList():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceCustodyListEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceListEntity

```lua
local device_list = client:DeviceList(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `table` | No |  |
| `total` | `number` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:DeviceList():load({ share_partner_to = "share_partner_to" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceListEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceReceiveResultEntity

```lua
local device_receive_result = client:DeviceReceiveResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:DeviceReceiveResult():create({
  success = --[[ boolean ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceReceiveResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```lua
local device_rki_activate_result = client:DeviceRkiActivateResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:DeviceRkiActivateResult():create({
  success = --[[ boolean ]],
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceRkiActivateResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceStateEntity

```lua
local device_state = client:DeviceState(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:DeviceState():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceStateEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## DeviceTypeEntity

```lua
local device_type = client:DeviceType(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `deviceTypeMode` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:DeviceType():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:DeviceType():load({ id = "device_type_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `DeviceTypeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## InjectKeyEntity

```lua
local inject_key = client:InjectKey(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `isP2PE` | `boolean` | No |  |
| `keyType` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:InjectKey():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:InjectKey():load({ id = "inject_key_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `InjectKeyEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## KifEntity

```lua
local kif = client:Kif(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No |  |
| `name` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Kif():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `KifEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## LocationEntity

```lua
local location = client:Location(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `string` | No |  |
| `address2` | `string` | No |  |
| `billingId` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `created` | `string` | No |  |
| `customReference` | `string` | No |  |
| `id` | `string` | No |  |
| `locationType` | `string` | No |  |
| `mailAddress1` | `string` | No |  |
| `mailAddress2` | `string` | No |  |
| `mailCity` | `string` | No |  |
| `mailCountry` | `string` | No |  |
| `mailPostalCode` | `string` | No |  |
| `mailStateProvince` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `nameOfBusiness` | `string` | No |  |
| `notes` | `string` | No |  |
| `postalCode` | `string` | No |  |
| `stateProvince` | `string` | No |  |
| `uniqueId` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Location():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Location():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Location():load({ id = "location_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Location():remove({ id = "location_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `LocationEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PartnerEntity

```lua
local partner = client:Partner(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No |  |
| `clientCanOrderEquipment` | `boolean` | No |  |
| `contact` | `table` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `location` | `table` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `table` | No |  |
| `partnerId` | `string` | No |  |
| `reference` | `string` | No |  |
| `verificationPhrase` | `string` | No |  |
| `version` | `number` | No |  |

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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Partner():create({
  location = --[[ table ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Partner():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Partner():load({ id = "partner_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ShipmentEntity

```lua
local shipment = client:Shipment(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `table` | No |  |
| `created` | `string` | No |  |
| `dateReceived` | `string` | No |  |
| `dateShipped` | `string` | No |  |
| `dcKif` | `table` | No |  |
| `id` | `string` | No |  |
| `items` | `table` | No |  |
| `kif` | `table` | No |  |
| `modified` | `string` | No |  |
| `partner` | `table` | No |  |
| `shipmentType` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Shipment():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Shipment():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Shipment():load({ id = "shipment_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ShipmentEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SuccessEntity

```lua
local success = client:Success(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Success():create({
  share_partner_to = --[[ string ]],
})
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Success():remove({ share_partner_to = "share_partner_to" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SuccessEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TransactionEntity

```lua
local transaction = client:Transaction(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `string` | No |  |
| `client` | `table` | No |  |
| `clientRef` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `number` | No |  |
| `deviceName` | `string` | No |  |
| `directPartner` | `table` | No |  |
| `encrypted` | `number` | No |  |
| `endDate` | `string` | No |  |
| `errCode` | `string` | No |  |
| `errMessage` | `string` | No |  |
| `id` | `string` | No |  |
| `ipAddress` | `string` | No |  |
| `isVirtual` | `boolean` | No |  |
| `keyType` | `string` | No |  |
| `location` | `table` | Yes |  |
| `messageId` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `table` | No |  |
| `reference` | `string` | No |  |
| `serialNumber` | `string` | No |  |
| `startDate` | `string` | No |  |
| `success` | `boolean` | No |  |
| `transactionSource` | `string` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Transaction():create({
  location = --[[ table ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Transaction():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Transaction():load({ id = "transaction_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## UpdateResultEntity

```lua
local update_result = client:UpdateResult(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `table` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `kif` | `table` | No |  |
| `lastName` | `string` | No |  |
| `partner` | `table` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `table` | No |  |
| `version` | `number` | No |  |

### Operations

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:UpdateResult():create({
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:UpdateResult():list()
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:UpdateResult():update({
  id = "id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## UserEntity

```lua
local user = client:User(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `table` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `kif` | `table` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `table` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `table` | No |  |
| `version` | `number` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:User():load({ id = "user_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:User():remove({ id = "user_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `UserEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

