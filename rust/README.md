# BluefinDecryptxP2pe Rust SDK



The Rust SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Rust conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(Value::Noval)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This crate is not yet published to crates.io. Depend on it from the GitHub
release tag (`rust/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/tags)) or
from a source checkout by adding it to your `Cargo.toml`:

```toml
[dependencies]
# From a source checkout:
voxgig-bluefin-decryptx-p2pe-sdk = { path = "../rust" }

# Or from the git release tag:
# voxgig-bluefin-decryptx-p2pe-sdk = { git = "<repo-url>", tag = "rust/vX.Y.Z" }
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```rust
use bluefin_decryptx_p2pe_sdk::{getp, jo, BluefinDecryptxP2peEntity, BluefinDecryptxP2peSDK, Entity, Value};

let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("apikey", Value::str(std::env::var("BLUEFIN_DECRYPTX_P2PE_APIKEY").unwrap_or_default())),
]));
```

### 2. List attestation records

`list()` returns one entity per record, and `Err` on failure — match on
the `Result`. `data(None)` reads an entity's record.

```rust
match client.attestation(Value::Noval).list(jo(vec![("client", Value::str("example"))]), Value::Noval) {
    Ok(attestations) => {
        for attestation in &attestations {
            println!("{:?}", attestation.data(None));
        }
    }
    Err(err) => eprintln!("list failed: {}", err),
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the entity, and `Err` on failure; `data(None)` reads its
record.

```rust
match client.device_custody_detail(Value::Noval).load(jo(vec![("device_type", Value::str("example_device_type")), ("serial_number", Value::str("example_serial_number")), ("id", Value::str("example_id"))]), Value::Noval) {
    Ok(device_custody_detail) => println!("{:?}", device_custody_detail.data(None)),
    Err(err) => eprintln!("load failed: {}", err),
}
```

### 4. Create, update, and remove

```rust
// Create — returns the created entity
let created = client.attestation(Value::Noval).create(jo(vec![("devices", Value::empty_list())]), Value::Noval).unwrap();

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const devicetypes = await client.DeviceType().list()
  console.log(devicetypes.map((item) => item.data()))
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
result envelope. Branch on `ok`; on failure `status` holds the HTTP status
(for error responses) and `err` holds the error:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (!result.ok) {
  console.error('request failed:', result.status, result.err)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```rust
let result = client.direct(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("GET")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

if getp(&result, "ok") == Value::Bool(true) {
    println!("{:?}", getp(&result, "status"));  // 200
    println!("{:?}", getp(&result, "data"));    // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    println!("{:?} {:?}", getp(&result, "status"), getp(&result, "err"));
}
```

### Prepare a request without sending it

```rust
// prepare() returns the fetch definition on Ok and Err on failure.
let fetchdef = client.prepare(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("DELETE")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

println!("{:?}", getp(&fetchdef, "url"));
println!("{:?}", getp(&fetchdef, "method"));
println!("{:?}", getp(&fetchdef, "headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```rust
use bluefin_decryptx_p2pe_sdk::{jo, test_sdk, BluefinDecryptxP2peEntity, Entity, Value};

let client = test_sdk(Value::Noval, Value::Noval);

// list returns one entity per mock record on Ok, and Err on failure.
for device_type in client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap() {
    println!("{:?}", device_type.data(None));
}
```

### Point at a different server

Override the base URL to reach a local or staging server:

```rust
let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("base", Value::str("http://localhost:8080")),
]));
```

### Run live tests

Create a `.env.local` file at the crate root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd rust && cargo test
```


## Reference

### BluefinDecryptxP2peSDK

```rust
use bluefin_decryptx_p2pe_sdk::{BluefinDecryptxP2peSDK, Value};

let client = BluefinDecryptxP2peSDK::new(options);
```

