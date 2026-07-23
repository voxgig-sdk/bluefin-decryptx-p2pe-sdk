# BluefinDecryptxP2pe C# SDK Reference

Complete API reference for the BluefinDecryptxP2pe C# SDK.


## BluefinDecryptxP2peSDK

### Constructor

```csharp
using BluefinDecryptxP2peSdk;

var client = new BluefinDecryptxP2peSDK(options);
```

Create a new SDK client instance. `options` is a
`Dictionary<string, object?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Dictionary` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `Dictionary` | Custom headers for all requests. |
| `options["feature"]` | `Dictionary` | Feature configuration. |
| `options["system"]` | `Dictionary` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinDecryptxP2peSDK.TestSDK(testopts = null, sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```csharp
var client = BluefinDecryptxP2peSDK.TestSDK(null, null);
```


### Instance Methods

#### `Attestation(entopts = null)`

Create a new `Attestation` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Client(entopts = null)`

Create a new `Client` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `CreateResult(entopts = null)`

Create a new `CreateResult` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Decryption(entopts = null)`

Create a new `Decryption` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Device(entopts = null)`

Create a new `Device` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceBuild(entopts = null)`

Create a new `DeviceBuild` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceCustodyDetail(entopts = null)`

Create a new `DeviceCustodyDetail` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceCustodyList(entopts = null)`

Create a new `DeviceCustodyList` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceList(entopts = null)`

Create a new `DeviceList` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceReceiveResult(entopts = null)`

Create a new `DeviceReceiveResult` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceRkiActivateResult(entopts = null)`

Create a new `DeviceRkiActivateResult` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceState(entopts = null)`

Create a new `DeviceState` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `DeviceType(entopts = null)`

Create a new `DeviceType` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `InjectKey(entopts = null)`

Create a new `InjectKey` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Kif(entopts = null)`

Create a new `Kif` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Location(entopts = null)`

Create a new `Location` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Partner(entopts = null)`

Create a new `Partner` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Shipment(entopts = null)`

Create a new `Shipment` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Success(entopts = null)`

Create a new `Success` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `Transaction(entopts = null)`

Create a new `Transaction` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `UpdateResult(entopts = null)`

Create a new `UpdateResult` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `User(entopts = null)`

Create a new `User` entity instance (returns
`BluefinDecryptxP2peEntityBase`). Pass `null` for no initial options.

#### `OptionsMap() -> Dictionary`

Return a deep copy of the current SDK options.

#### `GetUtility() -> Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs = null) -> Dictionary`

Make a direct HTTP request to any API endpoint. Returns a result
`Dictionary<string, object?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Dictionary` | Path parameter values. |
| `fetchargs["query"]` | `Dictionary` | Query string parameters. |
| `fetchargs["headers"]` | `Dictionary` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `object?` | Request body (dictionaries are JSON-serialized). |

**Returns:** `Dictionary<string, object?>`

#### `Prepare(fetchargs = null) -> Dictionary`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```csharp
var attestation = client.Attestation();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Dictionary<string, object?>` | No |  |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `Dictionary<string, object?>` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Attestation().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Attestation().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Attestation().Load(new Dictionary<string, object?> { ["id"] = "attestation_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Attestation` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Client

```csharp
var client = client.Client();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `Dictionary<string, object?>` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `Dictionary<string, object?>` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | - | - |
| `created` | - | - | - | - |
| `direct_partner` | - | - | - | - |
| `id` | - | - | - | - |
| `is_active` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | - | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Client().Create(new Dictionary<string, object?>
{
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Client().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Client().Load(new Dictionary<string, object?> { ["id"] = "client_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.Client().Remove(new Dictionary<string, object?> { ["id"] = "client_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Client` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## CreateResult

