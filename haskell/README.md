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

`eList ent match ctrl` resolves to one ENTITY per record and raises on
error. Read a record with `eDataGet`.

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  attestations <- Sdk.eList ent match ctrl
  mapM_ (\en -> print =<< Sdk.eDataGet en) attestations
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`eLoad` resolves to the ENTITY and raises on error; `eDataGet` gives the
record.

```haskell
  device_custody_detailEnt <- Sdk.device_custody_detail sdk VNoval
  m <- jo [("device_type", VStr "example_device_type"), ("serial_number", VStr "example_serial_number"), ("id", VStr "example_id")]
  ctrl2 <- emptyMap
  device_custody_detail <- Sdk.eLoad device_custody_detailEnt m ctrl2
  print =<< Sdk.eDataGet device_custody_detail
```

### 4. Create, update, and remove

```haskell
  createEnt <- Sdk.attestation sdk VNoval
  d <- jo [("client", VNoval), ("completeDate", VStr "example_completeDate")]
  cctrl <- emptyMap
  created <- Sdk.eCreate createEnt d cctrl
  print =<< Sdk.eDataGet created
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
| `eLoad` | `Value -> Value -> IO Entity` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `eList` | `Value -> Value -> IO [Entity]` | List entities matching the criteria. Resolves to one entity per record. Raises on error. |
| `eCreate` | `Value -> Value -> IO Entity` | Create a new entity. Resolves to the entity. Raises on error. |
| `eUpdate` | `Value -> Value -> IO Entity` | Update an existing entity. Resolves to the entity. Raises on error. |
| `eRemove` | `Value -> Value -> IO Entity` | Remove an entity. Resolves to the entity, marked deleted. Raises on error. |
| `eDataGet` | `IO Value` | Get entity data. |
| `eDataSet` | `Value -> IO ()` | Set entity data. |
| `eStream` | `String -> Value -> Value -> IO [Value]` | Run an op as a lazy stream of items. |
| `eMake` | `IO Entity` | Create a new instance with the same options. |
| `eName` | `String` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `eList` to
one entity per record — and raise on error. The record is reached through
`eDataGet`, which returns the entity's data container. `eRemove` resolves to
the entity marked deleted (`eDeleted`); it keeps the data it held. Wrap calls
in `Control.Exception.try` to handle failures.

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

Create an instance: `attestation <- Sdk.attestation sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `device` | `Value` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- jo [("id", VStr "attestation_id")]
  ctrl <- emptyMap
  attestation <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  attestationData <- Sdk.eDataGet attestation
```

#### Example: List

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  attestations <- Sdk.eList ent match ctrl
  attestationDatas <- mapM Sdk.eDataGet attestations
```

#### Example: Create

```haskell
  ent <- Sdk.attestation sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  attestation <- Sdk.eCreate ent d ctrl
  attestationData <- Sdk.eDataGet attestation
```


### Client

Create an instance: `client <- Sdk.client sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `eRemove ent match ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Value` |  |
| `created` | `String` |  |
| `directPartner` | `Value` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
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
  -- The op resolves to the ENTITY; the record is inside it.
  clientData <- Sdk.eDataGet client
```

#### Example: List

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  clients <- Sdk.eList ent match ctrl
  clientDatas <- mapM Sdk.eDataGet clients
```

#### Example: Create

```haskell
  ent <- Sdk.client sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  client <- Sdk.eCreate ent d ctrl
  clientData <- Sdk.eDataGet client
```


### CreateResult

Create an instance: `create_result <- Sdk.create_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

#### Example: Create

```haskell
  ent <- Sdk.create_result sdk VNoval
  d <- jo
    [ ("device_type", VStr "example_device_type")   -- String
    , ("serial_number", VStr "example_serial_number")   -- String
    ]
  ctrl <- emptyMap
  create_result <- Sdk.eCreate ent d ctrl
  create_resultData <- Sdk.eDataGet create_result
```


### Decryption

Create an instance: `decryption <- Sdk.decryption sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

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
  decryptionData <- Sdk.eDataGet decryption
```


### Device

Create an instance: `device <- Sdk.device sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `Value` |  |
| `activationDate` | `String` |  |
| `alternateKey` | `String` |  |
| `auditNextDate` | `String` |  |
| `auditNotificationDate` | `String` |  |
| `client` | `Value` |  |
| `created` | `String` |  |
| `createdBy` | `Value` |  |
| `deviceBuild` | `Value` |  |
| `deviceState` | `Value` |  |
| `deviceType` | `Value` |  |
| `errorCounter` | `Int` |  |
| `errorLastDate` | `String` |  |
| `id` | `String` |  |
| `initializedBy` | `Value` |  |
| `initializedDate` | `String` |  |
| `injectKey` | `Value` |  |
| `isVirtual` | `Bool` |  |
| `kif` | `Value` |  |
| `lastActivityDate` | `String` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Value` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `partner` | `Value` |  |
| `serialNumber` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device sdk VNoval
  match <- jo [("id", VStr "device_id")]
  ctrl <- emptyMap
  device <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  deviceData <- Sdk.eDataGet device
