# BluefinDecryptxP2pe Rust SDK Reference

Complete API reference for the BluefinDecryptxP2pe Rust SDK.


## BluefinDecryptxP2peSDK

### Constructor

```rust
use bluefin_decryptx_p2pe_sdk::{BluefinDecryptxP2peSDK, Value};

let client = BluefinDecryptxP2peSDK::new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`Value::Noval` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinDecryptxP2peSDK>`

Create a test client with mock features active. Both arguments may be
`Value::Noval`.

```rust
use bluefin_decryptx_p2pe_sdk::{test_sdk, Value};

let client = test_sdk(Value::Noval, Value::Noval);
```


### Instance Methods

#### `attestation(entopts: Value) -> Rc<AttestationEntity>`

Create a new `AttestationEntity` instance. Pass `Value::Noval` for no
initial options.

#### `client(entopts: Value) -> Rc<ClientEntity>`

Create a new `ClientEntity` instance. Pass `Value::Noval` for no
initial options.

#### `create_result(entopts: Value) -> Rc<CreateResultEntity>`

Create a new `CreateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `decryption(entopts: Value) -> Rc<DecryptionEntity>`

Create a new `DecryptionEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device(entopts: Value) -> Rc<DeviceEntity>`

Create a new `DeviceEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_build(entopts: Value) -> Rc<DeviceBuildEntity>`

Create a new `DeviceBuildEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_custody_detail(entopts: Value) -> Rc<DeviceCustodyDetailEntity>`

Create a new `DeviceCustodyDetailEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_custody_list(entopts: Value) -> Rc<DeviceCustodyListEntity>`

Create a new `DeviceCustodyListEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_list(entopts: Value) -> Rc<DeviceListEntity>`

Create a new `DeviceListEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_receive_result(entopts: Value) -> Rc<DeviceReceiveResultEntity>`

Create a new `DeviceReceiveResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_rki_activate_result(entopts: Value) -> Rc<DeviceRkiActivateResultEntity>`

Create a new `DeviceRkiActivateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_state(entopts: Value) -> Rc<DeviceStateEntity>`

Create a new `DeviceStateEntity` instance. Pass `Value::Noval` for no
initial options.

#### `device_type(entopts: Value) -> Rc<DeviceTypeEntity>`

Create a new `DeviceTypeEntity` instance. Pass `Value::Noval` for no
initial options.

#### `inject_key(entopts: Value) -> Rc<InjectKeyEntity>`

Create a new `InjectKeyEntity` instance. Pass `Value::Noval` for no
initial options.

#### `kif(entopts: Value) -> Rc<KifEntity>`

Create a new `KifEntity` instance. Pass `Value::Noval` for no
initial options.

#### `location(entopts: Value) -> Rc<LocationEntity>`

Create a new `LocationEntity` instance. Pass `Value::Noval` for no
initial options.

#### `partner(entopts: Value) -> Rc<PartnerEntity>`

Create a new `PartnerEntity` instance. Pass `Value::Noval` for no
initial options.

#### `shipment(entopts: Value) -> Rc<ShipmentEntity>`

Create a new `ShipmentEntity` instance. Pass `Value::Noval` for no
initial options.

#### `success(entopts: Value) -> Rc<SuccessEntity>`

Create a new `SuccessEntity` instance. Pass `Value::Noval` for no
initial options.

#### `transaction(entopts: Value) -> Rc<TransactionEntity>`

Create a new `TransactionEntity` instance. Pass `Value::Noval` for no
initial options.

#### `update_result(entopts: Value) -> Rc<UpdateResultEntity>`

Create a new `UpdateResultEntity` instance. Pass `Value::Noval` for no
initial options.

#### `user(entopts: Value) -> Rc<UserEntity>`

Create a new `UserEntity` instance. Pass `Value::Noval` for no
initial options.

#### `options_map() -> Value`

Return a deep copy of the current SDK options.

#### `get_utility() -> Rc<Utility>`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>`

Make a direct HTTP request to any API endpoint. `Ok` is a result `Value::Map`
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch resolves to `Ok` even on a non-2xx response — branch on
`getp(&result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) -> Result<Value, BluefinDecryptxP2peError>`

Prepare a fetch definition without sending. Returns the fetchdef on `Ok`.


---

## AttestationEntity

```rust
let attestation = client.attestation(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `completeDate` | `String` | No | The date and time that the Attestation took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `device` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `name` | `String` | No | Text describing the attestation. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Attestation. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.attestation(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.attestation(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for attestation in items.borrow().iter() {
        println!("{:?}", attestation);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.attestation(Value::Noval).load(jo(vec![("id", Value::str("attestation_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `AttestationEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ClientEntity

