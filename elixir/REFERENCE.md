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
| `client` | `map()` | No | Reference to the associated Client resource. |
| `completeDate` | `String.t()` | No | The date and time that the Attestation took place. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `device` | `map()` | No | Reference to the associated Device resource. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `name` | `String.t()` | No | Text describing the attestation. |
| `notes` | `String.t()` | No | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `map()` | No | Reference to the associated User resource. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map()` | No | Reference to the associated Partner. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No | This property indicates if the Client account is active or disabled. |
| `location` | `map()` | Yes | Reference to the associated Location resource. |
| `mid` | `String.t()` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The Client's name. |
| `partner` | `map()` | No | Reference to the Client's root Partner. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `success` | `boolean()` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `map()` | Yes | Reference to the associated User resource. |
| `activationDate` | `String.t()` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `String.t()` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `String.t()` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `String.t()` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `map()` | No | Reference to the associated Client resource. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map()` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `map()` | No | Reference to the associated Device Build resource. |
| `deviceState` | `map()` | No | Reference to the associated Device State resource. |
| `deviceType` | `map()` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `integer()` | No | The number times the Device has been in error. |
| `errorLastDate` | `String.t()` | No | Timestamp from the last time that the Device had an error. |
| `id` | `String.t()` | No | The Device's unique identifier. |
| `initializedBy` | `map()` | Yes | Reference to the associated User resource. |
| `initializedDate` | `String.t()` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `map()` | No | Reference to the associated Device resource. |
| `isVirtual` | `boolean()` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `map()` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `String.t()` | No | Timestamp from the last time that the Device was used. |
| `location` | `map()` | Yes | Reference to the associated Location resource. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `modifiedBy` | `map()` | Yes | Reference to the associated User resource. |
| `name` | `String.t()` | No | The Device's name. |
| `notes` | `String.t()` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `serialNumber` | `String.t()` | No | The Device's serial number. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `appVersion` | `String.t()` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `String.t()` | No | The Build Number. |
| `configFileName` | `String.t()` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `String.t()` | No | The Device Type Name. |
| `firmwareVersion` | `String.t()` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `String.t()` | No | A list of hardware versions that this Device Build covers. |
| `id` | `integer()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The Device Builds's name. |
| `notes` | `String.t()` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `String.t()` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean()` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `String.t()` | No | The date and time that the Custody change took place. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map()` | Yes | Reference to the associated User resource. |
| `custodian` | `map()` | Yes | Reference to the associated User resource. |
| `device` | `map()` | No | Reference to the associated Device resource. |
| `id` | `integer()` | No | This resource's unique identifier. |
| `location` | `map()` | Yes | Reference to the associated Location resource. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `modifiedBy` | `map()` | Yes | Reference to the associated User resource. |
| `notes` | `String.t()` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map()` | No | Reference to the associated Custody Status. |
| `transferMethod` | `map()` | No | Reference to the associated Transfer Method. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `String.t()` | No | The date and time that the Custody change took place. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map()` | Yes | Reference to the associated User resource. |
| `custodian` | `map()` | Yes | Reference to the associated User resource. |
| `device` | `map()` | No | Reference to the associated Device resource. |
| `id` | `integer()` | No | This resource's unique identifier. |
| `location` | `map()` | Yes | Reference to the associated Location resource. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `modifiedBy` | `map()` | Yes | Reference to the associated User resource. |
| `notes` | `String.t()` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map()` | No | Reference to the associated Custody Status. |
| `transferMethod` | `map()` | No | Reference to the associated Transfer Method. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `data` | `list()` | No | List of Devices. |
| `total` | `integer()` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `boolean()` | Yes | Indicates if the action succeeded. |

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
| `success` | `boolean()` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `integer()` | No | Unique identifier for this Device state. |
| `name` | `String.t()` | No | Descriptive name for this Device state. |

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
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `String.t()` | No | The Device type. |
| `hardwareVersion` | `String.t()` | No | The Device hardware version. |
| `id` | `String.t()` | No | Unique idenifier. |
| `isActive` | `boolean()` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `String.t()` | No | The Device manufacturer. |
| `model` | `String.t()` | No | The Device model. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The DeviceType name. |
| `photoUrl` | `String.t()` | No |  |
| `productName` | `String.t()` | No | The Device name. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String.t()` | No | unique idenifier |
| `isActive` | `boolean()` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean()` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `String.t()` | No | The cipher type that the key works with. |
| `modified` | `String.t()` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `String.t()` | No | Key name. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `id` | `integer()` | No | This resource's unique identifier. |
| `name` | `String.t()` | No | The KIF's name. |

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
| `address1` | `String.t()` | No | The Location's street address. |
| `address2` | `String.t()` | No | The Location's street address. |
| `billingId` | `String.t()` | No | \? |
| `city` | `String.t()` | No | The Location's city. |
| `country` | `String.t()` | No | The Location's country. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `String.t()` | No | A Partner specified reference for a location. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `locationType` | `String.t()` | No | The Location's clasification. |
| `mailAddress1` | `String.t()` | No | The Location's street address. |
| `mailAddress2` | `String.t()` | No | The Location's street address. |
| `mailCity` | `String.t()` | No | The Location's city. |
| `mailCountry` | `String.t()` | No | The Location's street address. |
| `mailPostalCode` | `String.t()` | No | The Location's postal code. |
| `mailStateProvince` | `String.t()` | No | The Location's street state or province. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The Location's name. |
| `nameOfBusiness` | `String.t()` | No | The name of the business at this location. |
| `notes` | `String.t()` | No | Note for delivery driver. |
| `postalCode` | `String.t()` | No | The Location's postal code. |
| `stateProvince` | `String.t()` | No | The Location's street state or province. |
| `uniqueId` | `String.t()` | No | Unique Identifier for the Location. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `billingId` | `String.t()` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean()` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `map()` | No | Reference to the associated User resource. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `map()` | Yes | Reference to the associated Location resource. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `name` | `String.t()` | No | The Partner's name. |
| `parent` | `map()` | No | Reference to the associated Partner. |
| `partnerId` | `String.t()` | No | The Partner's id. |
| `reference` | `String.t()` | No | The Partner's reference string. |
| `verificationPhrase` | `String.t()` | No | The verification phrase is a message that the Partner creates. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `carrier` | `String.t()` | No | The name of the courier. |
| `client` | `map()` | No | Reference to the associated Client resource. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `String.t()` | No | The date and time that a package is recieved. |
| `dateShipped` | `String.t()` | No | The date and time that a package is shipped. |
| `dcKif` | `map()` | No | Reference to the associated KIF resource. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `items` | `list()` | No |  |
| `kif` | `map()` | No | Reference to the associated KIF resource. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `shipmentType` | `String.t()` | No | The type of shipment. |
| `tracking` | `String.t()` | No | The courier's tracking number. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `success` | `boolean()` | No | Indicates if the action was a success. |

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
| `alternateKey` | `String.t()` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `map()` | No | Reference to the associated Client resource. |
| `clientRef` | `String.t()` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `integer()` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `String.t()` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `map()` | No | Reference to the associated Partner. |
| `encrypted` | `integer()` | No | A Transcation can process muliple encryptions. |
| `endDate` | `String.t()` | No | Timestamp from the end of the transaction. |
| `errCode` | `String.t()` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `String.t()` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `ipAddress` | `String.t()` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean()` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `String.t()` | No | The type of cipher used during decrytion. |
| `location` | `map()` | Yes | Reference to the associated Location resource. |
| `messageId` | `String.t()` | No | Message ID. |
| `method` | `String.t()` | No | The decryption cypher/method. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `reference` | `String.t()` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `String.t()` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `String.t()` | No | Timestamp from the beginning of the transaction. |
| `success` | `boolean()` | No | The success indicator. |
| `transactionSource` | `String.t()` | No | The source of the Transaction. |

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
| `client` | `map()` | No | Reference to the associated Client resource. |
| `email` | `String.t()` | No | The User's email address. |
| `firstName` | `String.t()` | No | The User's name. |
| `id` | `String.t()` | No | ID of newly created resource |
| `isActive` | `boolean()` | No | This property indicates if the User account is active or disabled. |
| `kif` | `map()` | No | Reference to the associated KIF resource. |
| `lastName` | `String.t()` | No | The User's Surname. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `phone` | `String.t()` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String.t()` | No | The User's unique username. |
| `userRole` | `map()` | No | Reference to the associated User Role. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `client` | `map()` | No | Reference to the associated Client resource. |
| `created` | `String.t()` | No | Creation timestamp in ISO 8601 format. |
| `email` | `String.t()` | No | The User's email address. |
| `firstName` | `String.t()` | No | The User's name. |
| `id` | `String.t()` | No | This resource's unique identifier. |
| `isActive` | `boolean()` | No | This property indicates if the User account is active or disabled. |
| `kif` | `map()` | No | Reference to the associated KIF resource. |
| `lastName` | `String.t()` | No | The User's Surname. |
| `modified` | `String.t()` | No | Last modified timestamp. |
| `partner` | `map()` | No | Reference to the associated Partner. |
| `phone` | `String.t()` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `String.t()` | No | The User's unique username. |
| `userRole` | `map()` | No | Reference to the associated User Role. |
| `version` | `integer()` | No | The number of times that this resource has been updated. |

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
| `audit` | 0.0.1 | Structured audit trail of operations |
| `clienttrack` | 0.0.1 | Client identity and per-request correlation headers |
| `idempotency` | 0.0.1 | Idempotency keys for safe retries of mutating operations |
| `log` | 0.0.1 | Structured request and response logging |
| `metrics` | 0.0.1 | Statistics capture: per-operation counters and latency |
| `paging` | 0.0.1 | Pagination signals for list operations |
| `ratelimit` | 0.0.1 | Client-side rate limiting via a token bucket |
| `retry` | 0.0.1 | Automatic retry of transient failures with exponential backoff |
| `telemetry` | 0.0.1 | Distributed tracing spans with W3C trace-context propagation |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |
| `timeout` | 0.0.1 | Per-request timeout with transport abort |


