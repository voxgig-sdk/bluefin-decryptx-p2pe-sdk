# BluefinDecryptxP2pe C++ SDK



The C++ SDK for the BluefinDecryptxP2pe API — a header-only,
entity-oriented client following idiomatic modern C++ (C++17) conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client->attestation()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low. Every value flows through a single dynamic
`sdk::Value` type (a JSON-like variant), so there is no schema-driven code to
regenerate when the API changes.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
The C++ SDK is **header-only** — there is no package to install
from a registry. Vendor the `cpp/` directory into your project (or add the
repository as a git submodule) and put it on your compiler's include path.
Releases are cut as the git tag `cpp/vX.Y.Z` (see
[Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)).

```bash
# Add the SDK as a submodule (or copy the cpp/ directory into your tree).
git submodule add <repo-url> third_party/bluefindecryptxp2pe-sdk
```

Then include the umbrella header and compile with C++17:

```cpp
#include "core/sdk.hpp"
```

```bash
g++ -std=c++17 -Ithird_party/bluefindecryptxp2pe-sdk/cpp your_app.cpp -o your_app
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```cpp
#include <cstdlib>
#include "core/sdk.hpp"

using namespace sdk;

const char* apikey = std::getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY");
auto client = std::make_shared<BluefinDecryptxP2peSDK>(vmap({
    {"apikey", Value(apikey ? apikey : "")},
}));
```

### 2. List attestation records

`list()` returns an `sdk::Value` list and throws `sdk::SdkErrorPtr`
on error — iterate it directly.

```cpp
try {
  Value attestations = client->attestation()->list(Value::undef(), Value::undef());
  for (const auto& attestation : *attestations.as_list()) {
    std::cout << Struct::jsonify(attestation) << std::endl;
  }
} catch (const SdkErrorPtr& err) {
  std::cerr << "list failed: " << err->msg << std::endl;
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the bare record and throws on error.

```cpp
try {
  Value device_custody_detail = client->device_custody_detail()->load(vmap({{"device_type", Value("example_device_type")}, {"serial_number", Value("example_serial_number")}, {"id", Value("example_id")}}), Value::undef());
  std::cout << Struct::jsonify(device_custody_detail) << std::endl;
} catch (const SdkErrorPtr& err) {
  std::cerr << "load failed: " << err->msg << std::endl;
}
```

### 4. Create, update, and remove

```cpp
// Create — returns the bare created record.
Value created = client->attestation()->create(vmap({{"client", vmap()}, {"completeDate", Value("example_completeDate")}}), Value::undef());

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

```cpp
Value result = client->direct(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("GET")},
    {"params", vmap({{"id", Value("example")}})},
}));

if (getp(result, "ok") == Value(true)) {
  std::cout << Helpers::toInt(getp(result, "status")) << std::endl;  // 200
  std::cout << Struct::jsonify(getp(result, "data")) << std::endl;   // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. Only one is present.
  std::cerr << Helpers::toInt(getp(result, "status")) << " "
            << Struct::jsonify(getp(result, "err")) << std::endl;
}
```

`direct()` is the escape hatch: it never throws — branch on
`getp(result, "ok")`.

### Prepare a request without sending it

```cpp
// prepare() returns the fetch definition and throws on error.
Value fetchdef = client->prepare(vmap({
    {"path", Value("/api/resource/{id}")},
    {"method", Value("DELETE")},
    {"params", vmap({{"id", Value("example")}})},
}));

std::cout << Struct::stringify(getp(fetchdef, "url")) << std::endl;
std::cout << Struct::stringify(getp(fetchdef, "method")) << std::endl;
std::cout << Struct::jsonify(getp(fetchdef, "headers")) << std::endl;
```

### Use test mode

Create a mock client for unit testing — no server required. The test
feature installs an in-memory mock transport:

```cpp
auto client = BluefinDecryptxP2peSDK::testSDK();

// Entity ops return the bare record and throw on error.
Value device_type = client->device_type()->list(Value::undef(), Value::undef());
// device_type contains the mock response record
std::cout << Struct::jsonify(device_type) << std::endl;
```

You can seed the mock store by passing test options — see the generated
`test/` suite for worked examples.

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then build and run the test suite:

```bash
cd cpp && make test
```


## Reference

### BluefinDecryptxP2peSDK

```cpp
#include "core/sdk.hpp"

