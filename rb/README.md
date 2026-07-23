# BluefinDecryptxP2pe Ruby SDK



The Ruby SDK for the BluefinDecryptxP2pe API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Attestation` — with named operations (`list`/`load`/`create`/`update`/`remove`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "BluefinDecryptxP2pe_sdk"

client = BluefinDecryptxP2peSDK.new({
  "apikey" => ENV["BLUEFIN_DECRYPTX_P2PE_APIKEY"],
})
```

### 2. List attestation records

```ruby
begin
  # list returns an Array of Attestation records — iterate directly.
  attestations = client.Attestation.list
  attestations.each do |item|
    puts "#{item["id"]} #{item["client"]}"
  end
rescue => err
  warn "list failed: #{err}"
end
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.

```ruby
begin
  # load returns the bare DeviceCustodyDetail record (raises on error).
  devicecustodydetail = client.DeviceCustodyDetail.load({ "device_type" => "example_device_type", "serial_number" => "example_serial_number", "id" => "example_id" })
  puts devicecustodydetail
rescue => err
  warn "load failed: #{err}"
end
```

### 4. Create, update, and remove

```ruby
# create returns the bare created Attestation record.
created = client.Attestation.create({ "client" => {}, "complete_date" => "example_complete_date" })

```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  attestations = client.Attestation.list()
rescue => err
  warn "list failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```ruby
client = BluefinDecryptxP2peSDK.test({
  "entity" => { "attestation" => { "test01" => { "id" => "test01" } } },
})

# Entity ops return the bare mock record (raises on error).
attestation = client.Attestation.list()
puts attestation
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = BluefinDecryptxP2peSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### BluefinDecryptxP2peSDK

```ruby
require_relative "BluefinDecryptxP2pe_sdk"
client = BluefinDecryptxP2peSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = BluefinDecryptxP2peSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `Attestation` | `(data) -> AttestationEntity` | Create an Attestation entity instance. |
| `Client` | `(data) -> ClientEntity` | Create a Client entity instance. |
| `CreateResult` | `(data) -> CreateResultEntity` | Create a CreateResult entity instance. |
| `Decryption` | `(data) -> DecryptionEntity` | Create a Decryption entity instance. |
| `Device` | `(data) -> DeviceEntity` | Create a Device entity instance. |
| `DeviceBuild` | `(data) -> DeviceBuildEntity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `(data) -> DeviceCustodyDetailEntity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `(data) -> DeviceCustodyListEntity` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `(data) -> DeviceListEntity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `(data) -> DeviceReceiveResultEntity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `(data) -> DeviceRkiActivateResultEntity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `(data) -> DeviceStateEntity` | Create a DeviceState entity instance. |
| `DeviceType` | `(data) -> DeviceTypeEntity` | Create a DeviceType entity instance. |
| `InjectKey` | `(data) -> InjectKeyEntity` | Create an InjectKey entity instance. |
| `Kif` | `(data) -> KifEntity` | Create a Kif entity instance. |
| `Location` | `(data) -> LocationEntity` | Create a Location entity instance. |
| `Partner` | `(data) -> PartnerEntity` | Create a Partner entity instance. |
| `Shipment` | `(data) -> ShipmentEntity` | Create a Shipment entity instance. |
| `Success` | `(data) -> SuccessEntity` | Create a Success entity instance. |
| `Transaction` | `(data) -> TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `(data) -> UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `(data) -> UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `BluefinDecryptxP2peError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` |  |
| `complete_date` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `note` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `mid` |  |
| `modified` |  |
| `name` |  |
| `partner` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/clients`

#### CreateResult

| Field | Description |
| --- | --- |

