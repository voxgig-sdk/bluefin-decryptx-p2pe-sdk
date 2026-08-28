# BluefinDecryptxP2pe Elixir SDK



The Elixir SDK for the BluefinDecryptxP2pe API — an entity-oriented client
following idiomatic, functional Elixir conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `BluefinDecryptxP2pe.attestation(sdk)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to [Hex](https://hex.pm). Install it from
the GitHub release tag (`elixir/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases))
by adding a git dependency to your `mix.exs`:

```elixir
def deps do
  [
    {:bluefin_decryptx_p2pe, git: "https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk.git", tag: "elixir/vX.Y.Z"}
  ]
end
```

Or from a local source checkout:

```elixir
def deps do
  [
    {:bluefin_decryptx_p2pe, path: "../bluefin-decryptx-p2pe-sdk/elixir"}
  ]
end
```

Then run `mix deps.get`.


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```elixir
alias BluefinDecryptxP2pe.Helpers, as: H

sdk = BluefinDecryptxP2pe.new(H.deep(%{"apikey" => System.get_env("BLUEFIN_DECRYPTX_P2PE_APIKEY")}))
```

### 2. List attestation records

`list/2` returns a list value node and raises on error.

```elixir
try do
  attestation = BluefinDecryptxP2pe.attestation(sdk)
  records = BluefinDecryptxP2pe.Entity.Attestation.list(attestation)
  IO.inspect(records)
rescue
  err -> IO.puts("list failed: " <> inspect(err))
end
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load/2` returns the bare record and raises on error.

```elixir
try do
  device_custody_detail = BluefinDecryptxP2pe.device_custody_detail(sdk)
  record = BluefinDecryptxP2pe.Entity.DeviceCustodyDetail.load(device_custody_detail, H.deep(%{"device_type" => "example_device_type", "serial_number" => "example_serial_number", "id" => "example_id"}))
  IO.inspect(record)
rescue
  err -> IO.puts("load failed: " <> inspect(err))
end
```

### 4. Create, update, and remove

```elixir
attestation = BluefinDecryptxP2pe.attestation(sdk)

# Create — returns the bare created record
created = BluefinDecryptxP2pe.Entity.Attestation.create(attestation, H.deep(%{"client" => %{}, "completeDate" => "example_completeDate"}))

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const devicetypes = await client.DeviceType().list()
  console.log(devicetypes)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity operations. `direct/2` never raises —
it returns a result node you branch on with `Voxgig.Struct.getprop/2`:

```elixir
alias Voxgig.Struct, as: S
alias BluefinDecryptxP2pe.Helpers, as: H

result = BluefinDecryptxP2pe.direct(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => %{"id" => "example"}
}))

if S.getprop(result, "ok") do
  IO.inspect(S.getprop(result, "status"))  # 200
  IO.inspect(S.getprop(result, "data"))    # response body
else
  # A non-2xx response carries status + data (the error body); a
  # transport-level failure carries err instead.
  IO.inspect(S.getprop(result, "err"))
end
```

### Prepare a request without sending it

```elixir
alias BluefinDecryptxP2pe.Helpers, as: H

# prepare/2 returns the fetch definition and raises on error.
fetchdef = BluefinDecryptxP2pe.prepare(sdk, H.deep(%{
  "path" => "/api/resource/{id}",
  "method" => "DELETE",
  "params" => %{"id" => "example"}
}))