using namespace sdk;

auto client = std::make_shared<BluefinDecryptxP2peSDK>(options);
```

Creates a new SDK client. `options` is an `sdk::Value` map.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `std::string` | API key for authentication. |
| `base` | `std::string` | Base URL of the API server. |
| `prefix` | `std::string` | URL path prefix prepended to all requests. |
| `suffix` | `std::string` | URL path suffix appended to all requests. |
| `feature` | `Value` | Feature activation flags. |
| `system` | `Value` | System overrides. |

### testSDK

```cpp
auto client = BluefinDecryptxP2peSDK::testSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::undef()`; a no-arg `BluefinDecryptxP2peSDK::testSDK()` overload is
also provided.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Value` | Deep copy of current SDK options. |
| `getUtility` | `() -> UtilityPtr` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Value` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> Value` | Build and send an HTTP request. Returns a result Value (branch on `ok`). |
| `attestation` | `(entopts) -> std::shared_ptr<AttestationEntity>` | Create an Attestation entity instance. |
| `client` | `(entopts) -> std::shared_ptr<ClientEntity>` | Create a Client entity instance. |
| `create_result` | `(entopts) -> std::shared_ptr<CreateResultEntity>` | Create a CreateResult entity instance. |
| `decryption` | `(entopts) -> std::shared_ptr<DecryptionEntity>` | Create a Decryption entity instance. |
| `device` | `(entopts) -> std::shared_ptr<DeviceEntity>` | Create a Device entity instance. |
| `device_build` | `(entopts) -> std::shared_ptr<DeviceBuildEntity>` | Create a DeviceBuild entity instance. |
| `device_custody_detail` | `(entopts) -> std::shared_ptr<DeviceCustodyDetailEntity>` | Create a DeviceCustodyDetail entity instance. |
| `device_custody_list` | `(entopts) -> std::shared_ptr<DeviceCustodyListEntity>` | Create a DeviceCustodyList entity instance. |
| `device_list` | `(entopts) -> std::shared_ptr<DeviceListEntity>` | Create a DeviceList entity instance. |
| `device_receive_result` | `(entopts) -> std::shared_ptr<DeviceReceiveResultEntity>` | Create a DeviceReceiveResult entity instance. |
| `device_rki_activate_result` | `(entopts) -> std::shared_ptr<DeviceRkiActivateResultEntity>` | Create a DeviceRkiActivateResult entity instance. |
| `device_state` | `(entopts) -> std::shared_ptr<DeviceStateEntity>` | Create a DeviceState entity instance. |
| `device_type` | `(entopts) -> std::shared_ptr<DeviceTypeEntity>` | Create a DeviceType entity instance. |
| `inject_key` | `(entopts) -> std::shared_ptr<InjectKeyEntity>` | Create an InjectKey entity instance. |
| `kif` | `(entopts) -> std::shared_ptr<KifEntity>` | Create a Kif entity instance. |
| `location` | `(entopts) -> std::shared_ptr<LocationEntity>` | Create a Location entity instance. |
| `partner` | `(entopts) -> std::shared_ptr<PartnerEntity>` | Create a Partner entity instance. |
| `shipment` | `(entopts) -> std::shared_ptr<ShipmentEntity>` | Create a Shipment entity instance. |
| `success` | `(entopts) -> std::shared_ptr<SuccessEntity>` | Create a Success entity instance. |
| `transaction` | `(entopts) -> std::shared_ptr<TransactionEntity>` | Create a Transaction entity instance. |
| `update_result` | `(entopts) -> std::shared_ptr<UpdateResultEntity>` | Create an UpdateResult entity instance. |
| `user` | `(entopts) -> std::shared_ptr<UserEntity>` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Value` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, ctrl) -> Value` | List entities matching the criteria (a Value list). Throws on error. |
| `create` | `(reqdata, ctrl) -> Value` | Create a new entity. Throws on error. |
| `update` | `(reqdata, ctrl) -> Value` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, ctrl) -> Value` | Remove an entity. Throws on error. |
| `data` | `(arg) -> Value` | Get (no arg) or set (with arg) entity data. |
| `match` | `(arg) -> Value` | Get (no arg) or set (with arg) entity match criteria. |
| `make` | `() -> EntityPtr` | Create a new instance with the same options. |
| `getName` | `() -> std::string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a map `Value` for
single-entity ops, a list `Value` for `list`) and throw
`sdk::SdkErrorPtr` on error. Wrap calls in `try`/`catch` to handle
failures.

