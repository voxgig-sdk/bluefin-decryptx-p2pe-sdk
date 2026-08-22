# BluefinDecryptxP2pe Ruby SDK Reference

Complete API reference for the BluefinDecryptxP2pe Ruby SDK.


## BluefinDecryptxP2peSDK

### Constructor

```ruby
require_relative 'BluefinDecryptxP2pe_sdk'

client = BluefinDecryptxP2peSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = BluefinDecryptxP2peSDK.test
```


### Instance Methods

#### `Attestation(data = nil)`

Create a new `Attestation` entity instance. Pass `nil` for no initial data.

#### `Client(data = nil)`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `CreateResult(data = nil)`

Create a new `CreateResult` entity instance. Pass `nil` for no initial data.

#### `Decryption(data = nil)`

Create a new `Decryption` entity instance. Pass `nil` for no initial data.

#### `Device(data = nil)`

Create a new `Device` entity instance. Pass `nil` for no initial data.

#### `DeviceBuild(data = nil)`

Create a new `DeviceBuild` entity instance. Pass `nil` for no initial data.

#### `DeviceCustodyDetail(data = nil)`

Create a new `DeviceCustodyDetail` entity instance. Pass `nil` for no initial data.

#### `DeviceCustodyList(data = nil)`

Create a new `DeviceCustodyList` entity instance. Pass `nil` for no initial data.

#### `DeviceList(data = nil)`

Create a new `DeviceList` entity instance. Pass `nil` for no initial data.

#### `DeviceReceiveResult(data = nil)`

Create a new `DeviceReceiveResult` entity instance. Pass `nil` for no initial data.

#### `DeviceRkiActivateResult(data = nil)`

Create a new `DeviceRkiActivateResult` entity instance. Pass `nil` for no initial data.

#### `DeviceState(data = nil)`

Create a new `DeviceState` entity instance. Pass `nil` for no initial data.

#### `DeviceType(data = nil)`

Create a new `DeviceType` entity instance. Pass `nil` for no initial data.

#### `InjectKey(data = nil)`

Create a new `InjectKey` entity instance. Pass `nil` for no initial data.

#### `Kif(data = nil)`

Create a new `Kif` entity instance. Pass `nil` for no initial data.

#### `Location(data = nil)`

Create a new `Location` entity instance. Pass `nil` for no initial data.

#### `Partner(data = nil)`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `Shipment(data = nil)`

Create a new `Shipment` entity instance. Pass `nil` for no initial data.

#### `Success(data = nil)`

Create a new `Success` entity instance. Pass `nil` for no initial data.

#### `Transaction(data = nil)`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `UpdateResult(data = nil)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `User(data = nil)`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## AttestationEntity

```ruby
attestation = client.Attestation
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Hash` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | The date and time that the Attestation took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Hash` | No | Reference to the associated Device resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `name` | `String` | No | Text describing the attestation. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Attestation. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Attestation.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Attestation.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Attestation.load({ "id" => "attestation_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `AttestationEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ClientEntity

