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
| `client` | `table` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | The date and time that the Attestation took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `device` | `table` | No | Reference to the associated Device resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `name` | `string` | No | Text describing the attestation. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `table` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `table` | No | Reference to the associated Partner. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Client account is active or disabled. |
| `location` | `table` | Yes | Reference to the associated Location resource. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `table` | No | Reference to the Client's root Partner. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `success` | `boolean` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `table` | Yes | Reference to the associated User resource. |
| `activationDate` | `string` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `table` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `table` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `table` | No | Reference to the associated Device Build resource. |
| `deviceState` | `table` | No | Reference to the associated Device State resource. |
| `deviceType` | `table` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `number` | No | The number times the Device has been in error. |
| `errorLastDate` | `string` | No | Timestamp from the last time that the Device had an error. |
| `id` | `string` | No | The Device's unique identifier. |
| `initializedBy` | `table` | Yes | Reference to the associated User resource. |
| `initializedDate` | `string` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `table` | No | Reference to the associated Device resource. |
| `isVirtual` | `boolean` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `table` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | No | Timestamp from the last time that the Device was used. |
| `location` | `table` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `table` | Yes | Reference to the associated User resource. |
| `name` | `string` | No | The Device's name. |
| `notes` | `string` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `table` | No | Reference to the associated Partner. |
| `serialNumber` | `string` | No | The Device's serial number. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `appVersion` | `string` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | No | The Build Number. |
| `configFileName` | `string` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | No | The Device Type Name. |
| `firmwareVersion` | `string` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | No | A list of hardware versions that this Device Build covers. |
| `id` | `number` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Device Builds's name. |
| `notes` | `string` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `number` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `table` | Yes | Reference to the associated User resource. |
| `custodian` | `table` | Yes | Reference to the associated User resource. |
| `device` | `table` | No | Reference to the associated Device resource. |
| `id` | `number` | No | This resource's unique identifier. |
| `location` | `table` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `table` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `table` | No | Reference to the associated Custody Status. |
| `transferMethod` | `table` | No | Reference to the associated Transfer Method. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `table` | Yes | Reference to the associated User resource. |
| `custodian` | `table` | Yes | Reference to the associated User resource. |
| `device` | `table` | No | Reference to the associated Device resource. |
| `id` | `number` | No | This resource's unique identifier. |
| `location` | `table` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `table` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `table` | No | Reference to the associated Custody Status. |
| `transferMethod` | `table` | No | Reference to the associated Transfer Method. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `data` | `table` | No | List of Devices. |
| `total` | `number` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `boolean` | Yes | Indicates if the action succeeded. |

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
| `success` | `boolean` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `number` | No | Unique identifier for this Device state. |
| `name` | `string` | No | Descriptive name for this Device state. |

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | No | The Device type. |
| `hardwareVersion` | `string` | No | The Device hardware version. |
| `id` | `string` | No | Unique idenifier. |
| `isActive` | `boolean` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | No | The Device manufacturer. |
| `model` | `string` | No | The Device model. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The DeviceType name. |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No | The Device name. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | unique idenifier |
| `isActive` | `boolean` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | No | The cipher type that the key works with. |
| `modified` | `string` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | No | Key name. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `id` | `number` | No | This resource's unique identifier. |
| `name` | `string` | No | The KIF's name. |

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
| `address1` | `string` | No | The Location's street address. |
| `address2` | `string` | No | The Location's street address. |
| `billingId` | `string` | No | \? |
| `city` | `string` | No | The Location's city. |
| `country` | `string` | No | The Location's country. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | No | A Partner specified reference for a location. |
| `id` | `string` | No | This resource's unique identifier. |
| `locationType` | `string` | No | The Location's clasification. |
| `mailAddress1` | `string` | No | The Location's street address. |
| `mailAddress2` | `string` | No | The Location's street address. |
| `mailCity` | `string` | No | The Location's city. |
| `mailCountry` | `string` | No | The Location's street address. |
| `mailPostalCode` | `string` | No | The Location's postal code. |
| `mailStateProvince` | `string` | No | The Location's street state or province. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Location's name. |
| `nameOfBusiness` | `string` | No | The name of the business at this location. |
| `notes` | `string` | No | Note for delivery driver. |
| `postalCode` | `string` | No | The Location's postal code. |
| `stateProvince` | `string` | No | The Location's street state or province. |
| `uniqueId` | `string` | No | Unique Identifier for the Location. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `table` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `table` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `table` | No | Reference to the associated Partner. |
| `partnerId` | `string` | No | The Partner's id. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `carrier` | `string` | No | The name of the courier. |
| `client` | `table` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | No | The date and time that a package is recieved. |
| `dateShipped` | `string` | No | The date and time that a package is shipped. |
| `dcKif` | `table` | No | Reference to the associated KIF resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `items` | `table` | No |  |
| `kif` | `table` | No | Reference to the associated KIF resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `table` | No | Reference to the associated Partner. |
| `shipmentType` | `string` | No | The type of shipment. |
| `tracking` | `string` | No | The courier's tracking number. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `success` | `boolean` | No | Indicates if the action was a success. |

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
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `table` | No | Reference to the associated Client resource. |
| `clientRef` | `string` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `number` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `table` | No | Reference to the associated Partner. |
| `encrypted` | `number` | No | A Transcation can process muliple encryptions. |
| `endDate` | `string` | No | Timestamp from the end of the transaction. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | No | The type of cipher used during decrytion. |
| `location` | `table` | Yes | Reference to the associated Location resource. |
| `messageId` | `string` | No | Message ID. |
| `method` | `string` | No | The decryption cypher/method. |
| `partner` | `table` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `success` | `boolean` | No | The success indicator. |
| `transactionSource` | `string` | No | The source of the Transaction. |

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
| `client` | `table` | No | Reference to the associated Client resource. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | ID of newly created resource |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `table` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `partner` | `table` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `table` | No | Reference to the associated User Role. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `client` | `table` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `table` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `table` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `table` | No | Reference to the associated User Role. |
| `version` | `number` | No | The number of times that this resource has been updated. |

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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    audit = { active = true },
    clienttrack = { active = true },
    idempotency = { active = true },
    log = { active = true },
    metrics = { active = true },
    paging = { active = true },
    ratelimit = { active = true },
    retry = { active = true },
    telemetry = { active = true },
    test = { active = true },
    timeout = { active = true },
  },
})
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

`audit`, `clienttrack`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

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

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

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

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

