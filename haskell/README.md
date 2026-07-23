# BluefinDecryptxP2pe Haskell SDK



The Haskell SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Haskell conventions (pure functions, explicit `IO`, and the dependency-free vendored `Value` struct model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `attestation sdk VNoval` — each
carrying a small, uniform set of operations (`eList`, `eLoad`, `eCreate`, `eUpdate`, `eRemove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Hackage. Install it from the GitHub
release tag (`haskell/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout. The runtime has no third-party dependencies (only the
GHC boot libraries: `base`, `containers`, `array`, `time`), so the
bundled Makefile drives stock GHC with no cabal solve:

```bash
cd haskell && make test
```

A `.cabal` file is also generated for use with `cabal`/`stack`:

```bash
cd haskell && cabal build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```haskell
import System.Environment (lookupEnv)
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  mkey <- lookupEnv "BLUEFIN_DECRYPTX_P2PE_APIKEY"
  opts <- jo [("apikey", maybe VNoval VStr mkey)]
  sdk <- Sdk.newSdk opts
```

Entity operations raise on error (via `Control.Exception.throwIO`) and
return the bare result `Value`. Wrap a call in `Control.Exception.try`
to recover from failures.

### 2. List attestation records

`eList ent match ctrl` returns a list `Value` and raises on error.

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  attestations <- Sdk.eList ent match ctrl
  print attestations
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`eLoad` returns the bare record and raises on error.

```haskell
  device_custody_detailEnt <- Sdk.device_custody_detail sdk VNoval
  m <- jo [("device_type", VStr "example_device_type"), ("serial_number", VStr "example_serial_number"), ("id", VStr "example_id")]
  ctrl2 <- emptyMap
  device_custody_detail <- Sdk.eLoad device_custody_detailEnt m ctrl2
  print device_custody_detail
```

### 4. Create, update, and remove

```haskell
  createEnt <- Sdk.attestation sdk VNoval
  d <- jo [("client", VNoval), ("complete_date", VStr "example_complete_date")]
  cctrl <- emptyMap
  created <- Sdk.eCreate createEnt d cctrl
  print created
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

For endpoints not covered by entity accessors, use `direct` — it never
raises and returns a result `Value` you branch on via its `ok` field:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "GET"), ("params", params)]
  result <- F.direct sdk args
  ok <- getp result "ok"
  case ok of
    VBool True -> do
      status <- getp result "status"   -- e.g. VNum 200
      body <- getp result "data"       -- the response body
      print (status, body)
    _ -> do
      -- A non-2xx response carries status + data (the error body); a
      -- transport-level failure carries err instead.
      status <- getp result "status"
      err <- getp result "err"
      print (status, err)
```

### Prepare a request without sending it

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..))
import SdkHelpers (jo, getp)

main :: IO ()
main = do
  sdk <- Sdk.newSdk0
  params <- jo [("id", VStr "example")]
  args <- jo [("path", VStr "/api/resource/{id}"), ("method", VStr "DELETE"), ("params", params)]
  -- prepare returns the fetch definition and raises on error.
  fetchdef <- F.prepare sdk args
  url <- getp fetchdef "url"
  method <- getp fetchdef "method"
  print (url, method)
```

### Use test mode

Create a mock client for unit testing — no server required:

```haskell
import qualified SdkClient as Sdk
import qualified SdkFeatures as F
import VoxgigStruct (Value (..), emptyMap)
import SdkHelpers (jo)

main :: IO ()
main = do
  sdk <- Sdk.testSdk0
  ent <- Sdk.device_type sdk VNoval
  arg <- emptyMap
  ctrl <- emptyMap
  -- Entity ops return the bare record and raise on error.
  device_type <- Sdk.eList ent arg ctrl
  print device_type
```

### Use a custom fetch function

Replace the HTTP transport with your own `VFunc` under `system.fetch`:

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo, jsonThunk)

