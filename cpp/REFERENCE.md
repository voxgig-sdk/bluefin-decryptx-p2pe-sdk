# BluefinDecryptxP2pe C++ SDK Reference

Complete API reference for the BluefinDecryptxP2pe C++ SDK.


## BluefinDecryptxP2peSDK

### Constructor

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinDecryptxP2peSDK>(options);
```

Create a new SDK client instance. `options` is an `sdk::Value` map.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Value` | SDK configuration options (a map). |
| `options["apikey"]` | `std::string` | API key for authentication. |
| `options["base"]` | `std::string` | Base URL for API requests. |
| `options["prefix"]` | `std::string` | URL prefix appended after base. |
| `options["suffix"]` | `std::string` | URL suffix appended after path. |
| `options["headers"]` | `Value` | Custom headers for all requests. |
| `options["feature"]` | `Value` | Feature configuration. |
| `options["system"]` | `Value` | System overrides. |


### Static Methods

#### `BluefinDecryptxP2peSDK::testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be
`Value::undef()`; a no-arg overload is also provided.

```cpp
auto client = BluefinDecryptxP2peSDK::testSDK();
```


### Instance Methods

#### `attestation(entopts = Value::undef()) -> std::shared_ptr<AttestationEntity>`

Create a new `AttestationEntity` instance bound to this client.

#### `client(entopts = Value::undef()) -> std::shared_ptr<ClientEntity>`

Create a new `ClientEntity` instance bound to this client.

#### `create_result(entopts = Value::undef()) -> std::shared_ptr<CreateResultEntity>`

Create a new `CreateResultEntity` instance bound to this client.

#### `decryption(entopts = Value::undef()) -> std::shared_ptr<DecryptionEntity>`

Create a new `DecryptionEntity` instance bound to this client.

#### `device(entopts = Value::undef()) -> std::shared_ptr<DeviceEntity>`

Create a new `DeviceEntity` instance bound to this client.

#### `device_build(entopts = Value::undef()) -> std::shared_ptr<DeviceBuildEntity>`

Create a new `DeviceBuildEntity` instance bound to this client.

#### `device_custody_detail(entopts = Value::undef()) -> std::shared_ptr<DeviceCustodyDetailEntity>`

Create a new `DeviceCustodyDetailEntity` instance bound to this client.

#### `device_custody_list(entopts = Value::undef()) -> std::shared_ptr<DeviceCustodyListEntity>`

Create a new `DeviceCustodyListEntity` instance bound to this client.

#### `device_list(entopts = Value::undef()) -> std::shared_ptr<DeviceListEntity>`

Create a new `DeviceListEntity` instance bound to this client.

#### `device_receive_result(entopts = Value::undef()) -> std::shared_ptr<DeviceReceiveResultEntity>`

Create a new `DeviceReceiveResultEntity` instance bound to this client.

#### `device_rki_activate_result(entopts = Value::undef()) -> std::shared_ptr<DeviceRkiActivateResultEntity>`

Create a new `DeviceRkiActivateResultEntity` instance bound to this client.

#### `device_state(entopts = Value::undef()) -> std::shared_ptr<DeviceStateEntity>`

Create a new `DeviceStateEntity` instance bound to this client.

#### `device_type(entopts = Value::undef()) -> std::shared_ptr<DeviceTypeEntity>`

Create a new `DeviceTypeEntity` instance bound to this client.

#### `inject_key(entopts = Value::undef()) -> std::shared_ptr<InjectKeyEntity>`

Create a new `InjectKeyEntity` instance bound to this client.

#### `kif(entopts = Value::undef()) -> std::shared_ptr<KifEntity>`

Create a new `KifEntity` instance bound to this client.

#### `location(entopts = Value::undef()) -> std::shared_ptr<LocationEntity>`

Create a new `LocationEntity` instance bound to this client.

#### `partner(entopts = Value::undef()) -> std::shared_ptr<PartnerEntity>`

Create a new `PartnerEntity` instance bound to this client.

#### `shipment(entopts = Value::undef()) -> std::shared_ptr<ShipmentEntity>`

Create a new `ShipmentEntity` instance bound to this client.

#### `success(entopts = Value::undef()) -> std::shared_ptr<SuccessEntity>`

Create a new `SuccessEntity` instance bound to this client.