```csharp
var createResult = client.CreateResult();
```

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.CreateResult().Create(new Dictionary<string, object?>
{
    ["device_type"] = "example_device_type",  // string
    ["serial_number"] = "example_serial_number",  // string
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `CreateResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Decryption

```csharp
var decryption = client.Decryption();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Decryption().Create(new Dictionary<string, object?>
{
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Decryption` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Device

```csharp
var device = client.Device();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `Dictionary<string, object?>` | Yes |  |
| `activation_date` | `string` | No |  |
| `alternate_key` | `string` | No |  |
| `audit_next_date` | `string` | No |  |
| `audit_notification_date` | `string` | No |  |
| `client` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `created_by` | `Dictionary<string, object?>` | Yes |  |
| `device_build` | `Dictionary<string, object?>` | No |  |
| `device_state` | `Dictionary<string, object?>` | No |  |
| `device_type` | `Dictionary<string, object?>` | No |  |
| `error_counter` | `long` | No |  |
| `error_last_date` | `string` | No |  |
| `id` | `string` | No |  |
| `initialized_by` | `Dictionary<string, object?>` | Yes |  |
| `initialized_date` | `string` | No |  |
| `inject_key` | `Dictionary<string, object?>` | No |  |
| `is_virtual` | `bool` | No |  |
| `kif` | `Dictionary<string, object?>` | No |  |
| `last_activity_date` | `string` | No |  |
| `location` | `Dictionary<string, object?>` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `Dictionary<string, object?>` | Yes |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `serial_number` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Device().Create(new Dictionary<string, object?>
{
    ["activated_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["created_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["initialized_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
    ["modified_by"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Device().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Device().Load(new Dictionary<string, object?> { ["id"] = "device_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Device` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceBuild

```csharp
var deviceBuild = client.DeviceBuild();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `app_version` | `string` | No |  |
| `build_number` | `string` | No |  |
| `config_file_name` | `string` | No |  |
| `created` | `string` | No |  |
| `device_type` | `string` | No |  |
| `firmware_version` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `long` | No |  |
| `is_active` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `version` | `long` | No |  |
| `white_listing_bin_range` | `string` | No |  |
| `white_listing_used` | `bool` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.DeviceBuild().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.DeviceBuild().Load(new Dictionary<string, object?> { ["id"] = "device_build_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceBuild` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceCustodyDetail

```csharp
var deviceCustodyDetail = client.DeviceCustodyDetail();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `Dictionary<string, object?>` | Yes |  |
| `custodian` | `Dictionary<string, object?>` | Yes |  |
| `device` | `Dictionary<string, object?>` | No |  |
| `id` | `long` | No |  |
| `location` | `Dictionary<string, object?>` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `Dictionary<string, object?>` | Yes |  |
| `note` | `string` | No |  |
| `status` | `Dictionary<string, object?>` | No |  |
| `transfer_method` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.DeviceCustodyDetail().Load(new Dictionary<string, object?> { ["id"] = "device_custody_detail_id", ["device_type"] = "device_type", ["serial_number"] = "serial_number" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceCustodyList

```csharp
var deviceCustodyList = client.DeviceCustodyList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `Dictionary<string, object?>` | Yes |  |
| `custodian` | `Dictionary<string, object?>` | Yes |  |
| `device` | `Dictionary<string, object?>` | No |  |
| `id` | `long` | No |  |
| `location` | `Dictionary<string, object?>` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `Dictionary<string, object?>` | Yes |  |
| `note` | `string` | No |  |
| `status` | `Dictionary<string, object?>` | No |  |
| `transfer_method` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.DeviceCustodyList().List(null);
Console.WriteLine(results);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceList

```csharp
var deviceList = client.DeviceList();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `List<object?>` | No |  |
| `total` | `long` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.DeviceList().Load(new Dictionary<string, object?> { ["share_partner_to"] = "share_partner_to" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceList` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceReceiveResult

```csharp
var deviceReceiveResult = client.DeviceReceiveResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.DeviceReceiveResult().Create(new Dictionary<string, object?>
{
    ["success"] = true,  // bool
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceRkiActivateResult

```csharp
var deviceRkiActivateResult = client.DeviceRkiActivateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.DeviceRkiActivateResult().Create(new Dictionary<string, object?>
{
    ["success"] = true,  // bool
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceState

```csharp
var deviceState = client.DeviceState();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `long` | No |  |
| `name` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.DeviceState().List(null);
Console.WriteLine(results);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceState` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## DeviceType

```csharp
var deviceType = client.DeviceType();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `device_type_mode` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photo_url` | `string` | No |  |
| `product_name` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.DeviceType().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.DeviceType().Load(new Dictionary<string, object?> { ["id"] = "device_type_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `DeviceType` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## InjectKey

```csharp
var injectKey = client.InjectKey();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `is_p2_pe` | `bool` | No |  |
| `key_type` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.InjectKey().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.InjectKey().Load(new Dictionary<string, object?> { ["id"] = "inject_key_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `InjectKey` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Kif

```csharp
var kif = client.Kif();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `long` | No |  |
| `name` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Kif().List(null);
Console.WriteLine(results);
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Kif` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Location

```csharp
var location = client.Location();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `string` | No |  |
| `address2` | `string` | No |  |
| `billing_id` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `created` | `string` | No |  |
| `custom_reference` | `string` | No |  |
| `id` | `string` | No |  |
| `location_type` | `string` | No |  |
| `mail_address1` | `string` | No |  |
| `mail_address2` | `string` | No |  |
| `mail_city` | `string` | No |  |
| `mail_country` | `string` | No |  |
| `mail_postal_code` | `string` | No |  |
| `mail_state_province` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `name_of_business` | `string` | No |  |
| `note` | `string` | No |  |
| `postal_code` | `string` | No |  |
| `state_province` | `string` | No |  |
| `unique_id` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Location().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Location().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Location().Load(new Dictionary<string, object?> { ["id"] = "location_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.Location().Remove(new Dictionary<string, object?> { ["id"] = "location_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Location` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Partner

```csharp
var partner = client.Partner();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client_can_order_equipment` | `bool` | No |  |
| `contact` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `location` | `Dictionary<string, object?>` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `Dictionary<string, object?>` | No |  |
| `partner_id` | `string` | No |  |
| `reference` | `string` | No |  |
| `verification_phrase` | `string` | No |  |
| `version` | `long` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billing_id` | - | - | - |
| `client_can_order_equipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `is_active` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partner_id` | - | - | - |
| `reference` | - | - | - |
| `verification_phrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Partner().Create(new Dictionary<string, object?>
{
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Partner().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Partner().Load(new Dictionary<string, object?> { ["id"] = "partner_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Partner` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Shipment

```csharp
var shipment = client.Shipment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `date_received` | `string` | No |  |
| `date_shipped` | `string` | No |  |
| `dc_kif` | `Dictionary<string, object?>` | No |  |
| `id` | `string` | No |  |
| `item` | `List<object?>` | No |  |
| `kif` | `Dictionary<string, object?>` | No |  |
| `modified` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `shipment_type` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Shipment().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Shipment().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Shipment().Load(new Dictionary<string, object?> { ["id"] = "shipment_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Shipment` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Success

```csharp
var success = client.Success();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Success().Create(new Dictionary<string, object?>
{
    ["share_partner_to"] = "example_share_partner_to",  // string
});
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.Success().Remove(new Dictionary<string, object?> { ["share_partner_to"] = "share_partner_to" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Success` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Transaction

```csharp
var transaction = client.Transaction();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `string` | No |  |
| `client` | `Dictionary<string, object?>` | No |  |
| `client_ref` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `long` | No |  |
| `device_name` | `string` | No |  |
| `direct_partner` | `Dictionary<string, object?>` | No |  |
| `encrypted` | `long` | No |  |
| `end_date` | `string` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `string` | No |  |
| `ip_address` | `string` | No |  |
| `is_virtual` | `bool` | No |  |
| `key_type` | `string` | No |  |
| `location` | `Dictionary<string, object?>` | Yes |  |
| `message_id` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `reference` | `string` | No |  |
| `serial_number` | `string` | No |  |
| `start_date` | `string` | No |  |
| `success` | `bool` | No |  |
| `transaction_source` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.Transaction().Create(new Dictionary<string, object?>
{
    ["location"] = new Dictionary<string, object?>(),  // Dictionary<string, object?>
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.Transaction().List(null);
Console.WriteLine(results);
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.Transaction().Load(new Dictionary<string, object?> { ["id"] = "transaction_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `Transaction` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## UpdateResult

```csharp
var updateResult = client.UpdateResult();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Dictionary<string, object?>` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `Dictionary<string, object?>` | No |  |
| `last_name` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.UpdateResult().Create(new Dictionary<string, object?>
{
});
```

#### `List(reqmatch, ctrl = null) -> object?`

List entities matching the given criteria. The match is optional — call `List(null)` to list all records. Returns an aggregate list and raises on error.

```csharp
var results = client.UpdateResult().List(null);
Console.WriteLine(results);
```

#### `Update(reqdata, ctrl = null) -> object?`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```csharp
var result = client.UpdateResult().Update(new Dictionary<string, object?>
{
    ["id"] = "id",
    // Fields to update
});
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `UpdateResult` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## User

```csharp
var user = client.User();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `Dictionary<string, object?>` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `bool` | No |  |
| `kif` | `Dictionary<string, object?>` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `Dictionary<string, object?>` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `Dictionary<string, object?>` | No |  |
| `version` | `long` | No |  |

### Operations

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.User().Load(new Dictionary<string, object?> { ["id"] = "user_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.User().Remove(new Dictionary<string, object?> { ["id"] = "user_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `User` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```csharp
var client = new BluefinDecryptxP2peSDK(new Dictionary<string, object?>
{
    ["feature"] = new Dictionary<string, object?>
    {
        ["test"] = new Dictionary<string, object?> { ["active"] = true },
    },
});
```