Operations: Create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activated_by` |  |
| `activation_date` |  |
| `alternate_key` |  |
| `audit_next_date` |  |
| `audit_notification_date` |  |
| `client` |  |
| `created` |  |
| `created_by` |  |
| `device_build` |  |
| `device_state` |  |
| `device_type` |  |
| `error_counter` |  |
| `error_last_date` |  |
| `id` |  |
| `initialized_by` |  |
| `initialized_date` |  |
| `inject_key` |  |
| `is_virtual` |  |
| `kif` |  |
| `last_activity_date` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `name` |  |
| `note` |  |
| `partner` |  |
| `serial_number` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `app_version` |  |
| `build_number` |  |
| `config_file_name` |  |
| `created` |  |
| `device_type` |  |
| `firmware_version` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `note` |  |
| `version` |  |
| `white_listing_bin_range` |  |
| `white_listing_used` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` |  |
| `total` |  |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` |  |
| `device_type_mode` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photo_url` |  |
| `product_name` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `is_p2_pe` |  |
| `key_type` |  |
| `modified` |  |
| `name` |  |
| `version` |  |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` |  |
| `address2` |  |
| `billing_id` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `custom_reference` |  |
| `id` |  |
| `location_type` |  |
| `mail_address1` |  |
| `mail_address2` |  |
| `mail_city` |  |
| `mail_country` |  |
| `mail_postal_code` |  |
| `mail_state_province` |  |
| `modified` |  |
| `name` |  |
| `name_of_business` |  |
| `note` |  |
| `postal_code` |  |
| `state_province` |  |
| `unique_id` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client_can_order_equipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partner_id` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `date_received` |  |
| `date_shipped` |  |
| `dc_kif` |  |
| `id` |  |
| `item` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipment_type` |  |
| `tracking` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` |  |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternate_key` |  |
| `client` |  |
| `client_ref` |  |
| `created` |  |
| `decrypted` |  |
| `device_name` |  |
| `direct_partner` |  |
| `encrypted` |  |
| `end_date` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `is_virtual` |  |
| `key_type` |  |
| `location` |  |
| `message_id` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serial_number` |  |
| `start_date` |  |
| `success` |  |
| `transaction_source` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `attestation = client.Attestation`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Hash` |  |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `device` | `Hash` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |

#### Example: Load

```ruby
# load returns the bare Attestation record (raises on error).
attestation = client.Attestation.load({ "id" => "attestation_id" })
```

#### Example: List

```ruby
# list returns an Array of Attestation records (raises on error).
attestations = client.Attestation.list
```

#### Example: Create

```ruby
attestation = client.Attestation.create({
})
```


### Client

Create an instance: `client_ = client.Client`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Hash` |  |
| `created` | `String` |  |
| `direct_partner` | `Hash` |  |
| `id` | `String` |  |
| `is_active` | `Boolean` |  |
| `location` | `Hash` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Client record (raises on error).
client_ = client.Client.load({ "id" => "client_id" })
```

#### Example: List

```ruby
# list returns an Array of Client records (raises on error).
client_s = client.Client.list
```

#### Example: Create

```ruby
client_ = client.Client.create({
  "location" => {}, # Hash
})
```


### CreateResult

Create an instance: `create_result = client.CreateResult`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```ruby
create_result = client.CreateResult.create({
  "device_type" => "example_device_type", # String
  "serial_number" => "example_serial_number", # String
})
```


### Decryption

Create an instance: `decryption = client.Decryption`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```ruby
decryption = client.Decryption.create({
})
```


### Device

Create an instance: `device = client.Device`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `Hash` |  |
| `activation_date` | `String` |  |
| `alternate_key` | `String` |  |
| `audit_next_date` | `String` |  |
| `audit_notification_date` | `String` |  |
| `client` | `Hash` |  |
| `created` | `String` |  |
| `created_by` | `Hash` |  |
| `device_build` | `Hash` |  |
| `device_state` | `Hash` |  |
| `device_type` | `Hash` |  |
| `error_counter` | `Integer` |  |
| `error_last_date` | `String` |  |
| `id` | `String` |  |
| `initialized_by` | `Hash` |  |
| `initialized_date` | `String` |  |
| `inject_key` | `Hash` |  |
| `is_virtual` | `Boolean` |  |
| `kif` | `Hash` |  |
| `last_activity_date` | `String` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `modified_by` | `Hash` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `partner` | `Hash` |  |
| `serial_number` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Device record (raises on error).
device = client.Device.load({ "id" => "device_id" })
```

#### Example: List

```ruby
# list returns an Array of Device records (raises on error).
devices = client.Device.list
```

#### Example: Create