#### `transaction(entopts = Value::undef()) -> std::shared_ptr<TransactionEntity>`

Create a new `TransactionEntity` instance bound to this client.

#### `update_result(entopts = Value::undef()) -> std::shared_ptr<UpdateResultEntity>`

Create a new `UpdateResultEntity` instance bound to this client.

#### `user(entopts = Value::undef()) -> std::shared_ptr<UserEntity>`

Create a new `UserEntity` instance bound to this client.

#### `optionsMap() -> Value`

Return a deep copy of the current SDK options.

#### `getUtility() -> UtilityPtr`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Value`

Make a direct HTTP request to any API endpoint. Returns a result `Value` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `getp(result, "ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `std::string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `std::string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Value` | Path parameter values. |
| `fetchargs["query"]` | `Value` | Query string parameters. |
| `fetchargs["headers"]` | `Value` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Value` | Request body (maps are JSON-serialized). |

**Returns:** `Value` (result map)

#### `prepare(fetchargs) -> Value`

Prepare a fetch definition without sending. Returns the `fetchdef` and throws on error.


---

## AttestationEntity

```cpp
auto attestation = client->attestation();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `completeDate` | `std::string` | No | The date and time that the Attestation took place. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `device` | `std::map<std::string, Value>` | No | Reference to the associated Device resource. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `name` | `std::string` | No | Text describing the attestation. |
| `notes` | `std::string` | No | Free form field that allows the Client associate notes with the Attestation. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->attestation()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->attestation()->list(Value::undef(), Value::undef());
for (const auto& attestation : *results.as_list()) {
  std::cout << Struct::jsonify(attestation) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->attestation()->load(vmap({{"id", Value("attestation_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `AttestationEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ClientEntity

```cpp
auto client = client->client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `std::map<std::string, Value>` | No | Reference to the associated User resource. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Client account is active or disabled. |
| `location` | `std::map<std::string, Value>` | Yes | Reference to the associated Location resource. |
| `mid` | `std::string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The Client's name. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the Client's root Partner. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->client()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->client()->list(Value::undef(), Value::undef());
for (const auto& client : *results.as_list()) {
  std::cout << Struct::jsonify(client) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->client()->load(vmap({{"id", Value("client_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->client()->remove(vmap({{"id", Value("client_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ClientEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## CreateResultEntity

```cpp
auto create_result = client->create_result();
```

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->create_result()->create(vmap({
    {"device_type", Value("example_device_type")},  // std::string
    {"serial_number", Value("example_serial_number")},  // std::string
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `CreateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DecryptionEntity

```cpp
auto decryption = client->decryption();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No | true if the payload decryption was successful. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->decryption()->create(vmap({
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DecryptionEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceEntity

```cpp
auto device = client->device();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `activationDate` | `std::string` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `std::string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `std::string` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `std::string` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `std::map<std::string, Value>` | No | Reference to the associated Device Build resource. |
| `deviceState` | `std::map<std::string, Value>` | No | Reference to the associated Device State resource. |
| `deviceType` | `std::map<std::string, Value>` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `int64_t` | No | The number times the Device has been in error. |
| `errorLastDate` | `std::string` | No | Timestamp from the last time that the Device had an error. |
| `id` | `std::string` | No | The Device's unique identifier. |
| `initializedBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `initializedDate` | `std::string` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `std::map<std::string, Value>` | No | Reference to the associated Device resource. |
| `isVirtual` | `bool` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `std::map<std::string, Value>` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `std::string` | No | Timestamp from the last time that the Device was used. |
| `location` | `std::map<std::string, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `modifiedBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `name` | `std::string` | No | The Device's name. |
| `notes` | `std::string` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `serialNumber` | `std::string` | No | The Device's serial number. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->device()->create(vmap({
    {"activatedBy", vmap()},  // std::map<std::string, Value>
    {"createdBy", vmap()},  // std::map<std::string, Value>
    {"initializedBy", vmap()},  // std::map<std::string, Value>
    {"location", vmap()},  // std::map<std::string, Value>
    {"modifiedBy", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device()->list(Value::undef(), Value::undef());
for (const auto& device : *results.as_list()) {
  std::cout << Struct::jsonify(device) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device()->load(vmap({{"id", Value("device_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceBuildEntity

```cpp
auto device_build = client->device_build();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `std::string` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `std::string` | No | The Build Number. |
| `configFileName` | `std::string` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `std::string` | No | The Device Type Name. |
| `firmwareVersion` | `std::string` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `std::string` | No | A list of hardware versions that this Device Build covers. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The Device Builds's name. |
| `notes` | `std::string` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `std::string` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_build()->list(Value::undef(), Value::undef());
for (const auto& device_build : *results.as_list()) {
  std::cout << Struct::jsonify(device_build) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_build()->load(vmap({{"id", Value("device_build_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceBuildEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceCustodyDetailEntity

```cpp
auto device_custody_detail = client->device_custody_detail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `std::string` | No | The date and time that the Custody change took place. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `custodian` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `device` | `std::map<std::string, Value>` | No | Reference to the associated Device resource. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `location` | `std::map<std::string, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `modifiedBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `notes` | `std::string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::map<std::string, Value>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `std::map<std::string, Value>` | No | Reference to the associated Transfer Method. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_custody_detail()->load(vmap({{"id", Value("device_custody_detail_id")}, {"device_type", Value("device_type")}, {"serial_number", Value("serial_number")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceCustodyDetailEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceCustodyListEntity

```cpp
auto device_custody_list = client->device_custody_list();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `std::string` | No | The date and time that the Custody change took place. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `custodian` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `device` | `std::map<std::string, Value>` | No | Reference to the associated Device resource. |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `location` | `std::map<std::string, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `modifiedBy` | `std::map<std::string, Value>` | Yes | Reference to the associated User resource. |
| `notes` | `std::string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::map<std::string, Value>` | No | Reference to the associated Custody Status. |
| `transferMethod` | `std::map<std::string, Value>` | No | Reference to the associated Transfer Method. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_custody_list()->list(Value::undef(), Value::undef());
for (const auto& device_custody_list : *results.as_list()) {
  std::cout << Struct::jsonify(device_custody_list) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceCustodyListEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceListEntity

```cpp
auto device_list = client->device_list();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `std::vector<Value>` | No | List of Devices. |
| `total` | `int64_t` | No | Total number of Devices available (not the number of Users in the response). |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_list()->load(vmap({{"share_partner_to", Value("share_partner_to")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceListEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceReceiveResultEntity

```cpp
auto device_receive_result = client->device_receive_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes | Indicates if the action succeeded. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->device_receive_result()->create(vmap({
    {"success", Value(true)},  // bool
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceReceiveResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```cpp
auto device_rki_activate_result = client->device_rki_activate_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes | Indicates if the RKI activation succeeded. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->device_rki_activate_result()->create(vmap({
    {"success", Value(true)},  // bool
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceRkiActivateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceStateEntity

```cpp
auto device_state = client->device_state();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No | Unique identifier for this Device state. |
| `name` | `std::string` | No | Descriptive name for this Device state. |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_state()->list(Value::undef(), Value::undef());
for (const auto& device_state : *results.as_list()) {
  std::cout << Struct::jsonify(device_state) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceStateEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## DeviceTypeEntity

```cpp
auto device_type = client->device_type();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `std::string` | No | The Device type. |
| `hardwareVersion` | `std::string` | No | The Device hardware version. |
| `id` | `std::string` | No | Unique idenifier. |
| `isActive` | `bool` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `std::string` | No | The Device manufacturer. |
| `model` | `std::string` | No | The Device model. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The DeviceType name. |
| `photoUrl` | `std::string` | No |  |
| `productName` | `std::string` | No | The Device name. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->device_type()->list(Value::undef(), Value::undef());
for (const auto& device_type : *results.as_list()) {
  std::cout << Struct::jsonify(device_type) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->device_type()->load(vmap({{"id", Value("device_type_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `DeviceTypeEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## InjectKeyEntity

```cpp
auto inject_key = client->inject_key();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `std::string` | No | unique idenifier |
| `isActive` | `bool` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `std::string` | No | The cipher type that the key works with. |
| `modified` | `std::string` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `std::string` | No | Key name. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->inject_key()->list(Value::undef(), Value::undef());
for (const auto& inject_key : *results.as_list()) {
  std::cout << Struct::jsonify(inject_key) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->inject_key()->load(vmap({{"id", Value("inject_key_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `InjectKeyEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## KifEntity

```cpp
auto kif = client->kif();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int64_t` | No | This resource's unique identifier. |
| `name` | `std::string` | No | The KIF's name. |

### Operations

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->kif()->list(Value::undef(), Value::undef());
for (const auto& kif : *results.as_list()) {
  std::cout << Struct::jsonify(kif) << std::endl;
}
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `KifEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## LocationEntity

```cpp
auto location = client->location();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `std::string` | No | The Location's street address. |
| `address2` | `std::string` | No | The Location's street address. |
| `billingId` | `std::string` | No | \? |
| `city` | `std::string` | No | The Location's city. |
| `country` | `std::string` | No | The Location's country. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `std::string` | No | A Partner specified reference for a location. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `locationType` | `std::string` | No | The Location's clasification. |
| `mailAddress1` | `std::string` | No | The Location's street address. |
| `mailAddress2` | `std::string` | No | The Location's street address. |
| `mailCity` | `std::string` | No | The Location's city. |
| `mailCountry` | `std::string` | No | The Location's street address. |
| `mailPostalCode` | `std::string` | No | The Location's postal code. |
| `mailStateProvince` | `std::string` | No | The Location's street state or province. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The Location's name. |
| `nameOfBusiness` | `std::string` | No | The name of the business at this location. |
| `notes` | `std::string` | No | Note for delivery driver. |
| `postalCode` | `std::string` | No | The Location's postal code. |
| `stateProvince` | `std::string` | No | The Location's street state or province. |
| `uniqueId` | `std::string` | No | Unique Identifier for the Location. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->location()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->location()->list(Value::undef(), Value::undef());
for (const auto& location : *results.as_list()) {
  std::cout << Struct::jsonify(location) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->location()->load(vmap({{"id", Value("location_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->location()->remove(vmap({{"id", Value("location_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `LocationEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## PartnerEntity

```cpp
auto partner = client->partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `std::string` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `std::map<std::string, Value>` | No | Reference to the associated User resource. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `std::map<std::string, Value>` | Yes | Reference to the associated Location resource. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `name` | `std::string` | No | The Partner's name. |
| `parent` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `partnerId` | `std::string` | No | The Partner's id. |
| `reference` | `std::string` | No | The Partner's reference string. |
| `verificationPhrase` | `std::string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

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

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->partner()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->partner()->list(Value::undef(), Value::undef());
for (const auto& partner : *results.as_list()) {
  std::cout << Struct::jsonify(partner) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->partner()->load(vmap({{"id", Value("partner_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `PartnerEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## ShipmentEntity

```cpp
auto shipment = client->shipment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `std::string` | No | The name of the courier. |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `std::string` | No | The date and time that a package is recieved. |
| `dateShipped` | `std::string` | No | The date and time that a package is shipped. |
| `dcKif` | `std::map<std::string, Value>` | No | Reference to the associated KIF resource. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `items` | `std::vector<Value>` | No |  |
| `kif` | `std::map<std::string, Value>` | No | Reference to the associated KIF resource. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `shipmentType` | `std::string` | No | The type of shipment. |
| `tracking` | `std::string` | No | The courier's tracking number. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->shipment()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->shipment()->list(Value::undef(), Value::undef());
for (const auto& shipment : *results.as_list()) {
  std::cout << Struct::jsonify(shipment) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->shipment()->load(vmap({{"id", Value("shipment_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `ShipmentEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## SuccessEntity

```cpp
auto success = client->success();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No | Indicates if the action was a success. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->success()->create(vmap({
    {"share_partner_to", Value("example_share_partner_to")},  // std::string
}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->success()->remove(vmap({{"share_partner_to", Value("share_partner_to")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `SuccessEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## TransactionEntity

```cpp
auto transaction = client->transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `std::string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `clientRef` | `std::string` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int64_t` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `std::string` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `encrypted` | `int64_t` | No | A Transcation can process muliple encryptions. |
| `endDate` | `std::string` | No | Timestamp from the end of the transaction. |
| `errCode` | `std::string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `std::string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `ipAddress` | `std::string` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `std::string` | No | The type of cipher used during decrytion. |
| `location` | `std::map<std::string, Value>` | Yes | Reference to the associated Location resource. |
| `messageId` | `std::string` | No | Message ID. |
| `method` | `std::string` | No | The decryption cypher/method. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `reference` | `std::string` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `std::string` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `std::string` | No | Timestamp from the beginning of the transaction. |
| `success` | `bool` | No | The success indicator. |
| `transactionSource` | `std::string` | No | The source of the Transaction. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->transaction()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->transaction()->list(Value::undef(), Value::undef());
for (const auto& transaction : *results.as_list()) {
  std::cout << Struct::jsonify(transaction) << std::endl;
}
```

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->transaction()->load(vmap({{"id", Value("transaction_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `TransactionEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## UpdateResultEntity

```cpp
auto update_result = client->update_result();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `email` | `std::string` | No | The User's email address. |
| `firstName` | `std::string` | No | The User's name. |
| `id` | `std::string` | No | ID of newly created resource |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `std::map<std::string, Value>` | No | Reference to the associated KIF resource. |
| `lastName` | `std::string` | No | The User's Surname. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `phone` | `std::string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `std::string` | No | The User's unique username. |
| `userRole` | `std::map<std::string, Value>` | No | Reference to the associated User Role. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `create(reqdata, ctrl) -> Value`

Create a new entity with the given data. Returns the created entity data and throws on error.

```cpp
Value result = client->update_result()->create(vmap({
}), Value::undef());
```

#### `list(reqmatch, ctrl) -> Value`

List entities matching the given criteria. The match is optional — pass `Value::undef()` to list all records. Returns a Value list and throws on error.

```cpp
Value results = client->update_result()->list(Value::undef(), Value::undef());
for (const auto& update_result : *results.as_list()) {
  std::cout << Struct::jsonify(update_result) << std::endl;
}
```

#### `update(reqdata, ctrl) -> Value`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and throws on error.

```cpp
Value result = client->update_result()->update(vmap({
    {"id", Value("id")},
    // Fields to update
}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `UpdateResultEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## UserEntity

```cpp
auto user = client->user();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `std::map<std::string, Value>` | No | Reference to the associated Client resource. |
| `created` | `std::string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `std::string` | No | The User's email address. |
| `firstName` | `std::string` | No | The User's name. |
| `id` | `std::string` | No | This resource's unique identifier. |
| `isActive` | `bool` | No | This property indicates if the User account is active or disabled. |
| `kif` | `std::map<std::string, Value>` | No | Reference to the associated KIF resource. |
| `lastName` | `std::string` | No | The User's Surname. |
| `modified` | `std::string` | No | Last modified timestamp. |
| `partner` | `std::map<std::string, Value>` | No | Reference to the associated Partner. |
| `phone` | `std::string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `std::string` | No | The User's unique username. |
| `userRole` | `std::map<std::string, Value>` | No | Reference to the associated User Role. |
| `version` | `int64_t` | No | The number of times that this resource has been updated. |

### Operations

#### `load(reqmatch, ctrl) -> Value`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```cpp
Value result = client->user()->load(vmap({{"id", Value("user_id")}}), Value::undef());
```

#### `remove(reqmatch, ctrl) -> Value`

Remove the entity matching the given criteria. Throws on error.

```cpp
Value result = client->user()->remove(vmap({{"id", Value("user_id")}}), Value::undef());
```

### Common Methods

#### `data(arg = Value::undef()) -> Value`

Get the entity data (no argument) or set it (with a map argument).

#### `match(arg = Value::undef()) -> Value`

Get the entity match criteria (no argument) or set it (with a map argument).

#### `make() -> EntityPtr`

Create a new `UserEntity` instance with the same options.

#### `getName() -> std::string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```cpp
auto client = std::make_shared<BluefinDecryptxP2peSDK>(vmap({
    {"feature", vmap({
        {"audit", vmap({{"active", Value(true)}})},
        {"clienttrack", vmap({{"active", Value(true)}})},
        {"idempotency", vmap({{"active", Value(true)}})},
        {"log", vmap({{"active", Value(true)}})},
        {"metrics", vmap({{"active", Value(true)}})},
        {"paging", vmap({{"active", Value(true)}})},
        {"ratelimit", vmap({{"active", Value(true)}})},
        {"retry", vmap({{"active", Value(true)}})},
        {"telemetry", vmap({{"active", Value(true)}})},
        {"test", vmap({{"active", Value(true)}})},
        {"timeout", vmap({{"active", Value(true)}})},
    })},
}));
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