The `direct()` escape hatch never throws — it returns a result `Value`
you branch on via `getp(result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Value` | Response headers. |
| `data` | `Value` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

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

Create an instance: `auto attestation = client->attestation();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::map<std::string, Value>` |  |
| `completeDate` | `std::string` |  |
| `created` | `std::string` |  |
| `device` | `std::map<std::string, Value>` |  |
| `id` | `std::string` |  |
| `name` | `std::string` |  |
| `notes` | `std::string` |  |

#### Example: Load

```cpp
Value attestation = client->attestation()->load(vmap({{"id", Value("attestation_id")}}), Value::undef());
```

#### Example: List

```cpp
Value attestations = client->attestation()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value attestation = client->attestation()->create(vmap({
}), Value::undef());
```


### Client

Create an instance: `auto client = client->client();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `std::map<std::string, Value>` |  |
| `created` | `std::string` |  |
| `directPartner` | `std::map<std::string, Value>` |  |
| `id` | `std::string` |  |
| `isActive` | `bool` |  |
| `location` | `std::map<std::string, Value>` |  |
| `mid` | `std::string` |  |
| `modified` | `std::string` |  |
| `name` | `std::string` |  |
| `partner` | `std::map<std::string, Value>` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value client = client->client()->load(vmap({{"id", Value("client_id")}}), Value::undef());
```

#### Example: List

```cpp
Value clients = client->client()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value client = client->client()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```


### CreateResult

Create an instance: `auto create_result = client->create_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Example: Create

```cpp
Value create_result = client->create_result()->create(vmap({
    {"device_type", Value("example_device_type")},  // std::string
    {"serial_number", Value("example_serial_number")},  // std::string
}), Value::undef());
```


### Decryption

Create an instance: `auto decryption = client->decryption();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```cpp
Value decryption = client->decryption()->create(vmap({
}), Value::undef());
```


### Device

Create an instance: `auto device = client->device();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `std::map<std::string, Value>` |  |
| `activationDate` | `std::string` |  |
| `alternateKey` | `std::string` |  |
| `auditNextDate` | `std::string` |  |
| `auditNotificationDate` | `std::string` |  |
| `client` | `std::map<std::string, Value>` |  |
| `created` | `std::string` |  |
| `createdBy` | `std::map<std::string, Value>` |  |
| `deviceBuild` | `std::map<std::string, Value>` |  |
| `deviceState` | `std::map<std::string, Value>` |  |
| `deviceType` | `std::map<std::string, Value>` |  |
| `errorCounter` | `int64_t` |  |
| `errorLastDate` | `std::string` |  |
| `id` | `std::string` |  |
| `initializedBy` | `std::map<std::string, Value>` |  |
| `initializedDate` | `std::string` |  |
| `injectKey` | `std::map<std::string, Value>` |  |
| `isVirtual` | `bool` |  |
| `kif` | `std::map<std::string, Value>` |  |
| `lastActivityDate` | `std::string` |  |
| `location` | `std::map<std::string, Value>` |  |
| `modified` | `std::string` |  |
| `modifiedBy` | `std::map<std::string, Value>` |  |
| `name` | `std::string` |  |
| `notes` | `std::string` |  |
| `partner` | `std::map<std::string, Value>` |  |
| `serialNumber` | `std::string` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value device = client->device()->load(vmap({{"id", Value("device_id")}}), Value::undef());
```

#### Example: List

```cpp
Value devices = client->device()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value device = client->device()->create(vmap({
    {"activatedBy", vmap()},  // std::map<std::string, Value>
    {"createdBy", vmap()},  // std::map<std::string, Value>
    {"initializedBy", vmap()},  // std::map<std::string, Value>
    {"location", vmap()},  // std::map<std::string, Value>
    {"modifiedBy", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```


