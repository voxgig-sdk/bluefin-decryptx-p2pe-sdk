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
  # load returns the ENTITY — call data_get for the DeviceCustodyDetail record (raises on error).
  devicecustodydetail = client.DeviceCustodyDetail.load({ "device_type" => "example_device_type", "serial_number" => "example_serial_number", "id" => "example_id" })
  puts devicecustodydetail
rescue => err
  warn "load failed: #{err}"
end
```

### 4. Create, update, and remove

```ruby
# create returns the ENTITY — call data_get for the created Attestation record.
created = client.Attestation.create({ "client" => {}, "completeDate" => "example_completeDate" })

```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  devicetypes = client.DeviceType.list()
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
  "entity" => { "devicetype" => { "test01" => { "id" => "test01" } } },
})

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
devicetype = client.DeviceType.list()
puts devicetype
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
| `completeDate` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `notes` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `directPartner` |  |
| `id` |  |
| `isActive` |  |
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
| `activatedBy` |  |
| `activationDate` |  |
| `alternateKey` |  |
| `auditNextDate` |  |
| `auditNotificationDate` |  |
| `client` |  |
| `created` |  |
| `createdBy` |  |
| `deviceBuild` |  |
| `deviceState` |  |
| `deviceType` |  |
| `errorCounter` |  |
| `errorLastDate` |  |
| `id` |  |
| `initializedBy` |  |
| `initializedDate` |  |
| `injectKey` |  |
| `isVirtual` |  |
| `kif` |  |
| `lastActivityDate` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `name` |  |
| `notes` |  |
| `partner` |  |
| `serialNumber` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` |  |
| `buildNumber` |  |
| `configFileName` |  |
| `created` |  |
| `deviceType` |  |
| `firmwareVersion` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `modified` |  |
| `name` |  |
| `notes` |  |
| `version` |  |
| `whiteListingBinRanges` |  |
| `whiteListingUsed` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
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
| `deviceTypeMode` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photoUrl` |  |
| `productName` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `isP2PE` |  |
| `keyType` |  |
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
| `billingId` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `customReference` |  |
| `id` |  |
| `locationType` |  |
| `mailAddress1` |  |
| `mailAddress2` |  |
| `mailCity` |  |
| `mailCountry` |  |
| `mailPostalCode` |  |
| `mailStateProvince` |  |
| `modified` |  |
| `name` |  |
| `nameOfBusiness` |  |
| `notes` |  |
| `postalCode` |  |
| `stateProvince` |  |
| `uniqueId` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` |  |
| `clientCanOrderEquipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partnerId` |  |
| `reference` |  |
| `verificationPhrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `dateReceived` |  |
| `dateShipped` |  |
| `dcKif` |  |
| `id` |  |
| `items` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipmentType` |  |
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
| `alternateKey` |  |
| `client` |  |
| `clientRef` |  |
| `created` |  |
| `decrypted` |  |
| `deviceName` |  |
| `directPartner` |  |
| `encrypted` |  |
| `endDate` |  |
| `errCode` |  |
| `errMessage` |  |
| `id` |  |
| `ipAddress` |  |
| `isVirtual` |  |
| `keyType` |  |
| `location` |  |
| `messageId` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serialNumber` |  |
| `startDate` |  |
| `success` |  |
| `transactionSource` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
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
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `device` | `Hash` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Attestation record (raises on error).
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
| `directPartner` | `Hash` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `location` | `Hash` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Client record (raises on error).
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
| `activatedBy` | `Hash` |  |
| `activationDate` | `String` |  |
| `alternateKey` | `String` |  |
| `auditNextDate` | `String` |  |
| `auditNotificationDate` | `String` |  |
| `client` | `Hash` |  |
| `created` | `String` |  |
| `createdBy` | `Hash` |  |
| `deviceBuild` | `Hash` |  |
| `deviceState` | `Hash` |  |
| `deviceType` | `Hash` |  |
| `errorCounter` | `Integer` |  |
| `errorLastDate` | `String` |  |
| `id` | `String` |  |
| `initializedBy` | `Hash` |  |
| `initializedDate` | `String` |  |
| `injectKey` | `Hash` |  |
| `isVirtual` | `Boolean` |  |
| `kif` | `Hash` |  |
| `lastActivityDate` | `String` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Hash` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `partner` | `Hash` |  |
| `serialNumber` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Device record (raises on error).
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
  "activatedBy" => {}, # Hash
  "createdBy" => {}, # Hash
  "initializedBy" => {}, # Hash
  "location" => {}, # Hash
  "modifiedBy" => {}, # Hash
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
| `appVersion` | `String` |  |
| `buildNumber` | `String` |  |
| `configFileName` | `String` |  |
| `created` | `String` |  |
| `deviceType` | `String` |  |
| `firmwareVersion` | `String` |  |
| `hardwareVersion` | `String` |  |
| `id` | `Integer` |  |
| `isActive` | `Boolean` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `version` | `Integer` |  |
| `whiteListingBinRanges` | `String` |  |
| `whiteListingUsed` | `Boolean` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the DeviceBuild record (raises on error).
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
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Hash` |  |
| `custodian` | `Hash` |  |
| `device` | `Hash` |  |
| `id` | `Integer` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Hash` |  |
| `notes` | `String` |  |
| `status` | `Hash` |  |
| `transferMethod` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the DeviceCustodyDetail record (raises on error).
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
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Hash` |  |
| `custodian` | `Hash` |  |
| `device` | `Hash` |  |
| `id` | `Integer` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Hash` |  |
| `notes` | `String` |  |
| `status` | `Hash` |  |
| `transferMethod` | `Hash` |  |
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
# load returns the ENTITY — call data_get for the DeviceList record (raises on error).
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
| `deviceTypeMode` | `String` |  |
| `hardwareVersion` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photoUrl` | `String` |  |
| `productName` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the DeviceType record (raises on error).
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
| `isActive` | `Boolean` |  |
| `isP2PE` | `Boolean` |  |
| `keyType` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the InjectKey record (raises on error).
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
| `billingId` | `String` |  |
| `city` | `String` |  |
| `country` | `String` |  |
| `created` | `String` |  |
| `customReference` | `String` |  |
| `id` | `String` |  |
| `locationType` | `String` |  |
| `mailAddress1` | `String` |  |
| `mailAddress2` | `String` |  |
| `mailCity` | `String` |  |
| `mailCountry` | `String` |  |
| `mailPostalCode` | `String` |  |
| `mailStateProvince` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `nameOfBusiness` | `String` |  |
| `notes` | `String` |  |
| `postalCode` | `String` |  |
| `stateProvince` | `String` |  |
| `uniqueId` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Location record (raises on error).
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
| `billingId` | `String` |  |
| `clientCanOrderEquipment` | `Boolean` |  |
| `contact` | `Hash` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `location` | `Hash` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Hash` |  |
| `partnerId` | `String` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Partner record (raises on error).
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
| `dateReceived` | `String` |  |
| `dateShipped` | `String` |  |
| `dcKif` | `Hash` |  |
| `id` | `String` |  |
| `items` | `Array` |  |
| `kif` | `Hash` |  |
| `modified` | `String` |  |
| `partner` | `Hash` |  |
| `shipmentType` | `String` |  |
| `tracking` | `String` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Shipment record (raises on error).
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
| `alternateKey` | `String` |  |
| `client` | `Hash` |  |
| `clientRef` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `Integer` |  |
| `deviceName` | `String` |  |
| `directPartner` | `Hash` |  |
| `encrypted` | `Integer` |  |
| `endDate` | `String` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `String` |  |
| `ipAddress` | `String` |  |
| `isVirtual` | `Boolean` |  |
| `keyType` | `String` |  |
| `location` | `Hash` |  |
| `messageId` | `String` |  |
| `method` | `String` |  |
| `partner` | `Hash` |  |
| `reference` | `String` |  |
| `serialNumber` | `String` |  |
| `startDate` | `String` |  |
| `success` | `Boolean` |  |
| `transactionSource` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Transaction record (raises on error).
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
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `kif` | `Hash` |  |
| `lastName` | `String` |  |
| `partner` | `Hash` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Hash` |  |
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
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `kif` | `Hash` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Hash` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Hash` |  |
| `version` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the User record (raises on error).
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
devicetype = client.DeviceType
devicetype.list()

# devicetype.data_get now returns the devicetype data from the last list
# devicetype.match_get returns the last match criteria
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
