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
  print(item["id"], item["completeDate"])
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
local created, err = client:Attestation():create({ client = {}, completeDate = "example_completeDate" })
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
| `client` | Reference to the associated Client resource. |
| `completeDate` | The date and time that the Attestation took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `name` | Text describing the attestation. |
| `notes` | Free form field that allows the Client associate notes with the Attestation. |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `directPartner` | Reference to the associated Partner. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Client account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | Last modified timestamp. |
| `name` | The Client's name. |
| `partner` | Reference to the Client's root Partner. |
| `version` | The number of times that this resource has been updated. |

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
| `success` | true if the payload decryption was successful. |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `activatedBy` | Reference to the associated User resource. |
| `activationDate` | Timestamp from when the Device was activated. |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `deviceBuild` | Reference to the associated Device Build resource. |
| `deviceState` | Reference to the associated Device State resource. |
| `deviceType` | Reference to the associated Device Type resource. |
| `errorCounter` | The number times the Device has been in error. |
| `errorLastDate` | Timestamp from the last time that the Device had an error. |
| `id` | The Device's unique identifier. |
| `initializedBy` | Reference to the associated User resource. |
| `initializedDate` | Timestamp from when the Device was initialized. |
| `injectKey` | Reference to the associated Device resource. |
| `isVirtual` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | Reference to the associated KIF resource. |
| `lastActivityDate` | Timestamp from the last time that the Device was used. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `name` | The Device's name. |
| `notes` | Arbitary note that can be attached to a Device entry. |
| `partner` | Reference to the associated Partner. |
| `serialNumber` | The Device's serial number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | The Build Number. |
| `configFileName` | The name of the configuration file that is uploaded to the device. |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceType` | The Device Type Name. |
| `firmwareVersion` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | A list of hardware versions that this Device Build covers. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | Last modified timestamp. |
| `name` | The Device Builds's name. |
| `notes` | Notes attached to the device build by Bluefin CISO. |
| `version` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` | The date and time that the Custody change took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `createdBy` | Reference to the associated User resource. |
| `custodian` | Reference to the associated User resource. |
| `device` | Reference to the associated Device resource. |
| `id` | This resource's unique identifier. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `modifiedBy` | Reference to the associated User resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | Reference to the associated Custody Status. |
| `transferMethod` | Reference to the associated Transfer Method. |
| `version` | The number of times that this resource has been updated. |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the action succeeded. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the RKI activation succeeded. |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` | Unique identifier for this Device state. |
| `name` | Descriptive name for this Device state. |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | The Device type. |
| `hardwareVersion` | The Device hardware version. |
| `id` | Unique idenifier. |
| `isActive` | This property indicates if the DeviceType is active. |
| `manufacturer` | The Device manufacturer. |
| `model` | The Device model. |
| `modified` | Last modified timestamp. |
| `name` | The DeviceType name. |
| `photoUrl` |  |
| `productName` | The Device name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | unique idenifier |
| `isActive` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | The cipher type that the key works with. |
| `modified` | Last modified timestamp in ISO 8601 format. |
| `name` | Key name. |
| `version` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` | This resource's unique identifier. |
| `name` | The KIF's name. |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `address1` | The Location's street address. |
| `address2` | The Location's street address. |
| `billingId` | \? |
| `city` | The Location's city. |
| `country` | The Location's country. |
| `created` | Creation timestamp in ISO 8601 format. |
| `customReference` | A Partner specified reference for a location. |
| `id` | This resource's unique identifier. |
| `locationType` | The Location's clasification. |
| `mailAddress1` | The Location's street address. |
| `mailAddress2` | The Location's street address. |
| `mailCity` | The Location's city. |
| `mailCountry` | The Location's street address. |
| `mailPostalCode` | The Location's postal code. |
| `mailStateProvince` | The Location's street state or province. |
| `modified` | Last modified timestamp. |
| `name` | The Location's name. |
| `nameOfBusiness` | The name of the business at this location. |
| `notes` | Note for delivery driver. |
| `postalCode` | The Location's postal code. |
| `stateProvince` | The Location's street state or province. |
| `uniqueId` | Unique Identifier for the Location. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | Reference to the associated User resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the Parter account is active or disabled. |
| `location` | Reference to the associated Location resource. |
| `modified` | Last modified timestamp. |
| `name` | The Partner's name. |
| `parent` | Reference to the associated Partner. |
| `partnerId` | The Partner's id. |
| `reference` | The Partner's reference string. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` | The name of the courier. |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | The date and time that a package is recieved. |
| `dateShipped` | The date and time that a package is shipped. |
| `dcKif` | Reference to the associated KIF resource. |
| `id` | This resource's unique identifier. |
| `items` |  |
| `kif` | Reference to the associated KIF resource. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `shipmentType` | The type of shipment. |
| `tracking` | The courier's tracking number. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` | Indicates if the action was a success. |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | Reference to the associated Client resource. |
| `clientRef` | Client Reference property that is included in the decrypt API call. |
| `created` | Creation timestamp in ISO 8601 format. |
| `decrypted` | A Transcation can process muliple decryptions. |
| `deviceName` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | Reference to the associated Partner. |
| `encrypted` | A Transcation can process muliple encryptions. |
| `endDate` | Timestamp from the end of the transaction. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | This resource's unique identifier. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | The type of cipher used during decrytion. |
| `location` | Reference to the associated Location resource. |
| `messageId` | Message ID. |
| `method` | The decryption cypher/method. |
| `partner` | Reference to the associated Partner. |
| `reference` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | Timestamp from the beginning of the transaction. |
| `success` | The success indicator. |
| `transactionSource` | The source of the Transaction. |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | ID of newly created resource |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `created` | Creation timestamp in ISO 8601 format. |
| `email` | The User's email address. |
| `firstName` | The User's name. |
| `id` | This resource's unique identifier. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `modified` | Last modified timestamp. |
| `partner` | Reference to the associated Partner. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `version` | The number of times that this resource has been updated. |

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
| `client` | `table` | Reference to the associated Client resource. |
| `completeDate` | `string` | The date and time that the Attestation took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `device` | `table` | Reference to the associated Device resource. |
| `id` | `string` | This resource's unique identifier. |
| `name` | `string` | Text describing the attestation. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `table` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `table` | Reference to the associated Partner. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the Client account is active or disabled. |
| `location` | `table` | Reference to the associated Location resource. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `table` | Reference to the Client's root Partner. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `success` | `boolean` | true if the payload decryption was successful. |

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
| `activatedBy` | `table` | Reference to the associated User resource. |
| `activationDate` | `string` | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `table` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `table` | Reference to the associated User resource. |
| `deviceBuild` | `table` | Reference to the associated Device Build resource. |
| `deviceState` | `table` | Reference to the associated Device State resource. |
| `deviceType` | `table` | Reference to the associated Device Type resource. |
| `errorCounter` | `number` | The number times the Device has been in error. |
| `errorLastDate` | `string` | Timestamp from the last time that the Device had an error. |
| `id` | `string` | The Device's unique identifier. |
| `initializedBy` | `table` | Reference to the associated User resource. |
| `initializedDate` | `string` | Timestamp from when the Device was initialized. |
| `injectKey` | `table` | Reference to the associated Device resource. |
| `isVirtual` | `boolean` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `table` | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | Timestamp from the last time that the Device was used. |
| `location` | `table` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `table` | Reference to the associated User resource. |
| `name` | `string` | The Device's name. |
| `notes` | `string` | Arbitary note that can be attached to a Device entry. |
| `partner` | `table` | Reference to the associated Partner. |
| `serialNumber` | `string` | The Device's serial number. |
| `version` | `number` | The number of times that this resource has been updated. |

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
  activatedBy = {}, -- table
  createdBy = {}, -- table
  initializedBy = {}, -- table
  location = {}, -- table
  modifiedBy = {}, -- table
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
| `appVersion` | `string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | The Build Number. |
| `configFileName` | `string` | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | The Device Type Name. |
| `firmwareVersion` | `string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | A list of hardware versions that this Device Build covers. |
| `id` | `number` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Device Builds's name. |
| `notes` | `string` | Notes attached to the device build by Bluefin CISO. |
| `version` | `number` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `table` | Reference to the associated User resource. |
| `custodian` | `table` | Reference to the associated User resource. |
| `device` | `table` | Reference to the associated Device resource. |
| `id` | `number` | This resource's unique identifier. |
| `location` | `table` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `table` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `table` | Reference to the associated Custody Status. |
| `transferMethod` | `table` | Reference to the associated Transfer Method. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `table` | Reference to the associated User resource. |
| `custodian` | `table` | Reference to the associated User resource. |
| `device` | `table` | Reference to the associated Device resource. |
| `id` | `number` | This resource's unique identifier. |
| `location` | `table` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `table` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `table` | Reference to the associated Custody Status. |
| `transferMethod` | `table` | Reference to the associated Transfer Method. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `data` | `table` | List of Devices. |
| `total` | `number` | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `boolean` | Indicates if the action succeeded. |

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
| `success` | `boolean` | Indicates if the RKI activation succeeded. |

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
| `id` | `number` | Unique identifier for this Device state. |
| `name` | `string` | Descriptive name for this Device state. |

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
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | The Device type. |
| `hardwareVersion` | `string` | The Device hardware version. |
| `id` | `string` | Unique idenifier. |
| `isActive` | `boolean` | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | The Device manufacturer. |
| `model` | `string` | The Device model. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The DeviceType name. |
| `photoUrl` | `string` |  |
| `productName` | `string` | The Device name. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | unique idenifier |
| `isActive` | `boolean` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | The cipher type that the key works with. |
| `modified` | `string` | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | Key name. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `id` | `number` | This resource's unique identifier. |
| `name` | `string` | The KIF's name. |

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
| `address1` | `string` | The Location's street address. |
| `address2` | `string` | The Location's street address. |
| `billingId` | `string` | \? |
| `city` | `string` | The Location's city. |
| `country` | `string` | The Location's country. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | A Partner specified reference for a location. |
| `id` | `string` | This resource's unique identifier. |
| `locationType` | `string` | The Location's clasification. |
| `mailAddress1` | `string` | The Location's street address. |
| `mailAddress2` | `string` | The Location's street address. |
| `mailCity` | `string` | The Location's city. |
| `mailCountry` | `string` | The Location's street address. |
| `mailPostalCode` | `string` | The Location's postal code. |
| `mailStateProvince` | `string` | The Location's street state or province. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Location's name. |
| `nameOfBusiness` | `string` | The name of the business at this location. |
| `notes` | `string` | Note for delivery driver. |
| `postalCode` | `string` | The Location's postal code. |
| `stateProvince` | `string` | The Location's street state or province. |
| `uniqueId` | `string` | Unique Identifier for the Location. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `table` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the Parter account is active or disabled. |
| `location` | `table` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `table` | Reference to the associated Partner. |
| `partnerId` | `string` | The Partner's id. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `carrier` | `string` | The name of the courier. |
| `client` | `table` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | The date and time that a package is recieved. |
| `dateShipped` | `string` | The date and time that a package is shipped. |
| `dcKif` | `table` | Reference to the associated KIF resource. |
| `id` | `string` | This resource's unique identifier. |
| `items` | `table` |  |
| `kif` | `table` | Reference to the associated KIF resource. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `table` | Reference to the associated Partner. |
| `shipmentType` | `string` | The type of shipment. |
| `tracking` | `string` | The courier's tracking number. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `success` | `boolean` | Indicates if the action was a success. |

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
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `table` | Reference to the associated Client resource. |
| `clientRef` | `string` | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `number` | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `table` | Reference to the associated Partner. |
| `encrypted` | `number` | A Transcation can process muliple encryptions. |
| `endDate` | `string` | Timestamp from the end of the transaction. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | The type of cipher used during decrytion. |
| `location` | `table` | Reference to the associated Location resource. |
| `messageId` | `string` | Message ID. |
| `method` | `string` | The decryption cypher/method. |
| `partner` | `table` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | Timestamp from the beginning of the transaction. |
| `success` | `boolean` | The success indicator. |
| `transactionSource` | `string` | The source of the Transaction. |

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
| `client` | `table` | Reference to the associated Client resource. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | ID of newly created resource |
| `isActive` | `boolean` | This property indicates if the User account is active or disabled. |
| `kif` | `table` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `partner` | `table` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `table` | Reference to the associated User Role. |
| `version` | `number` | The number of times that this resource has been updated. |

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
| `client` | `table` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `boolean` | This property indicates if the User account is active or disabled. |
| `kif` | `table` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `table` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `table` | Reference to the associated User Role. |
| `version` | `number` | The number of times that this resource has been updated. |

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