### DeviceBuild

Create an instance: `auto device_build = client->device_build();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `std::string` |  |
| `buildNumber` | `std::string` |  |
| `configFileName` | `std::string` |  |
| `created` | `std::string` |  |
| `deviceType` | `std::string` |  |
| `firmwareVersion` | `std::string` |  |
| `hardwareVersion` | `std::string` |  |
| `id` | `int64_t` |  |
| `isActive` | `bool` |  |
| `modified` | `std::string` |  |
| `name` | `std::string` |  |
| `notes` | `std::string` |  |
| `version` | `int64_t` |  |
| `whiteListingBinRanges` | `std::string` |  |
| `whiteListingUsed` | `bool` |  |

#### Example: Load

```cpp
Value device_build = client->device_build()->load(vmap({{"id", Value("device_build_id")}}), Value::undef());
```

#### Example: List

```cpp
Value device_builds = client->device_build()->list(Value::undef(), Value::undef());
```


### DeviceCustodyDetail

Create an instance: `auto device_custody_detail = client->device_custody_detail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `std::string` |  |
| `created` | `std::string` |  |
| `createdBy` | `std::map<std::string, Value>` |  |
| `custodian` | `std::map<std::string, Value>` |  |
| `device` | `std::map<std::string, Value>` |  |
| `id` | `int64_t` |  |
| `location` | `std::map<std::string, Value>` |  |
| `modified` | `std::string` |  |
| `modifiedBy` | `std::map<std::string, Value>` |  |
| `notes` | `std::string` |  |
| `status` | `std::map<std::string, Value>` |  |
| `transferMethod` | `std::map<std::string, Value>` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value device_custody_detail = client->device_custody_detail()->load(vmap({{"id", Value("device_custody_detail_id")}, {"device_type", Value("device_type")}, {"serial_number", Value("serial_number")}}), Value::undef());
```


### DeviceCustodyList

Create an instance: `auto device_custody_list = client->device_custody_list();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `std::string` |  |
| `created` | `std::string` |  |
| `createdBy` | `std::map<std::string, Value>` |  |
| `custodian` | `std::map<std::string, Value>` |  |
| `device` | `std::map<std::string, Value>` |  |
| `id` | `int64_t` |  |
| `location` | `std::map<std::string, Value>` |  |
| `modified` | `std::string` |  |
| `modifiedBy` | `std::map<std::string, Value>` |  |
| `notes` | `std::string` |  |
| `status` | `std::map<std::string, Value>` |  |
| `transferMethod` | `std::map<std::string, Value>` |  |
| `version` | `int64_t` |  |

#### Example: List

```cpp
Value device_custody_lists = client->device_custody_list()->list(Value::undef(), Value::undef());
```


### DeviceList

Create an instance: `auto device_list = client->device_list();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `std::vector<Value>` |  |
| `total` | `int64_t` |  |

#### Example: Load

```cpp
Value device_list = client->device_list()->load(vmap({{"share_partner_to", Value("share_partner_to")}}), Value::undef());
```


### DeviceReceiveResult

Create an instance: `auto device_receive_result = client->device_receive_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```cpp
Value device_receive_result = client->device_receive_result()->create(vmap({
    {"success", Value(true)},  // bool
}), Value::undef());
```


### DeviceRkiActivateResult

