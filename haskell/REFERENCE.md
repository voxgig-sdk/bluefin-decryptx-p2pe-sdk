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

#### `device_custody_list_item :: Client -> Value -> IO Entity`

Construct a `DeviceCustodyListItem` entity bound to the client. Pass `VNoval` for no initial options.

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

#### `virtual_device :: Client -> Value -> IO Entity`

Construct a `VirtualDevice` entity bound to the client. Pass `VNoval` for no initial options.

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
| `client` | `Value` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | The date and time that the Attestation took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `device` | `Value` | No | Reference to the associated Device resource. |
| `devices` | `[Value]` | Yes |  |
| `id` | `String` | No | This resource's unique identifier. |
| `name` | `String` | No | Text describing the attestation. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Attestation. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `client` | - | - | Yes |
| `completeDate` | - | - | Yes |
| `created` | - | - | - |
| `device` | - | - | - |
| `devices` | - | - | - |
| `id` | - | - | - |
| `name` | - | - | Yes |
| `notes` | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.attestation sdk VNoval
  d <- jo
    [ ("devices", VNoval)   -- [Value]
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.attestation sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `contact` | `Value` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Value` | No | Reference to the associated Partner. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `Value` | No | Reference to the Client's root Partner. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | Yes | - |
| `created` | - | - | - | - |
| `directPartner` | - | - | Yes | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

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

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

```haskell
  ent <- Sdk.client sdk VNoval
  match <- jo [("id", VStr "client_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the entity, marked as deleted (`eDeleted`); it keeps the data it held. Raises on error.

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

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `custodian` | `Value` | Yes | Reference to the associated User resource. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.create_result sdk VNoval
  d <- jo
    [ ("device_type", VStr "example_device_type")   -- String
    , ("serial_number", VStr "example_serial_number")   -- String
    , ("custodian", VNoval)   -- Value
    , ("location", VNoval)   -- Value
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
| `cbcVector` | `String` | No | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `String` | Yes | The device Type. |
| `encoding` | `String` | No | The payload encoding |
| `encrypted` | `[Value]` | Yes |  |
| `hasCcData` | `String` | No | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `String` | No | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `String` | No | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `String` | Yes | The serial number of the device. |
| `success` | `Bool` | No | true if the payload decryption was successful. |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.decryption sdk VNoval
  d <- jo
    [ ("deviceType", VStr "example_deviceType")   -- String
    , ("encrypted", VNoval)   -- [Value]
    , ("serialNumber", VStr "example_serialNumber")   -- String
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
| `activatedBy` | `Value` | Yes | Reference to the associated User resource. |
| `activationDate` | `String` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `Value` | No | Reference to the associated Device Build resource. |
| `deviceState` | `Value` | No | Reference to the associated Device State resource. |
| `deviceType` | `Value` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `Int` | No | The number times the Device has been in error. |
| `errorLastDate` | `String` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String` | No | The Device's unique identifier. |
| `initializedBy` | `Value` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `Value` | No | Reference to the associated Device resource. |
| `isVirtual` | `Bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Value` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | No | Timestamp from the last time that the Device was used. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Value` | Yes | Reference to the associated User resource. |
| `name` | `String` | No | The Device's name. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `serialNumber` | `String` | No | The Device's serial number. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `activatedBy` | - | - | - |
| `activationDate` | - | - | - |
| `alternateKey` | - | - | - |
| `auditNextDate` | - | - | - |
| `auditNotificationDate` | - | - | - |
| `client` | - | - | - |
| `created` | - | - | - |
| `createdBy` | - | - | - |
| `deviceBuild` | - | - | - |
| `deviceState` | - | - | - |
| `deviceType` | - | - | Yes |
| `errorCounter` | - | - | - |
| `errorLastDate` | - | - | - |
| `id` | - | - | - |
| `initializedBy` | - | - | - |
| `initializedDate` | - | - | - |
| `injectKey` | - | - | - |
| `isVirtual` | - | - | - |
| `kif` | - | - | Yes |
| `lastActivityDate` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `modifiedBy` | - | - | - |
| `name` | - | - | - |
| `notes` | - | - | - |
| `partner` | - | - | - |
| `serialNumber` | - | - | Yes |
| `version` | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

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

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.device sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `appVersion` | `String` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String` | No | The Build Number. |
| `configFileName` | `String` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String` | No | The Device Type Name. |
| `firmwareVersion` | `String` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | No | A list of hardware versions that this Device Build covers. |
| `id` | `Int` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Device Builds's name. |
| `notes` | `String` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `Int` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `Bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.device_build sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value` | Yes | Reference to the associated User resource. |
| `custodian` | `Value` | Yes | Reference to the associated User resource. |
| `device` | `Value` | No | Reference to the associated Device resource. |
| `id` | `Int` | No | This resource's unique identifier. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Value` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Value` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Value` | No | Reference to the associated Transfer Method. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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

## DeviceCustodyListItem

```haskell
  ent <- Sdk.device_custody_list_item sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Value` | Yes | Reference to the associated User resource. |
| `custodian` | `Value` | Yes | Reference to the associated User resource. |
| `device` | `Value` | No | Reference to the associated Device resource. |
| `id` | `Int` | No | This resource's unique identifier. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `Value` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Value` | No | Reference to the associated Custody Status. |
| `transferMethod` | `Value` | No | Reference to the associated Transfer Method. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.device_custody_list_item sdk VNoval
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

Create a new `DeviceCustodyListItem` entity with the same options.

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
| `serialNumber` | `String` | Yes | The serial number of the Device that is shipped. |
| `success` | `Bool` | Yes | Indicates if the action succeeded. |
| `tamperLabel` | `String` | Yes | The code that is printed the tamper label of the Device that is shipped. |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.device_receive_result sdk VNoval
  d <- jo
    [ ("serialNumber", VStr "example_serialNumber")   -- String
    , ("success", VBool True)   -- Bool
    , ("tamperLabel", VStr "example_tamperLabel")   -- String
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
| `appVersion` | `String` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `String` | No | The Device Builds's name. |
| `buildNumber` | `String` | No | The Build Number. |
| `configFile` | `String` | No | \? |
| `firmwareVersion` | `String` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | No | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `String` | Yes | The referenced Device's serial number. |
| `success` | `Bool` | Yes | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `String` | No | \? |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.device_rki_activate_result sdk VNoval
  d <- jo
    [ ("serialNumber", VStr "example_serialNumber")   -- String
    , ("success", VBool True)   -- Bool
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
| `id` | `Int` | No | Unique identifier for this Device state. |
| `name` | `String` | No | Descriptive name for this Device state. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

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
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | No | The Device type. |
| `hardwareVersion` | `String` | No | The Device hardware version. |
| `id` | `String` | No | Unique idenifier. |
| `isActive` | `Bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | No | The Device manufacturer. |
| `model` | `String` | No | The Device model. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The DeviceType name. |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No | The Device name. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.device_type sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | unique idenifier |
| `isActive` | `Bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `Bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | No | The cipher type that the key works with. |
| `modified` | `String` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | No | Key name. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.inject_key sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `id` | `Int` | No | This resource's unique identifier. |
| `name` | `String` | No | The KIF's name. |

### Operations

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

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
| `address1` | `String` | No | The Location's street address. |
| `address2` | `String` | No | The Location's street address. |
| `billingId` | `String` | No | \? |
| `city` | `String` | No | The Location's city. |
| `client` | `Value` | No | Reference to the associated Client resource. |
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
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `address1` | - | - | Yes | - |
| `address2` | - | - | - | - |
| `billingId` | - | - | - | - |
| `city` | - | - | Yes | - |
| `client` | - | - | - | - |
| `country` | - | - | Yes | - |
| `created` | - | - | - | - |
| `customReference` | - | - | - | - |
| `id` | - | - | - | - |
| `locationType` | - | - | Yes | - |
| `mailAddress1` | - | - | - | - |
| `mailAddress2` | - | - | - | - |
| `mailCity` | - | - | - | - |
| `mailCountry` | - | - | - | - |
| `mailPostalCode` | - | - | - | - |
| `mailStateProvince` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | Yes | - |
| `nameOfBusiness` | - | - | - | - |
| `notes` | - | - | - | - |
| `postalCode` | - | - | - | - |
| `stateProvince` | - | - | - | - |
| `uniqueId` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

```haskell
  ent <- Sdk.location sdk VNoval
  match <- jo [("id", VStr "location_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the entity, marked as deleted (`eDeleted`); it keeps the data it held. Raises on error.

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
| `billingId` | `String` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `Bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Value` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `Value` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `contact` | - | Yes | Yes |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | Yes |
| `parent` | - | - | Yes |
| `partnerId` | - | - | - |
| `reference` | - | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

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

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.partner sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `carrier` | `String` | No | The name of the courier. |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | No | The date and time that a package is recieved. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `dcKif` | `Value` | No | Reference to the associated KIF resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `items` | `[Value]` | No |  |
| `kif` | `Value` | No | Reference to the associated KIF resource. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `shipmentType` | `String` | No | The type of shipment. |
| `tracking` | `String` | No | The courier's tracking number. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `carrier` | - | - | Yes |
| `client` | - | - | Yes |
| `created` | - | - | - |
| `dateReceived` | - | - | - |
| `dateShipped` | - | - | Yes |
| `dcKif` | - | - | - |
| `id` | - | - | - |
| `items` | - | - | Yes |
| `kif` | - | - | Yes |
| `location` | - | - | - |
| `modified` | - | - | - |
| `partner` | - | - | Yes |
| `shipmentType` | - | - | - |
| `tracking` | - | - | Yes |
| `version` | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.shipment sdk VNoval
  d <- jo
    [ ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.shipment sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `devices` | `[Value]` | Yes | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `Value` | Yes | Reference to the associated Partner. |
| `success` | `Bool` | No | Indicates if the action was a success. |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.success sdk VNoval
  d <- jo
    [ ("share_partner_to", VStr "example_share_partner_to")   -- String
    , ("devices", VNoval)   -- [Value]
    , ("sharePartnerFrom", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the entity, marked as deleted (`eDeleted`); it keeps the data it held. Raises on error.

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
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `Int` | No | A Transcation can process muliple decryptions. |
| `device` | `Value` | Yes | Reference to the associated Device resource. |
| `deviceName` | `String` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Value` | No | Reference to the associated Partner. |
| `encrypted` | `Int` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `Bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `success` | `Bool` | No | The success indicator. |
| `transactionSource` | `String` | No | The source of the Transaction. |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `alternateKey` | - | - | - |
| `client` | - | - | Yes |
| `clientRef` | - | - | - |
| `created` | - | - | - |
| `decrypted` | - | - | - |
| `device` | - | - | - |
| `deviceName` | - | - | - |
| `directPartner` | - | - | - |
| `encrypted` | - | - | - |
| `endDate` | - | - | - |
| `errCode` | - | - | - |
| `errMessage` | - | - | - |
| `id` | - | - | - |
| `ipAddress` | - | - | Yes |
| `isVirtual` | - | - | - |
| `keyType` | - | - | Yes |
| `location` | - | - | - |
| `messageId` | - | - | - |
| `method` | - | - | Yes |
| `partner` | - | - | Yes |
| `reference` | - | - | - |
| `serialNumber` | - | - | - |
| `startDate` | - | - | - |
| `success` | - | - | - |
| `transactionSource` | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  d <- jo
    [ ("device", VNoval)   -- Value
    , ("location", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.transaction sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

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
| `address1` | `String` | No | The Location's street address. |
| `address2` | `String` | No | The Location's street address. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `String` | No | \? |
| `city` | `String` | No | The Location's city. |
| `client` | `Value` | No | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `Bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `contact` | `Value` | Yes | Reference to the associated User resource. |
| `country` | `Value` | No | Reference to the associated Country. |
| `customReference` | `String` | No | A Partner specified reference for a location. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `decrypted` | `Int` | No | A Transcation can process muliple decryptions. |
| `device` | `Value` | No | Reference to the associated Device resource. |
| `deviceBuild` | `Value` | No | Reference to the associated Device Build resource. |
| `deviceType` | `Value` | No | Reference to the associated Device Type resource. |
| `directPartner` | `Value` | No | Reference to the associated Partner. |
| `email` | `String` | Yes | The User's email address. |
| `encrypted` | `Int` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `String` | Yes | The User's name. |
| `id` | `String` | No | ID of newly created resource |
| `injectKey` | `Value` | No | Reference to the associated Device resource. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `Bool` | Yes | This property indicates if the User account is active or disabled. |
| `items` | `[Value]` | No |  |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `kif` | `Value` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | Yes | The User's Surname. |
| `location` | `Value` | Yes | Reference to the associated Location resource. |
| `locationType` | `String` | No | The Location's clasification. |
| `mailAddress1` | `String` | No | The Location's street address. |
| `mailAddress2` | `String` | No | The Location's street address. |
| `mailCity` | `String` | No | The Location's city. |
| `mailCountry` | `String` | No | The Location's street address. |
| `mailPostalCode` | `String` | No | The Location's postal code. |
| `mailStateProvince` | `String` | No | The Location's street state or province. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | No | The Client's name. |
| `nameOfBusiness` | `String` | No | The name of the business at this location. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `parent` | `Value` | No | Reference to the associated Partner. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `phone` | `String` | Yes | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `String` | No | The Location's postal code. |
| `reference` | `String` | No | The Partner's reference string. |
| `sendWelcomeEmail` | `Bool` | No | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `String` | No | The Device's serial number. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `stateProvince` | `String` | No | The Location's street state or province. |
| `success` | `Bool` | No | The success indicator. |
| `tracking` | `String` | No | The courier's tracking number. |
| `uniqueId` | `String` | No | Unique Identifier for the Location. |
| `userName` | `String` | Yes | The User's unique username. |
| `userRole` | `Value` | Yes | Reference to the associated User Role. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Field Usage by Operation

| Field | list | create | update |
| --- | --- | --- | --- |
| `address1` | - | - | - |
| `address2` | - | - | - |
| `alternateKey` | - | - | - |
| `auditNextDate` | - | - | - |
| `billingId` | - | - | - |
| `city` | - | - | - |
| `client` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `clientRef` | - | - | - |
| `contact` | - | - | - |
| `country` | - | - | - |
| `customReference` | - | - | - |
| `dateShipped` | - | - | - |
| `decrypted` | - | - | - |
| `device` | - | - | - |
| `deviceBuild` | - | - | - |
| `deviceType` | - | - | - |
| `directPartner` | - | - | - |
| `email` | Yes | - | Yes |
| `encrypted` | - | - | - |
| `endDate` | - | - | - |
| `errCode` | - | - | - |
| `errMessage` | - | - | - |
| `firstName` | Yes | - | Yes |
| `id` | - | - | - |
| `injectKey` | - | - | - |
| `ipAddress` | - | - | - |
| `isActive` | Yes | - | Yes |
| `items` | - | - | - |
| `keyType` | - | - | - |
| `kif` | - | - | - |
| `lastName` | Yes | - | Yes |
| `location` | - | - | - |
| `locationType` | - | - | - |
| `mailAddress1` | - | - | - |
| `mailAddress2` | - | - | - |
| `mailCity` | - | - | - |
| `mailCountry` | - | - | - |
| `mailPostalCode` | - | - | - |
| `mailStateProvince` | - | - | - |
| `messageId` | - | - | - |
| `method` | - | - | - |
| `mid` | - | - | - |
| `name` | - | - | - |
| `nameOfBusiness` | - | - | - |
| `notes` | - | - | - |
| `parent` | - | - | - |
| `partner` | - | - | - |
| `partnerId` | - | - | - |
| `phone` | Yes | - | Yes |
| `postalCode` | - | - | - |
| `reference` | - | - | - |
| `sendWelcomeEmail` | - | - | - |
| `serialNumber` | - | - | - |
| `startDate` | - | - | - |
| `stateProvince` | - | - | - |
| `success` | - | - | - |
| `tracking` | - | - | - |
| `uniqueId` | - | - | - |
| `userName` | Yes | - | Yes |
| `userRole` | Yes | - | Yes |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `eCreate ent data ctrl :: IO Entity`

Create a new entity with the given data. Resolves to the created entity and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  d <- jo
    [ ("contact", VNoval)   -- Value
    , ("email", VStr "example_email")   -- String
    , ("firstName", VStr "example_firstName")   -- String
    , ("isActive", VBool True)   -- Bool
    , ("lastName", VStr "example_lastName")   -- String
    , ("location", VNoval)   -- Value
    , ("phone", VStr "example_phone")   -- String
    , ("userName", VStr "example_userName")   -- String
    , ("userRole", VNoval)   -- Value
    ]
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl   -- the ENTITY
  d2 <- Sdk.eDataGet result
```

#### `eList ent match ctrl :: IO [Entity]`

List entities matching the given criteria. The match is optional — pass an empty map to list all records. Resolves to one entity per record and raises on error.

```haskell
  ent <- Sdk.update_result sdk VNoval
  match <- emptyMap
  ctrl <- emptyMap
  results <- Sdk.eList ent match ctrl   -- one ENTITY per record
  datas <- mapM Sdk.eDataGet results
```

#### `eUpdate ent data ctrl :: IO Entity`

Update an existing entity. The data must include the entity `id`. Resolves to the updated entity and raises on error.

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
| `client` | `Value` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `Bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `Value` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `Value` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `Value` | No | Reference to the associated User Role. |
| `version` | `Int` | No | The number of times that this resource has been updated. |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

```haskell
  ent <- Sdk.user sdk VNoval
  match <- jo [("id", VStr "user_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Entity`

Remove the entity matching the given criteria. Resolves to the entity, marked as deleted (`eDeleted`); it keeps the data it held. Raises on error.

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

## VirtualDevice

```haskell
  ent <- Sdk.virtual_device sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `[Value]` | No | List of Devices. |
| `id` | `String` | No |  |
| `total` | `Int` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `eLoad ent match ctrl :: IO Entity`

Load a single entity matching the given criteria. Resolves to the entity, whose record `eDataGet` reads, and raises on error.

```haskell
  ent <- Sdk.virtual_device sdk VNoval
  match <- jo [("id", VStr "virtual_device_id")]
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

Create a new `VirtualDevice` entity with the same options.

#### `eName :: String`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `audit` | 0.0.1 | Audit trail |
| `clienttrack` | 0.0.1 | Client tracking |
| `debug` | 0.0.1 | Debug capture |
| `idempotency` | 0.0.1 | Idempotency |
| `log` | 0.0.1 | Logging |
| `metrics` | 0.0.1 | Metrics |
| `paging` | 0.0.1 | Paging |
| `ratelimit` | 0.0.1 | Rate limiting |
| `retry` | 0.0.1 | Retry |
| `telemetry` | 0.0.1 | Telemetry |
| `test` | 0.0.1 | Test transport |
| `timeout` | 0.0.1 | Timeout |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("audit", active)
    , ("clienttrack", active)
    , ("debug", active)
    , ("idempotency", active)
    , ("log", active)
    , ("metrics", active)
    , ("paging", active)
    , ("ratelimit", active)
    , ("retry", active)
    , ("telemetry", active)
    , ("test", active)
    , ("timeout", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```