Features are activated via the `feature` option:

```elixir
sdk = BluefinDecryptxP2pe.new(BluefinDecryptxP2pe.Helpers.deep(%{
  "feature" => %{
    "audit" => %{"active" => true},
    "clienttrack" => %{"active" => true},
    "idempotency" => %{"active" => true},
    "log" => %{"active" => true},
    "metrics" => %{"active" => true},
    "paging" => %{"active" => true},
    "ratelimit" => %{"active" => true},
    "retry" => %{"active" => true},
    "telemetry" => %{"active" => true},
    "test" => %{"active" => true},
    "timeout" => %{"active" => true},
  }
}))
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`audit`, `clienttrack`, `idempotency`, `log`, `metrics`, `paging`, `telemetry`, `test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `audit`

Structured audit trail of operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.audit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `clienttrack`

Client identity and per-request correlation headers.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.clienttrack.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `idempotency`

Idempotency keys for safe retries of mutating operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.idempotency.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `log`

Structured request and response logging.

**Configuration**

| Option | Default |
|---|---|
| `active` | `true` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.log.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `metrics`

Statistics capture: per-operation counters and latency.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.metrics.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `paging`

Pagination signals for list operations.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.paging.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `ratelimit`

Client-side rate limiting via a token bucket.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Automatic retry of transient failures with exponential backoff.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `telemetry`

Distributed tracing spans with W3C trace-context propagation.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.telemetry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

In-memory mock transport for testing without a live server.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Per-request timeout with transport abort.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Options above are those the model carries a default for. A feature may
also accept callback options — a `sink` to receive each record, for
instance — which have no default and are covered in the full feature
reference.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

