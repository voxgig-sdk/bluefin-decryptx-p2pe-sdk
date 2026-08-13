# BluefinDecryptxP2pe Elixir SDK Reference

Complete API reference for the BluefinDecryptxP2pe Elixir SDK.


## BluefinDecryptxP2pe

### Constructor

```elixir
sdk = BluefinDecryptxP2pe.new(options)
```

Create a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinDecryptxP2pe.Helpers.deep/1`.

**Options:**

| Name | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL for API requests. |
| `prefix` | `String.t()` | URL prefix appended after base. |
| `suffix` | `String.t()` | URL suffix appended after path. |
| `headers` | `map()` | Custom headers for all requests. |
| `feature` | `map()` | Feature configuration. |
| `system` | `map()` | System overrides (e.g. custom fetch). |


### Constructors

#### `BluefinDecryptxP2pe.test(testopts \\ nil, sdkopts \\ nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```elixir
sdk = BluefinDecryptxP2pe.test()
```


### Functions

#### `BluefinDecryptxP2pe.attestation(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Attestation` handle.

#### `BluefinDecryptxP2pe.client(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Client` handle.

#### `BluefinDecryptxP2pe.create_result(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.CreateResult` handle.

#### `BluefinDecryptxP2pe.decryption(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Decryption` handle.

#### `BluefinDecryptxP2pe.device(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Device` handle.

#### `BluefinDecryptxP2pe.device_build(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceBuild` handle.

#### `BluefinDecryptxP2pe.device_custody_detail(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceCustodyDetail` handle.

#### `BluefinDecryptxP2pe.device_custody_list(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceCustodyList` handle.

#### `BluefinDecryptxP2pe.device_list(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceList` handle.

#### `BluefinDecryptxP2pe.device_receive_result(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceReceiveResult` handle.

#### `BluefinDecryptxP2pe.device_rki_activate_result(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceRkiActivateResult` handle.

#### `BluefinDecryptxP2pe.device_state(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceState` handle.

#### `BluefinDecryptxP2pe.device_type(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.DeviceType` handle.

#### `BluefinDecryptxP2pe.inject_key(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.InjectKey` handle.

#### `BluefinDecryptxP2pe.kif(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Kif` handle.

#### `BluefinDecryptxP2pe.location(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Location` handle.

#### `BluefinDecryptxP2pe.partner(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Partner` handle.

#### `BluefinDecryptxP2pe.shipment(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Shipment` handle.

#### `BluefinDecryptxP2pe.success(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Success` handle.

#### `BluefinDecryptxP2pe.transaction(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.Transaction` handle.

#### `BluefinDecryptxP2pe.update_result(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.UpdateResult` handle.

#### `BluefinDecryptxP2pe.user(client, entopts \\ nil)`

Create a `BluefinDecryptxP2pe.Entity.User` handle.

#### `options_map(client) :: map()`

Return a deep copy of the current SDK options.

#### `get_utility(client) :: map()`

Return the SDK utility node.

#### `direct(client, fetchargs) :: map()`

Make a direct HTTP request to any API endpoint. Returns a result node with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `Voxgig.Struct.getprop(result, "ok")`.

**fetchargs keys:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String.t()` | URL path with optional `{param}` placeholders. |
| `method` | `String.t()` | HTTP method (default: `"GET"`). |
| `params` | `map()` | Path parameter values. |
| `query` | `map()` | Query string parameters. |
| `headers` | `map()` | Request headers (merged with defaults). |
| `body` | `any()` | Request body (maps are JSON-serialized). |

#### `prepare(client, fetchargs) :: map()`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## BluefinDecryptxP2pe.Entity.Attestation

```elixir
attestation = BluefinDecryptxP2pe.attestation(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map()` | No |  |
| `completeDate` | `String.t()` | No |  |
| `created` | `String.t()` | No |  |
| `device` | `map()` | No |  |
| `id` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `notes` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Attestation.create(attestation, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Attestation.list(attestation)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Attestation.load(attestation, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "attestation_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Attestation` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Client

```elixir
client = BluefinDecryptxP2pe.client(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `directPartner` | `map()` | No |  |
| `id` | `String.t()` | No |  |
| `isActive` | `boolean()` | No |  |
| `location` | `map()` | Yes |  |
| `mid` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Client.create(client, BluefinDecryptxP2pe.Helpers.deep(%{
  "location" => %{},  # map()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Client.list(client)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Client.load(client, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "client_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Client.remove(client, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "client_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Client` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.CreateResult

```elixir
create_result = BluefinDecryptxP2pe.create_result(sdk)
```

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.CreateResult.create(create_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "device_type" => "example_device_type",  # String.t()
  "serial_number" => "example_serial_number",  # String.t()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.CreateResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Decryption

```elixir
decryption = BluefinDecryptxP2pe.decryption(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Decryption.create(decryption, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Decryption` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Device

```elixir
device = BluefinDecryptxP2pe.device(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `map()` | Yes |  |
| `activationDate` | `String.t()` | No |  |
| `alternateKey` | `String.t()` | No |  |
| `auditNextDate` | `String.t()` | No |  |
| `auditNotificationDate` | `String.t()` | No |  |
| `client` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `createdBy` | `map()` | Yes |  |
| `deviceBuild` | `map()` | No |  |
| `deviceState` | `map()` | No |  |
| `deviceType` | `map()` | No |  |
| `errorCounter` | `integer()` | No |  |
| `errorLastDate` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `initializedBy` | `map()` | Yes |  |
| `initializedDate` | `String.t()` | No |  |
| `injectKey` | `map()` | No |  |
| `isVirtual` | `boolean()` | No |  |
| `kif` | `map()` | No |  |
| `lastActivityDate` | `String.t()` | No |  |
| `location` | `map()` | Yes |  |
| `modified` | `String.t()` | No |  |
| `modifiedBy` | `map()` | Yes |  |
| `name` | `String.t()` | No |  |
| `notes` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `serialNumber` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Device.create(device, BluefinDecryptxP2pe.Helpers.deep(%{
  "activatedBy" => %{},  # map()
  "createdBy" => %{},  # map()
  "initializedBy" => %{},  # map()
  "location" => %{},  # map()
  "modifiedBy" => %{},  # map()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Device.list(device)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Device.load(device, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Device` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceBuild

```elixir
device_build = BluefinDecryptxP2pe.device_build(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `String.t()` | No |  |
| `buildNumber` | `String.t()` | No |  |
| `configFileName` | `String.t()` | No |  |
| `created` | `String.t()` | No |  |
| `deviceType` | `String.t()` | No |  |
| `firmwareVersion` | `String.t()` | No |  |
| `hardwareVersion` | `String.t()` | No |  |
| `id` | `integer()` | No |  |
| `isActive` | `boolean()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `notes` | `String.t()` | No |  |
| `version` | `integer()` | No |  |
| `whiteListingBinRanges` | `String.t()` | No |  |
| `whiteListingUsed` | `boolean()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.DeviceBuild.list(device_build)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.DeviceBuild.load(device_build, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_build_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceBuild` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceCustodyDetail

```elixir
device_custody_detail = BluefinDecryptxP2pe.device_custody_detail(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String.t()` | No |  |
| `created` | `String.t()` | No |  |
| `createdBy` | `map()` | Yes |  |
| `custodian` | `map()` | Yes |  |
| `device` | `map()` | No |  |
| `id` | `integer()` | No |  |
| `location` | `map()` | Yes |  |
| `modified` | `String.t()` | No |  |
| `modifiedBy` | `map()` | Yes |  |
| `notes` | `String.t()` | No |  |
| `status` | `map()` | No |  |
| `transferMethod` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.DeviceCustodyDetail.load(device_custody_detail, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_custody_detail_id", "device_type" => "device_type", "serial_number" => "serial_number"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceCustodyDetail` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceCustodyList

```elixir
device_custody_list = BluefinDecryptxP2pe.device_custody_list(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `String.t()` | No |  |
| `created` | `String.t()` | No |  |
| `createdBy` | `map()` | Yes |  |
| `custodian` | `map()` | Yes |  |
| `device` | `map()` | No |  |
| `id` | `integer()` | No |  |
| `location` | `map()` | Yes |  |
| `modified` | `String.t()` | No |  |
| `modifiedBy` | `map()` | Yes |  |
| `notes` | `String.t()` | No |  |
| `status` | `map()` | No |  |
| `transferMethod` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.DeviceCustodyList.list(device_custody_list)
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceCustodyList` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceList

```elixir
device_list = BluefinDecryptxP2pe.device_list(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `list()` | No |  |
| `total` | `integer()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.DeviceList.load(device_list, BluefinDecryptxP2pe.Helpers.deep(%{"share_partner_to" => "share_partner_to"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceList` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceReceiveResult

```elixir
device_receive_result = BluefinDecryptxP2pe.device_receive_result(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.DeviceReceiveResult.create(device_receive_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "success" => true,  # boolean()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceReceiveResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceRkiActivateResult

```elixir
device_rki_activate_result = BluefinDecryptxP2pe.device_rki_activate_result(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean()` | Yes |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.DeviceRkiActivateResult.create(device_rki_activate_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "success" => true,  # boolean()
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceRkiActivateResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceState

```elixir
device_state = BluefinDecryptxP2pe.device_state(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `integer()` | No |  |
| `name` | `String.t()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.DeviceState.list(device_state)
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceState` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.DeviceType

```elixir
device_type = BluefinDecryptxP2pe.device_type(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String.t()` | No |  |
| `deviceTypeMode` | `String.t()` | No |  |
| `hardwareVersion` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `isActive` | `boolean()` | No |  |
| `manufacturer` | `String.t()` | No |  |
| `model` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `photoUrl` | `String.t()` | No |  |
| `productName` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.DeviceType.list(device_type)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.DeviceType.load(device_type, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "device_type_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.DeviceType` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.InjectKey

```elixir
inject_key = BluefinDecryptxP2pe.inject_key(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `isActive` | `boolean()` | No |  |
| `isP2PE` | `boolean()` | No |  |
| `keyType` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.InjectKey.list(inject_key)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.InjectKey.load(inject_key, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "inject_key_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.InjectKey` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Kif

```elixir
kif = BluefinDecryptxP2pe.kif(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `integer()` | No |  |
| `name` | `String.t()` | No |  |

### Operations

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Kif.list(kif)
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Kif` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Location

```elixir
location = BluefinDecryptxP2pe.location(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `String.t()` | No |  |
| `address2` | `String.t()` | No |  |
| `billingId` | `String.t()` | No |  |
| `city` | `String.t()` | No |  |
| `country` | `String.t()` | No |  |
| `created` | `String.t()` | No |  |
| `customReference` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `locationType` | `String.t()` | No |  |
| `mailAddress1` | `String.t()` | No |  |
| `mailAddress2` | `String.t()` | No |  |
| `mailCity` | `String.t()` | No |  |
| `mailCountry` | `String.t()` | No |  |
| `mailPostalCode` | `String.t()` | No |  |
| `mailStateProvince` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `nameOfBusiness` | `String.t()` | No |  |
| `notes` | `String.t()` | No |  |
| `postalCode` | `String.t()` | No |  |
| `stateProvince` | `String.t()` | No |  |
| `uniqueId` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Location.create(location, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Location.list(location)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Location.load(location, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "location_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Location.remove(location, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "location_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Location` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Partner

```elixir
partner = BluefinDecryptxP2pe.partner(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `String.t()` | No |  |
| `clientCanOrderEquipment` | `boolean()` | No |  |
| `contact` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `isActive` | `boolean()` | No |  |
| `location` | `map()` | Yes |  |
| `modified` | `String.t()` | No |  |
| `name` | `String.t()` | No |  |
| `parent` | `map()` | No |  |
| `partnerId` | `String.t()` | No |  |
| `reference` | `String.t()` | No |  |
| `verificationPhrase` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Partner.create(partner, BluefinDecryptxP2pe.Helpers.deep(%{
  "location" => %{},  # map()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Partner.list(partner)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Partner.load(partner, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "partner_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Partner` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Shipment

```elixir
shipment = BluefinDecryptxP2pe.shipment(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `String.t()` | No |  |
| `client` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `dateReceived` | `String.t()` | No |  |
| `dateShipped` | `String.t()` | No |  |
| `dcKif` | `map()` | No |  |
| `id` | `String.t()` | No |  |
| `items` | `list()` | No |  |
| `kif` | `map()` | No |  |
| `modified` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `shipmentType` | `String.t()` | No |  |
| `tracking` | `String.t()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Shipment.create(shipment, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Shipment.list(shipment)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Shipment.load(shipment, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "shipment_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Shipment` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Success

```elixir
success = BluefinDecryptxP2pe.success(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Success.create(success, BluefinDecryptxP2pe.Helpers.deep(%{
  "share_partner_to" => "example_share_partner_to",  # String.t()
}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Success.remove(success, BluefinDecryptxP2pe.Helpers.deep(%{"share_partner_to" => "share_partner_to"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Success` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.Transaction

```elixir
transaction = BluefinDecryptxP2pe.transaction(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `String.t()` | No |  |
| `client` | `map()` | No |  |
| `clientRef` | `String.t()` | No |  |
| `created` | `String.t()` | No |  |
| `decrypted` | `integer()` | No |  |
| `deviceName` | `String.t()` | No |  |
| `directPartner` | `map()` | No |  |
| `encrypted` | `integer()` | No |  |
| `endDate` | `String.t()` | No |  |
| `errCode` | `String.t()` | No |  |
| `errMessage` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `ipAddress` | `String.t()` | No |  |
| `isVirtual` | `boolean()` | No |  |
| `keyType` | `String.t()` | No |  |
| `location` | `map()` | Yes |  |
| `messageId` | `String.t()` | No |  |
| `method` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `reference` | `String.t()` | No |  |
| `serialNumber` | `String.t()` | No |  |
| `startDate` | `String.t()` | No |  |
| `success` | `boolean()` | No |  |
| `transactionSource` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Transaction.create(transaction, BluefinDecryptxP2pe.Helpers.deep(%{
  "location" => %{},  # map()
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.Transaction.list(transaction)
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.Transaction.load(transaction, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "transaction_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.Transaction` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.UpdateResult

```elixir
update_result = BluefinDecryptxP2pe.update_result(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map()` | No |  |
| `email` | `String.t()` | No |  |
| `firstName` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `isActive` | `boolean()` | No |  |
| `kif` | `map()` | No |  |
| `lastName` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `phone` | `String.t()` | No |  |
| `userName` | `String.t()` | No |  |
| `userRole` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.UpdateResult.create(update_result, BluefinDecryptxP2pe.Helpers.deep(%{
}))
```

#### `list(entity, reqmatch \\ nil, ctrl \\ nil) :: list()`

List entities matching the given criteria. The match is optional — call `list(entity)` to list all records. Returns a list and raises on error.

```elixir
records = BluefinDecryptxP2pe.Entity.UpdateResult.list(update_result)
```

#### `update(entity, reqdata, ctrl \\ nil) :: map()`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.UpdateResult.update(update_result, BluefinDecryptxP2pe.Helpers.deep(%{
  "id" => "id",
  # Fields to update
}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.UpdateResult` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## BluefinDecryptxP2pe.Entity.User

```elixir
user = BluefinDecryptxP2pe.user(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map()` | No |  |
| `created` | `String.t()` | No |  |
| `email` | `String.t()` | No |  |
| `firstName` | `String.t()` | No |  |
| `id` | `String.t()` | No |  |
| `isActive` | `boolean()` | No |  |
| `kif` | `map()` | No |  |
| `lastName` | `String.t()` | No |  |
| `modified` | `String.t()` | No |  |
| `partner` | `map()` | No |  |
| `phone` | `String.t()` | No |  |
| `userName` | `String.t()` | No |  |
| `userRole` | `map()` | No |  |
| `version` | `integer()` | No |  |

### Operations

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.User.load(user, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "user_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinDecryptxP2pe.Entity.User.remove(user, BluefinDecryptxP2pe.Helpers.deep(%{"id" => "user_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinDecryptxP2pe.Entity.User` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```elixir
sdk = BluefinDecryptxP2pe.new(BluefinDecryptxP2pe.Helpers.deep(%{
  "feature" => %{
    "test" => %{"active" => true},
  }
}))
```

