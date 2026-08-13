# BluefinDecryptxP2pe Java SDK



The Java SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Java conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. Install it from the GitHub
release tag (`java/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout — build the library with Maven:

```bash
cd java && mvn install
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```java
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK;

Map<String, Object> options = new java.util.LinkedHashMap<>();
options.put("apikey", System.getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"));
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```

### 2. List attestation records

`list(null, null)` returns an aggregate list of records (as `Object`, an
aggregate list) and raises on error.

```java
try {
    Object attestationList = client.attestation(null).list(null, null);
    System.out.println(attestationList);
}
catch (RuntimeException err) {
    System.out.println("list failed: " + err.getMessage());
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data() for the record — and raises on error.

```java
try {
    Object deviceCustodyDetail = client.deviceCustodyDetail(null).load(Map.of("device_type", "example_device_type", "serial_number", "example_serial_number", "id", "example_id"), null);
    System.out.println(deviceCustodyDetail);
}
catch (RuntimeException err) {
    System.out.println("load failed: " + err.getMessage());
}
```

### 4. Create, update, and remove

```java
// Create — returns the ENTITY (call data() for the record)
Object created = client.attestation(null).create(Map.of("client", Map.of(), "completeDate", "example_completeDate"), null);

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

```java
Map<String, Object> result = client.direct(Map.of(
    "path", "/api/resource/{id}",
    "method", "GET",
    "params", Map.of("id", "example")));

if (Boolean.TRUE.equals(result.get("ok"))) {
    System.out.println(result.get("status"));  // 200
    System.out.println(result.get("data"));    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both — an absent key simply reads as null.
    System.out.println(result.get("status") + " " + result.get("err"));
}
```

### Prepare a request without sending it

```java
// prepare() returns the fetch definition and raises on error.
Map<String, Object> fetchdef = client.prepare(Map.of(
    "path", "/api/resource/{id}",
    "method", "DELETE",
    "params", Map.of("id", "example")));

System.out.println(fetchdef.get("url"));
System.out.println(fetchdef.get("method"));
System.out.println(fetchdef.get("headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```java
BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(null, null);

// Entity ops return the ENTITY and raises on error;
// call data() for the record.
Object deviceType = client.deviceType(null).list(null, null);
// deviceType holds the mock response record
System.out.println(deviceType);
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```java
java.util.function.BiFunction<String, Map<String, Object>, Object> mockFetch =
    (url, init) -> {
        Map<String, Object> res = new java.util.LinkedHashMap<>();
        res.put("status", 200);
        res.put("statusText", "OK");
        res.put("headers", new java.util.LinkedHashMap<String, Object>());
        res.put("json", (java.util.function.Supplier<Object>) () ->
            Map.of("id", "mock01"));
        return res;
    };

Map<String, Object> options = new java.util.LinkedHashMap<>();
options.put("base", "http://localhost:8080");
options.put("system", Map.of("fetch", mockFetch));
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd java && mvn test
```


## Reference

### BluefinDecryptxP2peSDK

```java
BluefinDecryptxP2peSDK client = new BluefinDecryptxP2peSDK(options);
```

Creates a new SDK client. `options` is a `Map<String, Object>`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Map` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Map` | System overrides (e.g. custom `fetch` function). |

### testSDK

```java
BluefinDecryptxP2peSDK client = BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> Map` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `attestation` | `(entopts) -> SdkEntity` | Create an Attestation entity instance. |
| `client` | `(entopts) -> SdkEntity` | Create a Client entity instance. |
| `createResult` | `(entopts) -> SdkEntity` | Create a CreateResult entity instance. |
| `decryption` | `(entopts) -> SdkEntity` | Create a Decryption entity instance. |
| `device` | `(entopts) -> SdkEntity` | Create a Device entity instance. |
| `deviceBuild` | `(entopts) -> SdkEntity` | Create a DeviceBuild entity instance. |
| `deviceCustodyDetail` | `(entopts) -> SdkEntity` | Create a DeviceCustodyDetail entity instance. |
| `deviceCustodyList` | `(entopts) -> SdkEntity` | Create a DeviceCustodyList entity instance. |
| `deviceList` | `(entopts) -> SdkEntity` | Create a DeviceList entity instance. |
| `deviceReceiveResult` | `(entopts) -> SdkEntity` | Create a DeviceReceiveResult entity instance. |
| `deviceRkiActivateResult` | `(entopts) -> SdkEntity` | Create a DeviceRkiActivateResult entity instance. |
| `deviceState` | `(entopts) -> SdkEntity` | Create a DeviceState entity instance. |
| `deviceType` | `(entopts) -> SdkEntity` | Create a DeviceType entity instance. |
| `injectKey` | `(entopts) -> SdkEntity` | Create an InjectKey entity instance. |
| `kif` | `(entopts) -> SdkEntity` | Create a Kif entity instance. |
| `location` | `(entopts) -> SdkEntity` | Create a Location entity instance. |
| `partner` | `(entopts) -> SdkEntity` | Create a Partner entity instance. |
| `shipment` | `(entopts) -> SdkEntity` | Create a Shipment entity instance. |
| `success` | `(entopts) -> SdkEntity` | Create a Success entity instance. |
| `transaction` | `(entopts) -> SdkEntity` | Create a Transaction entity instance. |
| `updateResult` | `(entopts) -> SdkEntity` | Create an UpdateResult entity instance. |
| `user` | `(entopts) -> SdkEntity` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> Object` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Object` | List entities matching the criteria (an aggregate list). Raises on error. |
| `create` | `(reqdata, ctrl) -> Object` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> Object` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> Object` | Remove an entity. Raises on error. |
| `data` | `(newdata...) -> Object` | Get or set entity data. |
| `match` | `(newmatch...) -> Object` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Object` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`Map<String, Object>` you branch on via `result.get("ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Object` | Parsed JSON response body. |

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

Operations: create, list, load.

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

Operations: create, list, load, remove.

API path: `/clients`

#### CreateResult

| Field | Description |
| --- | --- |

Operations: create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

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

Operations: create, list, load.

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

Operations: list, load.

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

Operations: load.

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

Operations: list.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` |  |
| `total` |  |

Operations: load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: list.

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

Operations: list, load.

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

Operations: list, load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: list.

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

Operations: create, list, load, remove.

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

Operations: create, list, load.

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

Operations: create, list, load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create, remove.

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

Operations: create, list, load.

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

Operations: create, list, update.

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

Operations: load, remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `SdkEntity attestation = client.attestation(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, Object>` |  |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `device` | `Map<String, Object>` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |

#### Example: Load

```java
Object attestation = client.attestation(null).load(Map.of("id", "attestation_id"), null);
```

#### Example: List

```java
Object attestationList = client.attestation(null).list(null, null);
```

#### Example: Create

```java
Object attestation = client.attestation(null).create(Map.of(
), null);
```


### Client

Create an instance: `SdkEntity client = client.client(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Map<String, Object>` |  |
| `created` | `String` |  |
| `directPartner` | `Map<String, Object>` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `location` | `Map<String, Object>` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `Map<String, Object>` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object client = client.client(null).load(Map.of("id", "client_id"), null);
```

#### Example: List

```java
Object clientList = client.client(null).list(null, null);
```

#### Example: Create

```java
Object client = client.client(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```


### CreateResult

Create an instance: `SdkEntity createResult = client.createResult(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Example: Create

```java
Object createResult = client.createResult(null).create(Map.of(
    "device_type", "example_device_type",  // String
    "serial_number", "example_serial_number"  // String
), null);
```


### Decryption

Create an instance: `SdkEntity decryption = client.decryption(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```java
Object decryption = client.decryption(null).create(Map.of(
), null);
```


### Device

Create an instance: `SdkEntity device = client.device(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `Map<String, Object>` |  |
| `activationDate` | `String` |  |
| `alternateKey` | `String` |  |
| `auditNextDate` | `String` |  |
| `auditNotificationDate` | `String` |  |
| `client` | `Map<String, Object>` |  |
| `created` | `String` |  |
| `createdBy` | `Map<String, Object>` |  |
| `deviceBuild` | `Map<String, Object>` |  |
| `deviceState` | `Map<String, Object>` |  |
| `deviceType` | `Map<String, Object>` |  |
| `errorCounter` | `Long` |  |
| `errorLastDate` | `String` |  |
| `id` | `String` |  |
| `initializedBy` | `Map<String, Object>` |  |
| `initializedDate` | `String` |  |
| `injectKey` | `Map<String, Object>` |  |
| `isVirtual` | `Boolean` |  |
| `kif` | `Map<String, Object>` |  |
| `lastActivityDate` | `String` |  |
| `location` | `Map<String, Object>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Map<String, Object>` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `partner` | `Map<String, Object>` |  |
| `serialNumber` | `String` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object device = client.device(null).load(Map.of("id", "device_id"), null);
```

#### Example: List

```java
Object deviceList = client.device(null).list(null, null);
```

#### Example: Create

```java
Object device = client.device(null).create(Map.of(
    "activatedBy", Map.of(),  // Map<String, Object>
    "createdBy", Map.of(),  // Map<String, Object>
    "initializedBy", Map.of(),  // Map<String, Object>
    "location", Map.of(),  // Map<String, Object>
    "modifiedBy", Map.of()  // Map<String, Object>
), null);
```


### DeviceBuild

Create an instance: `SdkEntity deviceBuild = client.deviceBuild(null);`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

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
| `id` | `Long` |  |
| `isActive` | `Boolean` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `version` | `Long` |  |
| `whiteListingBinRanges` | `String` |  |
| `whiteListingUsed` | `Boolean` |  |

#### Example: Load

```java
Object deviceBuild = client.deviceBuild(null).load(Map.of("id", "device_build_id"), null);
```

#### Example: List

```java
Object deviceBuildList = client.deviceBuild(null).list(null, null);
```


### DeviceCustodyDetail

Create an instance: `SdkEntity deviceCustodyDetail = client.deviceCustodyDetail(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Map<String, Object>` |  |
| `custodian` | `Map<String, Object>` |  |
| `device` | `Map<String, Object>` |  |
| `id` | `Long` |  |
| `location` | `Map<String, Object>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Map<String, Object>` |  |
| `notes` | `String` |  |
| `status` | `Map<String, Object>` |  |
| `transferMethod` | `Map<String, Object>` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object deviceCustodyDetail = client.deviceCustodyDetail(null).load(Map.of("id", "device_custody_detail_id", "device_type", "device_type", "serial_number", "serial_number"), null);
```


### DeviceCustodyList

Create an instance: `SdkEntity deviceCustodyList = client.deviceCustodyList(null);`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `Map<String, Object>` |  |
| `custodian` | `Map<String, Object>` |  |
| `device` | `Map<String, Object>` |  |
| `id` | `Long` |  |
| `location` | `Map<String, Object>` |  |
| `modified` | `String` |  |
| `modifiedBy` | `Map<String, Object>` |  |
| `notes` | `String` |  |
| `status` | `Map<String, Object>` |  |
| `transferMethod` | `Map<String, Object>` |  |
| `version` | `Long` |  |

#### Example: List

```java
Object deviceCustodyListList = client.deviceCustodyList(null).list(null, null);
```


### DeviceList

Create an instance: `SdkEntity deviceList = client.deviceList(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `List<Object>` |  |
| `total` | `Long` |  |

#### Example: Load

```java
Object deviceList = client.deviceList(null).load(Map.of("share_partner_to", "share_partner_to"), null);
```


### DeviceReceiveResult

Create an instance: `SdkEntity deviceReceiveResult = client.deviceReceiveResult(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```java
Object deviceReceiveResult = client.deviceReceiveResult(null).create(Map.of(
    "success", true  // Boolean
), null);
```


### DeviceRkiActivateResult

Create an instance: `SdkEntity deviceRkiActivateResult = client.deviceRkiActivateResult(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```java
Object deviceRkiActivateResult = client.deviceRkiActivateResult(null).create(Map.of(
    "success", true  // Boolean
), null);
```


### DeviceState

Create an instance: `SdkEntity deviceState = client.deviceState(null);`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Long` |  |
| `name` | `String` |  |

#### Example: List

```java
Object deviceStateList = client.deviceState(null).list(null, null);
```


### DeviceType

Create an instance: `SdkEntity deviceType = client.deviceType(null);`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `deviceTypeMode` | `String` |  |
| `hardwareVersion` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photoUrl` | `String` |  |
| `productName` | `String` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object deviceType = client.deviceType(null).load(Map.of("id", "device_type_id"), null);
```

#### Example: List

```java
Object deviceTypeList = client.deviceType(null).list(null, null);
```


### InjectKey

Create an instance: `SdkEntity injectKey = client.injectKey(null);`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `isP2PE` | `Boolean` |  |
| `keyType` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object injectKey = client.injectKey(null).load(Map.of("id", "inject_key_id"), null);
```

#### Example: List

```java
Object injectKeyList = client.injectKey(null).list(null, null);
```


### Kif

Create an instance: `SdkEntity kif = client.kif(null);`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Long` |  |
| `name` | `String` |  |

#### Example: List

```java
Object kifList = client.kif(null).list(null, null);
```


### Location

Create an instance: `SdkEntity location = client.location(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

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
| `version` | `Long` |  |

#### Example: Load

```java
Object location = client.location(null).load(Map.of("id", "location_id"), null);
```

#### Example: List

```java
Object locationList = client.location(null).list(null, null);
```

#### Example: Create

```java
Object location = client.location(null).create(Map.of(
), null);
```


### Partner

Create an instance: `SdkEntity partner = client.partner(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `clientCanOrderEquipment` | `Boolean` |  |
| `contact` | `Map<String, Object>` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `location` | `Map<String, Object>` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `Map<String, Object>` |  |
| `partnerId` | `String` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object partner = client.partner(null).load(Map.of("id", "partner_id"), null);
```

#### Example: List

```java
Object partnerList = client.partner(null).list(null, null);
```

#### Example: Create

```java
Object partner = client.partner(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```


### Shipment

Create an instance: `SdkEntity shipment = client.shipment(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `Map<String, Object>` |  |
| `created` | `String` |  |
| `dateReceived` | `String` |  |
| `dateShipped` | `String` |  |
| `dcKif` | `Map<String, Object>` |  |
| `id` | `String` |  |
| `items` | `List<Object>` |  |
| `kif` | `Map<String, Object>` |  |
| `modified` | `String` |  |
| `partner` | `Map<String, Object>` |  |
| `shipmentType` | `String` |  |
| `tracking` | `String` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object shipment = client.shipment(null).load(Map.of("id", "shipment_id"), null);
```

#### Example: List

```java
Object shipmentList = client.shipment(null).list(null, null);
```

#### Example: Create

```java
Object shipment = client.shipment(null).create(Map.of(
), null);
```


### Success

Create an instance: `SdkEntity success = client.success(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Boolean` |  |

#### Example: Create

```java
Object success = client.success(null).create(Map.of(
    "share_partner_to", "example_share_partner_to"  // String
), null);
```


### Transaction

Create an instance: `SdkEntity transaction = client.transaction(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` |  |
| `client` | `Map<String, Object>` |  |
| `clientRef` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `Long` |  |
| `deviceName` | `String` |  |
| `directPartner` | `Map<String, Object>` |  |
| `encrypted` | `Long` |  |
| `endDate` | `String` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `String` |  |
| `ipAddress` | `String` |  |
| `isVirtual` | `Boolean` |  |
| `keyType` | `String` |  |
| `location` | `Map<String, Object>` |  |
| `messageId` | `String` |  |
| `method` | `String` |  |
| `partner` | `Map<String, Object>` |  |
| `reference` | `String` |  |
| `serialNumber` | `String` |  |
| `startDate` | `String` |  |
| `success` | `Boolean` |  |
| `transactionSource` | `String` |  |

#### Example: Load

```java
Object transaction = client.transaction(null).load(Map.of("id", "transaction_id"), null);
```

#### Example: List

```java
Object transactionList = client.transaction(null).list(null, null);
```

#### Example: Create

```java
Object transaction = client.transaction(null).create(Map.of(
    "location", Map.of()  // Map<String, Object>
), null);
```


### UpdateResult

Create an instance: `SdkEntity updateResult = client.updateResult(null);`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, Object>` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `kif` | `Map<String, Object>` |  |
| `lastName` | `String` |  |
| `partner` | `Map<String, Object>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Map<String, Object>` |  |
| `version` | `Long` |  |

#### Example: List

```java
Object updateResultList = client.updateResult(null).list(null, null);
```

#### Example: Create

```java
Object updateResult = client.updateResult(null).create(Map.of(
), null);
```


### User

Create an instance: `SdkEntity user = client.user(null);`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Map<String, Object>` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Boolean` |  |
| `kif` | `Map<String, Object>` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `Map<String, Object>` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `Map<String, Object>` |  |
| `version` | `Long` |  |

#### Example: Load

```java
Object user = client.user(null).load(Map.of("id", "user_id"), null);
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

### Data as maps

The Java SDK uses a loose object model — `Map<String, Object>` throughout —
rather than a bespoke typed class per endpoint. This mirrors the dynamic
nature of the API and keeps the SDK flexible: no regeneration is needed when
the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`Map<String, Object>`. A `BluefinDecryptxP2peTypes.java` module of reference
`record` types is also generated for editor documentation.

### Project structure

```
java/
├── pom.xml                     -- Maven project (compiles core/, utility/, feature/, entity/)
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- JUnit test suites
```

The main client class (`BluefinDecryptxP2peSDK`, package `voxgig.bluefindecryptxp2pesdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed.

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
