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
release tag (`rust/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
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
use bluefin_decryptx_p2pe_sdk::{getp, jo, BluefinDecryptxP2peSDK, Value};

let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("apikey", Value::str(std::env::var("BLUEFIN_DECRYPTX_P2PE_APIKEY").unwrap_or_default())),
]));
```

### 2. List attestation records

`list()` returns a `Value::List` of records and returns `Err` on
failure — match on the `Result`.

```rust
match client.attestation(Value::Noval).list(Value::Noval, Value::Noval) {
    Ok(attestations) => {
        if let Value::List(items) = &attestations {
            for attestation in items.borrow().iter() {
                println!("{:?}", attestation);
            }
        }
    }
    Err(err) => eprintln!("list failed: {}", err),
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the bare record and returns `Err` on failure.

```rust
match client.device_custody_detail(Value::Noval).load(jo(vec![("device_type", Value::str("example_device_type")), ("serial_number", Value::str("example_serial_number")), ("id", Value::str("example_id"))]), Value::Noval) {
    Ok(device_custody_detail) => println!("{:?}", device_custody_detail),
    Err(err) => eprintln!("load failed: {}", err),
}
```

### 4. Create, update, and remove

```rust
// Create — returns the bare created record
let created = client.attestation(Value::Noval).create(jo(vec![("client", Value::empty_map()), ("completeDate", Value::str("example_completeDate"))]), Value::Noval).unwrap();

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
let client = test_sdk(Value::Noval, Value::Noval);

// Entity ops return the bare record on Ok and Err on failure.
let device_type = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
// device_type contains the mock response record
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
| `device_custody_list` | `(entopts: Value) -> Rc<DeviceCustodyListEntity>` | Create a DeviceCustodyList entity instance. |
| `device_list` | `(entopts: Value) -> Rc<DeviceListEntity>` | Create a DeviceList entity instance. |
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

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Load a single entity by match criteria. |
| `list` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | List entities matching the criteria (Ok is a `Value::List`). |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Create a new entity. |
| `update` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Update an existing entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>` | Remove an entity. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `Result<Value, BluefinDecryptxP2peError>` — the
bare result data on `Ok` (a `Value::Map` for single-entity ops, a
`Value::List` for `list`) and the branded error on `Err`.

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

Create an instance: `let attestation = client.attestation(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `device` | `std::collections::HashMap<String, Value>` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |

#### Example: Load

```rust
let attestation = client.attestation(Value::Noval).load(jo(vec![("id", Value::str("attestation_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let attestations = client.attestation(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let attestation = client.attestation(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Client

Create an instance: `let client = client.client(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `directPartner` | `std::collections::HashMap<String, Value>` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let client = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let clients = client.client(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
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
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Example: Create

```rust
let create_result = client.create_result(Value::Noval).create(jo(vec![
    ("device_type", Value::str("example_device_type")),  // String
    ("serial_number", Value::str("example_serial_number")),  // String
]), Value::Noval).unwrap();
```


### Decryption

Create an instance: `let decryption = client.decryption(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let decryption = client.decryption(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Device

Create an instance: `let device = client.device(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `std::collections::HashMap<String, Value>` |  |
| `activationDate` | `String` |  |
| `alternateKey` | `String` |  |
| `auditNextDate` | `String` |  |
| `auditNotificationDate` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `createdBy` | `std::collections::HashMap<String, Value>` |  |
| `deviceBuild` | `std::collections::HashMap<String, Value>` |  |
| `deviceState` | `std::collections::HashMap<String, Value>` |  |
| `deviceType` | `std::collections::HashMap<String, Value>` |  |
| `errorCounter` | `i64` |  |
| `errorLastDate` | `String` |  |
| `id` | `String` |  |
| `initializedBy` | `std::collections::HashMap<String, Value>` |  |
| `initializedDate` | `String` |  |
| `injectKey` | `std::collections::HashMap<String, Value>` |  |
| `isVirtual` | `bool` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `lastActivityDate` | `String` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `std::collections::HashMap<String, Value>` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `serialNumber` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let device = client.device(Value::Noval).load(jo(vec![("id", Value::str("device_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let devices = client.device(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
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
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

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
| `id` | `i64` |  |
| `isActive` | `bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `version` | `i64` |  |
| `whiteListingBinRanges` | `String` |  |
| `whiteListingUsed` | `bool` |  |

#### Example: Load

```rust
let device_build = client.device_build(Value::Noval).load(jo(vec![("id", Value::str("device_build_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let device_builds = client.device_build(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### DeviceCustodyDetail

Create an instance: `let device_custody_detail = client.device_custody_detail(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `std::collections::HashMap<String, Value>` |  |
| `custodian` | `std::collections::HashMap<String, Value>` |  |
| `device` | `std::collections::HashMap<String, Value>` |  |
| `id` | `i64` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `std::collections::HashMap<String, Value>` |  |
| `notes` | `String` |  |
| `status` | `std::collections::HashMap<String, Value>` |  |
| `transferMethod` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let device_custody_detail = client.device_custody_detail(Value::Noval).load(jo(vec![("id", Value::str("device_custody_detail_id")), ("device_type", Value::str("device_type")), ("serial_number", Value::str("serial_number"))]), Value::Noval).unwrap();
```


### DeviceCustodyList

Create an instance: `let device_custody_list = client.device_custody_list(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `std::collections::HashMap<String, Value>` |  |
| `custodian` | `std::collections::HashMap<String, Value>` |  |
| `device` | `std::collections::HashMap<String, Value>` |  |
| `id` | `i64` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `std::collections::HashMap<String, Value>` |  |
| `notes` | `String` |  |
| `status` | `std::collections::HashMap<String, Value>` |  |
| `transferMethod` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: List

```rust
let device_custody_lists = client.device_custody_list(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### DeviceList

Create an instance: `let device_list = client.device_list(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `Vec<Value>` |  |
| `total` | `i64` |  |

#### Example: Load

```rust
let device_list = client.device_list(Value::Noval).load(jo(vec![("share_partner_to", Value::str("share_partner_to"))]), Value::Noval).unwrap();
```


### DeviceReceiveResult

Create an instance: `let device_receive_result = client.device_receive_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let device_receive_result = client.device_receive_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```


### DeviceRkiActivateResult

Create an instance: `let device_rki_activate_result = client.device_rki_activate_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let device_rki_activate_result = client.device_rki_activate_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```


### DeviceState

Create an instance: `let device_state = client.device_state(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` |  |
| `name` | `String` |  |

#### Example: List

```rust
let device_states = client.device_state(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### DeviceType

Create an instance: `let device_type = client.device_type(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `deviceTypeMode` | `String` |  |
| `hardwareVersion` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photoUrl` | `String` |  |
| `productName` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let device_type = client.device_type(Value::Noval).load(jo(vec![("id", Value::str("device_type_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let device_types = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### InjectKey

Create an instance: `let inject_key = client.inject_key(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `isP2PE` | `bool` |  |
| `keyType` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let inject_key = client.inject_key(Value::Noval).load(jo(vec![("id", Value::str("inject_key_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let inject_keys = client.inject_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### Kif

Create an instance: `let kif = client.kif(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `i64` |  |
| `name` | `String` |  |

#### Example: List

```rust
let kifs = client.kif(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```


### Location

Create an instance: `let location = client.location(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

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
| `version` | `i64` |  |

#### Example: Load

```rust
let location = client.location(Value::Noval).load(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let locations = client.location(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
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
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `clientCanOrderEquipment` | `bool` |  |
| `contact` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `std::collections::HashMap<String, Value>` |  |
| `partnerId` | `String` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let partner = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let partners = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
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
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `dateReceived` | `String` |  |
| `dateShipped` | `String` |  |
| `dcKif` | `std::collections::HashMap<String, Value>` |  |
| `id` | `String` |  |
| `items` | `Vec<Value>` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `modified` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `shipmentType` | `String` |  |
| `tracking` | `String` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let shipment = client.shipment(Value::Noval).load(jo(vec![("id", Value::str("shipment_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let shipments = client.shipment(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let shipment = client.shipment(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### Success

Create an instance: `let success = client.success(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```rust
let success = client.success(Value::Noval).create(jo(vec![
    ("share_partner_to", Value::str("example_share_partner_to")),  // String
]), Value::Noval).unwrap();
```


### Transaction

Create an instance: `let transaction = client.transaction(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` |  |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `clientRef` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `i64` |  |
| `deviceName` | `String` |  |
| `directPartner` | `std::collections::HashMap<String, Value>` |  |
| `encrypted` | `i64` |  |
| `endDate` | `String` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `String` |  |
| `ipAddress` | `String` |  |
| `isVirtual` | `bool` |  |
| `keyType` | `String` |  |
| `location` | `std::collections::HashMap<String, Value>` |  |
| `messageId` | `String` |  |
| `method` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `reference` | `String` |  |
| `serialNumber` | `String` |  |
| `startDate` | `String` |  |
| `success` | `bool` |  |
| `transactionSource` | `String` |  |

#### Example: Load

```rust
let transaction = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

#### Example: List

```rust
let transactions = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let transaction = client.transaction(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```


### UpdateResult

Create an instance: `let update_result = client.update_result(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `list(reqmatch, ctrl)` | List entities, optionally matching the given criteria. |
| `update(reqdata, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `lastName` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: List

```rust
let update_results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
```

#### Example: Create

```rust
let update_result = client.update_result(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


### User

Create an instance: `let user = client.user(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `kif` | `std::collections::HashMap<String, Value>` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `std::collections::HashMap<String, Value>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `std::collections::HashMap<String, Value>` |  |
| `version` | `i64` |  |

#### Example: Load

```rust
let user = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
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
