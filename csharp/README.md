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
var created = client.Attestation().Create(new Dictionary<string, object?> { ["client"] = new Dictionary<string, object?>(), ["complete_date"] = "example_complete_date" });

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
| `client` |  |
| `complete_date` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `note` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `direct_partner` |  |
| `id` |  |
| `is_active` |  |
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
| `activated_by` |  |
| `activation_date` |  |
| `alternate_key` |  |
| `audit_next_date` |  |
| `audit_notification_date` |  |
| `client` |  |
| `created` |  |
| `created_by` |  |
| `device_build` |  |
| `device_state` |  |
| `device_type` |  |
| `error_counter` |  |
| `error_last_date` |  |
| `id` |  |
| `initialized_by` |  |
| `initialized_date` |  |
| `inject_key` |  |
| `is_virtual` |  |
| `kif` |  |
| `last_activity_date` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `name` |  |
| `note` |  |
| `partner` |  |
| `serial_number` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `app_version` |  |
| `build_number` |  |
| `config_file_name` |  |
| `created` |  |
| `device_type` |  |
| `firmware_version` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `modified` |  |
| `name` |  |
| `note` |  |
| `version` |  |
| `white_listing_bin_range` |  |
| `white_listing_used` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `complete_date` |  |
| `created` |  |
| `created_by` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modified_by` |  |
| `note` |  |
| `status` |  |
| `transfer_method` |  |
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
| `device_type_mode` |  |
| `hardware_version` |  |
| `id` |  |
| `is_active` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photo_url` |  |
| `product_name` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `is_p2_pe` |  |
| `key_type` |  |
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
| `billing_id` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `custom_reference` |  |
| `id` |  |
| `location_type` |  |
| `mail_address1` |  |
| `mail_address2` |  |
| `mail_city` |  |
| `mail_country` |  |
| `mail_postal_code` |  |
| `mail_state_province` |  |
| `modified` |  |
| `name` |  |
| `name_of_business` |  |
| `note` |  |
| `postal_code` |  |
| `state_province` |  |
| `unique_id` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billing_id` |  |
| `client_can_order_equipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `is_active` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partner_id` |  |
| `reference` |  |
| `verification_phrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `date_received` |  |
| `date_shipped` |  |
| `dc_kif` |  |
| `id` |  |
| `item` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipment_type` |  |
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
| `alternate_key` |  |
| `client` |  |
| `client_ref` |  |
| `created` |  |
| `decrypted` |  |
| `device_name` |  |
| `direct_partner` |  |
| `encrypted` |  |
| `end_date` |  |
| `err_code` |  |
| `err_message` |  |
| `id` |  |
| `ip_address` |  |
| `is_virtual` |  |
| `key_type` |  |
| `location` |  |
| `message_id` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serial_number` |  |
| `start_date` |  |
| `success` |  |
| `transaction_source` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `first_name` |  |
| `id` |  |
| `is_active` |  |
| `kif` |  |
| `last_name` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `user_name` |  |
| `user_role` |  |
| `version` |  |

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
| `client` | `Dictionary<string, object?>` |  |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `device` | `Dictionary<string, object?>` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |

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
| `contact` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `direct_partner` | `Dictionary<string, object?>` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `location` | `Dictionary<string, object?>` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

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
| `success` | `bool` |  |

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
| `activated_by` | `Dictionary<string, object?>` |  |
| `activation_date` | `string` |  |
| `alternate_key` | `string` |  |
| `audit_next_date` | `string` |  |
| `audit_notification_date` | `string` |  |
| `client` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `created_by` | `Dictionary<string, object?>` |  |
| `device_build` | `Dictionary<string, object?>` |  |
| `device_state` | `Dictionary<string, object?>` |  |
| `device_type` | `Dictionary<string, object?>` |  |
| `error_counter` | `long` |  |
| `error_last_date` | `string` |  |
| `id` | `string` |  |
| `initialized_by` | `Dictionary<string, object?>` |  |
| `initialized_date` | `string` |  |
| `inject_key` | `Dictionary<string, object?>` |  |
| `is_virtual` | `bool` |  |
| `kif` | `Dictionary<string, object?>` |  |
| `last_activity_date` | `string` |  |
| `location` | `Dictionary<string, object?>` |  |
| `modified` | `string` |  |
| `modified_by` | `Dictionary<string, object?>` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `serial_number` | `string` |  |
| `version` | `long` |  |

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
    ["activated_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["created_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["initialized_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["modified_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
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
| `app_version` | `string` |  |
| `build_number` | `string` |  |
| `config_file_name` | `string` |  |
| `created` | `string` |  |
| `device_type` | `string` |  |
| `firmware_version` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `long` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `version` | `long` |  |
| `white_listing_bin_range` | `string` |  |
| `white_listing_used` | `bool` |  |

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
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `Dictionary<string, object?>` |  |
| `custodian` | `Dictionary<string, object?>` |  |
| `device` | `Dictionary<string, object?>` |  |
| `id` | `long` |  |
| `location` | `Dictionary<string, object?>` |  |
| `modified` | `string` |  |
| `modified_by` | `Dictionary<string, object?>` |  |
| `note` | `string` |  |
| `status` | `Dictionary<string, object?>` |  |
| `transfer_method` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

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
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `Dictionary<string, object?>` |  |
| `custodian` | `Dictionary<string, object?>` |  |
| `device` | `Dictionary<string, object?>` |  |
| `id` | `long` |  |
| `location` | `Dictionary<string, object?>` |  |
| `modified` | `string` |  |
| `modified_by` | `Dictionary<string, object?>` |  |
| `note` | `string` |  |
| `status` | `Dictionary<string, object?>` |  |
| `transfer_method` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

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
| `data` | `List<object?>` |  |
| `total` | `long` |  |

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
| `success` | `bool` |  |

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
| `success` | `bool` |  |

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
| `id` | `long` |  |
| `name` | `string` |  |

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
| `created` | `string` |  |
| `device_type_mode` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photo_url` | `string` |  |
| `product_name` | `string` |  |
| `version` | `long` |  |

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
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `is_p2_pe` | `bool` |  |
| `key_type` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `version` | `long` |  |

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
| `id` | `long` |  |
| `name` | `string` |  |

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
| `address1` | `string` |  |
| `address2` | `string` |  |
| `billing_id` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `created` | `string` |  |
| `custom_reference` | `string` |  |
| `id` | `string` |  |
| `location_type` | `string` |  |
| `mail_address1` | `string` |  |
| `mail_address2` | `string` |  |
| `mail_city` | `string` |  |
| `mail_country` | `string` |  |
| `mail_postal_code` | `string` |  |
| `mail_state_province` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `name_of_business` | `string` |  |
| `note` | `string` |  |
| `postal_code` | `string` |  |
| `state_province` | `string` |  |
| `unique_id` | `string` |  |
| `version` | `long` |  |

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
| `billing_id` | `string` |  |
| `client_can_order_equipment` | `bool` |  |
| `contact` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `location` | `Dictionary<string, object?>` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `Dictionary<string, object?>` |  |
| `partner_id` | `string` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `long` |  |

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
| `carrier` | `string` |  |
| `client` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `date_received` | `string` |  |
| `date_shipped` | `string` |  |
| `dc_kif` | `Dictionary<string, object?>` |  |
| `id` | `string` |  |
| `item` | `List<object?>` |  |
| `kif` | `Dictionary<string, object?>` |  |
| `modified` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `shipment_type` | `string` |  |
| `tracking` | `string` |  |
| `version` | `long` |  |

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
| `success` | `bool` |  |

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
| `alternate_key` | `string` |  |
| `client` | `Dictionary<string, object?>` |  |
| `client_ref` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `long` |  |
| `device_name` | `string` |  |
| `direct_partner` | `Dictionary<string, object?>` |  |
| `encrypted` | `long` |  |
| `end_date` | `string` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `string` |  |
| `ip_address` | `string` |  |
| `is_virtual` | `bool` |  |
| `key_type` | `string` |  |
| `location` | `Dictionary<string, object?>` |  |
| `message_id` | `string` |  |
| `method` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `reference` | `string` |  |
| `serial_number` | `string` |  |
| `start_date` | `string` |  |
| `success` | `bool` |  |
| `transaction_source` | `string` |  |

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
| `client` | `Dictionary<string, object?>` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `kif` | `Dictionary<string, object?>` |  |
| `last_name` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

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
| `client` | `Dictionary<string, object?>` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `kif` | `Dictionary<string, object?>` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `Dictionary<string, object?>` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `Dictionary<string, object?>` |  |
| `version` | `long` |  |

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
