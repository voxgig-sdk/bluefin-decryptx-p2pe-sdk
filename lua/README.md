# BluefinDecryptxP2pe Lua SDK



The Lua SDK for the BluefinDecryptxP2pe API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:Attestation()` — each with the same small set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("bluefin-decryptx-p2pe_sdk")

local client = sdk.new({
  apikey = os.getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
})
```

### 2. List attestation records

Entity operations return `(value, err)`. For `list`, `value` is the
array of records itself — iterate it directly (there is no wrapper).

```lua
local attestations, err = client:Attestation():list()
if err then error(err) end

for _, item in ipairs(attestations) do
  print(item["id"], item["complete_date"])
end
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.

```lua
local devicecustodydetail, err = client:DeviceCustodyDetail():load({ device_type = "example_device_type", serial_number = "example_serial_number", id = "example_id" })
if err then error(err) end
print(devicecustodydetail)
```

### 4. Create, update, and remove

```lua
-- Create
local created, err = client:Attestation():create({ client = {}, complete_date = "example_complete_date" })
if err then error(err) end

```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local devicetypes, err = client:DeviceType():list()
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:DeviceType():list()
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
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
cd lua && busted test/
```


## Reference

### BluefinDecryptxP2peSDK

```lua
local sdk = require("bluefin-decryptx-p2pe_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
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
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> any, err` | Create a new entity. |
| `update` | `(reqdata, ctrl) -> any, err` | Update an existing entity. |
| `remove` | `(reqmatch, ctrl) -> any, err` | Remove an entity. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` / `create` / `update` / `remove` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local attestation, err = client:Attestation():load({ id = "example_id" })
    if err then error(err) end
    -- attestation is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

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

Create an instance: `local attestation = client:Attestation(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `table` |  |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `device` | `table` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |

#### Example: Load

```lua
local attestation, err = client:Attestation():load({ id = "attestation_id" })
```

#### Example: List

```lua
local attestations, err = client:Attestation():list()
```

#### Example: Create

```lua
local attestation, err = client:Attestation():create({
})
```


### Client

Create an instance: `local client_ = client:Client(nil)`

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
| `contact` | `table` |  |
| `created` | `string` |  |
| `direct_partner` | `table` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `location` | `table` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `table` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local client_, err = client:Client():load({ id = "client_id" })
```

#### Example: List

```lua
local client_s, err = client:Client():list()
```

#### Example: Create

```lua
local client_, err = client:Client():create({
  location = {}, -- table
})
```


### CreateResult

Create an instance: `local create_result = client:CreateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```lua
local create_result, err = client:CreateResult():create({
  device_type = "example_device_type", -- string
  serial_number = "example_serial_number", -- string
})
```


### Decryption

Create an instance: `local decryption = client:Decryption(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```lua
local decryption, err = client:Decryption():create({
})
```


### Device

Create an instance: `local device = client:Device(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `table` |  |
| `activation_date` | `string` |  |
| `alternate_key` | `string` |  |
| `audit_next_date` | `string` |  |
| `audit_notification_date` | `string` |  |
| `client` | `table` |  |
| `created` | `string` |  |
| `created_by` | `table` |  |
| `device_build` | `table` |  |
| `device_state` | `table` |  |
| `device_type` | `table` |  |
| `error_counter` | `number` |  |
| `error_last_date` | `string` |  |
| `id` | `string` |  |
| `initialized_by` | `table` |  |
| `initialized_date` | `string` |  |
| `inject_key` | `table` |  |
| `is_virtual` | `boolean` |  |
| `kif` | `table` |  |
| `last_activity_date` | `string` |  |
| `location` | `table` |  |
| `modified` | `string` |  |
| `modified_by` | `table` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `partner` | `table` |  |
| `serial_number` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local device, err = client:Device():load({ id = "device_id" })
```

#### Example: List

```lua
local devices, err = client:Device():list()
```

#### Example: Create

```lua
local device, err = client:Device():create({
  activated_by = {}, -- table
  created_by = {}, -- table
  initialized_by = {}, -- table
  location = {}, -- table
  modified_by = {}, -- table
})
```


### DeviceBuild

Create an instance: `local device_build = client:DeviceBuild(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `app_version` | `string` |  |
| `build_number` | `string` |  |
| `config_file_name` | `string` |  |
| `created` | `string` |  |
| `device_type` | `string` |  |
| `firmware_version` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `version` | `number` |  |
| `white_listing_bin_range` | `string` |  |
| `white_listing_used` | `boolean` |  |

#### Example: Load

```lua
local device_build, err = client:DeviceBuild():load({ id = "device_build_id" })
```

#### Example: List

```lua
local device_builds, err = client:DeviceBuild():list()
```


### DeviceCustodyDetail

Create an instance: `local device_custody_detail = client:DeviceCustodyDetail(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `table` |  |
| `custodian` | `table` |  |
| `device` | `table` |  |
| `id` | `number` |  |
| `location` | `table` |  |
| `modified` | `string` |  |
| `modified_by` | `table` |  |
| `note` | `string` |  |
| `status` | `table` |  |
| `transfer_method` | `table` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local device_custody_detail, err = client:DeviceCustodyDetail():load({ id = "device_custody_detail_id", device_type = "device_type", serial_number = "serial_number" })
```


### DeviceCustodyList

Create an instance: `local device_custody_list = client:DeviceCustodyList(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `table` |  |
| `custodian` | `table` |  |
| `device` | `table` |  |
| `id` | `number` |  |
| `location` | `table` |  |
| `modified` | `string` |  |
| `modified_by` | `table` |  |
| `note` | `string` |  |
| `status` | `table` |  |
| `transfer_method` | `table` |  |
| `version` | `number` |  |

#### Example: List

```lua
local device_custody_lists, err = client:DeviceCustodyList():list()
```


### DeviceList

Create an instance: `local device_list = client:DeviceList(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `table` |  |
| `total` | `number` |  |

#### Example: Load

```lua
local device_list, err = client:DeviceList():load({ share_partner_to = "share_partner_to" })
```


### DeviceReceiveResult

Create an instance: `local device_receive_result = client:DeviceReceiveResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```lua
local device_receive_result, err = client:DeviceReceiveResult():create({
  success = true, -- boolean
})
```


### DeviceRkiActivateResult

Create an instance: `local device_rki_activate_result = client:DeviceRkiActivateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```lua
local device_rki_activate_result, err = client:DeviceRkiActivateResult():create({
  success = true, -- boolean
})
```


### DeviceState

Create an instance: `local device_state = client:DeviceState(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `number` |  |
| `name` | `string` |  |

#### Example: List

```lua
local device_states, err = client:DeviceState():list()
```


### DeviceType

Create an instance: `local device_type = client:DeviceType(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `device_type_mode` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photo_url` | `string` |  |
| `product_name` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local device_type, err = client:DeviceType():load({ id = "device_type_id" })
```

#### Example: List

```lua
local device_types, err = client:DeviceType():list()
```


### InjectKey

Create an instance: `local inject_key = client:InjectKey(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `is_p2_pe` | `boolean` |  |
| `key_type` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local inject_key, err = client:InjectKey():load({ id = "inject_key_id" })
```

#### Example: List

```lua
local inject_keys, err = client:InjectKey():list()
```


### Kif

Create an instance: `local kif = client:Kif(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `number` |  |
| `name` | `string` |  |

#### Example: List

```lua
local kifs, err = client:Kif():list()
```


### Location

Create an instance: `local location = client:Location(nil)`

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
| `address1` | `string` |  |
| `address2` | `string` |  |
| `billing_id` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `created` | `string` |  |
| `custom_reference` | `string` |  |
| `id` | `string` |  |
| `location_type` | `string` |  |
| `mail_address1` | `string` |  |
| `mail_address2` | `string` |  |
| `mail_city` | `string` |  |
| `mail_country` | `string` |  |
| `mail_postal_code` | `string` |  |
| `mail_state_province` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `name_of_business` | `string` |  |
| `note` | `string` |  |
| `postal_code` | `string` |  |
| `state_province` | `string` |  |
| `unique_id` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local location, err = client:Location():load({ id = "location_id" })
```

#### Example: List

```lua
local locations, err = client:Location():list()
```

#### Example: Create

```lua
local location, err = client:Location():create({
})
```


### Partner

Create an instance: `local partner = client:Partner(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client_can_order_equipment` | `boolean` |  |
| `contact` | `table` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `location` | `table` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `table` |  |
| `partner_id` | `string` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local partner, err = client:Partner():load({ id = "partner_id" })
```

#### Example: List

```lua
local partners, err = client:Partner():list()
```

#### Example: Create

```lua
local partner, err = client:Partner():create({
  location = {}, -- table
})
```


### Shipment

Create an instance: `local shipment = client:Shipment(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `table` |  |
| `created` | `string` |  |
| `date_received` | `string` |  |
| `date_shipped` | `string` |  |
| `dc_kif` | `table` |  |
| `id` | `string` |  |
| `item` | `table` |  |
| `kif` | `table` |  |
| `modified` | `string` |  |
| `partner` | `table` |  |
| `shipment_type` | `string` |  |
| `tracking` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local shipment, err = client:Shipment():load({ id = "shipment_id" })
```

#### Example: List

```lua
local shipments, err = client:Shipment():list()
```

#### Example: Create

```lua
local shipment, err = client:Shipment():create({
})
```


### Success

Create an instance: `local success = client:Success(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```lua
local success, err = client:Success():create({
  share_partner_to = "example_share_partner_to", -- string
})
```


### Transaction

Create an instance: `local transaction = client:Transaction(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `string` |  |
| `client` | `table` |  |
| `client_ref` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `number` |  |
| `device_name` | `string` |  |
| `direct_partner` | `table` |  |
| `encrypted` | `number` |  |
| `end_date` | `string` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `string` |  |
| `ip_address` | `string` |  |
| `is_virtual` | `boolean` |  |
| `key_type` | `string` |  |
| `location` | `table` |  |
| `message_id` | `string` |  |
| `method` | `string` |  |
| `partner` | `table` |  |
| `reference` | `string` |  |
| `serial_number` | `string` |  |
| `start_date` | `string` |  |
| `success` | `boolean` |  |
| `transaction_source` | `string` |  |

#### Example: Load

```lua
local transaction, err = client:Transaction():load({ id = "transaction_id" })
```

#### Example: List

```lua
local transactions, err = client:Transaction():list()
```

#### Example: Create

```lua
local transaction, err = client:Transaction():create({
  location = {}, -- table
})
```


### UpdateResult

Create an instance: `local update_result = client:UpdateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `table` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `kif` | `table` |  |
| `last_name` | `string` |  |
| `partner` | `table` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `table` |  |
| `version` | `number` |  |

#### Example: List

```lua
local update_results, err = client:UpdateResult():list()
```

#### Example: Create

```lua
local update_result, err = client:UpdateResult():create({
})
```


### User

Create an instance: `local user = client:User(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `table` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `kif` | `table` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `table` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `table` |  |
| `version` | `number` |  |

#### Example: Load

```lua
local user, err = client:User():load({ id = "user_id" })
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

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── bluefin-decryptx-p2pe_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`bluefin-decryptx-p2pe_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```lua
local devicetype = client:DeviceType()
devicetype:list()

-- devicetype:data_get() now returns the devicetype data from the last list
-- devicetype:match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
