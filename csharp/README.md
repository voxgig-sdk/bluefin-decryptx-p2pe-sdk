# BluefinDecryptxP2pe C# SDK



The C# SDK for the BluefinDecryptxP2pe API — an entity-oriented client following idiomatic C# conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Attestation()` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to NuGet. Install it from the GitHub
release tag (`csharp/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)) or
from a source checkout — build the library and add a project reference:

```bash
cd csharp && dotnet build BluefinDecryptxP2peSDK.csproj
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```csharp
using BluefinDecryptxP2peSdk;

var client = new BluefinDecryptxP2peSDK(new Dictionary<string, object?>
{
    ["apikey"] = Environment.GetEnvironmentVariable("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
});
```

### 2. List attestation records

`List(null)` returns an aggregate list of records (as `object?`) and raises
on error.

```csharp
try
{
    var attestationList = client.Attestation().List(null);
    Console.WriteLine(attestationList);
}
catch (Exception err)
{
    Console.WriteLine($"list failed: {err.Message}");
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`Load()` returns the bare record (as `object?`) and raises on error.

```csharp
try
{
    var deviceCustodyDetail = client.DeviceCustodyDetail().Load(new Dictionary<string, object?> { ["device_type"] = "example_device_type", ["serial_number"] = "example_serial_number", ["id"] = "example_id" });
    Console.WriteLine(deviceCustodyDetail);
}
catch (Exception err)
{
    Console.WriteLine($"load failed: {err.Message}");
}
```

### 4. Create, update, and remove

```csharp
// Create — returns the bare created record (as object?)
var created = client.Attestation().Create(new Dictionary<string, object?> { ["client"] = new Dictionary<string, object?>(), ["completeDate"] = "example_completeDate" });

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

```csharp
var result = client.Direct(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "GET",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

if (Equals(result["ok"], true))
{
    Console.WriteLine(result["status"]);  // 200
    Console.WriteLine(result["data"]);    // response body
}
else
{
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present, so
    // read both with TryGetValue rather than indexing a key that may be absent.
    result.TryGetValue("status", out var status);
    result.TryGetValue("err", out var err);
    Console.WriteLine($"{status} {err}");
}
```

### Prepare a request without sending it

```csharp
// Prepare() returns the fetch definition and raises on error.
var fetchdef = client.Prepare(new Dictionary<string, object?>
{
    ["path"] = "/api/resource/{id}",
    ["method"] = "DELETE",
    ["params"] = new Dictionary<string, object?> { ["id"] = "example" },
});

Console.WriteLine(fetchdef["url"]);
Console.WriteLine(fetchdef["method"]);
Console.WriteLine(fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```csharp
var client = BluefinDecryptxP2peSDK.TestSDK(null, null);

// Entity ops return the bare record and raise on error.
var deviceType = client.DeviceType().List(null);
// deviceType holds the mock response record
Console.WriteLine(deviceType);
```

### Use a custom fetch function

Replace the HTTP transport with your own delegate:

```csharp
Func<string, Dictionary<string, object?>, Dictionary<string, object?>> mockFetch =
    (url, init) => new Dictionary<string, object?>
    {
        ["status"] = 200,
        ["statusText"] = "OK",
        ["headers"] = new Dictionary<string, object?>(),
        ["json"] = (Func<object?>)(() => new Dictionary<string, object?> { ["id"] = "mock01" }),
    };

var client = new BluefinDecryptxP2peSDK(new Dictionary<string, object?>
{
    ["base"] = "http://localhost:8080",
    ["system"] = new Dictionary<string, object?>
    {
        ["fetch"] = mockFetch,
    },
});
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd csharp && dotnet test
```


## Reference

### BluefinDecryptxP2peSDK

```csharp
using BluefinDecryptxP2peSdk;

var client = new BluefinDecryptxP2peSDK(options);
```

Creates a new SDK client. `options` is a `Dictionary<string, object?>`.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `Dictionary` | Feature activation flags. |
| `extend` | `List` | Additional Feature instances to load. |
| `system` | `Dictionary` | System overrides (e.g. custom `fetch` delegate). |

### TestSDK

```csharp
var client = BluefinDecryptxP2peSDK.TestSDK(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() -> Dictionary` | Deep copy of current SDK options. |
| `GetUtility` | `() -> Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs) -> Dictionary` | Build an HTTP request definition without sending. Raises on error. |
| `Direct` | `(fetchargs) -> Dictionary` | Build and send an HTTP request. Returns a result dictionary (branch on `ok`). |
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
| `Load` | `(reqmatch, ctrl) -> object?` | Load a single entity by match criteria. Raises on error. |
| `List` | `(reqmatch, ctrl) -> object?` | List entities matching the criteria (an aggregate list). Raises on error. |
| `Create` | `(reqdata, ctrl) -> object?` | Create a new entity. Raises on error. |
| `Update` | `(reqdata, ctrl) -> object?` | Update an existing entity. Raises on error. |
| `Remove` | `(reqmatch, ctrl) -> object?` | Remove an entity. Raises on error. |
| `Data` | `(newdata) -> object?` | Get or set entity data. |
| `Match` | `(newmatch) -> object?` | Get or set entity match criteria. |
| `Make` | `() -> IEntity` | Create a new instance with the same options. |
| `GetName` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `Dictionary` for
single-entity ops, an aggregate list for `List`) as `object?` and raise on
error. Wrap calls in `try`/`catch` to handle failures.

The `Direct()` escape hatch never raises — it returns a result
`Dictionary<string, object?>` you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `Dictionary` | Response headers. |
| `data` | `object?` | Parsed JSON response body. |

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

Create an instance: `var attestation = client.Attestation();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `completeDate` | `string` | The date and time that the Attestation took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `device` | `Dictionary<string, object?>` | Reference to the associated Device resource. |
| `id` | `string` | This resource's unique identifier. |
| `name` | `string` | Text describing the attestation. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Attestation. |

#### Example: Load

```csharp
var attestation = client.Attestation().Load(new Dictionary<string, object?> { ["id"] = "attestation_id" });
```

#### Example: List

```csharp
var attestationList = client.Attestation().List(null);
```

#### Example: Create

```csharp
var attestation = client.Attestation().Create(new Dictionary<string, object?>
{
});
```


### Client

Create an instance: `var client = client.Client();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `Dictionary<string, object?>` | Reference to the associated Location resource. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `Dictionary<string, object?>` | Reference to the Client's root Partner. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var client = client.Client().Load(new Dictionary<string, object?> { ["id"] = "client_id" });
```

#### Example: List

```csharp
var clientList = client.Client().List(null);
```

#### Example: Create

```csharp
var client = client.Client().Create(new Dictionary<string, object?>
{
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```


### CreateResult

Create an instance: `var createResult = client.CreateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Example: Create

```csharp
var createResult = client.CreateResult().Create(new Dictionary<string, object?>
{
    ["device_type"] = "example_device_type",  // string
    ["serial_number"] = "example_serial_number",  // string
});
```


### Decryption

Create an instance: `var decryption = client.Decryption();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | true if the payload decryption was successful. |

#### Example: Create

```csharp
var decryption = client.Decryption().Create(new Dictionary<string, object?>
{
});
```


### Device

Create an instance: `var device = client.Device();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `activationDate` | `string` | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `deviceBuild` | `Dictionary<string, object?>` | Reference to the associated Device Build resource. |
| `deviceState` | `Dictionary<string, object?>` | Reference to the associated Device State resource. |
| `deviceType` | `Dictionary<string, object?>` | Reference to the associated Device Type resource. |
| `errorCounter` | `long` | The number times the Device has been in error. |
| `errorLastDate` | `string` | Timestamp from the last time that the Device had an error. |
| `id` | `string` | The Device's unique identifier. |
| `initializedBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `initializedDate` | `string` | Timestamp from when the Device was initialized. |
| `injectKey` | `Dictionary<string, object?>` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `Dictionary<string, object?>` | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | Timestamp from the last time that the Device was used. |
| `location` | `Dictionary<string, object?>` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `name` | `string` | The Device's name. |
| `notes` | `string` | Arbitary note that can be attached to a Device entry. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `serialNumber` | `string` | The Device's serial number. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var device = client.Device().Load(new Dictionary<string, object?> { ["id"] = "device_id" });
```

#### Example: List

```csharp
var deviceList = client.Device().List(null);
```

#### Example: Create

```csharp
var device = client.Device().Create(new Dictionary<string, object?>
{
    ["activatedBy"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["createdBy"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["initializedBy"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["modifiedBy"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```


### DeviceBuild

Create an instance: `var deviceBuild = client.DeviceBuild();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | The Build Number. |
| `configFileName` | `string` | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | The Device Type Name. |
| `firmwareVersion` | `string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | A list of hardware versions that this Device Build covers. |
| `id` | `long` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Device Builds's name. |
| `notes` | `string` | Notes attached to the device build by Bluefin CISO. |
| `version` | `long` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

#### Example: Load

```csharp
var deviceBuild = client.DeviceBuild().Load(new Dictionary<string, object?> { ["id"] = "device_build_id" });
```

#### Example: List

```csharp
var deviceBuildList = client.DeviceBuild().List(null);
```


### DeviceCustodyDetail

Create an instance: `var deviceCustodyDetail = client.DeviceCustodyDetail();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `custodian` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `device` | `Dictionary<string, object?>` | Reference to the associated Device resource. |
| `id` | `long` | This resource's unique identifier. |
| `location` | `Dictionary<string, object?>` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Dictionary<string, object?>` | Reference to the associated Custody Status. |
| `transferMethod` | `Dictionary<string, object?>` | Reference to the associated Transfer Method. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var deviceCustodyDetail = client.DeviceCustodyDetail().Load(new Dictionary<string, object?> { ["id"] = "device_custody_detail_id", ["device_type"] = "device_type", ["serial_number"] = "serial_number" });
```


### DeviceCustodyList

Create an instance: `var deviceCustodyList = client.DeviceCustodyList();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `custodian` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `device` | `Dictionary<string, object?>` | Reference to the associated Device resource. |
| `id` | `long` | This resource's unique identifier. |
| `location` | `Dictionary<string, object?>` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `Dictionary<string, object?>` | Reference to the associated Custody Status. |
| `transferMethod` | `Dictionary<string, object?>` | Reference to the associated Transfer Method. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: List

```csharp
var deviceCustodyListList = client.DeviceCustodyList().List(null);
```


### DeviceList

Create an instance: `var deviceList = client.DeviceList();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `List<object?>` | List of Devices. |
| `total` | `long` | Total number of Devices available (not the number of Users in the response). |

#### Example: Load

```csharp
var deviceList = client.DeviceList().Load(new Dictionary<string, object?> { ["share_partner_to"] = "share_partner_to" });
```


### DeviceReceiveResult

Create an instance: `var deviceReceiveResult = client.DeviceReceiveResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the action succeeded. |

#### Example: Create

```csharp
var deviceReceiveResult = client.DeviceReceiveResult().Create(new Dictionary<string, object?>
{
    ["success"] = true,  // bool
});
```


### DeviceRkiActivateResult

Create an instance: `var deviceRkiActivateResult = client.DeviceRkiActivateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the RKI activation succeeded. |

#### Example: Create

```csharp
var deviceRkiActivateResult = client.DeviceRkiActivateResult().Create(new Dictionary<string, object?>
{
    ["success"] = true,  // bool
});
```


### DeviceState

Create an instance: `var deviceState = client.DeviceState();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `long` | Unique identifier for this Device state. |
| `name` | `string` | Descriptive name for this Device state. |

#### Example: List

```csharp
var deviceStateList = client.DeviceState().List(null);
```


### DeviceType

Create an instance: `var deviceType = client.DeviceType();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | The Device type. |
| `hardwareVersion` | `string` | The Device hardware version. |
| `id` | `string` | Unique idenifier. |
| `isActive` | `bool` | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | The Device manufacturer. |
| `model` | `string` | The Device model. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The DeviceType name. |
| `photoUrl` | `string` |  |
| `productName` | `string` | The Device name. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var deviceType = client.DeviceType().Load(new Dictionary<string, object?> { ["id"] = "device_type_id" });
```

#### Example: List

```csharp
var deviceTypeList = client.DeviceType().List(null);
```


### InjectKey

Create an instance: `var injectKey = client.InjectKey();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | The cipher type that the key works with. |
| `modified` | `string` | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | Key name. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var injectKey = client.InjectKey().Load(new Dictionary<string, object?> { ["id"] = "inject_key_id" });
```

#### Example: List

```csharp
var injectKeyList = client.InjectKey().List(null);
```


### Kif

Create an instance: `var kif = client.Kif();`

#### Operations

| Method | Description |
| --- | --- |
| `List(null)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `long` | This resource's unique identifier. |
| `name` | `string` | The KIF's name. |

#### Example: List

```csharp
var kifList = client.Kif().List(null);
```


### Location

Create an instance: `var location = client.Location();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `string` | The Location's street address. |
| `address2` | `string` | The Location's street address. |
| `billingId` | `string` | \? |
| `city` | `string` | The Location's city. |
| `country` | `string` | The Location's country. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | A Partner specified reference for a location. |
| `id` | `string` | This resource's unique identifier. |
| `locationType` | `string` | The Location's clasification. |
| `mailAddress1` | `string` | The Location's street address. |
| `mailAddress2` | `string` | The Location's street address. |
| `mailCity` | `string` | The Location's city. |
| `mailCountry` | `string` | The Location's street address. |
| `mailPostalCode` | `string` | The Location's postal code. |
| `mailStateProvince` | `string` | The Location's street state or province. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Location's name. |
| `nameOfBusiness` | `string` | The name of the business at this location. |
| `notes` | `string` | Note for delivery driver. |
| `postalCode` | `string` | The Location's postal code. |
| `stateProvince` | `string` | The Location's street state or province. |
| `uniqueId` | `string` | Unique Identifier for the Location. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var location = client.Location().Load(new Dictionary<string, object?> { ["id"] = "location_id" });
```

#### Example: List

```csharp
var locationList = client.Location().List(null);
```

#### Example: Create

```csharp
var location = client.Location().Create(new Dictionary<string, object?>
{
});
```


### Partner

Create an instance: `var partner = client.Partner();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `Dictionary<string, object?>` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `Dictionary<string, object?>` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `partnerId` | `string` | The Partner's id. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var partner = client.Partner().Load(new Dictionary<string, object?> { ["id"] = "partner_id" });
```

#### Example: List

```csharp
var partnerList = client.Partner().List(null);
```

#### Example: Create

```csharp
var partner = client.Partner().Create(new Dictionary<string, object?>
{
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```


### Shipment

Create an instance: `var shipment = client.Shipment();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` | The name of the courier. |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | The date and time that a package is recieved. |
| `dateShipped` | `string` | The date and time that a package is shipped. |
| `dcKif` | `Dictionary<string, object?>` | Reference to the associated KIF resource. |
| `id` | `string` | This resource's unique identifier. |
| `items` | `List<object?>` |  |
| `kif` | `Dictionary<string, object?>` | Reference to the associated KIF resource. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `shipmentType` | `string` | The type of shipment. |
| `tracking` | `string` | The courier's tracking number. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var shipment = client.Shipment().Load(new Dictionary<string, object?> { ["id"] = "shipment_id" });
```

#### Example: List

```csharp
var shipmentList = client.Shipment().List(null);
```

#### Example: Create

```csharp
var shipment = client.Shipment().Create(new Dictionary<string, object?>
{
});
```


### Success

Create an instance: `var success = client.Success();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `Remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` | Indicates if the action was a success. |

#### Example: Create

```csharp
var success = client.Success().Create(new Dictionary<string, object?>
{
    ["share_partner_to"] = "example_share_partner_to",  // string
});
```


### Transaction

Create an instance: `var transaction = client.Transaction();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `clientRef` | `string` | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `long` | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `encrypted` | `long` | A Transcation can process muliple encryptions. |
| `endDate` | `string` | Timestamp from the end of the transaction. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | The type of cipher used during decrytion. |
| `location` | `Dictionary<string, object?>` | Reference to the associated Location resource. |
| `messageId` | `string` | Message ID. |
| `method` | `string` | The decryption cypher/method. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `string` | The source of the Transaction. |

#### Example: Load

```csharp
var transaction = client.Transaction().Load(new Dictionary<string, object?> { ["id"] = "transaction_id" });
```

#### Example: List

```csharp
var transactionList = client.Transaction().List(null);
```

#### Example: Create

```csharp
var transaction = client.Transaction().Create(new Dictionary<string, object?>
{
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```


### UpdateResult

Create an instance: `var updateResult = client.UpdateResult();`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data)` | Create a new entity with the given data. |
| `List(null)` | List entities, optionally matching the given criteria. |
| `Update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `Dictionary<string, object?>` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `Dictionary<string, object?>` | Reference to the associated User Role. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: List

```csharp
var updateResultList = client.UpdateResult().List(null);
```

#### Example: Create

```csharp
var updateResult = client.UpdateResult().Create(new Dictionary<string, object?>
{
});
```


### User

Create an instance: `var user = client.User();`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match)` | Load a single entity by match criteria. |
| `Remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Dictionary<string, object?>` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `Dictionary<string, object?>` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `Dictionary<string, object?>` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `Dictionary<string, object?>` | Reference to the associated User Role. |
| `version` | `long` | The number of times that this resource has been updated. |

#### Example: Load

```csharp
var user = client.User().Load(new Dictionary<string, object?> { ["id"] = "user_id" });
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

### Data as dictionaries

The C# SDK uses a loose object model — `Dictionary<string, object?>`
throughout — rather than a bespoke typed class per endpoint. This mirrors
the dynamic nature of the API and keeps the SDK flexible: no regeneration is
needed when the API schema changes.

Use `Helpers.ToMapAny(value)` to safely coerce a value to a
`Dictionary<string, object?>`. A `BluefinDecryptxP2peTypes.cs` module of
reference `record` types is also generated for editor documentation.

### Project structure

```
csharp/
├── BluefinDecryptxP2peSDK.csproj    -- Library project (compiles everything except test/)
├── core/                       -- Main SDK client, config, entity base, error type
├── entity/                     -- Entity implementations
├── feature/                    -- Built-in features (Base, Test, Log, ...)
├── utility/                    -- Utility functions and the vendored struct library
└── test/                       -- xUnit test suites
```

The main client class (`BluefinDecryptxP2peSDK`, namespace
`BluefinDecryptxP2peSdk`) exposes the entity accessors. Reference entity or
utility types directly only when needed.

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