```ruby
client_ = client.Client
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Hash` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Hash` | No | Reference to the associated Partner. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Hash` | Yes | Reference to the associated Location resource. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `Hash` | No | Reference to the Client's root Partner. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Client.create({
  "location" => {}, # Hash
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Client.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Client.load({ "id" => "client_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Client.remove({ "id" => "client_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ClientEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## CreateResultEntity

```ruby
create_result = client.CreateResult
```

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.CreateResult.create({
  "device_type" => "example_device_type", # String
  "serial_number" => "example_serial_number", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `CreateResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DecryptionEntity

```ruby
decryption = client.Decryption
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Decryption.create({
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DecryptionEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceEntity

```ruby
device = client.Device
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `Hash` | Yes | Reference to the associated User resource. |
| `activationDate` | `String` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Hash` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Hash` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Hash` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Hash` | No | Reference to the associated Device State resource. |
| `deviceType` | `Hash` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `Integer` | No | The number times the Device has been in error. |
| `errorLastDate` | `String` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String` | No | The Device's unique identifier. |
| `initializedBy` | `Hash` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Hash` | No | Reference to the associated Device resource. |
| `isVirtual` | `Boolean` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Hash` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | No | Timestamp from the last time that the Device was used. |
| `location` | `Hash` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Hash` | Yes | Reference to the associated User resource. |
| `name` | `String` | No | The Device's name. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Hash` | No | Reference to the associated Partner. |
| `serialNumber` | `String` | No | The Device's serial number. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Device.create({
  "activatedBy" => {}, # Hash
  "createdBy" => {}, # Hash
  "initializedBy" => {}, # Hash
  "location" => {}, # Hash
  "modifiedBy" => {}, # Hash
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Device.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Device.load({ "id" => "device_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceBuildEntity

```ruby
device_build = client.DeviceBuild
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
| `id` | `Integer` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Device Builds's name. |
| `notes` | `String` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `Boolean` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.DeviceBuild.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.DeviceBuild.load({ "id" => "device_build_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceBuildEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceCustodyDetailEntity

```ruby
device_custody_detail = client.DeviceCustodyDetail
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Hash` | Yes | Reference to the associated User resource. |
| `custodian` | `Hash` | Yes | Reference to the associated User resource. |
| `device` | `Hash` | No | Reference to the associated Device resource. |
| `id` | `Integer` | No | This resource's unique identifier. |
| `location` | `Hash` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Hash` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Hash` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Hash` | No | Reference to the associated Transfer Method. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.DeviceCustodyDetail.load({ "id" => "device_custody_detail_id", "device_type" => "device_type", "serial_number" => "serial_number" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceCustodyDetailEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceCustodyListEntity

```ruby
device_custody_list = client.DeviceCustodyList
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Hash` | Yes | Reference to the associated User resource. |
| `custodian` | `Hash` | Yes | Reference to the associated User resource. |
| `device` | `Hash` | No | Reference to the associated Device resource. |
| `id` | `Integer` | No | This resource's unique identifier. |
| `location` | `Hash` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Hash` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Hash` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Hash` | No | Reference to the associated Transfer Method. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.DeviceCustodyList.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceCustodyListEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceListEntity

```ruby
device_list = client.DeviceList
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `Array` | No | List of Devices. |
| `total` | `Integer` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.DeviceList.load({ "share_partner_to" => "share_partner_to" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceListEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceReceiveResultEntity

```ruby
device_receive_result = client.DeviceReceiveResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | Yes | Indicates if the action succeeded. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.DeviceReceiveResult.create({
  "success" => true, # Boolean
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceReceiveResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```ruby
device_rki_activate_result = client.DeviceRkiActivateResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | Yes | Indicates if the RKI activation succeeded. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.DeviceRkiActivateResult.create({
  "success" => true, # Boolean
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceRkiActivateResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceStateEntity

```ruby
device_state = client.DeviceState
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Integer` | No | Unique identifier for this Device state. |
| `name` | `String` | No | Descriptive name for this Device state. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.DeviceState.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceStateEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## DeviceTypeEntity

```ruby
device_type = client.DeviceType
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
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.DeviceType.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.DeviceType.load({ "id" => "device_type_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `DeviceTypeEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## InjectKeyEntity

```ruby
inject_key = client.InjectKey
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
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.InjectKey.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.InjectKey.load({ "id" => "inject_key_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `InjectKeyEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## KifEntity

```ruby
kif = client.Kif
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Integer` | No | This resource's unique identifier. |
| `name` | `String` | No | The KIF's name. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Kif.list
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `KifEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## LocationEntity

```ruby
location = client.Location
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
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Location.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Location.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Location.load({ "id" => "location_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Location.remove({ "id" => "location_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `LocationEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PartnerEntity

```ruby
partner = client.Partner
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `Boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Hash` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Hash` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Hash` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Partner.create({
  "location" => {}, # Hash
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Partner.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Partner.load({ "id" => "partner_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ShipmentEntity

```ruby
shipment = client.Shipment
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No | The name of the courier. |
| `client` | `Hash` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | No | The date and time that a package is recieved. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `dcKif` | `Hash` | No | Reference to the associated KIF resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `items` | `Array` | No |  |
| `kif` | `Hash` | No | Reference to the associated KIF resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Hash` | No | Reference to the associated Partner. |
| `shipmentType` | `String` | No | The type of shipment. |
| `tracking` | `String` | No | The courier's tracking number. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Shipment.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Shipment.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Shipment.load({ "id" => "shipment_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ShipmentEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SuccessEntity

```ruby
success = client.Success
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Boolean` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Success.create({
  "share_partner_to" => "example_share_partner_to", # String
})
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Success.remove({ "share_partner_to" => "share_partner_to" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SuccessEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## TransactionEntity

```ruby
transaction = client.Transaction
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Hash` | No | Reference to the associated Client resource. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `Integer` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `String` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Hash` | No | Reference to the associated Partner. |
| `encrypted` | `Integer` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `Boolean` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `location` | `Hash` | Yes | Reference to the associated Location resource. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `partner` | `Hash` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `success` | `Boolean` | No | The success indicator. |
| `transactionSource` | `String` | No | The source of the Transaction. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Transaction.create({
  "location" => {}, # Hash
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Transaction.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Transaction.load({ "id" => "transaction_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## UpdateResultEntity

```ruby
update_result = client.UpdateResult
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Hash` | No | Reference to the associated Client resource. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | ID of newly created resource |
| `isActive` | `Boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Hash` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `partner` | `Hash` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Hash` | No | Reference to the associated User Role. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.UpdateResult.create({
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.UpdateResult.list
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.UpdateResult.update({
  "id" => "id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## UserEntity

```ruby
user = client.User
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Hash` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Hash` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Hash` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Hash` | No | Reference to the associated User Role. |
| `version` | `Integer` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.User.load({ "id" => "user_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.User.remove({ "id" => "user_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `UserEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = BluefinDecryptxP2peSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