Create an instance: `auto device_rki_activate_result = client->device_rki_activate_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```cpp
Value device_rki_activate_result = client->device_rki_activate_result()->create(vmap({
    {"success", Value(true)},  // bool
}), Value::undef());
```


### DeviceState

Create an instance: `auto device_state = client->device_state();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` |  |
| `name` | `std::string` |  |

#### Example: List

```cpp
Value device_states = client->device_state()->list(Value::undef(), Value::undef());
```


### DeviceType

Create an instance: `auto device_type = client->device_type();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `std::string` |  |
| `deviceTypeMode` | `std::string` |  |
| `hardwareVersion` | `std::string` |  |
| `id` | `std::string` |  |
| `isActive` | `bool` |  |
| `manufacturer` | `std::string` |  |
| `model` | `std::string` |  |
| `modified` | `std::string` |  |
| `name` | `std::string` |  |
| `photoUrl` | `std::string` |  |
| `productName` | `std::string` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value device_type = client->device_type()->load(vmap({{"id", Value("device_type_id")}}), Value::undef());
```

#### Example: List

```cpp
Value device_types = client->device_type()->list(Value::undef(), Value::undef());
```


### InjectKey

Create an instance: `auto inject_key = client->inject_key();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `std::string` |  |
| `id` | `std::string` |  |
| `isActive` | `bool` |  |
| `isP2PE` | `bool` |  |
| `keyType` | `std::string` |  |
| `modified` | `std::string` |  |
| `name` | `std::string` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value inject_key = client->inject_key()->load(vmap({{"id", Value("inject_key_id")}}), Value::undef());
```

#### Example: List

```cpp
Value inject_keys = client->inject_key()->list(Value::undef(), Value::undef());
```


### Kif

Create an instance: `auto kif = client->kif();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int64_t` |  |
| `name` | `std::string` |  |

#### Example: List

```cpp
Value kifs = client->kif()->list(Value::undef(), Value::undef());
```


### Location

Create an instance: `auto location = client->location();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `std::string` |  |
| `address2` | `std::string` |  |
| `billingId` | `std::string` |  |
| `city` | `std::string` |  |
| `country` | `std::string` |  |
| `created` | `std::string` |  |
| `customReference` | `std::string` |  |
| `id` | `std::string` |  |
| `locationType` | `std::string` |  |
| `mailAddress1` | `std::string` |  |
| `mailAddress2` | `std::string` |  |
| `mailCity` | `std::string` |  |
| `mailCountry` | `std::string` |  |
| `mailPostalCode` | `std::string` |  |
| `mailStateProvince` | `std::string` |  |
| `modified` | `std::string` |  |
| `name` | `std::string` |  |
| `nameOfBusiness` | `std::string` |  |
| `notes` | `std::string` |  |
| `postalCode` | `std::string` |  |
| `stateProvince` | `std::string` |  |
| `uniqueId` | `std::string` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value location = client->location()->load(vmap({{"id", Value("location_id")}}), Value::undef());
```

#### Example: List

```cpp
Value locations = client->location()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value location = client->location()->create(vmap({
}), Value::undef());
```


### Partner

Create an instance: `auto partner = client->partner();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `std::string` |  |
| `clientCanOrderEquipment` | `bool` |  |
| `contact` | `std::map<std::string, Value>` |  |
| `created` | `std::string` |  |
| `id` | `std::string` |  |
| `isActive` | `bool` |  |
| `location` | `std::map<std::string, Value>` |  |
| `modified` | `std::string` |  |
| `name` | `std::string` |  |
| `parent` | `std::map<std::string, Value>` |  |
| `partnerId` | `std::string` |  |
| `reference` | `std::string` |  |
| `verificationPhrase` | `std::string` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value partner = client->partner()->load(vmap({{"id", Value("partner_id")}}), Value::undef());
```

#### Example: List

```cpp
Value partners = client->partner()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value partner = client->partner()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```


### Shipment

Create an instance: `auto shipment = client->shipment();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `std::string` |  |
| `client` | `std::map<std::string, Value>` |  |
| `created` | `std::string` |  |
| `dateReceived` | `std::string` |  |
| `dateShipped` | `std::string` |  |
| `dcKif` | `std::map<std::string, Value>` |  |
| `id` | `std::string` |  |
| `items` | `std::vector<Value>` |  |
| `kif` | `std::map<std::string, Value>` |  |
| `modified` | `std::string` |  |
| `partner` | `std::map<std::string, Value>` |  |
| `shipmentType` | `std::string` |  |
| `tracking` | `std::string` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value shipment = client->shipment()->load(vmap({{"id", Value("shipment_id")}}), Value::undef());
```

#### Example: List

```cpp
Value shipments = client->shipment()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value shipment = client->shipment()->create(vmap({
}), Value::undef());
```


### Success

Create an instance: `auto success = client->success();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```cpp
Value success = client->success()->create(vmap({
    {"share_partner_to", Value("example_share_partner_to")},  // std::string
}), Value::undef());
```


### Transaction

