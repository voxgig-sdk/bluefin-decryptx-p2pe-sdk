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
    .package(url: "<repo-url>", exact: "0.1.1"),
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
| `client` | `VMap` | Reference to the associated Client resource. |
| `completeDate` | `String` | The date and time that the Attestation took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `device` | `VMap` | Reference to the associated Device resource. |
| `id` | `String` | This resource's unique identifier. |
| `name` | `String` | Text describing the attestation. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `VMap` | Reference to the associated User resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `VMap` | Reference to the associated Partner. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `Bool` | This property indicates if the Client account is active or disabled. |
| `location` | `VMap` | Reference to the associated Location resource. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Client's name. |
| `partner` | `VMap` | Reference to the Client's root Partner. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `success` | `Bool` | true if the payload decryption was successful. |

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
| `activatedBy` | `VMap` | Reference to the associated User resource. |
| `activationDate` | `String` | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `VMap` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `VMap` | Reference to the associated User resource. |
| `deviceBuild` | `VMap` | Reference to the associated Device Build resource. |
| `deviceState` | `VMap` | Reference to the associated Device State resource. |
| `deviceType` | `VMap` | Reference to the associated Device Type resource. |
| `errorCounter` | `Int` | The number times the Device has been in error. |
| `errorLastDate` | `String` | Timestamp from the last time that the Device had an error. |
| `id` | `String` | The Device's unique identifier. |
| `initializedBy` | `VMap` | Reference to the associated User resource. |
| `initializedDate` | `String` | Timestamp from when the Device was initialized. |
| `injectKey` | `VMap` | Reference to the associated Device resource. |
| `isVirtual` | `Bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `VMap` | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | Timestamp from the last time that the Device was used. |
| `location` | `VMap` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `VMap` | Reference to the associated User resource. |
| `name` | `String` | The Device's name. |
| `notes` | `String` | Arbitary note that can be attached to a Device entry. |
| `partner` | `VMap` | Reference to the associated Partner. |
| `serialNumber` | `String` | The Device's serial number. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `appVersion` | `String` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String` | The Build Number. |
| `configFileName` | `String` | The name of the configuration file that is uploaded to the device. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String` | The Device Type Name. |
| `firmwareVersion` | `String` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String` | A list of hardware versions that this Device Build covers. |
| `id` | `Int` | This resource's unique identifier. |
| `isActive` | `Bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Device Builds's name. |
| `notes` | `String` | Notes attached to the device build by Bluefin CISO. |
| `version` | `Int` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `Bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `VMap` | Reference to the associated User resource. |
| `custodian` | `VMap` | Reference to the associated User resource. |
| `device` | `VMap` | Reference to the associated Device resource. |
| `id` | `Int` | This resource's unique identifier. |
| `location` | `VMap` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `VMap` | Reference to the associated User resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `VMap` | Reference to the associated Custody Status. |
| `transferMethod` | `VMap` | Reference to the associated Transfer Method. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `VMap` | Reference to the associated User resource. |
| `custodian` | `VMap` | Reference to the associated User resource. |
| `device` | `VMap` | Reference to the associated Device resource. |
| `id` | `Int` | This resource's unique identifier. |
| `location` | `VMap` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `VMap` | Reference to the associated User resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `VMap` | Reference to the associated Custody Status. |
| `transferMethod` | `VMap` | Reference to the associated Transfer Method. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `data` | `[Value]` | List of Devices. |
| `total` | `Int` | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `Bool` | Indicates if the action succeeded. |

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
| `success` | `Bool` | Indicates if the RKI activation succeeded. |

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
| `id` | `Int` | Unique identifier for this Device state. |
| `name` | `String` | Descriptive name for this Device state. |

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
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | The Device type. |
| `hardwareVersion` | `String` | The Device hardware version. |
| `id` | `String` | Unique idenifier. |
| `isActive` | `Bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | The Device manufacturer. |
| `model` | `String` | The Device model. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The DeviceType name. |
| `photoUrl` | `String` |  |
| `productName` | `String` | The Device name. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `String` | unique idenifier |
| `isActive` | `Bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `Bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | The cipher type that the key works with. |
| `modified` | `String` | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | Key name. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `id` | `Int` | This resource's unique identifier. |
| `name` | `String` | The KIF's name. |

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
| `address1` | `String` | The Location's street address. |
| `address2` | `String` | The Location's street address. |
| `billingId` | `String` | \? |
| `city` | `String` | The Location's city. |
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
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `billingId` | `String` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `Bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `VMap` | Reference to the associated User resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `Bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `VMap` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Partner's name. |
| `parent` | `VMap` | Reference to the associated Partner. |
| `partnerId` | `String` | The Partner's id. |
| `reference` | `String` | The Partner's reference string. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `carrier` | `String` | The name of the courier. |
| `client` | `VMap` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | The date and time that a package is recieved. |
| `dateShipped` | `String` | The date and time that a package is shipped. |
| `dcKif` | `VMap` | Reference to the associated KIF resource. |
| `id` | `String` | This resource's unique identifier. |
| `items` | `[Value]` |  |
| `kif` | `VMap` | Reference to the associated KIF resource. |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `VMap` | Reference to the associated Partner. |
| `shipmentType` | `String` | The type of shipment. |
| `tracking` | `String` | The courier's tracking number. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `success` | `Bool` | Indicates if the action was a success. |

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
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `VMap` | Reference to the associated Client resource. |
| `clientRef` | `String` | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `Int` | A Transcation can process muliple decryptions. |
| `deviceName` | `String` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `VMap` | Reference to the associated Partner. |
| `encrypted` | `Int` | A Transcation can process muliple encryptions. |
| `endDate` | `String` | Timestamp from the end of the transaction. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | This resource's unique identifier. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `Bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | The type of cipher used during decrytion. |
| `location` | `VMap` | Reference to the associated Location resource. |
| `messageId` | `String` | Message ID. |
| `method` | `String` | The decryption cypher/method. |
| `partner` | `VMap` | Reference to the associated Partner. |
| `reference` | `String` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | Timestamp from the beginning of the transaction. |
| `success` | `Bool` | The success indicator. |
| `transactionSource` | `String` | The source of the Transaction. |

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
| `client` | `VMap` | Reference to the associated Client resource. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `String` | ID of newly created resource |
| `isActive` | `Bool` | This property indicates if the User account is active or disabled. |
| `kif` | `VMap` | Reference to the associated KIF resource. |
| `lastName` | `String` | The User's Surname. |
| `partner` | `VMap` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `VMap` | Reference to the associated User Role. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
| `client` | `VMap` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `Bool` | This property indicates if the User account is active or disabled. |
| `kif` | `VMap` | Reference to the associated KIF resource. |
| `lastName` | `String` | The User's Surname. |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `VMap` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `VMap` | Reference to the associated User Role. |
| `version` | `Int` | The number of times that this resource has been updated. |

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
├── Sources/BluefinDecryptxP2peSdk/
│   ├── core/                         -- Main client, config, entity base, error type
│   ├── entity/                       -- Generated entity clients
│   ├── feature/                      -- Built-in features (Base, Test, Log, ...)
│   ├── utility/                      -- Utility functions
│   └── Struct/                       -- Vendored Voxgig Struct port
└── Tests/BluefinDecryptxP2peSdkTests/    -- Test suites (XCTest)
```

The main client class (`BluefinDecryptxP2peSDK`, under `Sources/BluefinDecryptxP2peSdk/core`)
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