Creates a new SDK client. `options` is a `Value` map (`Value::Noval` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```rust
use bluefin_decryptx_p2pe_sdk::{test_sdk, Value};

let client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::Noval`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Value` | Deep copy of the current SDK options. |
| `get_utility` | `() -> Rc<Utility>` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>` | Build and send an HTTP request. `Ok` is a result map (branch on `ok`). |
| `attestation` | `(entopts: Value) -> Rc<AttestationEntity>` | Create an Attestation entity instance. |
| `client` | `(entopts: Value) -> Rc<ClientEntity>` | Create a Client entity instance. |
| `create_result` | `(entopts: Value) -> Rc<CreateResultEntity>` | Create a CreateResult entity instance. |
| `decryption` | `(entopts: Value) -> Rc<DecryptionEntity>` | Create a Decryption entity instance. |
| `device` | `(entopts: Value) -> Rc<DeviceEntity>` | Create a Device entity instance. |
| `device_build` | `(entopts: Value) -> Rc<DeviceBuildEntity>` | Create a DeviceBuild entity instance. |
| `device_custody_detail` | `(entopts: Value) -> Rc<DeviceCustodyDetailEntity>` | Create a DeviceCustodyDetail entity instance. |
| `device_custody_list_item` | `(entopts: Value) -> Rc<DeviceCustodyListItemEntity>` | Create a DeviceCustodyListItem entity instance. |
| `device_receive_result` | `(entopts: Value) -> Rc<DeviceReceiveResultEntity>` | Create a DeviceReceiveResult entity instance. |
| `device_rki_activate_result` | `(entopts: Value) -> Rc<DeviceRkiActivateResultEntity>` | Create a DeviceRkiActivateResult entity instance. |
| `device_state` | `(entopts: Value) -> Rc<DeviceStateEntity>` | Create a DeviceState entity instance. |
| `device_type` | `(entopts: Value) -> Rc<DeviceTypeEntity>` | Create a DeviceType entity instance. |
| `inject_key` | `(entopts: Value) -> Rc<InjectKeyEntity>` | Create an InjectKey entity instance. |
| `kif` | `(entopts: Value) -> Rc<KifEntity>` | Create a Kif entity instance. |
| `location` | `(entopts: Value) -> Rc<LocationEntity>` | Create a Location entity instance. |
| `partner` | `(entopts: Value) -> Rc<PartnerEntity>` | Create a Partner entity instance. |
| `shipment` | `(entopts: Value) -> Rc<ShipmentEntity>` | Create a Shipment entity instance. |
| `success` | `(entopts: Value) -> Rc<SuccessEntity>` | Create a Success entity instance. |
| `transaction` | `(entopts: Value) -> Rc<TransactionEntity>` | Create a Transaction entity instance. |
| `update_result` | `(entopts: Value) -> Rc<UpdateResultEntity>` | Create an UpdateResult entity instance. |
| `user` | `(entopts: Value) -> Rc<UserEntity>` | Create an User entity instance. |
| `virtual_device` | `(entopts: Value) -> Rc<VirtualDeviceEntity>` | Create a VirtualDevice entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Rc<Self>, BluefinDecryptxP2peError>` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) -> Result<Vec<Rc<Self>>, BluefinDecryptxP2peError>` | List entities matching the criteria, one per record. |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Rc<Self>, BluefinDecryptxP2peError>` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) -> Result<Rc<Self>, BluefinDecryptxP2peError>` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) -> Result<Rc<Self>, BluefinDecryptxP2peError>` | Remove an entity, which is returned marked as deleted. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the entity on `Ok`, and `list` a `Vec` of
entities, one per record; `data(None)` reads an entity's record. `Err` is
the branded error. The operations are methods of the
`BluefinDecryptxP2peEntity` trait and `data` of the `Entity` trait, so
import both.

The `direct()` escape hatch resolves to `Ok` even on a non-2xx response —
it returns a result `Value::Map` you branch on via `getp(&result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` | Reference to the associated Client resource. |
| `completeDate` | The date and time that the Attestation took place. |
| `created` | Creation timestamp in ISO 8601 format. |
| `device` | Reference to the associated Device resource. |
| `devices` |  |
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
| `completeDate` | The date and time that the Custody change took place. |
| `custodian` | Reference to the associated User resource. |
| `location` | Reference to the associated Location resource. |
| `notes` | Free form field that allows the Client associate notes with the Custody Change. |

Operations: Create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `cbcVector` | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | The device Type. |
| `encoding` | The payload encoding |
| `encrypted` |  |
| `hasCcData` | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | The serial number of the device. |
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

#### DeviceCustodyListItem

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

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `serialNumber` | The serial number of the Device that is shipped. |
| `success` | Indicates if the action succeeded. |
| `tamperLabel` | The code that is printed the tamper label of the Device that is shipped. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `appVersion` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | The Device Builds's name. |
| `buildNumber` | The Build Number. |
| `configFile` | \? |
| `firmwareVersion` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | A list of hardware versions that this Device Build covers. |
| `serialNumber` | The referenced Device's serial number. |
| `success` | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | \? |

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
| `client` | Reference to the associated Client resource. |
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
| `location` | Reference to the associated Location resource. |
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
| `devices` | An array of Device ids to share with partner. |
| `sharePartnerFrom` | Reference to the associated Partner. |
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
| `device` | Reference to the associated Device resource. |
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
| `address1` | The Location's street address. |
| `address2` | The Location's street address. |
| `alternateKey` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | Date and time that the Device is due its next PCI Audit. |
| `billingId` | \? |
| `city` | The Location's city. |
| `client` | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | Client Reference property that is included in the decrypt API call. |
| `contact` | Reference to the associated User resource. |
| `country` | Reference to the associated Country. |
| `customReference` | A Partner specified reference for a location. |
| `dateShipped` | The date and time that a package is shipped. |
| `decrypted` | A Transcation can process muliple decryptions. |
| `device` | Reference to the associated Device resource. |
| `deviceBuild` | Reference to the associated Device Build resource. |
| `deviceType` | Reference to the associated Device Type resource. |
| `directPartner` | Reference to the associated Partner. |
| `email` | The User's email address. |
| `encrypted` | A Transcation can process muliple encryptions. |
| `endDate` | Timestamp from the end of the transaction. |
| `errCode` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | The User's name. |
| `id` | ID of newly created resource |
| `injectKey` | Reference to the associated Device resource. |
| `ipAddress` | The IP address of the http client that makes the decrypt API call. |
| `isActive` | This property indicates if the User account is active or disabled. |
| `items` |  |
| `keyType` | The type of cipher used during decrytion. |
| `kif` | Reference to the associated KIF resource. |
| `lastName` | The User's Surname. |
| `location` | Reference to the associated Location resource. |
| `locationType` | The Location's clasification. |
| `mailAddress1` | The Location's street address. |
| `mailAddress2` | The Location's street address. |
| `mailCity` | The Location's city. |
| `mailCountry` | The Location's street address. |
| `mailPostalCode` | The Location's postal code. |
| `mailStateProvince` | The Location's street state or province. |
| `messageId` | Message ID. |
| `method` | The decryption cypher/method. |
| `mid` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | The Client's name. |
| `nameOfBusiness` | The name of the business at this location. |
| `notes` | Arbitary note that can be attached to a Device entry. |
| `parent` | Reference to the associated Partner. |
| `partner` | Reference to the associated Partner. |
| `partnerId` | The Partner's id. |
| `phone` | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | The Location's postal code. |
| `reference` | The Partner's reference string. |
| `sendWelcomeEmail` | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | The Device's serial number. |
| `startDate` | Timestamp from the beginning of the transaction. |
| `stateProvince` | The Location's street state or province. |
| `success` | The success indicator. |
| `tracking` | The courier's tracking number. |
| `uniqueId` | Unique Identifier for the Location. |
| `userName` | The User's unique username. |
| `userRole` | Reference to the associated User Role. |
| `verificationPhrase` | The verification phrase is a message that the Partner creates. |
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

#### VirtualDevice

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `id` |  |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`



## Entities


### Attestation

Create an instance: `let attestation = client.attestation(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `completeDate` | `String` | The date and time that the Attestation took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `device` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `devices` | `Vec<Value>` |  |
| `id` | `String` | This resource's unique identifier. |
| `name` | `String` | Text describing the attestation. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```rust
let attestation = client.attestation(Value::Noval).load(jo(vec![("id", Value::str("attestation_id"))]), Value::Noval).unwrap();
println!("{:?}", attestation.data(None));
```

#### Example: List

```rust
let attestations = client.attestation(Value::Noval).list(jo(vec![("client", Value::str("example"))]), Value::Noval).unwrap();
for attestation in &attestations {
    println!("{:?}", attestation.data(None));
}
```

#### Example: Create

```rust
let attestation = client.attestation(Value::Noval).create(jo(vec![
    ("devices", Value::empty_list()),  // Vec<Value>
]), Value::Noval).unwrap();
```


### Client

Create an instance: `let client = client.client(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. `Ok` is the entity, marked as deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Client's name. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the Client's root Partner. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let client = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
println!("{:?}", client.data(None));
```

#### Example: List

```rust
let clients = client.client(Value::Noval).list(jo(vec![("partner", Value::str("example"))]), Value::Noval).unwrap();
for client in &clients {
    println!("{:?}", client.data(None));
}
```

#### Example: Create

```rust
let client = client.client(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### CreateResult

Create an instance: `let create_result = client.create_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `custodian` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |

#### Example: Create

```rust
let create_result = client.create_result(Value::Noval).create(jo(vec![
    ("device_type", Value::str("example_device_type")),  // String
    ("serial_number", Value::str("example_serial_number")),  // String
    ("custodian", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### Decryption

Create an instance: `let decryption = client.decryption(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `cbcVector` | `String` | Base64 or hex encoded initial vector obtained from device. |
| `deviceType` | `String` | The device Type. |
| `encoding` | `String` | The payload encoding |
| `encrypted` | `Vec<Value>` |  |
| `hasCcData` | `String` | Validation flag that indicates whether inbound and outbound data should be checked for credit card numbers. |
| `reference` | `String` | A string (of up to 50 characters) that helps partners identify individual API calls. |
| `sequenceNumber` | `String` | Sequence number obtained from device in base 64 or hex encoded format. |
| `serialNumber` | `String` | The serial number of the device. |
| `success` | `bool` | true if the payload decryption was successful. |

#### Example: Create

```rust
let decryption = client.decryption(Value::Noval).create(jo(vec![
    ("deviceType", Value::str("example_deviceType")),  // String
    ("encrypted", Value::empty_list()),  // Vec<Value>
    ("serialNumber", Value::str("example_serialNumber")),  // String
]), Value::Noval).unwrap();
```


### Device

Create an instance: `let device = client.device(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `activationDate` | `String` | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `deviceBuild` | `std::collections::HashMap<String, Value>` | Reference to the associated Device Build resource. |
| `deviceState` | `std::collections::HashMap<String, Value>` | Reference to the associated Device State resource. |
| `deviceType` | `std::collections::HashMap<String, Value>` | Reference to the associated Device Type resource. |
| `errorCounter` | `i64` | The number times the Device has been in error. |
| `errorLastDate` | `String` | Timestamp from the last time that the Device had an error. |
| `id` | `String` | The Device's unique identifier. |
| `initializedBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `initializedDate` | `String` | Timestamp from when the Device was initialized. |
| `injectKey` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `std::collections::HashMap<String, Value>` | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | Timestamp from the last time that the Device was used. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `name` | `String` | The Device's name. |
| `notes` | `String` | Arbitary note that can be attached to a Device entry. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `serialNumber` | `String` | The Device's serial number. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let device = client.device(Value::Noval).load(jo(vec![("id", Value::str("device_id"))]), Value::Noval).unwrap();
println!("{:?}", device.data(None));
```

#### Example: List

```rust
let devices = client.device(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for device in &devices {
    println!("{:?}", device.data(None));
}
```

#### Example: Create

```rust
let device = client.device(Value::Noval).create(jo(vec![
    ("activatedBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("createdBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("initializedBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("modifiedBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### DeviceBuild

Create an instance: `let device_build = client.device_build(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `String` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String` | The Build Number. |
| `configFileName` | `String` | The name of the configuration file that is uploaded to the device. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String` | The Device Type Name. |
| `firmwareVersion` | `String` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | A list of hardware versions that this Device Build covers. |
| `id` | `i64` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Device Builds's name. |
| `notes` | `String` | Notes attached to the device build by Bluefin CISO. |
| `version` | `i64` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```rust
let device_build = client.device_build(Value::Noval).load(jo(vec![("id", Value::str("device_build_id"))]), Value::Noval).unwrap();
println!("{:?}", device_build.data(None));
```

#### Example: List

```rust
let device_builds = client.device_build(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for device_build in &device_builds {
    println!("{:?}", device_build.data(None));
}
```


### DeviceCustodyDetail

Create an instance: `let device_custody_detail = client.device_custody_detail(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `custodian` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `device` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `id` | `i64` | This resource's unique identifier. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::collections::HashMap<String, Value>` | Reference to the associated Custody Status. |
| `transferMethod` | `std::collections::HashMap<String, Value>` | Reference to the associated Transfer Method. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let device_custody_detail = client.device_custody_detail(Value::Noval).load(jo(vec![("id", Value::str("device_custody_detail_id")), ("device_type", Value::str("device_type")), ("serial_number", Value::str("serial_number"))]), Value::Noval).unwrap();
println!("{:?}", device_custody_detail.data(None));
```


### DeviceCustodyListItem

Create an instance: `let device_custody_list_item = client.device_custody_list_item(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `custodian` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `device` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `id` | `i64` | This resource's unique identifier. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::collections::HashMap<String, Value>` | Reference to the associated Custody Status. |
| `transferMethod` | `std::collections::HashMap<String, Value>` | Reference to the associated Transfer Method. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: List

```rust
let device_custody_list_items = client.device_custody_list_item(Value::Noval).list(jo(vec![("device_type", Value::str("example")), ("serial_number", Value::str("example"))]), Value::Noval).unwrap();
for device_custody_list_item in &device_custody_list_items {
    println!("{:?}", device_custody_list_item.data(None));
}
```


### DeviceReceiveResult

Create an instance: `let device_receive_result = client.device_receive_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `serialNumber` | `String` | The serial number of the Device that is shipped. |
| `success` | `bool` | Indicates if the action succeeded. |
| `tamperLabel` | `String` | The code that is printed the tamper label of the Device that is shipped. |

#### Example: Create

```rust
let device_receive_result = client.device_receive_result(Value::Noval).create(jo(vec![
    ("serialNumber", Value::str("example_serialNumber")),  // String
    ("success", Value::Bool(true)),  // bool
    ("tamperLabel", Value::str("example_tamperLabel")),  // String
]), Value::Noval).unwrap();
```


### DeviceRkiActivateResult

Create an instance: `let device_rki_activate_result = client.device_rki_activate_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `String` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildName` | `String` | The Device Builds's name. |
| `buildNumber` | `String` | The Build Number. |
| `configFile` | `String` | \? |
| `firmwareVersion` | `String` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | A list of hardware versions that this Device Build covers. |
| `serialNumber` | `String` | The referenced Device's serial number. |
| `success` | `bool` | Indicates if the RKI activation succeeded. |
| `whiteListingBinRanges` | `String` | \? |

#### Example: Create

```rust
let device_rki_activate_result = client.device_rki_activate_result(Value::Noval).create(jo(vec![
    ("serialNumber", Value::str("example_serialNumber")),  // String
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```


### DeviceState

Create an instance: `let device_state = client.device_state(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` | Unique identifier for this Device state. |
| `name` | `String` | Descriptive name for this Device state. |

#### Example: List

```rust
let device_states = client.device_state(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for device_state in &device_states {
    println!("{:?}", device_state.data(None));
}
```


### DeviceType

Create an instance: `let device_type = client.device_type(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | The Device type. |
| `hardwareVersion` | `String` | The Device hardware version. |
| `id` | `String` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | The Device manufacturer. |
| `model` | `String` | The Device model. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The DeviceType name. |
| `photoUrl` | `String` |  |
| `productName` | `String` | The Device name. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let device_type = client.device_type(Value::Noval).load(jo(vec![("id", Value::str("device_type_id"))]), Value::Noval).unwrap();
println!("{:?}", device_type.data(None));
```

#### Example: List

```rust
let device_types = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for device_type in &device_types {
    println!("{:?}", device_type.data(None));
}
```


### InjectKey

Create an instance: `let inject_key = client.inject_key(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `String` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | The cipher type that the key works with. |
| `modified` | `String` | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | Key name. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let inject_key = client.inject_key(Value::Noval).load(jo(vec![("id", Value::str("inject_key_id"))]), Value::Noval).unwrap();
println!("{:?}", inject_key.data(None));
```

#### Example: List

```rust
let inject_keys = client.inject_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for inject_key in &inject_keys {
    println!("{:?}", inject_key.data(None));
}
```


### Kif

Create an instance: `let kif = client.kif(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` | This resource's unique identifier. |
| `name` | `String` | The KIF's name. |

#### Example: List

```rust
let kifs = client.kif(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for kif in &kifs {
    println!("{:?}", kif.data(None));
}
```


### Location

Create an instance: `let location = client.location(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. `Ok` is the entity, marked as deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `String` | The Location's street address. |
| `address2` | `String` | The Location's street address. |
| `billingId` | `String` | \? |
| `city` | `String` | The Location's city. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `country` | `String` | The Location's country. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `customReference` | `String` | A Partner specified reference for a location. |
| `id` | `String` | This resource's unique identifier. |
| `locationType` | `String` | The Location's clasification. |
| `mailAddress1` | `String` | The Location's street address. |
| `mailAddress2` | `String` | The Location's street address. |
| `mailCity` | `String` | The Location's city. |
| `mailCountry` | `String` | The Location's street address. |
| `mailPostalCode` | `String` | The Location's postal code. |
| `mailStateProvince` | `String` | The Location's street state or province. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Location's name. |
| `nameOfBusiness` | `String` | The name of the business at this location. |
| `notes` | `String` | Note for delivery driver. |
| `postalCode` | `String` | The Location's postal code. |
| `stateProvince` | `String` | The Location's street state or province. |
| `uniqueId` | `String` | Unique Identifier for the Location. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let location = client.location(Value::Noval).load(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
println!("{:?}", location.data(None));
```

#### Example: List

```rust
let locations = client.location(Value::Noval).list(jo(vec![("client", Value::str("example"))]), Value::Noval).unwrap();
for location in &locations {
    println!("{:?}", location.data(None));
}
```

#### Example: Create

```rust
let location = client.location(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Partner

Create an instance: `let partner = client.partner(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Partner's name. |
| `parent` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `partnerId` | `String` | The Partner's id. |
| `reference` | `String` | The Partner's reference string. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let partner = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
println!("{:?}", partner.data(None));
```

#### Example: List

```rust
let partners = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for partner in &partners {
    println!("{:?}", partner.data(None));
}
```

#### Example: Create

```rust
let partner = client.partner(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### Shipment

Create an instance: `let shipment = client.shipment(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` | The name of the courier. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | The date and time that a package is recieved. |
| `dateShipped` | `String` | The date and time that a package is shipped. |
| `dcKif` | `std::collections::HashMap<String, Value>` | Reference to the associated KIF resource. |
| `id` | `String` | This resource's unique identifier. |
| `items` | `Vec<Value>` |  |
| `kif` | `std::collections::HashMap<String, Value>` | Reference to the associated KIF resource. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `shipmentType` | `String` | The type of shipment. |
| `tracking` | `String` | The courier's tracking number. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let shipment = client.shipment(Value::Noval).load(jo(vec![("id", Value::str("shipment_id"))]), Value::Noval).unwrap();
println!("{:?}", shipment.data(None));
```

#### Example: List

```rust
let shipments = client.shipment(Value::Noval).list(jo(vec![("kif", Value::str("example"))]), Value::Noval).unwrap();
for shipment in &shipments {
    println!("{:?}", shipment.data(None));
}
```

#### Example: Create

```rust
let shipment = client.shipment(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### Success

Create an instance: `let success = client.success(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. `Ok` is the entity, marked as deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `devices` | `Vec<Value>` | An array of Device ids to share with partner. |
| `sharePartnerFrom` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `success` | `bool` | Indicates if the action was a success. |

#### Example: Create

```rust
let success = client.success(Value::Noval).create(jo(vec![
    ("share_partner_to", Value::str("example_share_partner_to")),  // String
    ("devices", Value::empty_list()),  // Vec<Value>
    ("sharePartnerFrom", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### Transaction

Create an instance: `let transaction = client.transaction(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `clientRef` | `String` | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `i64` | A Transcation can process muliple decryptions. |
| `device` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `deviceName` | `String` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `encrypted` | `i64` | A Transcation can process muliple encryptions. |
| `endDate` | `String` | Timestamp from the end of the transaction. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | This resource's unique identifier. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | The type of cipher used during decrytion. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `messageId` | `String` | Message ID. |
| `method` | `String` | The decryption cypher/method. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `reference` | `String` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `String` | The source of the Transaction. |

#### Example: Load

```rust
let transaction = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
println!("{:?}", transaction.data(None));
```

#### Example: List

```rust
let transactions = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for transaction in &transactions {
    println!("{:?}", transaction.data(None));
}
```

#### Example: Create

```rust
let transaction = client.transaction(Value::Noval).create(jo(vec![
    ("device", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### UpdateResult

Create an instance: `let update_result = client.update_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. `Ok` is the entity. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. `Ok` is a `Vec` of entities, one per record. |
| `update(reqdata, ctrl)` | Update an existing entity. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `String` | The Location's street address. |
| `address2` | `String` | The Location's street address. |
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | Date and time that the Device is due its next PCI Audit. |
| `billingId` | `String` | \? |
| `city` | `String` | The Location's city. |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `clientRef` | `String` | Client Reference property that is included in the decrypt API call. |
| `contact` | `std::collections::HashMap<String, Value>` | Reference to the associated User resource. |
| `country` | `std::collections::HashMap<String, Value>` | Reference to the associated Country. |
| `customReference` | `String` | A Partner specified reference for a location. |
| `dateShipped` | `String` | The date and time that a package is shipped. |
| `decrypted` | `i64` | A Transcation can process muliple decryptions. |
| `device` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `deviceBuild` | `std::collections::HashMap<String, Value>` | Reference to the associated Device Build resource. |
| `deviceType` | `std::collections::HashMap<String, Value>` | Reference to the associated Device Type resource. |
| `directPartner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `email` | `String` | The User's email address. |
| `encrypted` | `i64` | A Transcation can process muliple encryptions. |
| `endDate` | `String` | Timestamp from the end of the transaction. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `firstName` | `String` | The User's name. |
| `id` | `String` | ID of newly created resource |
| `injectKey` | `std::collections::HashMap<String, Value>` | Reference to the associated Device resource. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `items` | `Vec<Value>` |  |
| `keyType` | `String` | The type of cipher used during decrytion. |
| `kif` | `std::collections::HashMap<String, Value>` | Reference to the associated KIF resource. |
| `lastName` | `String` | The User's Surname. |
| `location` | `std::collections::HashMap<String, Value>` | Reference to the associated Location resource. |
| `locationType` | `String` | The Location's clasification. |
| `mailAddress1` | `String` | The Location's street address. |
| `mailAddress2` | `String` | The Location's street address. |
| `mailCity` | `String` | The Location's city. |
| `mailCountry` | `String` | The Location's street address. |
| `mailPostalCode` | `String` | The Location's postal code. |
| `mailStateProvince` | `String` | The Location's street state or province. |
| `messageId` | `String` | Message ID. |
| `method` | `String` | The decryption cypher/method. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `name` | `String` | The Client's name. |
| `nameOfBusiness` | `String` | The name of the business at this location. |
| `notes` | `String` | Arbitary note that can be attached to a Device entry. |
| `parent` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `partnerId` | `String` | The Partner's id. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets. |
| `postalCode` | `String` | The Location's postal code. |
| `reference` | `String` | The Partner's reference string. |
| `sendWelcomeEmail` | `bool` | If this property is set to '*true*' the newly created user will be sent a welcome email. |
| `serialNumber` | `String` | The Device's serial number. |
| `startDate` | `String` | Timestamp from the beginning of the transaction. |
| `stateProvince` | `String` | The Location's street state or province. |
| `success` | `bool` | The success indicator. |
| `tracking` | `String` | The courier's tracking number. |
| `uniqueId` | `String` | Unique Identifier for the Location. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `std::collections::HashMap<String, Value>` | Reference to the associated User Role. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: List

```rust
let update_results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
for update_result in &update_results {
    println!("{:?}", update_result.data(None));
}
```

#### Example: Create

```rust
let update_result = client.update_result(Value::Noval).create(jo(vec![
    ("contact", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("email", Value::str("example_email")),  // String
    ("firstName", Value::str("example_firstName")),  // String
    ("isActive", Value::Bool(true)),  // bool
    ("lastName", Value::str("example_lastName")),  // String
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("phone", Value::str("example_phone")),  // String
    ("userName", Value::str("example_userName")),  // String
    ("userRole", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### User

Create an instance: `let user = client.user(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. `Ok` is the entity, marked as deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `std::collections::HashMap<String, Value>` | Reference to the associated KIF resource. |
| `lastName` | `String` | The User's Surname. |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `std::collections::HashMap<String, Value>` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `std::collections::HashMap<String, Value>` | Reference to the associated User Role. |
| `version` | `i64` | The number of times that this resource has been updated. |

#### Example: Load

```rust
let user = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
println!("{:?}", user.data(None));
```


### VirtualDevice

Create an instance: `let virtual_device = client.virtual_device(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. `Ok` is the entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `Vec<Value>` | List of Devices. |
| `id` | `String` |  |
| `total` | `i64` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```rust
let virtual_device = client.virtual_device(Value::Noval).load(jo(vec![("id", Value::str("virtual_device_id"))]), Value::Noval).unwrap();
println!("{:?}", virtual_device.data(None));
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Audit trail |
| [`clienttrack`](#clienttrack) | Client tracking |
| [`debug`](#debug) | Debug capture |
| [`idempotency`](#idempotency) | Idempotency |
| [`log`](#log) | Logging |
| [`metrics`](#metrics) | Metrics |
| [`paging`](#paging) | Paging |
| [`ratelimit`](#ratelimit) | Rate limiting |
| [`retry`](#retry) | Retry |
| [`telemetry`](#telemetry) | Telemetry |
| [`test`](#test) | Test transport |
| [`timeout`](#timeout) | Timeout |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Audit trail.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client tracking.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### debug

Debug capture.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

### idempotency

Idempotency.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Metrics.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Paging.

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

Rate limiting.

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

Retry.

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

Telemetry.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Timeout.

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

- **AuditFeature**: Audit trail
- **ClienttrackFeature**: Client tracking
- **DebugFeature**: Debug capture
- **IdempotencyFeature**: Idempotency
- **LogFeature**: Logging
- **MetricsFeature**: Metrics
- **PagingFeature**: Paging
- **RatelimitFeature**: Rate limiting
- **RetryFeature**: Retry
- **TelemetryFeature**: Telemetry
- **TestFeature**: Test transport
- **TimeoutFeature**: Timeout

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `Value`

The Rust SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port (a
JSON-shaped enum: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Crate structure

```
rust/
├── lib.rs                       -- Crate root (module decls + re-exports)
├── core/                        -- Pipeline types, config, client (sdk.rs)
├── entity/                      -- Per-entity clients (one module each)
├── feature/                     -- Built-in features (base, test, log)
└── utility/                     -- Utilities + the vendored voxgig struct port
```

The public API is re-exported from the crate root, so `use bluefin_decryptx_p2pe_sdk::{...}`
reaches the SDK client, `Value`, and the `jo` / `ja` / `getp` helpers
directly. Import entity or utility modules only when needed.

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