IO.inspect(Voxgig.Struct.getprop(fetchdef, "url"))
IO.inspect(Voxgig.Struct.getprop(fetchdef, "method"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```elixir
alias BluefinDecryptxP2pe.Helpers, as: H

sdk = BluefinDecryptxP2pe.test()

# Entity ops return the bare record (raise on error).
device_type = BluefinDecryptxP2pe.device_type(sdk)
records = BluefinDecryptxP2pe.Entity.DeviceType.list(device_type, H.deep(%{}))
IO.inspect(records)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. It receives `(url,
fetchdef)` and returns a `{response, error}` tuple:

```elixir
alias Voxgig.Struct, as: S
alias BluefinDecryptxP2pe.Helpers, as: H

mock_fetch = fn _url, _fetchdef ->
  response = H.deep(%{
    "status" => 200,
    "statusText" => "OK",
    "headers" => %{},
    "json" => fn -> %{"id" => "mock01"} end
  })
  {response, nil}
end

sdk = BluefinDecryptxP2pe.new(H.deep(%{
  "base" => "http://localhost:8080",
  "system" => %{"fetch" => mock_fetch}
}))
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd elixir && mix test
```


## Reference

### BluefinDecryptxP2pe

```elixir
sdk = BluefinDecryptxP2pe.new(options)
```

Creates a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinDecryptxP2pe.Helpers.deep/1`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL of the API server. |
| `prefix` | `String.t()` | URL path prefix prepended to all requests. |
| `suffix` | `String.t()` | URL path suffix appended to all requests. |
| `feature` | `map()` | Feature activation flags. |
| `extend` | `list()` | Additional feature instances to load. |
| `system` | `map()` | System overrides (e.g. custom `fetch` function). |

### test

```elixir
sdk = BluefinDecryptxP2pe.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinDecryptxP2pe functions

| Function | Signature | Description |
| --- | --- | --- |
| `options_map` | `(client) :: map()` | Deep copy of current SDK options. |
| `get_utility` | `(client) :: map()` | The SDK utility node. |
| `prepare` | `(client, fetchargs) :: map()` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client, fetchargs) :: map()` | Build and send an HTTP request. Returns a result node (branch on `ok`). |
| `attestation` | `(client, entopts \\ nil) :: entity` | Create an Attestation entity handle. |
| `client` | `(client, entopts \\ nil) :: entity` | Create a Client entity handle. |
| `create_result` | `(client, entopts \\ nil) :: entity` | Create a CreateResult entity handle. |
| `decryption` | `(client, entopts \\ nil) :: entity` | Create a Decryption entity handle. |
| `device` | `(client, entopts \\ nil) :: entity` | Create a Device entity handle. |
| `device_build` | `(client, entopts \\ nil) :: entity` | Create a DeviceBuild entity handle. |
| `device_custody_detail` | `(client, entopts \\ nil) :: entity` | Create a DeviceCustodyDetail entity handle. |
| `device_custody_list` | `(client, entopts \\ nil) :: entity` | Create a DeviceCustodyList entity handle. |
| `device_list` | `(client, entopts \\ nil) :: entity` | Create a DeviceList entity handle. |
| `device_receive_result` | `(client, entopts \\ nil) :: entity` | Create a DeviceReceiveResult entity handle. |
| `device_rki_activate_result` | `(client, entopts \\ nil) :: entity` | Create a DeviceRkiActivateResult entity handle. |
| `device_state` | `(client, entopts \\ nil) :: entity` | Create a DeviceState entity handle. |
| `device_type` | `(client, entopts \\ nil) :: entity` | Create a DeviceType entity handle. |
| `inject_key` | `(client, entopts \\ nil) :: entity` | Create an InjectKey entity handle. |
| `kif` | `(client, entopts \\ nil) :: entity` | Create a Kif entity handle. |
| `location` | `(client, entopts \\ nil) :: entity` | Create a Location entity handle. |
| `partner` | `(client, entopts \\ nil) :: entity` | Create a Partner entity handle. |
| `shipment` | `(client, entopts \\ nil) :: entity` | Create a Shipment entity handle. |
| `success` | `(client, entopts \\ nil) :: entity` | Create a Success entity handle. |
| `transaction` | `(client, entopts \\ nil) :: entity` | Create a Transaction entity handle. |
| `update_result` | `(client, entopts \\ nil) :: entity` | Create an UpdateResult entity handle. |
| `user` | `(client, entopts \\ nil) :: entity` | Create an User entity handle. |

### Entity interface

Every entity's `BluefinDecryptxP2pe.Entity.<Name>` module shares the same interface.

| Function | Signature | Description |
| --- | --- | --- |
| `load` | `(entity, reqmatch, ctrl \\ nil) :: map()` | Load a single entity by match criteria. Raises on error. |
| `list` | `(entity, reqmatch \\ nil, ctrl \\ nil) :: list()` | List entities matching the criteria. Raises on error. |
| `create` | `(entity, reqdata, ctrl \\ nil) :: map()` | Create a new entity. Raises on error. |
| `update` | `(entity, reqdata, ctrl \\ nil) :: map()` | Update an existing entity. Raises on error. |
| `remove` | `(entity, reqmatch \\ nil, ctrl \\ nil) :: map()` | Remove an entity. Raises on error. |
| `data_get` | `(entity) :: map()` | Get entity data. |
| `data_set` | `(entity, data)` | Set entity data. |
| `match_get` | `(entity) :: map()` | Get entity match criteria. |
| `match_set` | `(entity, match)` | Set entity match criteria. |
| `make` | `(entity) :: entity` | Create a new handle with the same options. |
| `get_name` | `(entity) :: String.t()` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a value node — a map for
single-entity ops, a list for `list`) and raise a `BluefinDecryptxP2pe.Error` on
failure. Wrap calls in `try`/`rescue` to handle errors.

The `direct/2` escape hatch never raises — it returns a result node you
branch on via `Voxgig.Struct.getprop(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean()` | `true` if the HTTP status is 2xx. |
| `status` | `integer()` | HTTP status code. |
| `headers` | `map()` | Response headers. |
| `data` | `any()` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

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

Every operation lives on the entity's `BluefinDecryptxP2pe.Entity.<Name>` module and
takes an entity handle built from the client:


### Attestation

Create a handle: `attestation = BluefinDecryptxP2pe.attestation(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map()` | Reference to the associated Client resource. |
| `completeDate` | `String.t()` | The date and time that the Attestation took place. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `device` | `map()` | Reference to the associated Device resource. |
| `id` | `String.t()` | This resource's unique identifier. |
| `name` | `String.t()` | Text describing the attestation. |
| `notes` | `String.t()` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```elixir
attestation = BluefinDecryptxP2pe.attestation(sdk)
record = BluefinDecryptxP2pe.Entity.Attestation.load(attestation, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "attestation_id"}))
```

#### Example: List

```elixir
attestation = BluefinDecryptxP2pe.attestation(sdk)
records = BluefinDecryptxP2pe.Entity.Attestation.list(attestation)
```

#### Example: Create

```elixir
attestation = BluefinDecryptxP2pe.attestation(sdk)
record = BluefinDecryptxP2pe.Entity.Attestation.create(attestation, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```


### Client

Create a handle: `client = BluefinDecryptxP2pe.client(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `map()` | Reference to the associated User resource. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map()` | Reference to the associated Partner. |
| `id` | `String.t()` | This resource's unique identifier. |
| `isActive` | `boolean()` | This property indicates if the Client account is active or disabled. |
| `location` | `map()` | Reference to the associated Location resource. |
| `mid` | `String.t()` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The Client's name. |
| `partner` | `map()` | Reference to the Client's root Partner. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
client = BluefinDecryptxP2pe.client(sdk)
record = BluefinDecryptxP2pe.Entity.Client.load(client, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "client_id"}))
```

#### Example: List

```elixir
client = BluefinDecryptxP2pe.client(sdk)
records = BluefinDecryptxP2pe.Entity.Client.list(client)
```

#### Example: Create

```elixir
client = BluefinDecryptxP2pe.client(sdk)
record = BluefinDecryptxP2pe.Entity.Client.create(client, BluefinDecryptxP2pe.Helpers.deep(%{
  "location" => %{},  # map()
}))
```


### CreateResult

Create a handle: `create_result = BluefinDecryptxP2pe.create_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Example: Create