customClient :: IO Sdk.Client
customClient = do
  let mockFetch = VFunc (\_ _ _ _ -> do
        body <- jo [("id", VStr "mock01")]
        jo [("status", VNum 200), ("statusText", VStr "OK"), ("json", jsonThunk body)])
  sys <- jo [("fetch", mockFetch)]
  opts <- jo [("base", VStr "http://localhost:8080"), ("system", sys)]
  Sdk.newSdk opts
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run the suite (stock GHC, no third-party dependencies):

```bash
cd haskell && make test
```


## Reference

### Client constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

`newSdk :: Value -> IO Client` constructs a client from an options map;
`newSdk0 :: IO Client` is the no-argument convenience form.

| Option (map key) | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides (e.g. custom `fetch` function). |

### Test client

```haskell
client <- Sdk.testSdk testopts sdkopts
```

`testSdk :: Value -> Value -> IO Client` constructs a test-mode client with
mock transport (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a live client from options. |
| `newSdk0` | `IO Client` | Construct a live client with defaults. |
| `testSdk` | `Value -> Value -> IO Client` | Construct a test-mode client. |
| `prepare` | `Client -> Value -> IO Value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `Client -> Value -> IO Value` | Build and send an HTTP request. Returns a result `Value` (branch on `ok`). |
| `attestation` | `Client -> Value -> IO Entity` | Create an Attestation entity instance. |
| `client` | `Client -> Value -> IO Entity` | Create a Client entity instance. |
| `create_result` | `Client -> Value -> IO Entity` | Create a CreateResult entity instance. |
| `decryption` | `Client -> Value -> IO Entity` | Create a Decryption entity instance. |
| `device` | `Client -> Value -> IO Entity` | Create a Device entity instance. |
| `device_build` | `Client -> Value -> IO Entity` | Create a DeviceBuild entity instance. |
| `device_custody_detail` | `Client -> Value -> IO Entity` | Create a DeviceCustodyDetail entity instance. |
| `device_custody_list` | `Client -> Value -> IO Entity` | Create a DeviceCustodyList entity instance. |
| `device_list` | `Client -> Value -> IO Entity` | Create a DeviceList entity instance. |
| `device_receive_result` | `Client -> Value -> IO Entity` | Create a DeviceReceiveResult entity instance. |
| `device_rki_activate_result` | `Client -> Value -> IO Entity` | Create a DeviceRkiActivateResult entity instance. |
| `device_state` | `Client -> Value -> IO Entity` | Create a DeviceState entity instance. |
| `device_type` | `Client -> Value -> IO Entity` | Create a DeviceType entity instance. |
| `inject_key` | `Client -> Value -> IO Entity` | Create an InjectKey entity instance. |
| `kif` | `Client -> Value -> IO Entity` | Create a Kif entity instance. |
| `location` | `Client -> Value -> IO Entity` | Create a Location entity instance. |
| `partner` | `Client -> Value -> IO Entity` | Create a Partner entity instance. |
| `shipment` | `Client -> Value -> IO Entity` | Create a Shipment entity instance. |
| `success` | `Client -> Value -> IO Entity` | Create a Success entity instance. |
| `transaction` | `Client -> Value -> IO Entity` | Create a Transaction entity instance. |
| `update_result` | `Client -> Value -> IO Entity` | Create an UpdateResult entity instance. |
| `user` | `Client -> Value -> IO Entity` | Create an User entity instance. |

### Entity interface

All entities share the same record interface (fields of the `Entity` type).

| Field | Signature | Description |
| --- | --- | --- |
| `eLoad` | `Value -> Value -> IO Value` | Load a single entity by match criteria. Raises on error. |
| `eList` | `Value -> Value -> IO Value` | List entities matching the criteria. Raises on error. |
| `eCreate` | `Value -> Value -> IO Value` | Create a new entity. Raises on error. |
| `eUpdate` | `Value -> Value -> IO Value` | Update an existing entity. Raises on error. |
| `eRemove` | `Value -> Value -> IO Value` | Remove an entity. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations return the bare result `Value` (a map for single-entity
ops, a list for `eList`) and raise on error. Wrap calls in
`Control.Exception.try` to handle failures.

The `direct` escape hatch never raises — it returns a result `Value`
you branch on via its `ok` field (read with `getp result "ok"`):

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `True` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `False` and `err` carries the error value.

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

Create an instance: `attestation <- Sdk.attestation sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `device` | `Value` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- jo [("id", VStr "attestation_id")]
  ctrl <- emptyMap
  attestation <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  attestations <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.attestation sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  attestation <- Sdk.eCreate ent d ctrl
```


### Client

Create an instance: `client <- Sdk.client sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Value` |  |
| `created` | `String` |  |
| `direct_partner` | `Value` |  |
| `id` | `String` |  |
| `is_active` | `Bool` |  |
| `location` | `Value` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  client <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  clients <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.client sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  client <- Sdk.eCreate ent d ctrl
```


### CreateResult

Create an instance: `create_result <- Sdk.create_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Example: Create

```haskell
  ent <- Sdk.create_result sdk VNoval
  d <- jo
    [ ("device_type", VStr "example_device_type")   -- String
    , ("serial_number", VStr "example_serial_number")   -- String
    ]
  ctrl <- emptyMap
  create_result <- Sdk.eCreate ent d ctrl
```


### Decryption

Create an instance: `decryption <- Sdk.decryption sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```haskell
  ent <- Sdk.decryption sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  decryption <- Sdk.eCreate ent d ctrl
```


### Device

Create an instance: `device <- Sdk.device sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `Value` |  |
| `activation_date` | `String` |  |
| `alternate_key` | `String` |  |
| `audit_next_date` | `String` |  |
| `audit_notification_date` | `String` |  |
| `client` | `Value` |  |
| `created` | `String` |  |
| `created_by` | `Value` |  |
| `device_build` | `Value` |  |
| `device_state` | `Value` |  |
| `device_type` | `Value` |  |
| `error_counter` | `Int` |  |
| `error_last_date` | `String` |  |
| `id` | `String` |  |
| `initialized_by` | `Value` |  |
| `initialized_date` | `String` |  |
| `inject_key` | `Value` |  |
| `is_virtual` | `Bool` |  |
| `kif` | `Value` |  |
| `last_activity_date` | `String` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `modified_by` | `Value` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `partner` | `Value` |  |
| `serial_number` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device sdk VNoval
  match <- jo [("id", VStr "device_id")]
  ctrl <- emptyMap
  device <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.device sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  devices <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.device sdk VNoval
  d <- jo
    [ ("activated_by", VNoval)   -- Value
    , ("created_by", VNoval)   -- Value
    , ("initialized_by", VNoval)   -- Value
    , ("location", VNoval)   -- Value
    , ("modified_by", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  device <- Sdk.eCreate ent d ctrl
```


### DeviceBuild

Create an instance: `device_build <- Sdk.device_build sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

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
| `id` | `Int` |  |
| `is_active` | `Bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `note` | `String` |  |
| `version` | `Int` |  |
| `white_listing_bin_range` | `String` |  |
| `white_listing_used` | `Bool` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- jo [("id", VStr "device_build_id")]
  ctrl <- emptyMap
  device_build <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  device_builds <- Sdk.eList ent match ctrl
```


### DeviceCustodyDetail

Create an instance: `device_custody_detail <- Sdk.device_custody_detail sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `Value` |  |
| `custodian` | `Value` |  |
| `device` | `Value` |  |
| `id` | `Int` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `modified_by` | `Value` |  |
| `note` | `String` |  |
| `status` | `Value` |  |
| `transfer_method` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_custody_detail sdk VNoval
  match <- jo [("id", VStr "device_custody_detail_id"), ("device_type", VStr "device_type"), ("serial_number", VStr "serial_number")]
  ctrl <- emptyMap
  device_custody_detail <- Sdk.eLoad ent match ctrl
```


### DeviceCustodyList

Create an instance: `device_custody_list <- Sdk.device_custody_list sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `String` |  |
| `created` | `String` |  |
| `created_by` | `Value` |  |
| `custodian` | `Value` |  |
| `device` | `Value` |  |
| `id` | `Int` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `modified_by` | `Value` |  |
| `note` | `String` |  |
| `status` | `Value` |  |
| `transfer_method` | `Value` |  |
| `version` | `Int` |  |

#### Example: List

```haskell
  ent <- Sdk.device_custody_list sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  device_custody_lists <- Sdk.eList ent match ctrl
```


### DeviceList

Create an instance: `device_list <- Sdk.device_list sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `[Value]` |  |
| `total` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_list sdk VNoval
  match <- jo [("share_partner_to", VStr "share_partner_to")]
  ctrl <- emptyMap
  device_list <- Sdk.eLoad ent match ctrl
```


### DeviceReceiveResult

Create an instance: `device_receive_result <- Sdk.device_receive_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```haskell
  ent <- Sdk.device_receive_result sdk VNoval
  d <- jo
    [ ("success", VBool True)   -- Bool
    ]
  ctrl <- emptyMap
  device_receive_result <- Sdk.eCreate ent d ctrl
```


### DeviceRkiActivateResult

Create an instance: `device_rki_activate_result <- Sdk.device_rki_activate_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```haskell
  ent <- Sdk.device_rki_activate_result sdk VNoval
  d <- jo
    [ ("success", VBool True)   -- Bool
    ]
  ctrl <- emptyMap
  device_rki_activate_result <- Sdk.eCreate ent d ctrl
```


### DeviceState

Create an instance: `device_state <- Sdk.device_state sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` |  |
| `name` | `String` |  |

#### Example: List

```haskell
  ent <- Sdk.device_state sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  device_states <- Sdk.eList ent match ctrl
```


### DeviceType

Create an instance: `device_type <- Sdk.device_type sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `device_type_mode` | `String` |  |
| `hardware_version` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Bool` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photo_url` | `String` |  |
| `product_name` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- jo [("id", VStr "device_type_id")]
  ctrl <- emptyMap
  device_type <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  device_types <- Sdk.eList ent match ctrl
```


### InjectKey

Create an instance: `inject_key <- Sdk.inject_key sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Bool` |  |
| `is_p2_pe` | `Bool` |  |
| `key_type` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- jo [("id", VStr "inject_key_id")]
  ctrl <- emptyMap
  inject_key <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  inject_keys <- Sdk.eList ent match ctrl
```


### Kif

Create an instance: `kif <- Sdk.kif sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` |  |
| `name` | `String` |  |

#### Example: List

```haskell
  ent <- Sdk.kif sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  kifs <- Sdk.eList ent match ctrl
```


### Location

Create an instance: `location <- Sdk.location sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |

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
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.location sdk VNoval
  match <- jo [("id", VStr "location_id")]
  ctrl <- emptyMap
  location <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.location sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  locations <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.location sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  location <- Sdk.eCreate ent d ctrl
```


### Partner

Create an instance: `partner <- Sdk.partner sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `String` |  |
| `client_can_order_equipment` | `Bool` |  |
| `contact` | `Value` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Bool` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Value` |  |
| `partner_id` | `String` |  |
| `reference` | `String` |  |
| `verification_phrase` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- jo [("id", VStr "partner_id")]
  ctrl <- emptyMap
  partner <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  partners <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.partner sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  partner <- Sdk.eCreate ent d ctrl
```


### Shipment

Create an instance: `shipment <- Sdk.shipment sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `Value` |  |
| `created` | `String` |  |
| `date_received` | `String` |  |
| `date_shipped` | `String` |  |
| `dc_kif` | `Value` |  |
| `id` | `String` |  |
| `item` | `[Value]` |  |
| `kif` | `Value` |  |
| `modified` | `String` |  |
| `partner` | `Value` |  |
| `shipment_type` | `String` |  |
| `tracking` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- jo [("id", VStr "shipment_id")]
  ctrl <- emptyMap
  shipment <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  shipments <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.shipment sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  shipment <- Sdk.eCreate ent d ctrl
```


### Success

Create an instance: `success <- Sdk.success sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eRemove ent match ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```haskell
  ent <- Sdk.success sdk VNoval
  d <- jo
    [ ("share_partner_to", VStr "example_share_partner_to")   -- String
    ]
  ctrl <- emptyMap
  success <- Sdk.eCreate ent d ctrl
```


### Transaction

Create an instance: `transaction <- Sdk.transaction sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `String` |  |
| `client` | `Value` |  |
| `client_ref` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `Int` |  |
| `device_name` | `String` |  |
| `direct_partner` | `Value` |  |
| `encrypted` | `Int` |  |
| `end_date` | `String` |  |
| `err_code` | `String` |  |
| `err_message` | `String` |  |
| `id` | `String` |  |
| `ip_address` | `String` |  |
| `is_virtual` | `Bool` |  |
| `key_type` | `String` |  |
| `location` | `Value` |  |
| `message_id` | `String` |  |
| `method` | `String` |  |
| `partner` | `Value` |  |
| `reference` | `String` |  |
| `serial_number` | `String` |  |
| `start_date` | `String` |  |
| `success` | `Bool` |  |
| `transaction_source` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- jo [("id", VStr "transaction_id")]
  ctrl <- emptyMap
  transaction <- Sdk.eLoad ent match ctrl
```

#### Example: List

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  transactions <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.transaction sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  transaction <- Sdk.eCreate ent d ctrl
```


### UpdateResult

Create an instance: `update_result <- Sdk.update_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. |
| `eUpdate ent data ctrl` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Bool` |  |
| `kif` | `Value` |  |
| `last_name` | `String` |  |
| `partner` | `Value` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Value` |  |
| `version` | `Int` |  |

#### Example: List

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  update_results <- Sdk.eList ent match ctrl
```

#### Example: Create

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  update_result <- Sdk.eCreate ent d ctrl
```


### User

Create an instance: `user <- Sdk.user sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. |
| `eRemove ent match ctrl` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `first_name` | `String` |  |
| `id` | `String` |  |
| `is_active` | `Bool` |  |
| `kif` | `Value` |  |
| `last_name` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Value` |  |
| `phone` | `String` |  |
| `user_name` | `String` |  |
| `user_role` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  user <- Sdk.eLoad ent match ctrl
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as struct Values

The Haskell SDK models every API record as the dynamic `Value` type (from
the vendored `VoxgigStruct` module) rather than bespoke Haskell records.
This mirrors the dynamic nature of the API and keeps the SDK flexible — no
new datatypes or code generation are needed when the API schema changes.

Build request maps with `jo [(key, value)]` and read fields back with
`getp value "field"`; scalars are the `VStr` / `VNum` / `VBool`
constructors, and `VNoval` stands for an absent property.

### Module structure

```
haskell/
├── src/
│   ├── VoxgigStruct.hs   -- vendored dependency-free struct library (Value)
│   ├── Vregex.hs         -- vendored regex support
│   ├── SdkTypes.hs       -- core types (Client, Entity, Feature)
│   ├── SdkHelpers.hs     -- helper functions (jo, getp, ...)
│   ├── SdkRuntime.hs     -- the generic operation pipeline
│   ├── SdkFeatures.hs    -- built-in features + makeEntity
│   ├── SdkConfig.hs      -- generated API configuration + feature factory
│   └── SdkClient.hs      -- generated public client (newSdk, entity accessors)
├── test/                 -- test suites
├── Makefile              -- stock-GHC build/test (no third-party deps)
└── bluefindecryptxp2pe-sdk.cabal      -- package manifest (for Hackage)
```

The public module (`SdkClient`) exports the SDK constructors (`newSdk`,
`testSdk`) and one accessor per entity. Import `VoxgigStruct` for the
`Value` constructors and `SdkHelpers` for `jo` / `getp`.

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
