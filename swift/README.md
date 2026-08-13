# BluefinDecryptxP2pe Swift SDK



The Swift SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Swift conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Attestation()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to a SwiftPM registry. The generated SDK
is a dependency-free SwiftPM package (Foundation only, plus the vendored
Voxgig Struct port). Depend on it from the GitHub release tag
(`swift/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) by adding it to
your `Package.swift`:

```swift
dependencies: [
    // From the git release tag:
    .package(url: "<repo-url>", exact: "0.0.1"),
],
```

Or build from a source checkout with SwiftPM:

```bash
cd swift && swift build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```swift
import BluefinDecryptxP2peSdk

let options = VMap()
options.entries["apikey"] = .string(
    ProcessInfo.processInfo.environment["BLUEFIN_DECRYPTX_P2PE_APIKEY"] ?? "")
let client = BluefinDecryptxP2peSDK(options)
```

### 2. List attestation records

`list(nil, nil)` returns a `Value` list of records and throws on error —
iterate its items.

```swift
do {
    let attestationList = try client.Attestation().list(nil, nil)
    for attestation in attestationList.asList?.items ?? [] {
        print(attestation)
    }
}
catch {
    print("list failed: \(error)")
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data() for the record — and throws on error.

```swift
do {
    let deviceCustodyDetail = try client.DeviceCustodyDetail().load(VMap([("device_type", .string("example_device_type")), ("serial_number", .string("example_serial_number")), ("id", .string("example_id"))]), nil)
    print(deviceCustodyDetail)
}
catch {
    print("load failed: \(error)")
}
```

### 4. Create, update, and remove

```swift
// Create — returns the ENTITY (call data() for the record)
let created = try client.Attestation().create(VMap([("client", .map(VMap())), ("completeDate", .string("example_completeDate"))]), nil)

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

```swift
let result = client.direct(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("GET")),
    ("params", .map([("id", .string("example"))])),
]))

if result.entries["ok"] == .bool(true) {
    print(result.entries["status"] ?? .noval)  // 200
    print(result.entries["data"] ?? .noval)     // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // an absent key simply reads as .noval.
    print(result.entries["status"] ?? .noval, result.entries["err"] ?? .noval)
}
```

### Prepare a request without sending it

```swift
// prepare() returns the fetch definition and throws on error.
let fetchdef = try client.prepare(VMap([
    ("path", .string("/api/resource/{id}")),
    ("method", .string("DELETE")),
    ("params", .map([("id", .string("example"))])),
]))

print(fetchdef.entries["url"] ?? .noval)
print(fetchdef.entries["method"] ?? .noval)
print(fetchdef.entries["headers"] ?? .noval)
```

### Use test mode

Create a mock client for unit testing — no server required:

```swift
let client = BluefinDecryptxP2peSDK.testSDK(nil, nil)

// Entity ops return the ENTITY and throws on error;
// call data() for the record.
let deviceType = try client.DeviceType().list(nil, nil)
// deviceType holds the mock response record
print(deviceType)
```

### Use a custom fetch function

Replace the HTTP transport with your own `SystemFetch` closure:

```swift
let fetch: SystemFetch = { url, _ in
    let m = VMap()
    m.entries["status"] = .int(200)
    m.entries["statusText"] = .string("OK")
    m.entries["headers"] = .map(VMap())
    m.entries["json"] = .nat({ () -> Value in .map(VMap([("id", .string("mock01"))])) } as NativeCall0)
    return .map(m)
}

let system = VMap()
system.entries["fetch"] = .nat(fetch)
let options = VMap()
options.entries["base"] = .string("http://localhost:8080")
options.entries["system"] = .map(system)
let client = BluefinDecryptxP2peSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd swift && make test
```


## Reference

### BluefinDecryptxP2peSDK

```swift
let client = BluefinDecryptxP2peSDK(options)
```

Creates a new SDK client. `options` is a `VMap` of `Value`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `VMap` | Feature activation flags. |
| `extend` | `VList` | Additional Feature instances to load. |
| `system` | `VMap` | System overrides (e.g. custom `fetch` function). |

### testSDK

```swift
let client = BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `optionsMap` | `() -> VMap` | Deep copy of current SDK options. |
| `getUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) throws -> VMap` | Build an HTTP request definition without sending. Throws on error. |
| `direct` | `(fetchargs) -> VMap` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `Attestation` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create an Attestation entity instance. |
| `Client` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Client entity instance. |
| `CreateResult` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a CreateResult entity instance. |
| `Decryption` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Decryption entity instance. |
| `Device` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Device entity instance. |
| `DeviceBuild` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceState entity instance. |
| `DeviceType` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a DeviceType entity instance. |
| `InjectKey` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create an InjectKey entity instance. |
| `Kif` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Kif entity instance. |
| `Location` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Location entity instance. |
| `Partner` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Partner entity instance. |
| `Shipment` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Shipment entity instance. |
| `Success` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Success entity instance. |
| `Transaction` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create a Transaction entity instance. |
| `UpdateResult` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create an UpdateResult entity instance. |
| `User` | `(entopts) -> BluefinDecryptxP2peEntityBase` | Create an User entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) throws -> Value` | Load a single entity by match criteria. Throws on error. |
| `list` | `(reqmatch, ctrl) throws -> Value` | List entities matching the criteria (a Value list). Throws on error. |
| `create` | `(reqdata, ctrl) throws -> Value` | Create a new entity. Throws on error. |
| `update` | `(reqdata, ctrl) throws -> Value` | Update an existing entity. Throws on error. |
| `remove` | `(reqmatch, ctrl) throws -> Value` | Remove an entity. Throws on error. |
| `data` | `(newdata?) -> Value` | Get or set entity data. |
| `matchv` | `(newmatch?) -> Value` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Value` map for
single-entity ops, a `Value` list for `list`) and throw on error. Wrap
calls in `do`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `VMap` you
branch on via `result.entries["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `VMap` | Response headers. |
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

Create an instance: `let attestation = client.Attestation()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `VMap` |  |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `device` | `VMap` |  |
| `id` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |

#### Example: Load

```swift
let attestation = try client.Attestation().load(VMap([("id", .string("attestation_id"))]), nil)
```

#### Example: List

```swift
let attestationList = try client.Attestation().list(nil, nil)
```

#### Example: Create

```swift
let attestation = try client.Attestation().create(VMap([
]), nil)
```


### Client

Create an instance: `let client = client.Client()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `VMap` |  |
| `created` | `String` |  |
| `directPartner` | `VMap` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `location` | `VMap` |  |
| `mid` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `partner` | `VMap` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let client = try client.Client().load(VMap([("id", .string("client_id"))]), nil)
```

#### Example: List

```swift
let clientList = try client.Client().list(nil, nil)
```

#### Example: Create

```swift
let client = try client.Client().create(VMap([
    ("location", .map(VMap()))  // VMap
]), nil)
```


### CreateResult

Create an instance: `let createResult = client.CreateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Example: Create

```swift
let createResult = try client.CreateResult().create(VMap([
    ("device_type", .string("example_device_type")),  // String
    ("serial_number", .string("example_serial_number"))  // String
]), nil)
```


### Decryption

Create an instance: `let decryption = client.Decryption()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```swift
let decryption = try client.Decryption().create(VMap([
]), nil)
```


### Device

Create an instance: `let device = client.Device()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `VMap` |  |
| `activationDate` | `String` |  |
| `alternateKey` | `String` |  |
| `auditNextDate` | `String` |  |
| `auditNotificationDate` | `String` |  |
| `client` | `VMap` |  |
| `created` | `String` |  |
| `createdBy` | `VMap` |  |
| `deviceBuild` | `VMap` |  |
| `deviceState` | `VMap` |  |
| `deviceType` | `VMap` |  |
| `errorCounter` | `Int` |  |
| `errorLastDate` | `String` |  |
| `id` | `String` |  |
| `initializedBy` | `VMap` |  |
| `initializedDate` | `String` |  |
| `injectKey` | `VMap` |  |
| `isVirtual` | `Bool` |  |
| `kif` | `VMap` |  |
| `lastActivityDate` | `String` |  |
| `location` | `VMap` |  |
| `modified` | `String` |  |
| `modifiedBy` | `VMap` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `partner` | `VMap` |  |
| `serialNumber` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let device = try client.Device().load(VMap([("id", .string("device_id"))]), nil)
```

#### Example: List

```swift
let deviceList = try client.Device().list(nil, nil)
```

#### Example: Create

```swift
let device = try client.Device().create(VMap([
    ("activatedBy", .map(VMap())),  // VMap
    ("createdBy", .map(VMap())),  // VMap
    ("initializedBy", .map(VMap())),  // VMap
    ("location", .map(VMap())),  // VMap
    ("modifiedBy", .map(VMap()))  // VMap
]), nil)
```


### DeviceBuild

Create an instance: `let deviceBuild = client.DeviceBuild()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

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
| `id` | `Int` |  |
| `isActive` | `Bool` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `notes` | `String` |  |
| `version` | `Int` |  |
| `whiteListingBinRanges` | `String` |  |
| `whiteListingUsed` | `Bool` |  |

#### Example: Load

```swift
let deviceBuild = try client.DeviceBuild().load(VMap([("id", .string("device_build_id"))]), nil)
```

#### Example: List

```swift
let deviceBuildList = try client.DeviceBuild().list(nil, nil)
```


### DeviceCustodyDetail

Create an instance: `let deviceCustodyDetail = client.DeviceCustodyDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `VMap` |  |
| `custodian` | `VMap` |  |
| `device` | `VMap` |  |
| `id` | `Int` |  |
| `location` | `VMap` |  |
| `modified` | `String` |  |
| `modifiedBy` | `VMap` |  |
| `notes` | `String` |  |
| `status` | `VMap` |  |
| `transferMethod` | `VMap` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let deviceCustodyDetail = try client.DeviceCustodyDetail().load(VMap([("id", .string("device_custody_detail_id")), ("device_type", .string("device_type")), ("serial_number", .string("serial_number"))]), nil)
```


### DeviceCustodyList

Create an instance: `let deviceCustodyList = client.DeviceCustodyList()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` |  |
| `created` | `String` |  |
| `createdBy` | `VMap` |  |
| `custodian` | `VMap` |  |
| `device` | `VMap` |  |
| `id` | `Int` |  |
| `location` | `VMap` |  |
| `modified` | `String` |  |
| `modifiedBy` | `VMap` |  |
| `notes` | `String` |  |
| `status` | `VMap` |  |
| `transferMethod` | `VMap` |  |
| `version` | `Int` |  |

#### Example: List

```swift
let deviceCustodyListList = try client.DeviceCustodyList().list(nil, nil)
```


### DeviceList

Create an instance: `let deviceList = client.DeviceList()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `[Value]` |  |
| `total` | `Int` |  |

#### Example: Load

```swift
let deviceList = try client.DeviceList().load(VMap([("share_partner_to", .string("share_partner_to"))]), nil)
```


### DeviceReceiveResult

Create an instance: `let deviceReceiveResult = client.DeviceReceiveResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```swift
let deviceReceiveResult = try client.DeviceReceiveResult().create(VMap([
    ("success", .bool(true))  // Bool
]), nil)
```


### DeviceRkiActivateResult

Create an instance: `let deviceRkiActivateResult = client.DeviceRkiActivateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```swift
let deviceRkiActivateResult = try client.DeviceRkiActivateResult().create(VMap([
    ("success", .bool(true))  // Bool
]), nil)
```


### DeviceState

Create an instance: `let deviceState = client.DeviceState()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` |  |
| `name` | `String` |  |

#### Example: List

```swift
let deviceStateList = try client.DeviceState().list(nil, nil)
```


### DeviceType

Create an instance: `let deviceType = client.DeviceType()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `deviceTypeMode` | `String` |  |
| `hardwareVersion` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `manufacturer` | `String` |  |
| `model` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `photoUrl` | `String` |  |
| `productName` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let deviceType = try client.DeviceType().load(VMap([("id", .string("device_type_id"))]), nil)
```

#### Example: List

```swift
let deviceTypeList = try client.DeviceType().list(nil, nil)
```


### InjectKey

Create an instance: `let injectKey = client.InjectKey()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `isP2PE` | `Bool` |  |
| `keyType` | `String` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let injectKey = try client.InjectKey().load(VMap([("id", .string("inject_key_id"))]), nil)
```

#### Example: List

```swift
let injectKeyList = try client.InjectKey().list(nil, nil)
```


### Kif

Create an instance: `let kif = client.Kif()`

#### Operations

| Method | Description |
| --- | --- |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `Int` |  |
| `name` | `String` |  |

#### Example: List

```swift
let kifList = try client.Kif().list(nil, nil)
```


### Location

Create an instance: `let location = client.Location()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |

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
| `version` | `Int` |  |

#### Example: Load

```swift
let location = try client.Location().load(VMap([("id", .string("location_id"))]), nil)
```

#### Example: List

```swift
let locationList = try client.Location().list(nil, nil)
```

#### Example: Create

```swift
let location = try client.Location().create(VMap([
]), nil)
```


### Partner

Create an instance: `let partner = client.Partner()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` |  |
| `clientCanOrderEquipment` | `Bool` |  |
| `contact` | `VMap` |  |
| `created` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `location` | `VMap` |  |
| `modified` | `String` |  |
| `name` | `String` |  |
| `parent` | `VMap` |  |
| `partnerId` | `String` |  |
| `reference` | `String` |  |
| `verificationPhrase` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let partner = try client.Partner().load(VMap([("id", .string("partner_id"))]), nil)
```

#### Example: List

```swift
let partnerList = try client.Partner().list(nil, nil)
```

#### Example: Create

```swift
let partner = try client.Partner().create(VMap([
    ("location", .map(VMap()))  // VMap
]), nil)
```


### Shipment

Create an instance: `let shipment = client.Shipment()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` |  |
| `client` | `VMap` |  |
| `created` | `String` |  |
| `dateReceived` | `String` |  |
| `dateShipped` | `String` |  |
| `dcKif` | `VMap` |  |
| `id` | `String` |  |
| `items` | `[Value]` |  |
| `kif` | `VMap` |  |
| `modified` | `String` |  |
| `partner` | `VMap` |  |
| `shipmentType` | `String` |  |
| `tracking` | `String` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let shipment = try client.Shipment().load(VMap([("id", .string("shipment_id"))]), nil)
```

#### Example: List

```swift
let shipmentList = try client.Shipment().list(nil, nil)
```

#### Example: Create

```swift
let shipment = try client.Shipment().create(VMap([
]), nil)
```


### Success

Create an instance: `let success = client.Success()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `remove(match, nil)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `Bool` |  |

#### Example: Create

```swift
let success = try client.Success().create(VMap([
    ("share_partner_to", .string("example_share_partner_to"))  // String
]), nil)
```


### Transaction

Create an instance: `let transaction = client.Transaction()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `load(match, nil)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` |  |
| `client` | `VMap` |  |
| `clientRef` | `String` |  |
| `created` | `String` |  |
| `decrypted` | `Int` |  |
| `deviceName` | `String` |  |
| `directPartner` | `VMap` |  |
| `encrypted` | `Int` |  |
| `endDate` | `String` |  |
| `errCode` | `String` |  |
| `errMessage` | `String` |  |
| `id` | `String` |  |
| `ipAddress` | `String` |  |
| `isVirtual` | `Bool` |  |
| `keyType` | `String` |  |
| `location` | `VMap` |  |
| `messageId` | `String` |  |
| `method` | `String` |  |
| `partner` | `VMap` |  |
| `reference` | `String` |  |
| `serialNumber` | `String` |  |
| `startDate` | `String` |  |
| `success` | `Bool` |  |
| `transactionSource` | `String` |  |

#### Example: Load

```swift
let transaction = try client.Transaction().load(VMap([("id", .string("transaction_id"))]), nil)
```

#### Example: List

```swift
let transactionList = try client.Transaction().list(nil, nil)
```

#### Example: Create

```swift
let transaction = try client.Transaction().create(VMap([
    ("location", .map(VMap()))  // VMap
]), nil)
```


### UpdateResult

Create an instance: `let updateResult = client.UpdateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, nil)` | Create a new entity with the given data. |
| `list(nil, nil)` | List entities, optionally matching the given criteria. |
| `update(data, nil)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `VMap` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `kif` | `VMap` |  |
| `lastName` | `String` |  |
| `partner` | `VMap` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `VMap` |  |
| `version` | `Int` |  |

