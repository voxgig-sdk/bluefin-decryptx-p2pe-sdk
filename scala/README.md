# BluefinDecryptxP2pe Scala SDK



The Scala SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic Scala conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.attestation(null)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Maven Central. The generated SDK is a
plain-source scala-cli project (no build tool, no third-party runtime
dependencies). Install it from the GitHub release tag
(`scala/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or from a source
checkout — compile it with scala-cli:

```bash
cd scala && scala-cli compile .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```scala
import voxgig.bluefindecryptxp2pesdk.core.BluefinDecryptxP2peSDK

val options = new java.util.LinkedHashMap[String, Object]()
options.put("apikey", System.getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"))
val client = new BluefinDecryptxP2peSDK(options)
```

### 2. List attestation records

`list(null, null)` returns an aggregate list of records (as `Object`, an
aggregate list) and raises on error.

```scala
try {
    val attestationList = client.attestation(null).list(null, null)
    println(attestationList)
}
catch {
    case err: RuntimeException => println("list failed: " + err.getMessage)
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the ENTITY — call data() for the record — and raises on error.

```scala
try {
    val deviceCustodyDetail = client.deviceCustodyDetail(null).load(java.util.Map.of("device_type", "example_device_type", "serial_number", "example_serial_number", "id", "example_id"), null)
    println(deviceCustodyDetail)
}
catch {
    case err: RuntimeException => println("load failed: " + err.getMessage)
}
```

### 4. Create, update, and remove

```scala
// Create — returns the ENTITY (call data() for the record)
val created = client.attestation(null).create(java.util.Map.of("client", java.util.Map.of(), "completeDate", "example_completeDate"), null)

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

```scala
val result = client.direct(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "GET",
    "params", java.util.Map.of("id", "example")))

if (java.lang.Boolean.TRUE == result.get("ok")) {
    println(result.get("status"))  // 200
    println(result.get("data"))    // response body
}
else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both — an absent key simply reads as null.
    println("status=" + result.get("status") + " err=" + result.get("err"))
}
```

### Prepare a request without sending it

```scala
// prepare() returns the fetch definition and raises on error.
val fetchdef = client.prepare(java.util.Map.of(
    "path", "/api/resource/{id}",
    "method", "DELETE",
    "params", java.util.Map.of("id", "example")))

println(fetchdef.get("url"))
println(fetchdef.get("method"))
println(fetchdef.get("headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```scala
val client = BluefinDecryptxP2peSDK.testSDK(null, null)

// Entity ops return the ENTITY and raises on error;
// call data() for the record.
val deviceType = client.deviceType(null).list(null, null)
// deviceType holds the mock response record
println(deviceType)
```

### Use a custom fetch function

Replace the HTTP transport with your own `BiFunction`:

```scala
val mockFetch: java.util.function.BiFunction[String, java.util.Map[String, Object], Object] =
    (url, init) => {
        val res = new java.util.LinkedHashMap[String, Object]()
        res.put("status", java.lang.Integer.valueOf(200))
        res.put("statusText", "OK")
        res.put("headers", new java.util.LinkedHashMap[String, Object]())
        res.put("json", (() => java.util.Map.of("id", "mock01")): java.util.function.Supplier[Object])
        res
    }

val options = new java.util.LinkedHashMap[String, Object]()
options.put("base", "http://localhost:8080")
options.put("system", java.util.Map.of("fetch", mockFetch))
val client = new BluefinDecryptxP2peSDK(options)
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd scala && make test
```


## Reference

### BluefinDecryptxP2peSDK

```scala
val client = new BluefinDecryptxP2peSDK(options)
```

Creates a new SDK client. `options` is a `java.util.Map[String, Object]`.

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

```scala
val client = BluefinDecryptxP2peSDK.testSDK(testopts, sdkopts)
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
| `data` | `(newdata*) -> Object` | Get or set entity data. |
| `matchArgs` | `(newmatch*) -> Object` | Get or set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `getName` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the ENTITY (call data() for the record) (a `Map` for single-entity
ops, an aggregate `List` for `list`) as `Object` and raise on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never raises — it returns a result
`java.util.Map[String, Object]` you branch on via `result.get("ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Int` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `Object` | Parsed JSON response body. |

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

Operations: create, list, load.

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
| `success` | true if the payload decryption was successful. |

Operations: create.

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

Operations: create, list, load.

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

Operations: list, load.

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

Operations: load.

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

Operations: list.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` | List of Devices. |
| `total` | Total number of Devices available (not the number of Users in the response). |

Operations: load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the action succeeded. |

Operations: create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` | Indicates if the RKI activation succeeded. |

Operations: create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` | Unique identifier for this Device state. |
| `name` | Descriptive name for this Device state. |

Operations: list.

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

Operations: list, load.

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

Operations: list, load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` | This resource's unique identifier. |
| `name` | The KIF's name. |

Operations: list.

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

Operations: create, list, load, remove.

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

Operations: create, list, load.

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

Operations: create, list, load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` | Indicates if the action was a success. |

Operations: create, remove.

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

Operations: create, list, load.

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

Operations: create, list, update.

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

Operations: load, remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `val attestation = client.attestation(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | Reference to the associated Client resource. |
| `completeDate` | `String` | The date and time that the Attestation took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `device` | `java.util.Map[String, Object]` | Reference to the associated Device resource. |
| `id` | `String` | This resource's unique identifier. |
| `name` | `String` | Text describing the attestation. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```scala
val attestation = client.attestation(null).load(java.util.Map.of("id", "attestation_id"), null)
```

#### Example: List

```scala
val attestationList = client.attestation(null).list(null, null)
```

#### Example: Create

```scala
val attestation = client.attestation(null).create(java.util.Map.of(
), null)
```


### Client

Create an instance: `val client = client.client(null)`

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
| `contact` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | This property indicates if the Client account is active or disabled. |
| `location` | `java.util.Map[String, Object]` | Reference to the associated Location resource. |
| `mid` | `String` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Client's name. |
| `partner` | `java.util.Map[String, Object]` | Reference to the Client's root Partner. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val client = client.client(null).load(java.util.Map.of("id", "client_id"), null)
```

#### Example: List

```scala
val clientList = client.client(null).list(null, null)
```

#### Example: Create

```scala
val client = client.client(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### CreateResult

Create an instance: `val createResult = client.createResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Example: Create

```scala
val createResult = client.createResult(null).create(java.util.Map.of(
    "device_type", "example_device_type",  // String
    "serial_number", "example_serial_number"  // String
), null)
```


### Decryption

Create an instance: `val decryption = client.decryption(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` | true if the payload decryption was successful. |

#### Example: Create

```scala
val decryption = client.decryption(null).create(java.util.Map.of(
), null)
```


### Device

Create an instance: `val device = client.device(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `activationDate` | `String` | Timestamp from when the Device was activated. |
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `java.util.Map[String, Object]` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `deviceBuild` | `java.util.Map[String, Object]` | Reference to the associated Device Build resource. |
| `deviceState` | `java.util.Map[String, Object]` | Reference to the associated Device State resource. |
| `deviceType` | `java.util.Map[String, Object]` | Reference to the associated Device Type resource. |
| `errorCounter` | `java.lang.Long` | The number times the Device has been in error. |
| `errorLastDate` | `String` | Timestamp from the last time that the Device had an error. |
| `id` | `String` | The Device's unique identifier. |
| `initializedBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `initializedDate` | `String` | Timestamp from when the Device was initialized. |
| `injectKey` | `java.util.Map[String, Object]` | Reference to the associated Device resource. |
| `isVirtual` | `java.lang.Boolean` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `java.util.Map[String, Object]` | Reference to the associated KIF resource. |
| `lastActivityDate` | `String` | Timestamp from the last time that the Device was used. |
| `location` | `java.util.Map[String, Object]` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `name` | `String` | The Device's name. |
| `notes` | `String` | Arbitary note that can be attached to a Device entry. |
| `partner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `serialNumber` | `String` | The Device's serial number. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val device = client.device(null).load(java.util.Map.of("id", "device_id"), null)
```

#### Example: List

```scala
val deviceList = client.device(null).list(null, null)
```

#### Example: Create

```scala
val device = client.device(null).create(java.util.Map.of(
    "activatedBy", java.util.Map.of(),  // java.util.Map[String, Object]
    "createdBy", java.util.Map.of(),  // java.util.Map[String, Object]
    "initializedBy", java.util.Map.of(),  // java.util.Map[String, Object]
    "location", java.util.Map.of(),  // java.util.Map[String, Object]
    "modifiedBy", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### DeviceBuild

Create an instance: `val deviceBuild = client.deviceBuild(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

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
| `id` | `java.lang.Long` | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Device Builds's name. |
| `notes` | `String` | Notes attached to the device build by Bluefin CISO. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `java.lang.Boolean` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```scala
val deviceBuild = client.deviceBuild(null).load(java.util.Map.of("id", "device_build_id"), null)
```

#### Example: List

```scala
val deviceBuildList = client.deviceBuild(null).list(null, null)
```


### DeviceCustodyDetail

Create an instance: `val deviceCustodyDetail = client.deviceCustodyDetail(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `custodian` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `device` | `java.util.Map[String, Object]` | Reference to the associated Device resource. |
| `id` | `java.lang.Long` | This resource's unique identifier. |
| `location` | `java.util.Map[String, Object]` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `java.util.Map[String, Object]` | Reference to the associated Custody Status. |
| `transferMethod` | `java.util.Map[String, Object]` | Reference to the associated Transfer Method. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val deviceCustodyDetail = client.deviceCustodyDetail(null).load(java.util.Map.of("id", "device_custody_detail_id", "device_type", "device_type", "serial_number", "serial_number"), null)
```


### DeviceCustodyList

Create an instance: `val deviceCustodyList = client.deviceCustodyList(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `String` | The date and time that the Custody change took place. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `custodian` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `device` | `java.util.Map[String, Object]` | Reference to the associated Device resource. |
| `id` | `java.lang.Long` | This resource's unique identifier. |
| `location` | `java.util.Map[String, Object]` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `modifiedBy` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `notes` | `String` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `java.util.Map[String, Object]` | Reference to the associated Custody Status. |
| `transferMethod` | `java.util.Map[String, Object]` | Reference to the associated Transfer Method. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: List

```scala
val deviceCustodyListList = client.deviceCustodyList(null).list(null, null)
```


### DeviceList

Create an instance: `val deviceList = client.deviceList(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `java.util.List[Object]` | List of Devices. |
| `total` | `java.lang.Long` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```scala
val deviceList = client.deviceList(null).load(java.util.Map.of("share_partner_to", "share_partner_to"), null)
```


### DeviceReceiveResult

Create an instance: `val deviceReceiveResult = client.deviceReceiveResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` | Indicates if the action succeeded. |

#### Example: Create

```scala
val deviceReceiveResult = client.deviceReceiveResult(null).create(java.util.Map.of(
    "success", true  // java.lang.Boolean
), null)
```


### DeviceRkiActivateResult

Create an instance: `val deviceRkiActivateResult = client.deviceRkiActivateResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` | Indicates if the RKI activation succeeded. |

#### Example: Create

```scala
val deviceRkiActivateResult = client.deviceRkiActivateResult(null).create(java.util.Map.of(
    "success", true  // java.lang.Boolean
), null)
```


### DeviceState

Create an instance: `val deviceState = client.deviceState(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `java.lang.Long` | Unique identifier for this Device state. |
| `name` | `String` | Descriptive name for this Device state. |

#### Example: List

```scala
val deviceStateList = client.deviceState(null).list(null, null)
```


### DeviceType

Create an instance: `val deviceType = client.deviceType(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String` | The Device type. |
| `hardwareVersion` | `String` | The Device hardware version. |
| `id` | `String` | Unique idenifier. |
| `isActive` | `java.lang.Boolean` | This property indicates if the DeviceType is active. |
| `manufacturer` | `String` | The Device manufacturer. |
| `model` | `String` | The Device model. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The DeviceType name. |
| `photoUrl` | `String` |  |
| `productName` | `String` | The Device name. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val deviceType = client.deviceType(null).load(java.util.Map.of("id", "device_type_id"), null)
```

#### Example: List

```scala
val deviceTypeList = client.deviceType(null).list(null, null)
```


### InjectKey

Create an instance: `val injectKey = client.injectKey(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `String` | unique idenifier |
| `isActive` | `java.lang.Boolean` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `java.lang.Boolean` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String` | The cipher type that the key works with. |
| `modified` | `String` | Last modified timestamp in ISO 8601 format. |
| `name` | `String` | Key name. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val injectKey = client.injectKey(null).load(java.util.Map.of("id", "inject_key_id"), null)
```

#### Example: List

```scala
val injectKeyList = client.injectKey(null).list(null, null)
```


### Kif

Create an instance: `val kif = client.kif(null)`

#### Operations

| Method | Description |
| --- | --- |
| `list(null, null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `java.lang.Long` | This resource's unique identifier. |
| `name` | `String` | The KIF's name. |

#### Example: List

```scala
val kifList = client.kif(null).list(null, null)
```


### Location

Create an instance: `val location = client.location(null)`

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
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val location = client.location(null).load(java.util.Map.of("id", "location_id"), null)
```

#### Example: List

```scala
val locationList = client.location(null).list(null, null)
```

#### Example: Create

```scala
val location = client.location(null).create(java.util.Map.of(
), null)
```


### Partner

Create an instance: `val partner = client.partner(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `String` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `java.lang.Boolean` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `java.util.Map[String, Object]` | Reference to the associated User resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | This property indicates if the Parter account is active or disabled. |
| `location` | `java.util.Map[String, Object]` | Reference to the associated Location resource. |
| `modified` | `String` | Last modified timestamp. |
| `name` | `String` | The Partner's name. |
| `parent` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `partnerId` | `String` | The Partner's id. |
| `reference` | `String` | The Partner's reference string. |
| `verificationPhrase` | `String` | The verification phrase is a message that the Partner creates. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val partner = client.partner(null).load(java.util.Map.of("id", "partner_id"), null)
```

#### Example: List

```scala
val partnerList = client.partner(null).list(null, null)
```

#### Example: Create

```scala
val partner = client.partner(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### Shipment

Create an instance: `val shipment = client.shipment(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `String` | The name of the courier. |
| `client` | `java.util.Map[String, Object]` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String` | The date and time that a package is recieved. |
| `dateShipped` | `String` | The date and time that a package is shipped. |
| `dcKif` | `java.util.Map[String, Object]` | Reference to the associated KIF resource. |
| `id` | `String` | This resource's unique identifier. |
| `items` | `java.util.List[Object]` |  |
| `kif` | `java.util.Map[String, Object]` | Reference to the associated KIF resource. |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `shipmentType` | `String` | The type of shipment. |
| `tracking` | `String` | The courier's tracking number. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val shipment = client.shipment(null).load(java.util.Map.of("id", "shipment_id"), null)
```

#### Example: List

```scala
val shipmentList = client.shipment(null).list(null, null)
```

#### Example: Create

```scala
val shipment = client.shipment(null).create(java.util.Map.of(
), null)
```


### Success

Create an instance: `val success = client.success(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `java.lang.Boolean` | Indicates if the action was a success. |

#### Example: Create

```scala
val success = client.success(null).create(java.util.Map.of(
    "share_partner_to", "example_share_partner_to"  // String
), null)
```


### Transaction

Create an instance: `val transaction = client.transaction(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `load(match, null)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `String` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `java.util.Map[String, Object]` | Reference to the associated Client resource. |
| `clientRef` | `String` | Client Reference property that is included in the decrypt API call. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `java.lang.Long` | A Transcation can process muliple decryptions. |
| `deviceName` | `String` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `encrypted` | `java.lang.Long` | A Transcation can process muliple encryptions. |
| `endDate` | `String` | Timestamp from the end of the transaction. |
| `errCode` | `String` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String` | This resource's unique identifier. |
| `ipAddress` | `String` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `java.lang.Boolean` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String` | The type of cipher used during decrytion. |
| `location` | `java.util.Map[String, Object]` | Reference to the associated Location resource. |
| `messageId` | `String` | Message ID. |
| `method` | `String` | The decryption cypher/method. |
| `partner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `reference` | `String` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String` | Timestamp from the beginning of the transaction. |
| `success` | `java.lang.Boolean` | The success indicator. |
| `transactionSource` | `String` | The source of the Transaction. |

#### Example: Load

```scala
val transaction = client.transaction(null).load(java.util.Map.of("id", "transaction_id"), null)
```

#### Example: List

```scala
val transactionList = client.transaction(null).list(null, null)
```

#### Example: Create

```scala
val transaction = client.transaction(null).create(java.util.Map.of(
    "location", java.util.Map.of()  // java.util.Map[String, Object]
), null)
```


### UpdateResult

Create an instance: `val updateResult = client.updateResult(null)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data, null)` | Create a new entity with the given data. |
| `list(null, null)` | List entities, optionally matching the given criteria. |
| `update(data, null)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | Reference to the associated Client resource. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `String` | ID of newly created resource |
| `isActive` | `java.lang.Boolean` | This property indicates if the User account is active or disabled. |
| `kif` | `java.util.Map[String, Object]` | Reference to the associated KIF resource. |
| `lastName` | `String` | The User's Surname. |
| `partner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `java.util.Map[String, Object]` | Reference to the associated User Role. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: List

```scala
val updateResultList = client.updateResult(null).list(null, null)
```

#### Example: Create

```scala
val updateResult = client.updateResult(null).create(java.util.Map.of(
), null)
```


### User

Create an instance: `val user = client.user(null)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match, null)` | Load a single entity by match criteria. |
| `remove(match, null)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `java.util.Map[String, Object]` | Reference to the associated Client resource. |
| `created` | `String` | Creation timestamp in ISO 8601 format. |
| `email` | `String` | The User's email address. |
| `firstName` | `String` | The User's name. |
| `id` | `String` | This resource's unique identifier. |
| `isActive` | `java.lang.Boolean` | This property indicates if the User account is active or disabled. |
| `kif` | `java.util.Map[String, Object]` | Reference to the associated KIF resource. |
| `lastName` | `String` | The User's Surname. |
| `modified` | `String` | Last modified timestamp. |
| `partner` | `java.util.Map[String, Object]` | Reference to the associated Partner. |
| `phone` | `String` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String` | The User's unique username. |
| `userRole` | `java.util.Map[String, Object]` | Reference to the associated User Role. |
| `version` | `java.lang.Long` | The number of times that this resource has been updated. |

#### Example: Load

```scala
val user = client.user(null).load(java.util.Map.of("id", "user_id"), null)
```

## Features

This SDK ships 11 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Structured audit trail of operations |
| [`clienttrack`](#clienttrack) | Client identity and per-request correlation headers |
| [`idempotency`](#idempotency) | Idempotency keys for safe retries of mutating operations |
| [`log`](#log) | Structured request and response logging |
| [`metrics`](#metrics) | Statistics capture: per-operation counters and latency |
| [`paging`](#paging) | Pagination signals for list operations |
| [`ratelimit`](#ratelimit) | Client-side rate limiting via a token bucket |
| [`retry`](#retry) | Automatic retry of transient failures with exponential backoff |
| [`telemetry`](#telemetry) | Distributed tracing spans with W3C trace-context propagation |
| [`test`](#test) | In-memory mock transport for testing without a live server |
| [`timeout`](#timeout) | Per-request timeout with transport abort |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Structured audit trail of operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client identity and per-request correlation headers.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### idempotency

Idempotency keys for safe retries of mutating operations.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Structured request and response logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Statistics capture: per-operation counters and latency.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Pagination signals for list operations.

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

Client-side rate limiting via a token bucket.

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

Automatic retry of transient failures with exponential backoff.

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

Distributed tracing spans with W3C trace-context propagation.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

In-memory mock transport for testing without a live server.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Per-request timeout with transport abort.

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

- **AuditFeature**: Structured audit trail of operations
- **ClienttrackFeature**: Client identity and per-request correlation headers
- **IdempotencyFeature**: Idempotency keys for safe retries of mutating operations
- **LogFeature**: Structured request and response logging
- **MetricsFeature**: Statistics capture: per-operation counters and latency
- **PagingFeature**: Pagination signals for list operations
- **RatelimitFeature**: Client-side rate limiting via a token bucket
- **RetryFeature**: Automatic retry of transient failures with exponential backoff
- **TelemetryFeature**: Distributed tracing spans with W3C trace-context propagation
- **TestFeature**: In-memory mock transport for testing without a live server
- **TimeoutFeature**: Per-request timeout with transport abort

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Scala SDK uses a loose object model — `java.util.Map[String, Object]`
throughout — rather than a bespoke typed class per endpoint. This mirrors the
dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.toMapAny(value)` to safely coerce a value to a
`java.util.Map[String, Object]`. A `BluefinDecryptxP2peTypes.scala` module of
reference `case class` types is also generated for editor documentation.

### Project structure

```
scala/
├── project.scala               -- scala-cli project config (Scala 3, no deps)
├── core/                        -- Main SDK client, config, entity base, error type
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log, ...)
├── utility/                     -- Utility functions and the vendored struct library
└── sdktest/                     -- Generated per-entity tests (scala-cli mains)
```

The main client class (`BluefinDecryptxP2peSDK`, package `voxgig.bluefindecryptxp2pesdk.core`)
exposes the entity accessors. Reference entity or utility types directly only
when needed. The SDK is a dependency-free scala-cli project: JSON parsing is
the vendored `utility/Json.java`, HTTP transport is the JDK
`java.net.http.HttpClient`, and the struct library is inlined under
`utility/struct`.

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