```rust
let client = client.client(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `std::collections::HashMap<String, Value>` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated Location resource. |
| `mid` | `String` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Client's name. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the Client's root Partner. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.client(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.client(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for client in items.borrow().iter() {
        println!("{:?}", client);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.client(Value::Noval).load(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.client(Value::Noval).remove(jo(vec![("id", Value::str("client_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ClientEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## CreateResultEntity

```rust
let create_result = client.create_result(Value::Noval);
```

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.create_result(Value::Noval).create(jo(vec![
    ("device_type", Value::str("example_device_type")),  // String
    ("serial_number", Value::str("example_serial_number")),  // String
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `CreateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DecryptionEntity

```rust
let decryption = client.decryption(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.decryption(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DecryptionEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceEntity

```rust
let device = client.device(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `activationDate` | `String` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device Build resource. |
| `deviceState` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device State resource. |
| `deviceType` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `i64` | No | The number times the Device has been in error. |
| `errorLastDate` | `String` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String` | No | The Device's unique identifier. |
| `initializedBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device resource. |
| `isVirtual` | `bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `std::collections::HashMap<String, Value>` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | No | Timestamp from the last time that the Device was used. |
| `location` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `name` | `String` | No | The Device's name. |
| `notes` | `String` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `serialNumber` | `String` | No | The Device's serial number. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.device(Value::Noval).create(jo(vec![
    ("activatedBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("createdBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("initializedBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
    ("modifiedBy", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device in items.borrow().iter() {
        println!("{:?}", device);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device(Value::Noval).load(jo(vec![("id", Value::str("device_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceBuildEntity

```rust
let device_build = client.device_build(Value::Noval);
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
| `id` | `i64` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Device Builds's name. |
| `notes` | `String` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `i64` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_build(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_build in items.borrow().iter() {
        println!("{:?}", device_build);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_build(Value::Noval).load(jo(vec![("id", Value::str("device_build_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceBuildEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceCustodyDetailEntity

```rust
let device_custody_detail = client.device_custody_detail(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `custodian` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `device` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device resource. |
| `id` | `i64` | No | This resource's unique identifier. |
| `location` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Transfer Method. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_custody_detail(Value::Noval).load(jo(vec![("id", Value::str("device_custody_detail_id")), ("device_type", Value::str("device_type")), ("serial_number", Value::str("serial_number"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceCustodyDetailEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceCustodyListEntity

```rust
let device_custody_list = client.device_custody_list(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String` | No | The date and time that the Custody change took place. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `custodian` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `device` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Device resource. |
| `id` | `i64` | No | This resource's unique identifier. |
| `location` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `modifiedBy` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated User resource. |
| `notes` | `String` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Transfer Method. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_custody_list(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_custody_list in items.borrow().iter() {
        println!("{:?}", device_custody_list);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceCustodyListEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceListEntity

```rust
let device_list = client.device_list(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `Vec<Value>` | No | List of Devices. |
| `total` | `i64` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_list(Value::Noval).load(jo(vec![("share_partner_to", Value::str("share_partner_to"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceListEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceReceiveResultEntity

```rust
let device_receive_result = client.device_receive_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes | Indicates if the action succeeded. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_receive_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceReceiveResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```rust
let device_rki_activate_result = client.device_rki_activate_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_rki_activate_result(Value::Noval).create(jo(vec![
    ("success", Value::Bool(true)),  // bool
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceRkiActivateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceStateEntity

```rust
let device_state = client.device_state(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No | Unique identifier for this Device state. |
| `name` | `String` | No | Descriptive name for this Device state. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_state(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_state in items.borrow().iter() {
        println!("{:?}", device_state);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceStateEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## DeviceTypeEntity

```rust
let device_type = client.device_type(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | No | The Device type. |
| `hardwareVersion` | `String` | No | The Device hardware version. |
| `id` | `String` | No | Unique idenifier. |
| `isActive` | `bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | No | The Device manufacturer. |
| `model` | `String` | No | The Device model. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The DeviceType name. |
| `photoUrl` | `String` | No |  |
| `productName` | `String` | No | The Device name. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.device_type(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for device_type in items.borrow().iter() {
        println!("{:?}", device_type);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.device_type(Value::Noval).load(jo(vec![("id", Value::str("device_type_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `DeviceTypeEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## InjectKeyEntity

```rust
let inject_key = client.inject_key(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | unique idenifier |
| `isActive` | `bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | No | The cipher type that the key works with. |
| `modified` | `String` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | No | Key name. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.inject_key(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for inject_key in items.borrow().iter() {
        println!("{:?}", inject_key);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.inject_key(Value::Noval).load(jo(vec![("id", Value::str("inject_key_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `InjectKeyEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## KifEntity

```rust
let kif = client.kif(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `i64` | No | This resource's unique identifier. |
| `name` | `String` | No | The KIF's name. |

### Operations

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.kif(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for kif in items.borrow().iter() {
        println!("{:?}", kif);
    }
}
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `KifEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## LocationEntity

```rust
let location = client.location(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String` | No | The Location's street address. |
| `address2` | `String` | No | The Location's street address. |
| `billingId` | `String` | No | \? |
| `city` | `String` | No | The Location's city. |
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
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.location(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.location(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for location in items.borrow().iter() {
        println!("{:?}", location);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.location(Value::Noval).load(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.location(Value::Noval).remove(jo(vec![("id", Value::str("location_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `LocationEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## PartnerEntity

```rust
let partner = client.partner(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `std::collections::HashMap<String, Value>` | No | Reference to the associated User resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `name` | `String` | No | The Partner's name. |
| `parent` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `partnerId` | `String` | No | The Partner's id. |
| `reference` | `String` | No | The Partner's reference string. |
| `verificationPhrase` | `String` | No | The verification phrase is a message that the Partner creates. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.partner(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.partner(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for partner in items.borrow().iter() {
        println!("{:?}", partner);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.partner(Value::Noval).load(jo(vec![("id", Value::str("partner_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `PartnerEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## ShipmentEntity

```rust
let shipment = client.shipment(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String` | No | The name of the courier. |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | No | The date and time that a package is recieved. |
| `dateShipped` | `String` | No | The date and time that a package is shipped. |
| `dcKif` | `std::collections::HashMap<String, Value>` | No | Reference to the associated KIF resource. |
| `id` | `String` | No | This resource's unique identifier. |
| `items` | `Vec<Value>` | No |  |
| `kif` | `std::collections::HashMap<String, Value>` | No | Reference to the associated KIF resource. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `shipmentType` | `String` | No | The type of shipment. |
| `tracking` | `String` | No | The courier's tracking number. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.shipment(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.shipment(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for shipment in items.borrow().iter() {
        println!("{:?}", shipment);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.shipment(Value::Noval).load(jo(vec![("id", Value::str("shipment_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `ShipmentEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## SuccessEntity

```rust
let success = client.success(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.success(Value::Noval).create(jo(vec![
    ("share_partner_to", Value::str("example_share_partner_to")),  // String
]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.success(Value::Noval).remove(jo(vec![("share_partner_to", Value::str("share_partner_to"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `SuccessEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## TransactionEntity

```rust
let transaction = client.transaction(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `clientRef` | `String` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `i64` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `String` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `encrypted` | `i64` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String` | No | Timestamp from the end of the transaction. |
| `errCode` | `String` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | No | This resource's unique identifier. |
| `ipAddress` | `String` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | No | The type of cipher used during decrytion. |
| `location` | `std::collections::HashMap<String, Value>` | Yes | Reference to the associated Location resource. |
| `messageId` | `String` | No | Message ID. |
| `method` | `String` | No | The decryption cypher/method. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `reference` | `String` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | No | Timestamp from the beginning of the transaction. |
| `success` | `bool` | No | The success indicator. |
| `transactionSource` | `String` | No | The source of the Transaction. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.transaction(Value::Noval).create(jo(vec![
    ("location", Value::empty_map()),  // std::collections::HashMap<String, Value>
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.transaction(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for transaction in items.borrow().iter() {
        println!("{:?}", transaction);
    }
}
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.transaction(Value::Noval).load(jo(vec![("id", Value::str("transaction_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `TransactionEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## UpdateResultEntity

```rust
let update_result = client.update_result(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | ID of newly created resource |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `std::collections::HashMap<String, Value>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `std::collections::HashMap<String, Value>` | No | Reference to the associated User Role. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.update_result(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `list(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

List entities matching the given criteria. The match is optional — pass `Value::Noval` to list all records. `Ok` is a `Value::List`.

```rust
let results = client.update_result(Value::Noval).list(Value::Noval, Value::Noval).unwrap();
if let Value::List(items) = &results {
    for update_result in items.borrow().iter() {
        println!("{:?}", update_result);
    }
}
```

#### `update(reqdata: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Update an existing entity. The data must include the entity id. Returns the updated entity data on `Ok`.

```rust
let result = client.update_result(Value::Noval).update(jo(vec![
    ("id", Value::str("id")),
    // Fields to update
]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `UpdateResultEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## UserEntity

```rust
let user = client.user(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Client resource. |
| `created` | `String` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String` | No | The User's email address. |
| `firstName` | `String` | No | The User's name. |
| `id` | `String` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `std::collections::HashMap<String, Value>` | No | Reference to the associated KIF resource. |
| `lastName` | `String` | No | The User's Surname. |
| `modified` | `String` | No | Last modified timestamp. |
| `partner` | `std::collections::HashMap<String, Value>` | No | Reference to the associated Partner. |
| `phone` | `String` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | No | The User's unique username. |
| `userRole` | `std::collections::HashMap<String, Value>` | No | Reference to the associated User Role. |
| `version` | `i64` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.user(Value::Noval).load(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinDecryptxP2peError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.user(Value::Noval).remove(jo(vec![("id", Value::str("user_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `UserEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```rust
let client = BluefinDecryptxP2peSDK::new(jo(vec![
    ("feature", jo(vec![
        ("test", jo(vec![("active", Value::Bool(true))])),
    ])),
]));
```