```ruby
device = client.Device.create({
  "activated_by" => {}, # Hash
  "created_by" => {}, # Hash
  "initialized_by" => {}, # Hash
  "location" => {}, # Hash
  "modified_by" => {}, # Hash
})
```


### DeviceBuild

Create an instance: `device_build = client.DeviceBuild`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_version` | `String` |  |
| `build_number` | `String` |  |
| `config_file_name` | `String` |  |
| `created` | `String` |  |
| `device_type` | `String` |  |
| `firmware_version` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `Integer` |  |
| `is_active` | `Boolean` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `version` | `Integer` |  |
| `white_listing_bin_range` | `String` |  |
| `white_listing_used` | `Boolean` |  |

#### Example: Load

```ruby
# load returns the bare DeviceBuild record (raises on error).
device_build = client.DeviceBuild.load({ "id" => "device_build_id" })
```

#### Example: List

```ruby
# list returns an Array of DeviceBuild records (raises on error).
device_builds = client.DeviceBuild.list
```


### DeviceCustodyDetail

Create an instance: `device_custody_detail = client.DeviceCustodyDetail`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `Hash` |  |
| `custodian` | `Hash` |  |
| `device` | `Hash` |  |
| `id` | `Integer` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `modified_by` | `Hash` |  |
| `note` | `String` |  |
| `status` | `Hash` |  |
| `transfer_method` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare DeviceCustodyDetail record (raises on error).
device_custody_detail = client.DeviceCustodyDetail.load({ "id" => "device_custody_detail_id", "device_type" => "device_type", "serial_number" => "serial_number" })
```


### DeviceCustodyList

Create an instance: `device_custody_list = client.DeviceCustodyList`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `Hash` |  |
| `custodian` | `Hash` |  |
| `device` | `Hash` |  |
| `id` | `Integer` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `modified_by` | `Hash` |  |
| `note` | `String` |  |
| `status` | `Hash` |  |
| `transfer_method` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: List

```ruby
# list returns an Array of DeviceCustodyList records (raises on error).
device_custody_lists = client.DeviceCustodyList.list
```


### DeviceList

Create an instance: `device_list = client.DeviceList`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `Array` |  |
| `total` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare DeviceList record (raises on error).
device_list = client.DeviceList.load({ "share_partner_to" => "share_partner_to" })
```


### DeviceReceiveResult

Create an instance: `device_receive_result = client.DeviceReceiveResult`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```ruby
device_receive_result = client.DeviceReceiveResult.create({
  "success" => true, # Boolean
})
```


### DeviceRkiActivateResult

Create an instance: `device_rki_activate_result = client.DeviceRkiActivateResult`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```ruby
device_rki_activate_result = client.DeviceRkiActivateResult.create({
  "success" => true, # Boolean
})
```


### DeviceState

Create an instance: `device_state = client.DeviceState`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Integer` |  |
| `name` | `String` |  |

#### Example: List

```ruby
# list returns an Array of DeviceState records (raises on error).
device_states = client.DeviceState.list
```


### DeviceType

Create an instance: `device_type = client.DeviceType`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `device_type_mode` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Boolean` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photo_url` | `String` |  |
| `product_name` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare DeviceType record (raises on error).
device_type = client.DeviceType.load({ "id" => "device_type_id" })
```

#### Example: List

```ruby
# list returns an Array of DeviceType records (raises on error).
device_types = client.DeviceType.list
```


### InjectKey

Create an instance: `inject_key = client.InjectKey`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Boolean` |  |
| `is_p2_pe` | `Boolean` |  |
| `key_type` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare InjectKey record (raises on error).
inject_key = client.InjectKey.load({ "id" => "inject_key_id" })
```

#### Example: List

```ruby
# list returns an Array of InjectKey records (raises on error).
inject_keys = client.InjectKey.list
```


### Kif

Create an instance: `kif = client.Kif`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Integer` |  |
| `name` | `String` |  |

#### Example: List

```ruby
# list returns an Array of Kif records (raises on error).
kifs = client.Kif.list
```


### Location

