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
| `client` | `Hash` | No |  |
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `Hash` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |

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
| `contact` | `Hash` | No |  |
| `created` | `String` | No |  |
| `direct_partner` | `Hash` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `location` | `Hash` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `version` | `Integer` | No |  |

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
| `success` | `Boolean` | No |  |

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
| `activated_by` | `Hash` | Yes |  |
| `activation_date` | `String` | No |  |
| `alternate_key` | `String` | No |  |
| `audit_next_date` | `String` | No |  |
| `audit_notification_date` | `String` | No |  |
| `client` | `Hash` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Hash` | Yes |  |
| `device_build` | `Hash` | No |  |
| `device_state` | `Hash` | No |  |
| `device_type` | `Hash` | No |  |
| `error_counter` | `Integer` | No |  |
| `error_last_date` | `String` | No |  |
| `id` | `String` | No |  |
| `initialized_by` | `Hash` | Yes |  |
| `initialized_date` | `String` | No |  |
| `inject_key` | `Hash` | No |  |
| `is_virtual` | `Boolean` | No |  |
| `kif` | `Hash` | No |  |
| `last_activity_date` | `String` | No |  |
| `location` | `Hash` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Hash` | Yes |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `serial_number` | `String` | No |  |
| `version` | `Integer` | No |  |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Device.create({
  "activated_by" => {}, # Hash
  "created_by" => {}, # Hash
  "initialized_by" => {}, # Hash
  "location" => {}, # Hash
  "modified_by" => {}, # Hash
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
| `app_version` | `String` | No |  |
| `build_number` | `String` | No |  |
| `config_file_name` | `String` | No |  |
| `created` | `String` | No |  |
| `device_type` | `String` | No |  |
| `firmware_version` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `Integer` | No |  |
| `is_active` | `Boolean` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `note` | `String` | No |  |
| `version` | `Integer` | No |  |
| `white_listing_bin_range` | `String` | No |  |
| `white_listing_used` | `Boolean` | No |  |

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
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Hash` | Yes |  |
| `custodian` | `Hash` | Yes |  |
| `device` | `Hash` | No |  |
| `id` | `Integer` | No |  |
| `location` | `Hash` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Hash` | Yes |  |
| `note` | `String` | No |  |
| `status` | `Hash` | No |  |
| `transfer_method` | `Hash` | No |  |
| `version` | `Integer` | No |  |

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
| `complete_date` | `String` | No |  |
| `created` | `String` | No |  |
| `created_by` | `Hash` | Yes |  |
| `custodian` | `Hash` | Yes |  |
| `device` | `Hash` | No |  |
| `id` | `Integer` | No |  |
| `location` | `Hash` | Yes |  |
| `modified` | `String` | No |  |
| `modified_by` | `Hash` | Yes |  |
| `note` | `String` | No |  |
| `status` | `Hash` | No |  |
| `transfer_method` | `Hash` | No |  |
| `version` | `Integer` | No |  |

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
| `data` | `Array` | No |  |
| `total` | `Integer` | No |  |

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
| `success` | `Boolean` | Yes |  |

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
| `success` | `Boolean` | Yes |  |

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
| `id` | `Integer` | No |  |
| `name` | `String` | No |  |

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
| `created` | `String` | No |  |
| `device_type_mode` | `String` | No |  |
| `hardware_version` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photo_url` | `String` | No |  |
| `product_name` | `String` | No |  |
| `version` | `Integer` | No |  |

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
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `is_p2_pe` | `Boolean` | No |  |
| `key_type` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `Integer` | No |  |

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
| `id` | `Integer` | No |  |
| `name` | `String` | No |  |

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
| `address1` | `String` | No |  |
| `address2` | `String` | No |  |
| `billing_id` | `String` | No |  |
| `city` | `String` | No |  |
| `country` | `String` | No |  |
| `created` | `String` | No |  |
| `custom_reference` | `String` | No |  |
| `id` | `String` | No |  |
| `location_type` | `String` | No |  |
| `mail_address1` | `String` | No |  |
| `mail_address2` | `String` | No |  |
| `mail_city` | `String` | No |  |
| `mail_country` | `String` | No |  |
| `mail_postal_code` | `String` | No |  |
| `mail_state_province` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `name_of_business` | `String` | No |  |
| `note` | `String` | No |  |
| `postal_code` | `String` | No |  |
| `state_province` | `String` | No |  |
| `unique_id` | `String` | No |  |
| `version` | `Integer` | No |  |

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
| `billing_id` | `String` | No |  |
| `client_can_order_equipment` | `Boolean` | No |  |
| `contact` | `Hash` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `location` | `Hash` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Hash` | No |  |
| `partner_id` | `String` | No |  |
| `reference` | `String` | No |  |
| `verification_phrase` | `String` | No |  |
| `version` | `Integer` | No |  |

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
| `carrier` | `String` | No |  |
| `client` | `Hash` | No |  |
| `created` | `String` | No |  |
| `date_received` | `String` | No |  |
| `date_shipped` | `String` | No |  |
| `dc_kif` | `Hash` | No |  |
| `id` | `String` | No |  |
| `item` | `Array` | No |  |
| `kif` | `Hash` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `shipment_type` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `Integer` | No |  |

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
| `success` | `Boolean` | No |  |

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
| `alternate_key` | `String` | No |  |
| `client` | `Hash` | No |  |
| `client_ref` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `Integer` | No |  |
| `device_name` | `String` | No |  |
| `direct_partner` | `Hash` | No |  |
| `encrypted` | `Integer` | No |  |
| `end_date` | `String` | No |  |
| `err_code` | `String` | No |  |
| `err_message` | `String` | No |  |
| `id` | `String` | No |  |
| `ip_address` | `String` | No |  |
| `is_virtual` | `Boolean` | No |  |
| `key_type` | `String` | No |  |
| `location` | `Hash` | Yes |  |
| `message_id` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `reference` | `String` | No |  |
| `serial_number` | `String` | No |  |
| `start_date` | `String` | No |  |
| `success` | `Boolean` | No |  |
| `transaction_source` | `String` | No |  |

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
| `client` | `Hash` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `kif` | `Hash` | No |  |
| `last_name` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Hash` | No |  |
| `version` | `Integer` | No |  |

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
| `client` | `Hash` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `first_name` | `String` | No |  |
| `id` | `String` | No |  |
| `is_active` | `Boolean` | No |  |
| `kif` | `Hash` | No |  |
| `last_name` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Hash` | No |  |
| `phone` | `String` | No |  |
| `user_name` | `String` | No |  |
| `user_role` | `Hash` | No |  |
| `version` | `Integer` | No |  |

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

