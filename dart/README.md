# BluefinDecryptxP2pe Dart SDK



The Dart SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Dart conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Attestation()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to pub.dev. Add it as a git
dependency (pinned to a release tag `dart/vX.Y.Z`, see
[Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) in your `pubspec.yaml`:

```yaml
dependencies:
  bluefin_decryptx_p2pe_sdk:
    git:
      url: https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk
      path: dart
      ref: dart/v0.0.1
```

Or depend on a local source checkout:

```yaml
dependencies:
  bluefin_decryptx_p2pe_sdk:
    path: ../dart
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```dart
import 'dart:io';
import 'package:bluefin_decryptx_p2pe_sdk/BluefinDecryptxP2peSDK.dart';

final client = BluefinDecryptxP2peSDK({
  'apikey': Platform.environment['BLUEFIN_DECRYPTX_P2PE_APIKEY'],
});
```

### 2. List attestation records

`list()` returns a `List` of entity instances and throws on error — iterate
it and read each record's data via `.data()`.

```dart
try {
  final attestations = await client.Attestation().list();
  for (final item in attestations) {
    print(item.data());
  }
} catch (err) {
  print('list failed: $err');
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data() for the record — and throws on error.

```dart
try {
  final devicecustodydetail = await client.DeviceCustodyDetail().load({'device_type': 'example_device_type', 'serial_number': 'example_serial_number', 'id': 'example_id'});
  print(devicecustodydetail);
} catch (err) {
  print('load failed: $err');
}
```

### 4. Create, update, and remove

```dart
// Create — returns the ENTITY (call data() for the record)
final created = await client.Attestation().create({'client': <String, dynamic>{}, 'completeDate': 'example_completeDate'});

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

```dart
final result = await client.direct({
  'path': '/api/resource/{id}',
  'method': 'GET',
  'params': {'id': 'example'},
});

if (true == result['ok']) {
  print(result['status']);  // 200
  print(result['data']);    // response body
} else {
  // A non-2xx response carries status + data (the error body); a
  // transport-level failure carries err instead. direct() never throws —
  // branch on result['ok'].
  print(result['status']);
  print(result['err']);
}
```

### Prepare a request without sending it

```dart
// prepare() returns the fetch definition (or an error value on failure).
final fetchdef = await client.prepare({
  'path': '/api/resource/{id}',
  'method': 'DELETE',
  'params': {'id': 'example'},
});

print(fetchdef['url']);
print(fetchdef['method']);
print(fetchdef['headers']);
```

### Use test mode

Create a mock client for unit testing — no server required:

```dart
final client = BluefinDecryptxP2peSDK.test();

// Entity ops return the ENTITY and throws on error;
// call data() for the record.
final devicetype = await client.DeviceType().list();
// devicetype contains the mock response record
print(devicetype);
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```dart
Future<dynamic> mockFetch(dynamic url, dynamic init) async {
  return {
    'status': 200,
    'statusText': 'OK',
    'headers': <String, dynamic>{},
    'json': () => {'id': 'mock01'},
  };
}

final client = BluefinDecryptxP2peSDK({
  'base': 'http://localhost:8080',
  'system': {
    'fetch': mockFetch,
  },
});
```

### Run live tests

Set the live-mode environment variables:

```bash
export BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
export BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd dart && dart run test/main.dart
```


## Reference

### BluefinDecryptxP2peSDK

```dart
import 'package:bluefin_decryptx_p2pe_sdk/BluefinDecryptxP2peSDK.dart';

final client = BluefinDecryptxP2peSDK(options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### test

```dart
final client = BluefinDecryptxP2peSDK.test(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options` | `() -> Map` | Deep copy of current SDK options. |
| `utility` | `() -> Utility` | The SDK utility object. |
| `prepare` | `([fetchargs]) -> Future` | Build an HTTP request definition without sending. Returns an error value on failure. |
| `direct` | `([fetchargs]) -> Future<Map>` | Build and send an HTTP request. Returns a result map (branch on `ok`); never throws. |
| `Attestation` | `([entopts]) -> AttestationEntity` | Create an Attestation entity instance. |
| `Client` | `([entopts]) -> ClientEntity` | Create a Client entity instance. |
| `CreateResult` | `([entopts]) -> CreateResultEntity` | Create a CreateResult entity instance. |
| `Decryption` | `([entopts]) -> DecryptionEntity` | Create a Decryption entity instance. |
| `Device` | `([entopts]) -> DeviceEntity` | Create a Device entity instance. |
| `DeviceBuild` | `([entopts]) -> DeviceBuildEntity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `([entopts]) -> DeviceCustodyDetailEntity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `([entopts]) -> DeviceCustodyListEntity` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `([entopts]) -> DeviceListEntity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `([entopts]) -> DeviceReceiveResultEntity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `([entopts]) -> DeviceRkiActivateResultEntity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `([entopts]) -> DeviceStateEntity` | Create a DeviceState entity instance. |
| `DeviceType` | `([entopts]) -> DeviceTypeEntity` | Create a DeviceType entity instance. |
| `InjectKey` | `([entopts]) -> InjectKeyEntity` | Create an InjectKey entity instance. |
| `Kif` | `([entopts]) -> KifEntity` | Create a Kif entity instance. |
| `Location` | `([entopts]) -> LocationEntity` | Create a Location entity instance. |
| `Partner` | `([entopts]) -> PartnerEntity` | Create a Partner entity instance. |
| `Shipment` | `([entopts]) -> ShipmentEntity` | Create a Shipment entity instance. |
| `Success` | `([entopts]) -> SuccessEntity` | Create a Success entity instance. |
| `Transaction` | `([entopts]) -> TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `([entopts]) -> UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User` | `([entopts]) -> UserEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, [ctrl]) -> Future<List>` | List entities matching the criteria (a list of entity instances). Throws on error. |
| `create` | `(reqdata, [ctrl]) -> Future<dynamic>` | Create a new entity. Throws on error. |
| `update` | `(reqdata, [ctrl]) -> Future<dynamic>` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, [ctrl]) -> Future<dynamic>` | Remove an entity. Throws on error. |
| `data` | `([d]) -> Map` | Get (or, with an argument, set) entity data. |
| `match` | `([m]) -> Map` | Get (or, with an argument, set) entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `entopts` | `() -> Map` | Return the entity options. |
| `Name` | `String` | The entity name (a public field). |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
ops, a `List` of entity instances for `list`) and throw on error. Wrap calls
in `try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `Map` you
branch on via `result['ok']`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `dynamic` | Parsed JSON response body. |

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

Create an instance: `final attestation = client.Attestation();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, dynamic>` |  |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `device` | `Map<String, dynamic>` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |

#### Example: Load

```dart
final attestation = await client.Attestation().load({'id': 'attestation_id'});
```

#### Example: List

```dart
final attestations = await client.Attestation().list();
```

#### Example: Create

```dart
final attestation = await client.Attestation().create({
});
```


### Client

Create an instance: `final client_ = client.Client();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `directPartner` | `Map<String, dynamic>` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `location` | `Map<String, dynamic>` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final client_ = await client.Client().load({'id': 'client_id'});
```

#### Example: List

```dart
final client_s = await client.Client().list();
```

#### Example: Create

```dart
final client_ = await client.Client().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```


### CreateResult

Create an instance: `final create_result = client.CreateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```dart
final create_result = await client.CreateResult().create({
  'device_type': 'example_device_type',  // String
  'serial_number': 'example_serial_number',  // String
});
```


### Decryption

Create an instance: `final decryption = client.Decryption();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```dart
final decryption = await client.Decryption().create({
});
```


### Device

Create an instance: `final device = client.Device();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `Map<String, dynamic>` |  |
| `activationDate` | `String` |  |
| `alternateKey` | `String` |  |
| `auditNextDate` | `String` |  |
| `auditNotificationDate` | `String` |  |
| `client` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `createdBy` | `Map<String, dynamic>` |  |
| `deviceBuild` | `Map<String, dynamic>` |  |
| `deviceState` | `Map<String, dynamic>` |  |
| `deviceType` | `Map<String, dynamic>` |  |
| `errorCounter` | `int` |  |
| `errorLastDate` | `String` |  |
| `id` | `String` |  |
| `initializedBy` | `Map<String, dynamic>` |  |
| `initializedDate` | `String` |  |
| `injectKey` | `Map<String, dynamic>` |  |
| `isVirtual` | `bool` |  |
| `kif` | `Map<String, dynamic>` |  |
| `lastActivityDate` | `String` |  |
| `location` | `Map<String, dynamic>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Map<String, dynamic>` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `serialNumber` | `String` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final device = await client.Device().load({'id': 'device_id'});
```

#### Example: List

```dart
final devices = await client.Device().list();
```

#### Example: Create

```dart
final device = await client.Device().create({
  'activatedBy': <String, dynamic>{},  // Map<String, dynamic>
  'createdBy': <String, dynamic>{},  // Map<String, dynamic>
  'initializedBy': <String, dynamic>{},  // Map<String, dynamic>
  'location': <String, dynamic>{},  // Map<String, dynamic>
  'modifiedBy': <String, dynamic>{},  // Map<String, dynamic>
});
```


### DeviceBuild

Create an instance: `final device_build = client.DeviceBuild();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

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
| `id` | `int` |  |
| `isActive` | `bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `version` | `int` |  |
| `whiteListingBinRanges` | `String` |  |
| `whiteListingUsed` | `bool` |  |

#### Example: Load

```dart
final device_build = await client.DeviceBuild().load({'id': 'device_build_id'});
```

#### Example: List

```dart
final device_builds = await client.DeviceBuild().list();
```


### DeviceCustodyDetail

Create an instance: `final device_custody_detail = client.DeviceCustodyDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Map<String, dynamic>` |  |
| `custodian` | `Map<String, dynamic>` |  |
| `device` | `Map<String, dynamic>` |  |
| `id` | `int` |  |
| `location` | `Map<String, dynamic>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Map<String, dynamic>` |  |
| `notes` | `String` |  |
| `status` | `Map<String, dynamic>` |  |
| `transferMethod` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final device_custody_detail = await client.DeviceCustodyDetail().load({'id': 'device_custody_detail_id', 'device_type': 'device_type', 'serial_number': 'serial_number'});
```


### DeviceCustodyList

Create an instance: `final device_custody_list = client.DeviceCustodyList();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Map<String, dynamic>` |  |
| `custodian` | `Map<String, dynamic>` |  |
| `device` | `Map<String, dynamic>` |  |
| `id` | `int` |  |
| `location` | `Map<String, dynamic>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Map<String, dynamic>` |  |
| `notes` | `String` |  |
| `status` | `Map<String, dynamic>` |  |
| `transferMethod` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: List

```dart
final device_custody_lists = await client.DeviceCustodyList().list({ device_type: "example", serial_number: "example" });
```


### DeviceList

Create an instance: `final device_list = client.DeviceList();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `List<dynamic>` |  |
| `total` | `int` |  |

#### Example: Load

```dart
final device_list = await client.DeviceList().load({'share_partner_to': 'share_partner_to'});
```


### DeviceReceiveResult

Create an instance: `final device_receive_result = client.DeviceReceiveResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```dart
final device_receive_result = await client.DeviceReceiveResult().create({
  'success': true,  // bool
});
```


### DeviceRkiActivateResult

Create an instance: `final device_rki_activate_result = client.DeviceRkiActivateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```dart
final device_rki_activate_result = await client.DeviceRkiActivateResult().create({
  'success': true,  // bool
});
```


### DeviceState

Create an instance: `final device_state = client.DeviceState();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `String` |  |

#### Example: List

```dart
final device_states = await client.DeviceState().list();
```


### DeviceType

Create an instance: `final device_type = client.DeviceType();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

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
| `version` | `int` |  |

#### Example: Load

```dart
final device_type = await client.DeviceType().load({'id': 'device_type_id'});
```

#### Example: List

```dart
final device_types = await client.DeviceType().list();
```


### InjectKey

Create an instance: `final inject_key = client.InjectKey();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

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
| `version` | `int` |  |

#### Example: Load

```dart
final inject_key = await client.InjectKey().load({'id': 'inject_key_id'});
```

#### Example: List

```dart
final inject_keys = await client.InjectKey().list();
```


### Kif

Create an instance: `final kif = client.Kif();`

#### Operations

| Method | Description |
| --- | --- |
| `list()` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `String` |  |

#### Example: List

```dart
final kifs = await client.Kif().list();
```


### Location

Create an instance: `final location = client.Location();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

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
| `version` | `int` |  |

#### Example: Load

```dart
final location = await client.Location().load({'id': 'location_id'});
```

#### Example: List

```dart
final locations = await client.Location().list();
```

#### Example: Create

```dart
final location = await client.Location().create({
});
```


### Partner

Create an instance: `final partner = client.Partner();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `clientCanOrderEquipment` | `bool` |  |
| `contact` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `location` | `Map<String, dynamic>` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Map<String, dynamic>` |  |
| `partnerId` | `String` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final partner = await client.Partner().load({'id': 'partner_id'});
```

#### Example: List

```dart
final partners = await client.Partner().list();
```

#### Example: Create

```dart
final partner = await client.Partner().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```


### Shipment

Create an instance: `final shipment = client.Shipment();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `dateReceived` | `String` |  |
| `dateShipped` | `String` |  |
| `dcKif` | `Map<String, dynamic>` |  |
| `id` | `String` |  |
| `items` | `List<dynamic>` |  |
| `kif` | `Map<String, dynamic>` |  |
| `modified` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `shipmentType` | `String` |  |
| `tracking` | `String` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final shipment = await client.Shipment().load({'id': 'shipment_id'});
```

#### Example: List

```dart
final shipments = await client.Shipment().list();
```

#### Example: Create

```dart
final shipment = await client.Shipment().create({
});
```


### Success

Create an instance: `final success = client.Success();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```dart
final success = await client.Success().create({
  'share_partner_to': 'example_share_partner_to',  // String
});
```


### Transaction

Create an instance: `final transaction = client.Transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` |  |
| `client` | `Map<String, dynamic>` |  |
| `clientRef` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `int` |  |
| `deviceName` | `String` |  |
| `directPartner` | `Map<String, dynamic>` |  |
| `encrypted` | `int` |  |
| `endDate` | `String` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `String` |  |
| `ipAddress` | `String` |  |
| `isVirtual` | `bool` |  |
| `keyType` | `String` |  |
| `location` | `Map<String, dynamic>` |  |
| `messageId` | `String` |  |
| `method` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `reference` | `String` |  |
| `serialNumber` | `String` |  |
| `startDate` | `String` |  |
| `success` | `bool` |  |
| `transactionSource` | `String` |  |

#### Example: Load

```dart
final transaction = await client.Transaction().load({'id': 'transaction_id'});
```

#### Example: List

```dart
final transactions = await client.Transaction().list();
```

#### Example: Create

```dart
final transaction = await client.Transaction().create({
  'location': <String, dynamic>{},  // Map<String, dynamic>
});
```


### UpdateResult

Create an instance: `final update_result = client.UpdateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list()` | List entities, optionally matching the given criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, dynamic>` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `kif` | `Map<String, dynamic>` |  |
| `lastName` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: List

```dart
final update_results = await client.UpdateResult().list();
```

#### Example: Create

```dart
final update_result = await client.UpdateResult().create({
});
```


### User

Create an instance: `final user = client.User();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, dynamic>` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `bool` |  |
| `kif` | `Map<String, dynamic>` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Map<String, dynamic>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Map<String, dynamic>` |  |
| `version` | `int` |  |

#### Example: Load

```dart
final user = await client.User().load({'id': 'user_id'});
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

### Maps in, typed models alongside

The Dart SDK passes plain `Map<String, dynamic>` values through the
operation pipeline rather than requiring typed objects at every call. This
mirrors the dynamic nature of the API and keeps calls terse — a create is
just `create({'name': 'example'})`.

For a typed, documented view of each entity and operation, the generated
`BluefinDecryptxP2peTypes.dart` provides a class per entity plus per-op request/match
classes (e.g. `BluefinDecryptxP2pe.fromMap(entity.data())` and `model.toMap()`), so you
can convert to and from those maps wherever you want compile-time structure.

### Package structure

```
dart/
├── lib/
│   ├── BluefinDecryptxP2peSDK.dart          -- Main SDK library (exported entry point)
│   ├── BluefinDecryptxP2peTypes.dart        -- Typed entity + request/match models
│   ├── BluefinDecryptxP2peEntityBase.dart   -- Base class for entities
│   ├── BluefinDecryptxP2peError.dart        -- SDK error type
│   ├── Config.dart              -- Configuration
│   ├── entity/                  -- Entity implementations
│   ├── feature/                 -- Built-in features (base, test, log, ...)
│   └── utility/                 -- Utility functions and vendored struct library
└── test/                        -- Test suites (dart run test/main.dart)
```

The main library (`BluefinDecryptxP2peSDK.dart`) re-exports the SDK class, the typed
models, and every entity class, so a single
`import 'package:bluefin_decryptx_p2pe_sdk/BluefinDecryptxP2peSDK.dart';`
brings in everything you need.

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