Create an instance: `location = client.Location`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `String` |  |
| `address2` | `String` |  |
| `billing_id` | `String` |  |
| `city` | `String` |  |
| `country` | `String` |  |
| `created` | `String` |  |
| `custom_reference` | `String` |  |
| `id` | `String` |  |
| `location_type` | `String` |  |
| `mail_address1` | `String` |  |
| `mail_address2` | `String` |  |
| `mail_city` | `String` |  |
| `mail_country` | `String` |  |
| `mail_postal_code` | `String` |  |
| `mail_state_province` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `name_of_business` | `String` |  |
| `note` | `String` |  |
| `postal_code` | `String` |  |
| `state_province` | `String` |  |
| `unique_id` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Location record (raises on error).
location = client.Location.load({ "id" => "location_id" })
```

#### Example: List

```ruby
# list returns an Array of Location records (raises on error).
locations = client.Location.list
```

#### Example: Create

```ruby
location = client.Location.create({
})
```


### Partner

Create an instance: `partner = client.Partner`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client_can_order_equipment` | `Boolean` |  |
| `contact` | `Hash` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Boolean` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Hash` |  |
| `partner_id` | `String` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Partner record (raises on error).
partner = client.Partner.load({ "id" => "partner_id" })
```

#### Example: List

```ruby
# list returns an Array of Partner records (raises on error).
partners = client.Partner.list
```

#### Example: Create

```ruby
partner = client.Partner.create({
  "location" => {}, # Hash
})
```


### Shipment

Create an instance: `shipment = client.Shipment`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `Hash` |  |
| `created` | `String` |  |
| `date_received` | `String` |  |
| `date_shipped` | `String` |  |
| `dc_kif` | `Hash` |  |
| `id` | `String` |  |
| `item` | `Array` |  |
| `kif` | `Hash` |  |
| `modified` | `String` |  |
| `partner` | `Hash` |  |
| `shipment_type` | `String` |  |
| `tracking` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare Shipment record (raises on error).
shipment = client.Shipment.load({ "id" => "shipment_id" })
```

#### Example: List

```ruby
# list returns an Array of Shipment records (raises on error).
shipments = client.Shipment.list
```

#### Example: Create

```ruby
shipment = client.Shipment.create({
})
```


### Success

Create an instance: `success = client.Success`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```ruby
success = client.Success.create({
  "share_partner_to" => "example_share_partner_to", # String
})
```


### Transaction

Create an instance: `transaction = client.Transaction`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `String` |  |
| `client` | `Hash` |  |
| `client_ref` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `Integer` |  |
| `device_name` | `String` |  |
| `direct_partner` | `Hash` |  |
| `encrypted` | `Integer` |  |
| `end_date` | `String` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `String` |  |
| `ip_address` | `String` |  |
| `is_virtual` | `Boolean` |  |
| `key_type` | `String` |  |
| `location` | `Hash` |  |
| `message_id` | `String` |  |
| `method` | `String` |  |
| `partner` | `Hash` |  |
| `reference` | `String` |  |
| `serial_number` | `String` |  |
| `start_date` | `String` |  |
| `success` | `Boolean` |  |
| `transaction_source` | `String` |  |

#### Example: Load

```ruby
# load returns the bare Transaction record (raises on error).
transaction = client.Transaction.load({ "id" => "transaction_id" })
```

#### Example: List

```ruby
# list returns an Array of Transaction records (raises on error).
transactions = client.Transaction.list
```

#### Example: Create

```ruby
transaction = client.Transaction.create({
  "location" => {}, # Hash
})
```


### UpdateResult

Create an instance: `update_result = client.UpdateResult`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Hash` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Boolean` |  |
| `kif` | `Hash` |  |
| `last_name` | `String` |  |
| `partner` | `Hash` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: List

```ruby
# list returns an Array of UpdateResult records (raises on error).
update_results = client.UpdateResult.list
```

#### Example: Create

```ruby
update_result = client.UpdateResult.create({
})
```


### User

Create an instance: `user = client.User`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Hash` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Boolean` |  |
| `kif` | `Hash` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Hash` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the bare User record (raises on error).
user = client.User.load({ "id" => "user_id" })
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── BluefinDecryptxP2pe_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`BluefinDecryptxP2pe_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```ruby
attestation = client.Attestation
attestation.list()

# attestation.data_get now returns the attestation data from the last list
# attestation.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