Create an instance: `auto transaction = client->transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `std::string` |  |
| `client` | `std::map<std::string, Value>` |  |
| `clientRef` | `std::string` |  |
| `created` | `std::string` |  |
| `decrypted` | `int64_t` |  |
| `deviceName` | `std::string` |  |
| `directPartner` | `std::map<std::string, Value>` |  |
| `encrypted` | `int64_t` |  |
| `endDate` | `std::string` |  |
| `errCode` | `std::string` |  |
| `errMessage` | `std::string` |  |
| `id` | `std::string` |  |
| `ipAddress` | `std::string` |  |
| `isVirtual` | `bool` |  |
| `keyType` | `std::string` |  |
| `location` | `std::map<std::string, Value>` |  |
| `messageId` | `std::string` |  |
| `method` | `std::string` |  |
| `partner` | `std::map<std::string, Value>` |  |
| `reference` | `std::string` |  |
| `serialNumber` | `std::string` |  |
| `startDate` | `std::string` |  |
| `success` | `bool` |  |
| `transactionSource` | `std::string` |  |

#### Example: Load

```cpp
Value transaction = client->transaction()->load(vmap({{"id", Value("transaction_id")}}), Value::undef());
```

#### Example: List

```cpp
Value transactions = client->transaction()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value transaction = client->transaction()->create(vmap({
    {"location", vmap()},  // std::map<std::string, Value>
}), Value::undef());
```


### UpdateResult

Create an instance: `auto update_result = client->update_result();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, ctrl)` | Create a new entity with the given data. |
| `list(match, ctrl)` | List entities, optionally matching the given criteria. |
| `update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::map<std::string, Value>` |  |
| `email` | `std::string` |  |
| `firstName` | `std::string` |  |
| `id` | `std::string` |  |
| `isActive` | `bool` |  |
| `kif` | `std::map<std::string, Value>` |  |
| `lastName` | `std::string` |  |
| `partner` | `std::map<std::string, Value>` |  |
| `phone` | `std::string` |  |
| `userName` | `std::string` |  |
| `userRole` | `std::map<std::string, Value>` |  |
| `version` | `int64_t` |  |

#### Example: List

```cpp
Value update_results = client->update_result()->list(Value::undef(), Value::undef());
```

#### Example: Create

```cpp
Value update_result = client->update_result()->create(vmap({
}), Value::undef());
```


### User

Create an instance: `auto user = client->user();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, ctrl)` | Load a single entity by match criteria. |
| `remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `std::map<std::string, Value>` |  |
| `created` | `std::string` |  |
| `email` | `std::string` |  |
| `firstName` | `std::string` |  |
| `id` | `std::string` |  |
| `isActive` | `bool` |  |
| `kif` | `std::map<std::string, Value>` |  |
| `lastName` | `std::string` |  |
| `modified` | `std::string` |  |
| `partner` | `std::map<std::string, Value>` |  |
| `phone` | `std::string` |  |
| `userName` | `std::string` |  |
| `userRole` | `std::map<std::string, Value>` |  |
| `version` | `int64_t` |  |

#### Example: Load

```cpp
Value user = client->user()->load(vmap({{"id", Value("user_id")}}), Value::undef());
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

The C++ SDK uses a single dynamic `sdk::Value` type (a JSON-like variant
over string / number / bool / list / map) throughout rather than generated
typed structs. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema changes.

Build maps with `sdk::vmap({{"key", sdk::Value("v")}})` and lists with
`sdk::vlist({...})`; read fields back with `sdk::getp(value, "key")`. Use
`sdk::to_map()` to safely coerce a value that should be a map, and
`sdk::Struct::jsonify(value)` to render it as JSON.

### Directory structure

```
cpp/
├── core/                        -- Runtime type graph, config, generated client
├── entity/                      -- Per-entity client headers
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Operation pipeline + vendored struct library
├── test/                        -- Test suites
├── Makefile                     -- Build & run the tests (C++17)
└── VERSION                      -- SDK version
```

Include the umbrella header `core/sdk.hpp` to pull in the whole SDK: the
runtime types, the pipeline utilities, the vendored struct, the generated
config, the per-entity clients and the generated `BluefinDecryptxP2peSDK`
client class. Everything lives in the `sdk` namespace.

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
