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
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `completeDate` | `std::string` | The date and time that the Attestation took place. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `device` | `std::map<std::string, Value>` | Reference to the associated Device resource. |
| `id` | `std::string` | This resource's unique identifier. |
| `name` | `std::string` | Text describing the attestation. |
| `notes` | `std::string` | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `id` | `std::string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `std::map<std::string, Value>` | Reference to the associated Location resource. |
| `mid` | `std::string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The Client's name. |
| `partner` | `std::map<std::string, Value>` | Reference to the Client's root Partner. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `success` | `bool` | true if the payload decryption was successful. |

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
| `activatedBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `activationDate` | `std::string` | Timestamp from when the Device was activated. |
| `alternateKey` | `std::string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `std::string` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `std::string` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `deviceBuild` | `std::map<std::string, Value>` | Reference to the associated Device Build resource. |
| `deviceState` | `std::map<std::string, Value>` | Reference to the associated Device State resource. |
| `deviceType` | `std::map<std::string, Value>` | Reference to the associated Device Type resource. |
| `errorCounter` | `int64_t` | The number times the Device has been in error. |
| `errorLastDate` | `std::string` | Timestamp from the last time that the Device had an error. |
| `id` | `std::string` | The Device's unique identifier. |
| `initializedBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `initializedDate` | `std::string` | Timestamp from when the Device was initialized. |
| `injectKey` | `std::map<std::string, Value>` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `std::map<std::string, Value>` | Reference to the associated KIF resource. |
| `lastActivityDate` | `std::string` | Timestamp from the last time that the Device was used. |
| `location` | `std::map<std::string, Value>` | Reference to the associated Location resource. |
| `modified` | `std::string` | Last modified timestamp. |
| `modifiedBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `name` | `std::string` | The Device's name. |
| `notes` | `std::string` | Arbitary note that can be attached to a Device entry. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `serialNumber` | `std::string` | The Device's serial number. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `appVersion` | `std::string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `std::string` | The Build Number. |
| `configFileName` | `std::string` | The name of the configuration file that is uploaded to the device. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `std::string` | The Device Type Name. |
| `firmwareVersion` | `std::string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `std::string` | A list of hardware versions that this Device Build covers. |
| `id` | `int64_t` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The Device Builds's name. |
| `notes` | `std::string` | Notes attached to the device build by Bluefin CISO. |
| `version` | `int64_t` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `std::string` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `std::string` | The date and time that the Custody change took place. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `custodian` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `device` | `std::map<std::string, Value>` | Reference to the associated Device resource. |
| `id` | `int64_t` | This resource's unique identifier. |
| `location` | `std::map<std::string, Value>` | Reference to the associated Location resource. |
| `modified` | `std::string` | Last modified timestamp. |
| `modifiedBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `notes` | `std::string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::map<std::string, Value>` | Reference to the associated Custody Status. |
| `transferMethod` | `std::map<std::string, Value>` | Reference to the associated Transfer Method. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `completeDate` | `std::string` | The date and time that the Custody change took place. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `custodian` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `device` | `std::map<std::string, Value>` | Reference to the associated Device resource. |
| `id` | `int64_t` | This resource's unique identifier. |
| `location` | `std::map<std::string, Value>` | Reference to the associated Location resource. |
| `modified` | `std::string` | Last modified timestamp. |
| `modifiedBy` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `notes` | `std::string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `std::map<std::string, Value>` | Reference to the associated Custody Status. |
| `transferMethod` | `std::map<std::string, Value>` | Reference to the associated Transfer Method. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `data` | `std::vector<Value>` | List of Devices. |
| `total` | `int64_t` | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `bool` | Indicates if the action succeeded. |

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
| `success` | `bool` | Indicates if the RKI activation succeeded. |

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
| `id` | `int64_t` | Unique identifier for this Device state. |
| `name` | `std::string` | Descriptive name for this Device state. |

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
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `std::string` | The Device type. |
| `hardwareVersion` | `std::string` | The Device hardware version. |
| `id` | `std::string` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `std::string` | The Device manufacturer. |
| `model` | `std::string` | The Device model. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The DeviceType name. |
| `photoUrl` | `std::string` |  |
| `productName` | `std::string` | The Device name. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `id` | `std::string` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `std::string` | The cipher type that the key works with. |
| `modified` | `std::string` | Last modified timestamp in ISO 8601 format. |
| `name` | `std::string` | Key name. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `id` | `int64_t` | This resource's unique identifier. |
| `name` | `std::string` | The KIF's name. |

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
| `address1` | `std::string` | The Location's street address. |
| `address2` | `std::string` | The Location's street address. |
| `billingId` | `std::string` | \? |
| `city` | `std::string` | The Location's city. |
| `country` | `std::string` | The Location's country. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `customReference` | `std::string` | A Partner specified reference for a location. |
| `id` | `std::string` | This resource's unique identifier. |
| `locationType` | `std::string` | The Location's clasification. |
| `mailAddress1` | `std::string` | The Location's street address. |
| `mailAddress2` | `std::string` | The Location's street address. |
| `mailCity` | `std::string` | The Location's city. |
| `mailCountry` | `std::string` | The Location's street address. |
| `mailPostalCode` | `std::string` | The Location's postal code. |
| `mailStateProvince` | `std::string` | The Location's street state or province. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The Location's name. |
| `nameOfBusiness` | `std::string` | The name of the business at this location. |
| `notes` | `std::string` | Note for delivery driver. |
| `postalCode` | `std::string` | The Location's postal code. |
| `stateProvince` | `std::string` | The Location's street state or province. |
| `uniqueId` | `std::string` | Unique Identifier for the Location. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `billingId` | `std::string` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `std::map<std::string, Value>` | Reference to the associated User resource. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `id` | `std::string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `std::map<std::string, Value>` | Reference to the associated Location resource. |
| `modified` | `std::string` | Last modified timestamp. |
| `name` | `std::string` | The Partner's name. |
| `parent` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `partnerId` | `std::string` | The Partner's id. |
| `reference` | `std::string` | The Partner's reference string. |
| `verificationPhrase` | `std::string` | The verification phrase is a message that the Partner creates. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `carrier` | `std::string` | The name of the courier. |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `std::string` | The date and time that a package is recieved. |
| `dateShipped` | `std::string` | The date and time that a package is shipped. |
| `dcKif` | `std::map<std::string, Value>` | Reference to the associated KIF resource. |
| `id` | `std::string` | This resource's unique identifier. |
| `items` | `std::vector<Value>` |  |
| `kif` | `std::map<std::string, Value>` | Reference to the associated KIF resource. |
| `modified` | `std::string` | Last modified timestamp. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `shipmentType` | `std::string` | The type of shipment. |
| `tracking` | `std::string` | The courier's tracking number. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `success` | `bool` | Indicates if the action was a success. |

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
| `alternateKey` | `std::string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `clientRef` | `std::string` | Client Reference property that is included in the decrypt API call. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int64_t` | A Transcation can process muliple decryptions. |
| `deviceName` | `std::string` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `encrypted` | `int64_t` | A Transcation can process muliple encryptions. |
| `endDate` | `std::string` | Timestamp from the end of the transaction. |
| `errCode` | `std::string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `std::string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `std::string` | This resource's unique identifier. |
| `ipAddress` | `std::string` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `std::string` | The type of cipher used during decrytion. |
| `location` | `std::map<std::string, Value>` | Reference to the associated Location resource. |
| `messageId` | `std::string` | Message ID. |
| `method` | `std::string` | The decryption cypher/method. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `reference` | `std::string` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `std::string` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `std::string` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `std::string` | The source of the Transaction. |

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
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `email` | `std::string` | The User's email address. |
| `firstName` | `std::string` | The User's name. |
| `id` | `std::string` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `std::map<std::string, Value>` | Reference to the associated KIF resource. |
| `lastName` | `std::string` | The User's Surname. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `phone` | `std::string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `std::string` | The User's unique username. |
| `userRole` | `std::map<std::string, Value>` | Reference to the associated User Role. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
| `client` | `std::map<std::string, Value>` | Reference to the associated Client resource. |
| `created` | `std::string` | Creation timestamp in ISO 8601 format. |
| `email` | `std::string` | The User's email address. |
| `firstName` | `std::string` | The User's name. |
| `id` | `std::string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `std::map<std::string, Value>` | Reference to the associated KIF resource. |
| `lastName` | `std::string` | The User's Surname. |
| `modified` | `std::string` | Last modified timestamp. |
| `partner` | `std::map<std::string, Value>` | Reference to the associated Partner. |
| `phone` | `std::string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `std::string` | The User's unique username. |
| `userRole` | `std::map<std::string, Value>` | Reference to the associated User Role. |
| `version` | `int64_t` | The number of times that this resource has been updated. |

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