```elixir
create_result = BluefinDecryptxP2pe.create_result(sdk)
record = BluefinDecryptxP2pe.Entity.CreateResult.create(create_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "device_type" => "example_device_type",  # String.t()
  "serial_number" => "example_serial_number",  # String.t()
}))
```


### Decryption

Create a handle: `decryption = BluefinDecryptxP2pe.decryption(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean()` | true if the payload decryption was successful. |

#### Example: Create

```elixir
decryption = BluefinDecryptxP2pe.decryption(sdk)
record = BluefinDecryptxP2pe.Entity.Decryption.create(decryption, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```


### Device

Create a handle: `device = BluefinDecryptxP2pe.device(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `map()` | Reference to the associated User resource. |
| `activationDate` | `String.t()` | Timestamp from when the Device was activated. |
| `alternateKey` | `String.t()` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String.t()` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String.t()` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `map()` | Reference to the associated Client resource. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map()` | Reference to the associated User resource. |
| `deviceBuild` | `map()` | Reference to the associated Device Build resource. |
| `deviceState` | `map()` | Reference to the associated Device State resource. |
| `deviceType` | `map()` | Reference to the associated Device Type resource. |
| `errorCounter` | `integer()` | The number times the Device has been in error. |
| `errorLastDate` | `String.t()` | Timestamp from the last time that the Device had an error. |
| `id` | `String.t()` | The Device's unique identifier. |
| `initializedBy` | `map()` | Reference to the associated User resource. |
| `initializedDate` | `String.t()` | Timestamp from when the Device was initialized. |
| `injectKey` | `map()` | Reference to the associated Device resource. |
| `isVirtual` | `boolean()` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `map()` | Reference to the associated KIF resource. |
| `lastActivityDate` | `String.t()` | Timestamp from the last time that the Device was used. |
| `location` | `map()` | Reference to the associated Location resource. |
| `modified` | `String.t()` | Last modified timestamp. |
| `modifiedBy` | `map()` | Reference to the associated User resource. |
| `name` | `String.t()` | The Device's name. |
| `notes` | `String.t()` | Arbitary note that can be attached to a Device entry. |
| `partner` | `map()` | Reference to the associated Partner. |
| `serialNumber` | `String.t()` | The Device's serial number. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
device = BluefinDecryptxP2pe.device(sdk)
record = BluefinDecryptxP2pe.Entity.Device.load(device, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_id"}))
```

#### Example: List

```elixir
device = BluefinDecryptxP2pe.device(sdk)
records = BluefinDecryptxP2pe.Entity.Device.list(device)
```

#### Example: Create

```elixir
device = BluefinDecryptxP2pe.device(sdk)
record = BluefinDecryptxP2pe.Entity.Device.create(device, BluefinDecryptxP2pe.Helpers.deep(%{
  "activatedBy" => %{},  # map()
  "createdBy" => %{},  # map()
  "initializedBy" => %{},  # map()
  "location" => %{},  # map()
  "modifiedBy" => %{},  # map()
}))
```


### DeviceBuild

Create a handle: `device_build = BluefinDecryptxP2pe.device_build(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `String.t()` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String.t()` | The Build Number. |
| `configFileName` | `String.t()` | The name of the configuration file that is uploaded to the device. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String.t()` | The Device Type Name. |
| `firmwareVersion` | `String.t()` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String.t()` | A list of hardware versions that this Device Build covers. |
| `id` | `integer()` | This resource's unique identifier. |
| `isActive` | `boolean()` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The Device Builds's name. |
| `notes` | `String.t()` | Notes attached to the device build by Bluefin CISO. |
| `version` | `integer()` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String.t()` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean()` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```elixir
device_build = BluefinDecryptxP2pe.device_build(sdk)
record = BluefinDecryptxP2pe.Entity.DeviceBuild.load(device_build, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_build_id"}))
```

#### Example: List

```elixir
device_build = BluefinDecryptxP2pe.device_build(sdk)
records = BluefinDecryptxP2pe.Entity.DeviceBuild.list(device_build)
```


### DeviceCustodyDetail

Create a handle: `device_custody_detail = BluefinDecryptxP2pe.device_custody_detail(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String.t()` | The date and time that the Custody change took place. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map()` | Reference to the associated User resource. |
| `custodian` | `map()` | Reference to the associated User resource. |
| `device` | `map()` | Reference to the associated Device resource. |
| `id` | `integer()` | This resource's unique identifier. |
| `location` | `map()` | Reference to the associated Location resource. |
| `modified` | `String.t()` | Last modified timestamp. |
| `modifiedBy` | `map()` | Reference to the associated User resource. |
| `notes` | `String.t()` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map()` | Reference to the associated Custody Status. |
| `transferMethod` | `map()` | Reference to the associated Transfer Method. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
device_custody_detail = BluefinDecryptxP2pe.device_custody_detail(sdk)
record = BluefinDecryptxP2pe.Entity.DeviceCustodyDetail.load(device_custody_detail, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_custody_detail_id", "device_type" => "device_type", "serial_number" => "serial_number"}))
```


### DeviceCustodyList

Create a handle: `device_custody_list = BluefinDecryptxP2pe.device_custody_list(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String.t()` | The date and time that the Custody change took place. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map()` | Reference to the associated User resource. |
| `custodian` | `map()` | Reference to the associated User resource. |
| `device` | `map()` | Reference to the associated Device resource. |
| `id` | `integer()` | This resource's unique identifier. |
| `location` | `map()` | Reference to the associated Location resource. |
| `modified` | `String.t()` | Last modified timestamp. |
| `modifiedBy` | `map()` | Reference to the associated User resource. |
| `notes` | `String.t()` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map()` | Reference to the associated Custody Status. |
| `transferMethod` | `map()` | Reference to the associated Transfer Method. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: List

```elixir
device_custody_list = BluefinDecryptxP2pe.device_custody_list(sdk)
records = BluefinDecryptxP2pe.Entity.DeviceCustodyList.list(device_custody_list)
```


### DeviceList

Create a handle: `device_list = BluefinDecryptxP2pe.device_list(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `list()` | List of Devices. |
| `total` | `integer()` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```elixir
device_list = BluefinDecryptxP2pe.device_list(sdk)
record = BluefinDecryptxP2pe.Entity.DeviceList.load(device_list, BluefinDecryptxP2pe.Helpers.deep(%{"share_partner_to" => "share_partner_to"}))
```


### DeviceReceiveResult

Create a handle: `device_receive_result = BluefinDecryptxP2pe.device_receive_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean()` | Indicates if the action succeeded. |

#### Example: Create

```elixir
device_receive_result = BluefinDecryptxP2pe.device_receive_result(sdk)
record = BluefinDecryptxP2pe.Entity.DeviceReceiveResult.create(device_receive_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "success" => true,  # boolean()
}))
```


### DeviceRkiActivateResult

Create a handle: `device_rki_activate_result = BluefinDecryptxP2pe.device_rki_activate_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean()` | Indicates if the RKI activation succeeded. |

#### Example: Create

```elixir
device_rki_activate_result = BluefinDecryptxP2pe.device_rki_activate_result(sdk)
record = BluefinDecryptxP2pe.Entity.DeviceRkiActivateResult.create(device_rki_activate_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "success" => true,  # boolean()
}))
```


### DeviceState

Create a handle: `device_state = BluefinDecryptxP2pe.device_state(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer()` | Unique identifier for this Device state. |
| `name` | `String.t()` | Descriptive name for this Device state. |

#### Example: List

```elixir
device_state = BluefinDecryptxP2pe.device_state(sdk)
records = BluefinDecryptxP2pe.Entity.DeviceState.list(device_state)
```


### DeviceType

Create a handle: `device_type = BluefinDecryptxP2pe.device_type(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String.t()` | The Device type. |
| `hardwareVersion` | `String.t()` | The Device hardware version. |
| `id` | `String.t()` | Unique idenifier. |
| `isActive` | `boolean()` | This property indicates if the DeviceType is active. |
| `manufacturer` | `String.t()` | The Device manufacturer. |
| `model` | `String.t()` | The Device model. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The DeviceType name. |
| `photoUrl` | `String.t()` |  |
| `productName` | `String.t()` | The Device name. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
device_type = BluefinDecryptxP2pe.device_type(sdk)
record = BluefinDecryptxP2pe.Entity.DeviceType.load(device_type, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_type_id"}))
```

#### Example: List

```elixir
device_type = BluefinDecryptxP2pe.device_type(sdk)
records = BluefinDecryptxP2pe.Entity.DeviceType.list(device_type)
```


### InjectKey

Create a handle: `inject_key = BluefinDecryptxP2pe.inject_key(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `id` | `String.t()` | unique idenifier |
| `isActive` | `boolean()` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean()` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String.t()` | The cipher type that the key works with. |
| `modified` | `String.t()` | Last modified timestamp in ISO 8601 format. |
| `name` | `String.t()` | Key name. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
inject_key = BluefinDecryptxP2pe.inject_key(sdk)
record = BluefinDecryptxP2pe.Entity.InjectKey.load(inject_key, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "inject_key_id"}))
```

#### Example: List

```elixir
inject_key = BluefinDecryptxP2pe.inject_key(sdk)
records = BluefinDecryptxP2pe.Entity.InjectKey.list(inject_key)
```


### Kif

Create a handle: `kif = BluefinDecryptxP2pe.kif(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `list(entity)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `integer()` | This resource's unique identifier. |
| `name` | `String.t()` | The KIF's name. |

#### Example: List

```elixir
kif = BluefinDecryptxP2pe.kif(sdk)
records = BluefinDecryptxP2pe.Entity.Kif.list(kif)
```


### Location

Create a handle: `location = BluefinDecryptxP2pe.location(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `String.t()` | The Location's street address. |
| `address2` | `String.t()` | The Location's street address. |
| `billingId` | `String.t()` | \? |
| `city` | `String.t()` | The Location's city. |
| `country` | `String.t()` | The Location's country. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `customReference` | `String.t()` | A Partner specified reference for a location. |
| `id` | `String.t()` | This resource's unique identifier. |
| `locationType` | `String.t()` | The Location's clasification. |
| `mailAddress1` | `String.t()` | The Location's street address. |
| `mailAddress2` | `String.t()` | The Location's street address. |
| `mailCity` | `String.t()` | The Location's city. |
| `mailCountry` | `String.t()` | The Location's street address. |
| `mailPostalCode` | `String.t()` | The Location's postal code. |
| `mailStateProvince` | `String.t()` | The Location's street state or province. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The Location's name. |
| `nameOfBusiness` | `String.t()` | The name of the business at this location. |
| `notes` | `String.t()` | Note for delivery driver. |
| `postalCode` | `String.t()` | The Location's postal code. |
| `stateProvince` | `String.t()` | The Location's street state or province. |
| `uniqueId` | `String.t()` | Unique Identifier for the Location. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
location = BluefinDecryptxP2pe.location(sdk)
record = BluefinDecryptxP2pe.Entity.Location.load(location, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "location_id"}))
```

#### Example: List

```elixir
location = BluefinDecryptxP2pe.location(sdk)
records = BluefinDecryptxP2pe.Entity.Location.list(location)
```

#### Example: Create

```elixir
location = BluefinDecryptxP2pe.location(sdk)
record = BluefinDecryptxP2pe.Entity.Location.create(location, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```


### Partner

Create a handle: `partner = BluefinDecryptxP2pe.partner(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String.t()` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean()` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `map()` | Reference to the associated User resource. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `id` | `String.t()` | This resource's unique identifier. |
| `isActive` | `boolean()` | This property indicates if the Parter account is active or disabled. |
| `location` | `map()` | Reference to the associated Location resource. |
| `modified` | `String.t()` | Last modified timestamp. |
| `name` | `String.t()` | The Partner's name. |
| `parent` | `map()` | Reference to the associated Partner. |
| `partnerId` | `String.t()` | The Partner's id. |
| `reference` | `String.t()` | The Partner's reference string. |
| `verificationPhrase` | `String.t()` | The verification phrase is a message that the Partner creates. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
partner = BluefinDecryptxP2pe.partner(sdk)
record = BluefinDecryptxP2pe.Entity.Partner.load(partner, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "partner_id"}))
```

#### Example: List

```elixir
partner = BluefinDecryptxP2pe.partner(sdk)
records = BluefinDecryptxP2pe.Entity.Partner.list(partner)
```

#### Example: Create

```elixir
partner = BluefinDecryptxP2pe.partner(sdk)
record = BluefinDecryptxP2pe.Entity.Partner.create(partner, BluefinDecryptxP2pe.Helpers.deep(%{
  "location" => %{},  # map()
}))
```


### Shipment

Create a handle: `shipment = BluefinDecryptxP2pe.shipment(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String.t()` | The name of the courier. |
| `client` | `map()` | Reference to the associated Client resource. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String.t()` | The date and time that a package is recieved. |
| `dateShipped` | `String.t()` | The date and time that a package is shipped. |
| `dcKif` | `map()` | Reference to the associated KIF resource. |
| `id` | `String.t()` | This resource's unique identifier. |
| `items` | `list()` |  |
| `kif` | `map()` | Reference to the associated KIF resource. |
| `modified` | `String.t()` | Last modified timestamp. |
| `partner` | `map()` | Reference to the associated Partner. |
| `shipmentType` | `String.t()` | The type of shipment. |
| `tracking` | `String.t()` | The courier's tracking number. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
shipment = BluefinDecryptxP2pe.shipment(sdk)
record = BluefinDecryptxP2pe.Entity.Shipment.load(shipment, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "shipment_id"}))
```

#### Example: List

```elixir
shipment = BluefinDecryptxP2pe.shipment(sdk)
records = BluefinDecryptxP2pe.Entity.Shipment.list(shipment)
```

#### Example: Create

```elixir
shipment = BluefinDecryptxP2pe.shipment(sdk)
record = BluefinDecryptxP2pe.Entity.Shipment.create(shipment, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```


### Success

Create a handle: `success = BluefinDecryptxP2pe.success(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `remove(entity, match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean()` | Indicates if the action was a success. |

#### Example: Create

```elixir
success = BluefinDecryptxP2pe.success(sdk)
record = BluefinDecryptxP2pe.Entity.Success.create(success, BluefinDecryptxP2pe.Helpers.deep(%{
  "share_partner_to" => "example_share_partner_to",  # String.t()
}))
```


### Transaction

Create a handle: `transaction = BluefinDecryptxP2pe.transaction(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `load(entity, match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String.t()` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `map()` | Reference to the associated Client resource. |
| `clientRef` | `String.t()` | Client Reference property that is included in the decrypt API call. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `integer()` | A Transcation can process muliple decryptions. |
| `deviceName` | `String.t()` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `map()` | Reference to the associated Partner. |
| `encrypted` | `integer()` | A Transcation can process muliple encryptions. |
| `endDate` | `String.t()` | Timestamp from the end of the transaction. |
| `errCode` | `String.t()` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String.t()` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String.t()` | This resource's unique identifier. |
| `ipAddress` | `String.t()` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean()` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String.t()` | The type of cipher used during decrytion. |
| `location` | `map()` | Reference to the associated Location resource. |
| `messageId` | `String.t()` | Message ID. |
| `method` | `String.t()` | The decryption cypher/method. |
| `partner` | `map()` | Reference to the associated Partner. |
| `reference` | `String.t()` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String.t()` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String.t()` | Timestamp from the beginning of the transaction. |
| `success` | `boolean()` | The success indicator. |
| `transactionSource` | `String.t()` | The source of the Transaction. |

#### Example: Load

```elixir
transaction = BluefinDecryptxP2pe.transaction(sdk)
record = BluefinDecryptxP2pe.Entity.Transaction.load(transaction, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "transaction_id"}))
```

#### Example: List

```elixir
transaction = BluefinDecryptxP2pe.transaction(sdk)
records = BluefinDecryptxP2pe.Entity.Transaction.list(transaction)
```

#### Example: Create

```elixir
transaction = BluefinDecryptxP2pe.transaction(sdk)
record = BluefinDecryptxP2pe.Entity.Transaction.create(transaction, BluefinDecryptxP2pe.Helpers.deep(%{
  "location" => %{},  # map()
}))
```


### UpdateResult

Create a handle: `update_result = BluefinDecryptxP2pe.update_result(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `create(entity, data)` | Create a new entity with the given data. |
| `list(entity)` | List entities, optionally matching the given criteria. |
| `update(entity, data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map()` | Reference to the associated Client resource. |
| `email` | `String.t()` | The User's email address. |
| `firstName` | `String.t()` | The User's name. |
| `id` | `String.t()` | ID of newly created resource |
| `isActive` | `boolean()` | This property indicates if the User account is active or disabled. |
| `kif` | `map()` | Reference to the associated KIF resource. |
| `lastName` | `String.t()` | The User's Surname. |
| `partner` | `map()` | Reference to the associated Partner. |
| `phone` | `String.t()` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String.t()` | The User's unique username. |
| `userRole` | `map()` | Reference to the associated User Role. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: List

```elixir
update_result = BluefinDecryptxP2pe.update_result(sdk)
records = BluefinDecryptxP2pe.Entity.UpdateResult.list(update_result)
```

#### Example: Create

```elixir
update_result = BluefinDecryptxP2pe.update_result(sdk)
record = BluefinDecryptxP2pe.Entity.UpdateResult.create(update_result, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```


### User

Create a handle: `user = BluefinDecryptxP2pe.user(sdk)`

#### Operations

| Method | Description |
| --- | --- |
| `load(entity, match)` | Load a single entity by match criteria. |
| `remove(entity, match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map()` | Reference to the associated Client resource. |
| `created` | `String.t()` | Creation timestamp in ISO 8601 format. |
| `email` | `String.t()` | The User's email address. |
| `firstName` | `String.t()` | The User's name. |
| `id` | `String.t()` | This resource's unique identifier. |
| `isActive` | `boolean()` | This property indicates if the User account is active or disabled. |
| `kif` | `map()` | Reference to the associated KIF resource. |
| `lastName` | `String.t()` | The User's Surname. |
| `modified` | `String.t()` | Last modified timestamp. |
| `partner` | `map()` | Reference to the associated Partner. |
| `phone` | `String.t()` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String.t()` | The User's unique username. |
| `userRole` | `map()` | Reference to the associated User Role. |
| `version` | `integer()` | The number of times that this resource has been updated. |

#### Example: Load

```elixir
user = BluefinDecryptxP2pe.user(sdk)
record = BluefinDecryptxP2pe.Entity.User.load(user, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "user_id"}))
```

## Features

This SDK ships 11 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Structured audit trail of operations |
| [`clienttrack`](#clienttrack) | Client identity and per-request correlation headers |
| [`idempotency`](#idempotency) | Idempotency keys for safe retries of mutating operations |
| [`log`](#log) | Structured request and response logging |
| [`metrics`](#metrics) | Statistics capture: per-operation counters and latency |
| [`paging`](#paging) | Pagination signals for list operations |
| [`ratelimit`](#ratelimit) | Client-side rate limiting via a token bucket |
| [`retry`](#retry) | Automatic retry of transient failures with exponential backoff |
| [`telemetry`](#telemetry) | Distributed tracing spans with W3C trace-context propagation |
| [`test`](#test) | In-memory mock transport for testing without a live server |
| [`timeout`](#timeout) | Per-request timeout with transport abort |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Structured audit trail of operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client identity and per-request correlation headers.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### idempotency

Idempotency keys for safe retries of mutating operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Structured request and response logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Statistics capture: per-operation counters and latency.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Pagination signals for list operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Set `feature.paging.active` to enable it, then override any of the options above.

### ratelimit

Client-side rate limiting via a token bucket.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Automatic retry of transient failures with exponential backoff.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### telemetry

Distributed tracing spans with W3C trace-context propagation.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Per-request timeout with transport abort.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **AuditFeature**: Structured audit trail of operations
- **ClienttrackFeature**: Client identity and per-request correlation headers
- **IdempotencyFeature**: Idempotency keys for safe retries of mutating operations
- **LogFeature**: Structured request and response logging
- **MetricsFeature**: Statistics capture: per-operation counters and latency
- **PagingFeature**: Pagination signals for list operations
- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TelemetryFeature**: Distributed tracing spans with W3C trace-context propagation
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as struct value nodes

The Elixir SDK models every runtime object — clients, contexts, results and
record data — as reference-stable struct value nodes from the vendored
`Voxgig.Struct` library rather than as compile-time structs. This mirrors
the dynamic nature of the API and lets a feature hook mutate a shared node
that every later pipeline stage observes — the immutable-Elixir way to honour
the shared-mutable hook contract.

Build inputs from native Elixir maps with `BluefinDecryptxP2pe.Helpers.deep/1`,
and read fields off results with `Voxgig.Struct.getprop/2`.

### Module structure

```
elixir/
├── lib/
│   ├── bluefin-decryptx-p2pe.ex                 -- Main SDK module (entity factories)
│   ├── config.ex                 -- Resolved configuration
│   ├── features.ex               -- Feature factory
│   ├── pipeline.ex               -- Operation pipeline
│   └── bluefin-decryptx-p2pe/
│       ├── context.ex            -- Operation context
│       ├── entity_base.ex        -- Shared entity behaviour
│       ├── error.ex              -- SDK error type
│       ├── feature.ex            -- Built-in features
│       ├── helpers.ex            -- Value helpers (deep/1, ...)
│       ├── json.ex               -- JSON encode/decode
│       └── utility.ex            -- Utility functions
│   └── entity/                   -- Per-entity modules
├── mix.exs                       -- Package manifest
└── test/                         -- ExUnit suites
```

The main module `BluefinDecryptxP2pe` exposes the SDK constructors and one entity
factory function per entity. Call an operation on the matching
`BluefinDecryptxP2pe.Entity.<Name>` module.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const devicetype = client.DeviceType()
await devicetype.list()

// devicetype.data() now returns the devicetype data from the last `list`
// devicetype.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