#### Example: List

```swift
let updateResultList = try client.UpdateResult().list(nil, nil)
```

#### Example: Create

```swift
let updateResult = try client.UpdateResult().create(VMap([
]), nil)
```


### User

Create an instance: `let user = client.User()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, nil)` | Load a single entity by match criteria. |
| `remove(match, nil)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `VMap` |  |
| `created` | `String` |  |
| `email` | `String` |  |
| `firstName` | `String` |  |
| `id` | `String` |  |
| `isActive` | `Bool` |  |
| `kif` | `VMap` |  |
| `lastName` | `String` |  |
| `modified` | `String` |  |
| `partner` | `VMap` |  |
| `phone` | `String` |  |
| `userName` | `String` |  |
| `userRole` | `VMap` |  |
| `version` | `Int` |  |

#### Example: Load

```swift
let user = try client.User().load(VMap([("id", .string("user_id"))]), nil)
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

### Data as loose values

The Swift SDK uses a loose object model — the vendored `Value` enum
(with `VMap` / `VList` wrappers) throughout — rather than a bespoke typed
struct per endpoint. This mirrors the dynamic nature of the API and keeps the
SDK flexible: no regeneration is needed when the API schema changes.

Use the `.asMap` / `.asList` / `.asString` accessors to safely coerce a
`Value` to a concrete Swift type (each returns `nil` on a type mismatch).
A `BluefinDecryptxP2peTypes.swift` file of reference `struct` types is also
generated for editor documentation.

### Project structure

```
swift/
├── Package.swift                     -- SwiftPM manifest (zero runtime deps)
├── Sources/ProjectNameSDK/
│   ├── core/                         -- Main client, config, entity base, error type
│   ├── entity/                       -- Generated entity clients
│   ├── feature/                      -- Built-in features (Base, Test, Log, ...)
│   ├── utility/                      -- Utility functions
│   └── Struct/                       -- Vendored Voxgig Struct port
└── Tests/ProjectNameSDKTests/        -- Test suites (XCTest)
```

The main client class (`BluefinDecryptxP2peSDK`, under `Sources/ProjectNameSDK/core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is dependency-free: JSON parsing is the vendored
`Struct/JSON.swift`, HTTP transport is Foundation's `URLSession`, and the
struct library is inlined under `Struct/`.

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