```

#### Example: List

```haskell
  ent <- Sdk.device sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  devices <- Sdk.eList ent match ctrl
  deviceDatas <- mapM Sdk.eDataGet devices
```

#### Example: Create

```haskell
  ent <- Sdk.device sdk VNoval
  d <- jo
    [ ("activatedBy", VNoval)   -- Value
    , ("createdBy", VNoval)   -- Value
    , ("initializedBy", VNoval)   -- Value
    , ("location", VNoval)   -- Value
    , ("modifiedBy", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  device <- Sdk.eCreate ent d ctrl
  deviceData <- Sdk.eDataGet device
```


### DeviceBuild

Create an instance: `device_build <- Sdk.device_build sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

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
| `id` | `Int` |  |
| `isActive` | `Bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `version` | `Int` |  |
| `whiteListingBinRanges` | `String` |  |
| `whiteListingUsed` | `Bool` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- jo [("id", VStr "device_build_id")]
  ctrl <- emptyMap
  device_build <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  device_buildData <- Sdk.eDataGet device_build
```

#### Example: List

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  device_builds <- Sdk.eList ent match ctrl
  device_buildDatas <- mapM Sdk.eDataGet device_builds
```


### DeviceCustodyDetail

Create an instance: `device_custody_detail <- Sdk.device_custody_detail sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Value` |  |
| `custodian` | `Value` |  |
| `device` | `Value` |  |
| `id` | `Int` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Value` |  |
| `notes` | `String` |  |
| `status` | `Value` |  |
| `transferMethod` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_custody_detail sdk VNoval
  match <- jo [("id", VStr "device_custody_detail_id"), ("device_type", VStr "device_type"), ("serial_number", VStr "serial_number")]
  ctrl <- emptyMap
  device_custody_detail <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  device_custody_detailData <- Sdk.eDataGet device_custody_detail
```


### DeviceCustodyList

Create an instance: `device_custody_list <- Sdk.device_custody_list sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Value` |  |
| `custodian` | `Value` |  |
| `device` | `Value` |  |
| `id` | `Int` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Value` |  |
| `notes` | `String` |  |
| `status` | `Value` |  |
| `transferMethod` | `Value` |  |
| `version` | `Int` |  |

#### Example: List

```haskell
  ent <- Sdk.device_custody_list sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  device_custody_lists <- Sdk.eList ent match ctrl
  device_custody_listDatas <- mapM Sdk.eDataGet device_custody_lists
```


### DeviceList

Create an instance: `device_list <- Sdk.device_list sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

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
  -- The op resolves to the ENTITY; the record is inside it.
  device_listData <- Sdk.eDataGet device_list
```


### DeviceReceiveResult

Create an instance: `device_receive_result <- Sdk.device_receive_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

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
  device_receive_resultData <- Sdk.eDataGet device_receive_result
```


### DeviceRkiActivateResult

Create an instance: `device_rki_activate_result <- Sdk.device_rki_activate_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |

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
  device_rki_activate_resultData <- Sdk.eDataGet device_rki_activate_result
```


### DeviceState

Create an instance: `device_state <- Sdk.device_state sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |

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
  -- One ENTITY per record.
  device_states <- Sdk.eList ent match ctrl
  device_stateDatas <- mapM Sdk.eDataGet device_states
```


### DeviceType

Create an instance: `device_type <- Sdk.device_type sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `deviceTypeMode` | `String` |  |
| `hardwareVersion` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photoUrl` | `String` |  |
| `productName` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- jo [("id", VStr "device_type_id")]
  ctrl <- emptyMap
  device_type <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  device_typeData <- Sdk.eDataGet device_type
```

#### Example: List

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  device_types <- Sdk.eList ent match ctrl
  device_typeDatas <- mapM Sdk.eDataGet device_types
```


### InjectKey

Create an instance: `inject_key <- Sdk.inject_key sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `isP2PE` | `Bool` |  |
| `keyType` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- jo [("id", VStr "inject_key_id")]
  ctrl <- emptyMap
  inject_key <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  inject_keyData <- Sdk.eDataGet inject_key
```

#### Example: List

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  inject_keys <- Sdk.eList ent match ctrl
  inject_keyDatas <- mapM Sdk.eDataGet inject_keys
```


### Kif

Create an instance: `kif <- Sdk.kif sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |

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
  -- One ENTITY per record.
  kifs <- Sdk.eList ent match ctrl
  kifDatas <- mapM Sdk.eDataGet kifs
```


### Location

Create an instance: `location <- Sdk.location sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `eRemove ent match ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

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
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.location sdk VNoval
  match <- jo [("id", VStr "location_id")]
  ctrl <- emptyMap
  location <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  locationData <- Sdk.eDataGet location
```

#### Example: List

```haskell
  ent <- Sdk.location sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  locations <- Sdk.eList ent match ctrl
  locationDatas <- mapM Sdk.eDataGet locations
```

#### Example: Create

```haskell
  ent <- Sdk.location sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  location <- Sdk.eCreate ent d ctrl
  locationData <- Sdk.eDataGet location
```


### Partner

Create an instance: `partner <- Sdk.partner sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `clientCanOrderEquipment` | `Bool` |  |
| `contact` | `Value` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `location` | `Value` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Value` |  |
| `partnerId` | `String` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- jo [("id", VStr "partner_id")]
  ctrl <- emptyMap
  partner <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  partnerData <- Sdk.eDataGet partner
```

#### Example: List

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  partners <- Sdk.eList ent match ctrl
  partnerDatas <- mapM Sdk.eDataGet partners
```

#### Example: Create

```haskell
  ent <- Sdk.partner sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  partner <- Sdk.eCreate ent d ctrl
  partnerData <- Sdk.eDataGet partner
```


### Shipment

Create an instance: `shipment <- Sdk.shipment sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `Value` |  |
| `created` | `String` |  |
| `dateReceived` | `String` |  |
| `dateShipped` | `String` |  |
| `dcKif` | `Value` |  |
| `id` | `String` |  |
| `items` | `[Value]` |  |
| `kif` | `Value` |  |
| `modified` | `String` |  |
| `partner` | `Value` |  |
| `shipmentType` | `String` |  |
| `tracking` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- jo [("id", VStr "shipment_id")]
  ctrl <- emptyMap
  shipment <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  shipmentData <- Sdk.eDataGet shipment
```

#### Example: List

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  shipments <- Sdk.eList ent match ctrl
  shipmentDatas <- mapM Sdk.eDataGet shipments
```

#### Example: Create

```haskell
  ent <- Sdk.shipment sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  shipment <- Sdk.eCreate ent d ctrl
  shipmentData <- Sdk.eDataGet shipment
```


### Success

Create an instance: `success <- Sdk.success sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eRemove ent match ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

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
  successData <- Sdk.eDataGet success
```


### Transaction

Create an instance: `transaction <- Sdk.transaction sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` |  |
| `client` | `Value` |  |
| `clientRef` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `Int` |  |
| `deviceName` | `String` |  |
| `directPartner` | `Value` |  |
| `encrypted` | `Int` |  |
| `endDate` | `String` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `String` |  |
| `ipAddress` | `String` |  |
| `isVirtual` | `Bool` |  |
| `keyType` | `String` |  |
| `location` | `Value` |  |
| `messageId` | `String` |  |
| `method` | `String` |  |
| `partner` | `Value` |  |
| `reference` | `String` |  |
| `serialNumber` | `String` |  |
| `startDate` | `String` |  |
| `success` | `Bool` |  |
| `transactionSource` | `String` |  |

#### Example: Load

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- jo [("id", VStr "transaction_id")]
  ctrl <- emptyMap
  transaction <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  transactionData <- Sdk.eDataGet transaction
```

#### Example: List

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  transactions <- Sdk.eList ent match ctrl
  transactionDatas <- mapM Sdk.eDataGet transactions
```

#### Example: Create

```haskell
  ent <- Sdk.transaction sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  transaction <- Sdk.eCreate ent d ctrl
  transactionData <- Sdk.eDataGet transaction
```


### UpdateResult

Create an instance: `update_result <- Sdk.update_result sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eCreate ent data ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `eList ent match ctrl` | List entities, optionally matching the given criteria. Resolves to one entity per record. |
| `eUpdate ent data ctrl` | Update an existing entity. Resolves to the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `kif` | `Value` |  |
| `lastName` | `String` |  |
| `partner` | `Value` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Value` |  |
| `version` | `Int` |  |

#### Example: List

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  -- One ENTITY per record.
  update_results <- Sdk.eList ent match ctrl
  update_resultDatas <- mapM Sdk.eDataGet update_results
```

#### Example: Create

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  update_result <- Sdk.eCreate ent d ctrl
  update_resultData <- Sdk.eDataGet update_result
```


### User

Create an instance: `user <- Sdk.user sdk VNoval`

#### Operations

| Method | Description |
| --- | --- |
| `eLoad ent match ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `eRemove ent match ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Value` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `kif` | `Value` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Value` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Value` |  |
| `version` | `Int` |  |

#### Example: Load

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  user <- Sdk.eLoad ent match ctrl
  -- The op resolves to the ENTITY; the record is inside it.
  userData <- Sdk.eDataGet user
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
