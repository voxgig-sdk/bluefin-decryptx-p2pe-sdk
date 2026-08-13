# BluefinDecryptxP2pe Haskell SDK Reference

Complete API reference for the BluefinDecryptxP2pe Haskell SDK.


## Client

### Constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

Construct a live SDK client.

**Functions:**

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a client from an options map. |
| `newSdk0` | `IO Client` | Construct a client with defaults. |

**Options (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL for API requests. |
| `prefix` | `String` | URL prefix appended after base. |
| `suffix` | `String` | URL suffix appended after path. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature configuration. |
| `system` | `Value` | System overrides (e.g. custom fetch). |


### Test constructors

```haskell
client <- Sdk.testSdk0
```

`testSdk :: Value -> Value -> IO Client` constructs a test client with mock
features active (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.


### Entity accessors

#### `attestation :: Client -> Value -> IO Entity`

Construct a `Attestation` entity bound to the client. Pass `VNoval` for no initial options.

#### `client :: Client -> Value -> IO Entity`

Construct a `Client` entity bound to the client. Pass `VNoval` for no initial options.

#### `create_result :: Client -> Value -> IO Entity`

Construct a `CreateResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `decryption :: Client -> Value -> IO Entity`

Construct a `Decryption` entity bound to the client. Pass `VNoval` for no initial options.

#### `device :: Client -> Value -> IO Entity`

Construct a `Device` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_build :: Client -> Value -> IO Entity`

Construct a `DeviceBuild` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_custody_detail :: Client -> Value -> IO Entity`

Construct a `DeviceCustodyDetail` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_custody_list :: Client -> Value -> IO Entity`

Construct a `DeviceCustodyList` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_list :: Client -> Value -> IO Entity`

Construct a `DeviceList` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_receive_result :: Client -> Value -> IO Entity`

Construct a `DeviceReceiveResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_rki_activate_result :: Client -> Value -> IO Entity`

Construct a `DeviceRkiActivateResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_state :: Client -> Value -> IO Entity`

Construct a `DeviceState` entity bound to the client. Pass `VNoval` for no initial options.

#### `device_type :: Client -> Value -> IO Entity`

Construct a `DeviceType` entity bound to the client. Pass `VNoval` for no initial options.

#### `inject_key :: Client -> Value -> IO Entity`

Construct a `InjectKey` entity bound to the client. Pass `VNoval` for no initial options.

#### `kif :: Client -> Value -> IO Entity`

Construct a `Kif` entity bound to the client. Pass `VNoval` for no initial options.

#### `location :: Client -> Value -> IO Entity`

Construct a `Location` entity bound to the client. Pass `VNoval` for no initial options.

#### `partner :: Client -> Value -> IO Entity`

Construct a `Partner` entity bound to the client. Pass `VNoval` for no initial options.

#### `shipment :: Client -> Value -> IO Entity`

Construct a `Shipment` entity bound to the client. Pass `VNoval` for no initial options.

#### `success :: Client -> Value -> IO Entity`

Construct a `Success` entity bound to the client. Pass `VNoval` for no initial options.

#### `transaction :: Client -> Value -> IO Entity`

Construct a `Transaction` entity bound to the client. Pass `VNoval` for no initial options.

#### `update_result :: Client -> Value -> IO Entity`

Construct a `UpdateResult` entity bound to the client. Pass `VNoval` for no initial options.

#### `user :: Client -> Value -> IO Entity`

Construct a `User` entity bound to the client. Pass `VNoval` for no initial options.

### HTTP escape hatches

#### `direct :: Client -> Value -> IO Value` (module `SdkFeatures`)

Make a direct HTTP request to any API endpoint. Returns a result `Value` with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `getp result "ok"`.

**Argument (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String` | URL path with optional `{param}` placeholders. |
| `method` | `String` | HTTP method (default: `"GET"`). |
| `params` | `Value` | Path parameter values. |
| `query` | `Value` | Query string parameters. |
| `headers` | `Value` | Request headers (merged with defaults). |
| `body` | `Value` | Request body (maps are JSON-serialized). |

#### `prepare :: Client -> Value -> IO Value` (module `SdkFeatures`)

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```haskell
  ent <- Sdk.attestation sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value` | No |  |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `device` | `Value` | No |  |
| `id` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.attestation sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- jo [("id", VStr "attestation_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Attestation` entity with the same options.

#### `eName :: String`

The entity name.


---

## Client

```haskell
  ent <- Sdk.client sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Value` | No |  |
| `created` | `String` | No |  |
| `directPartner` | `Value` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `location` | `Value` | Yes |  |
| `mid` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `partner` | `Value` | No |  |
| `version` | `Int` | No |  |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`eDeleted`); it keeps the data it held. Raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Client` entity with the same options.

#### `eName :: String`

The entity name.


---

## CreateResult

```haskell
  ent <- Sdk.create_result sdk VNoval
```

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.create_result sdk VNoval
  d <- jo
    [ ("device_type", VStr "example_device_type")   -- String
    , ("serial_number", VStr "example_serial_number")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `CreateResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## Decryption

```haskell
  ent <- Sdk.decryption sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.decryption sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Decryption` entity with the same options.

#### `eName :: String`

The entity name.


---

## Device

```haskell
  ent <- Sdk.device sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `Value` | Yes |  |
| `activationDate` | `String` | No |  |
| `alternateKey` | `String` | No |  |
| `auditNextDate` | `String` | No |  |
| `auditNotificationDate` | `String` | No |  |
| `client` | `Value` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `Value` | Yes |  |
| `deviceBuild` | `Value` | No |  |
| `deviceState` | `Value` | No |  |
| `deviceType` | `Value` | No |  |
| `errorCounter` | `Int` | No |  |
| `errorLastDate` | `String` | No |  |
| `id` | `String` | No |  |
| `initializedBy` | `Value` | Yes |  |
| `initializedDate` | `String` | No |  |
| `injectKey` | `Value` | No |  |
| `isVirtual` | `Bool` | No |  |
| `kif` | `Value` | No |  |
| `lastActivityDate` | `String` | No |  |
| `location` | `Value` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `Value` | Yes |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `partner` | `Value` | No |  |
| `serialNumber` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

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
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.device sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device sdk VNoval
  match <- jo [("id", VStr "device_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Device` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceBuild

```haskell
  ent <- Sdk.device_build sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `String` | No |  |
| `buildNumber` | `String` | No |  |
| `configFileName` | `String` | No |  |
| `created` | `String` | No |  |
| `deviceType` | `String` | No |  |
| `firmwareVersion` | `String` | No |  |
| `hardwareVersion` | `String` | No |  |
| `id` | `Int` | No |  |
| `isActive` | `Bool` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `notes` | `String` | No |  |
| `version` | `Int` | No |  |
| `whiteListingBinRanges` | `String` | No |  |
| `whiteListingUsed` | `Bool` | No |  |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- jo [("id", VStr "device_build_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceBuild` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceCustodyDetail

```haskell
  ent <- Sdk.device_custody_detail sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `Value` | Yes |  |
| `custodian` | `Value` | Yes |  |
| `device` | `Value` | No |  |
| `id` | `Int` | No |  |
| `location` | `Value` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `Value` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `Value` | No |  |
| `transferMethod` | `Value` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device_custody_detail sdk VNoval
  match <- jo [("id", VStr "device_custody_detail_id"), ("device_type", VStr "device_type"), ("serial_number", VStr "serial_number")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceCustodyDetail` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceCustodyList

```haskell
  ent <- Sdk.device_custody_list sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No |  |
| `created` | `String` | No |  |
| `createdBy` | `Value` | Yes |  |
| `custodian` | `Value` | Yes |  |
| `device` | `Value` | No |  |
| `id` | `Int` | No |  |
| `location` | `Value` | Yes |  |
| `modified` | `String` | No |  |
| `modifiedBy` | `Value` | Yes |  |
| `notes` | `String` | No |  |
| `status` | `Value` | No |  |
| `transferMethod` | `Value` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.device_custody_list sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceCustodyList` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceList

```haskell
  ent <- Sdk.device_list sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `[Value]` | No |  |
| `total` | `Int` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device_list sdk VNoval
  match <- jo [("share_partner_to", VStr "share_partner_to")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceList` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceReceiveResult

```haskell
  ent <- Sdk.device_receive_result sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device_receive_result sdk VNoval
  d <- jo
    [ ("success", VBool True)   -- Bool
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceReceiveResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceRkiActivateResult

```haskell
  ent <- Sdk.device_rki_activate_result sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | Yes |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device_rki_activate_result sdk VNoval
  d <- jo
    [ ("success", VBool True)   -- Bool
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceRkiActivateResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceState

```haskell
  ent <- Sdk.device_state sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Int` | No |  |
| `name` | `String` | No |  |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.device_state sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceState` entity with the same options.

#### `eName :: String`

The entity name.


---

## DeviceType

```haskell
  ent <- Sdk.device_type sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `deviceTypeMode` | `String` | No |  |
| `hardwareVersion` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `manufacturer` | `String` | No |  |
| `model` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- jo [("id", VStr "device_type_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `DeviceType` entity with the same options.

#### `eName :: String`

The entity name.


---

## InjectKey

```haskell
  ent <- Sdk.inject_key sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `isP2PE` | `Bool` | No |  |
| `keyType` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- jo [("id", VStr "inject_key_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `InjectKey` entity with the same options.

#### `eName :: String`

The entity name.


---

## Kif

```haskell
  ent <- Sdk.kif sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `Int` | No |  |
| `name` | `String` | No |  |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.kif sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Kif` entity with the same options.

#### `eName :: String`

The entity name.


---

## Location

```haskell
  ent <- Sdk.location sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String` | No |  |
| `address2` | `String` | No |  |
| `billingId` | `String` | No |  |
| `city` | `String` | No |  |
| `country` | `String` | No |  |
| `created` | `String` | No |  |
| `customReference` | `String` | No |  |
| `id` | `String` | No |  |
| `locationType` | `String` | No |  |
| `mailAddress1` | `String` | No |  |
| `mailAddress2` | `String` | No |  |
| `mailCity` | `String` | No |  |
| `mailCountry` | `String` | No |  |
| `mailPostalCode` | `String` | No |  |
| `mailStateProvince` | `String` | No |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `nameOfBusiness` | `String` | No |  |
| `notes` | `String` | No |  |
| `postalCode` | `String` | No |  |
| `stateProvince` | `String` | No |  |
| `uniqueId` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  match <- jo [("id", VStr "location_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`eDeleted`); it keeps the data it held. Raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  match <- jo [("id", VStr "location_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Location` entity with the same options.

#### `eName :: String`

The entity name.


---

## Partner

```haskell
  ent <- Sdk.partner sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No |  |
| `clientCanOrderEquipment` | `Bool` | No |  |
| `contact` | `Value` | No |  |
| `created` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `location` | `Value` | Yes |  |
| `modified` | `String` | No |  |
| `name` | `String` | No |  |
| `parent` | `Value` | No |  |
| `partnerId` | `String` | No |  |
| `reference` | `String` | No |  |
| `verificationPhrase` | `String` | No |  |
| `version` | `Int` | No |  |

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

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- jo [("id", VStr "partner_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Partner` entity with the same options.

#### `eName :: String`

The entity name.


---

## Shipment

```haskell
  ent <- Sdk.shipment sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No |  |
| `client` | `Value` | No |  |
| `created` | `String` | No |  |
| `dateReceived` | `String` | No |  |
| `dateShipped` | `String` | No |  |
| `dcKif` | `Value` | No |  |
| `id` | `String` | No |  |
| `items` | `[Value]` | No |  |
| `kif` | `Value` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Value` | No |  |
| `shipmentType` | `String` | No |  |
| `tracking` | `String` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.shipment sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- jo [("id", VStr "shipment_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Shipment` entity with the same options.

#### `eName :: String`

The entity name.


---

## Success

```haskell
  ent <- Sdk.success sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `Bool` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.success sdk VNoval
  d <- jo
    [ ("share_partner_to", VStr "example_share_partner_to")   -- String
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`eDeleted`); it keeps the data it held. Raises on error.

```haskell
  ent <- Sdk.success sdk VNoval
  match <- jo [("share_partner_to", VStr "share_partner_to")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Success` entity with the same options.

#### `eName :: String`

The entity name.


---

## Transaction

```haskell
  ent <- Sdk.transaction sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No |  |
| `client` | `Value` | No |  |
| `clientRef` | `String` | No |  |
| `created` | `String` | No |  |
| `decrypted` | `Int` | No |  |
| `deviceName` | `String` | No |  |
| `directPartner` | `Value` | No |  |
| `encrypted` | `Int` | No |  |
| `endDate` | `String` | No |  |
| `errCode` | `String` | No |  |
| `errMessage` | `String` | No |  |
| `id` | `String` | No |  |
| `ipAddress` | `String` | No |  |
| `isVirtual` | `Bool` | No |  |
| `keyType` | `String` | No |  |
| `location` | `Value` | Yes |  |
| `messageId` | `String` | No |  |
| `method` | `String` | No |  |
| `partner` | `Value` | No |  |
| `reference` | `String` | No |  |
| `serialNumber` | `String` | No |  |
| `startDate` | `String` | No |  |
| `success` | `Bool` | No |  |
| `transactionSource` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- jo [("id", VStr "transaction_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `Transaction` entity with the same options.

#### `eName :: String`

The entity name.


---

## UpdateResult

```haskell
  ent <- Sdk.update_result sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `kif` | `Value` | No |  |
| `lastName` | `String` | No |  |
| `partner` | `Value` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `Value` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one ENTITY per record and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eUpdate ent data ctrl :: IO Entity`

Update an existing entity. The data must include the entity `id`. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    [ ("id", VStr "id")
    ]  -- fields to update
  ctrl <- emptyMap
  result <- Sdk.eUpdate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `UpdateResult` entity with the same options.

#### `eName :: String`

The entity name.


---

## User

```haskell
  ent <- Sdk.user sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Value` | No |  |
| `created` | `String` | No |  |
| `email` | `String` | No |  |
| `firstName` | `String` | No |  |
| `id` | `String` | No |  |
| `isActive` | `Bool` | No |  |
| `kif` | `Value` | No |  |
| `lastName` | `String` | No |  |
| `modified` | `String` | No |  |
| `partner` | `Value` | No |  |
| `phone` | `String` | No |  |
| `userName` | `String` | No |  |
| `userRole` | `Value` | No |  |
| `version` | `Int` | No |  |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the ENTITY (read the record with `eDataGet`) and raises on error.

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the ENTITY, marked deleted (`eDeleted`); it keeps the data it held. Raises on error.

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `User` entity with the same options.

#### `eName :: String`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("test", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

