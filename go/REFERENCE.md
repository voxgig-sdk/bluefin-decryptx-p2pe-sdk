# BluefinDecryptxP2pe Golang SDK Reference

Complete API reference for the BluefinDecryptxP2pe Golang SDK.


## BluefinDecryptxP2peSDK

### Constructor

```go
func NewBluefinDecryptxP2peSDK(options map[string]any) *BluefinDecryptxP2peSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *BluefinDecryptxP2peSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *BluefinDecryptxP2peSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Attestation(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Attestation` entity instance. Pass `nil` for no initial data.

#### `Client(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `CreateResult(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `CreateResult` entity instance. Pass `nil` for no initial data.

#### `Decryption(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Decryption` entity instance. Pass `nil` for no initial data.

#### `Device(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Device` entity instance. Pass `nil` for no initial data.

#### `DeviceBuild(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceBuild` entity instance. Pass `nil` for no initial data.

#### `DeviceCustodyDetail(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceCustodyDetail` entity instance. Pass `nil` for no initial data.

#### `DeviceCustodyList(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceCustodyList` entity instance. Pass `nil` for no initial data.

#### `DeviceList(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceList` entity instance. Pass `nil` for no initial data.

#### `DeviceReceiveResult(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceReceiveResult` entity instance. Pass `nil` for no initial data.

#### `DeviceRkiActivateResult(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceRkiActivateResult` entity instance. Pass `nil` for no initial data.

#### `DeviceState(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceState` entity instance. Pass `nil` for no initial data.

#### `DeviceType(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `DeviceType` entity instance. Pass `nil` for no initial data.

#### `InjectKey(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `InjectKey` entity instance. Pass `nil` for no initial data.

#### `Kif(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Kif` entity instance. Pass `nil` for no initial data.

#### `Location(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Location` entity instance. Pass `nil` for no initial data.

#### `Partner(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `Shipment(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Shipment` entity instance. Pass `nil` for no initial data.

#### `Success(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Success` entity instance. Pass `nil` for no initial data.

#### `Transaction(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `UpdateResult(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `User(data map[string]any) BluefinDecryptxP2peEntity`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## AttestationEntity

```go
attestation := client.Attestation(nil)
fmt.Println(attestation.GetName()) // "attestation"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map[string]any` | No |  |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `map[string]any` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Attestation(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Attestation(nil).Load(map[string]any{"id": "attestation_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Attestation(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AttestationEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ClientEntity

```go
client_ := client.Client(nil)
fmt.Println(client_.GetName()) // "client"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `map[string]any` | No |  |
| `created` | `string` | No |  |
| `directPartner` | `map[string]any` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `map[string]any` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `map[string]any` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create | remove |
| --- | --- | --- | --- | --- |
| `contact` | - | Yes | - | - |
| `created` | - | - | - | - |
| `directPartner` | - | - | - | - |
| `id` | - | - | - | - |
| `isActive` | - | - | - | - |
| `location` | - | - | - | - |
| `mid` | - | - | - | - |
| `modified` | - | - | - | - |
| `name` | - | - | - | - |
| `partner` | - | - | - | - |
| `version` | - | - | - | - |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Client(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Client(nil).Load(map[string]any{"id": "client_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Client(nil).Create(map[string]any{
    "location": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.Client(nil).Remove(map[string]any{"id": "client_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ClientEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## CreateResultEntity

```go
createResult := client.CreateResult(nil)
fmt.Println(createResult.GetName()) // "create_result"
```

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.CreateResult(nil).Create(map[string]any{
    "device_type": "example_device_type",
    "serial_number": "example_serial_number",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `CreateResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DecryptionEntity

```go
decryption := client.Decryption(nil)
fmt.Println(decryption.GetName()) // "decryption"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Decryption(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DecryptionEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceEntity

```go
device := client.Device(nil)
fmt.Println(device.GetName()) // "device"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activatedBy` | `map[string]any` | Yes |  |
| `activationDate` | `string` | No |  |
| `alternateKey` | `string` | No |  |
| `auditNextDate` | `string` | No |  |
| `auditNotificationDate` | `string` | No |  |
| `client` | `map[string]any` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `map[string]any` | Yes |  |
| `deviceBuild` | `map[string]any` | No |  |
| `deviceState` | `map[string]any` | No |  |
| `deviceType` | `map[string]any` | No |  |
| `errorCounter` | `int` | No |  |
| `errorLastDate` | `string` | No |  |
| `id` | `string` | No |  |
| `initializedBy` | `map[string]any` | Yes |  |
| `initializedDate` | `string` | No |  |
| `injectKey` | `map[string]any` | No |  |
| `isVirtual` | `bool` | No |  |
| `kif` | `map[string]any` | No |  |
| `lastActivityDate` | `string` | No |  |
| `location` | `map[string]any` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `map[string]any` | Yes |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `partner` | `map[string]any` | No |  |
| `serialNumber` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Device(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Device(nil).Load(map[string]any{"id": "device_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Device(nil).Create(map[string]any{
    "activatedBy": map[string]any{},
    "createdBy": map[string]any{},
    "initializedBy": map[string]any{},
    "location": map[string]any{},
    "modifiedBy": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceBuildEntity

```go
deviceBuild := client.DeviceBuild(nil)
fmt.Println(deviceBuild.GetName()) // "device_build"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `appVersion` | `string` | No |  |
| `buildNumber` | `string` | No |  |
| `configFileName` | `string` | No |  |
| `created` | `string` | No |  |
| `deviceType` | `string` | No |  |
| `firmwareVersion` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `int` | No |  |
| `isActive` | `bool` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `version` | `int` | No |  |
| `whiteListingBinRanges` | `string` | No |  |
| `whiteListingUsed` | `bool` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.DeviceBuild(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.DeviceBuild(nil).Load(map[string]any{"id": "device_build_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceBuildEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceCustodyDetailEntity

```go
deviceCustodyDetail := client.DeviceCustodyDetail(nil)
fmt.Println(deviceCustodyDetail.GetName()) // "device_custody_detail"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `map[string]any` | Yes |  |
| `custodian` | `map[string]any` | Yes |  |
| `device` | `map[string]any` | No |  |
| `id` | `int` | No |  |
| `location` | `map[string]any` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `map[string]any` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `map[string]any` | No |  |
| `transferMethod` | `map[string]any` | No |  |
| `version` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.DeviceCustodyDetail(nil).Load(map[string]any{"id": "device_custody_detail_id", "device_type": "device_type", "serial_number": "serial_number"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceCustodyDetailEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceCustodyListEntity

```go
deviceCustodyList := client.DeviceCustodyList(nil)
fmt.Println(deviceCustodyList.GetName()) // "device_custody_list"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `map[string]any` | Yes |  |
| `custodian` | `map[string]any` | Yes |  |
| `device` | `map[string]any` | No |  |
| `id` | `int` | No |  |
| `location` | `map[string]any` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `map[string]any` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `map[string]any` | No |  |
| `transferMethod` | `map[string]any` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.DeviceCustodyList(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceCustodyListEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceListEntity

```go
deviceList := client.DeviceList(nil)
fmt.Println(deviceList.GetName()) // "device_list"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `[]any` | No |  |
| `total` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.DeviceList(nil).Load(map[string]any{"share_partner_to": "share_partner_to"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceListEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceReceiveResultEntity

```go
deviceReceiveResult := client.DeviceReceiveResult(nil)
fmt.Println(deviceReceiveResult.GetName()) // "device_receive_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.DeviceReceiveResult(nil).Create(map[string]any{
    "success": true,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceReceiveResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceRkiActivateResultEntity

```go
deviceRkiActivateResult := client.DeviceRkiActivateResult(nil)
fmt.Println(deviceRkiActivateResult.GetName()) // "device_rki_activate_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | Yes |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.DeviceRkiActivateResult(nil).Create(map[string]any{
    "success": true,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceRkiActivateResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceStateEntity

```go
deviceState := client.DeviceState(nil)
fmt.Println(deviceState.GetName()) // "device_state"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.DeviceState(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceStateEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## DeviceTypeEntity

```go
deviceType := client.DeviceType(nil)
fmt.Println(deviceType.GetName()) // "device_type"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `deviceTypeMode` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.DeviceType(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.DeviceType(nil).Load(map[string]any{"id": "device_type_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `DeviceTypeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## InjectKeyEntity

```go
injectKey := client.InjectKey(nil)
fmt.Println(injectKey.GetName()) // "inject_key"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `isP2PE` | `bool` | No |  |
| `keyType` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.InjectKey(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.InjectKey(nil).Load(map[string]any{"id": "inject_key_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `InjectKeyEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## KifEntity

```go
kif := client.Kif(nil)
fmt.Println(kif.GetName()) // "kif"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `name` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Kif(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `KifEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## LocationEntity

```go
location := client.Location(nil)
fmt.Println(location.GetName()) // "location"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `address1` | `string` | No |  |
| `address2` | `string` | No |  |
| `billingId` | `string` | No |  |
| `city` | `string` | No |  |
| `country` | `string` | No |  |
| `created` | `string` | No |  |
| `customReference` | `string` | No |  |
| `id` | `string` | No |  |
| `locationType` | `string` | No |  |
| `mailAddress1` | `string` | No |  |
| `mailAddress2` | `string` | No |  |
| `mailCity` | `string` | No |  |
| `mailCountry` | `string` | No |  |
| `mailPostalCode` | `string` | No |  |
| `mailStateProvince` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `nameOfBusiness` | `string` | No |  |
| `notes` | `string` | No |  |
| `postalCode` | `string` | No |  |
| `stateProvince` | `string` | No |  |
| `uniqueId` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Location(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Location(nil).Load(map[string]any{"id": "location_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Location(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.Location(nil).Remove(map[string]any{"id": "location_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `LocationEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PartnerEntity

```go
partner := client.Partner(nil)
fmt.Println(partner.GetName()) // "partner"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billingId` | `string` | No |  |
| `clientCanOrderEquipment` | `bool` | No |  |
| `contact` | `map[string]any` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `location` | `map[string]any` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `map[string]any` | No |  |
| `partnerId` | `string` | No |  |
| `reference` | `string` | No |  |
| `verificationPhrase` | `string` | No |  |
| `version` | `int` | No |  |

### Field Usage by Operation

| Field | load | list | create |
| --- | --- | --- | --- |
| `billingId` | - | - | - |
| `clientCanOrderEquipment` | - | - | - |
| `contact` | - | Yes | - |
| `created` | - | - | - |
| `id` | - | - | - |
| `isActive` | - | - | - |
| `location` | - | - | - |
| `modified` | - | - | - |
| `name` | - | - | - |
| `parent` | - | - | - |
| `partnerId` | - | - | - |
| `reference` | - | - | - |
| `verificationPhrase` | - | - | - |
| `version` | - | - | - |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Partner(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Partner(nil).Load(map[string]any{"id": "partner_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Partner(nil).Create(map[string]any{
    "location": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PartnerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ShipmentEntity

```go
shipment := client.Shipment(nil)
fmt.Println(shipment.GetName()) // "shipment"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `map[string]any` | No |  |
| `created` | `string` | No |  |
| `dateReceived` | `string` | No |  |
| `dateShipped` | `string` | No |  |
| `dcKif` | `map[string]any` | No |  |
| `id` | `string` | No |  |
| `items` | `[]any` | No |  |
| `kif` | `map[string]any` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map[string]any` | No |  |
| `shipmentType` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Shipment(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Shipment(nil).Load(map[string]any{"id": "shipment_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Shipment(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ShipmentEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SuccessEntity

```go
success := client.Success(nil)
fmt.Println(success.GetName()) // "success"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `bool` | No |  |

### Operations

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Success(nil).Create(map[string]any{
    "share_partner_to": "example_share_partner_to",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.Success(nil).Remove(map[string]any{"share_partner_to": "share_partner_to"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SuccessEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TransactionEntity

```go
transaction := client.Transaction(nil)
fmt.Println(transaction.GetName()) // "transaction"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternateKey` | `string` | No |  |
| `client` | `map[string]any` | No |  |
| `clientRef` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `int` | No |  |
| `deviceName` | `string` | No |  |
| `directPartner` | `map[string]any` | No |  |
| `encrypted` | `int` | No |  |
| `endDate` | `string` | No |  |
| `errCode` | `string` | No |  |
| `errMessage` | `string` | No |  |
| `id` | `string` | No |  |
| `ipAddress` | `string` | No |  |
| `isVirtual` | `bool` | No |  |
| `keyType` | `string` | No |  |
| `location` | `map[string]any` | Yes |  |
| `messageId` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `map[string]any` | No |  |
| `reference` | `string` | No |  |
| `serialNumber` | `string` | No |  |
| `startDate` | `string` | No |  |
| `success` | `bool` | No |  |
| `transactionSource` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Transaction(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Transaction(nil).Load(map[string]any{"id": "transaction_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.Transaction(nil).Create(map[string]any{
    "location": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TransactionEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## UpdateResultEntity

```go
updateResult := client.UpdateResult(nil)
fmt.Println(updateResult.GetName()) // "update_result"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map[string]any` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `map[string]any` | No |  |
| `lastName` | `string` | No |  |
| `partner` | `map[string]any` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `map[string]any` | No |  |
| `version` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.UpdateResult(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

#### `Create(reqdata, ctrl map[string]any) (any, error)`

Create a new entity with the given data.

```go
result, err := client.UpdateResult(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Update(reqdata, ctrl map[string]any) (any, error)`

Update an existing entity. The data must include the entity `id`.

```go
result, err := client.UpdateResult(nil).Update(map[string]any{
    "id": "id",
    // Fields to update
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `UpdateResultEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## UserEntity

```go
user := client.User(nil)
fmt.Println(user.GetName()) // "user"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map[string]any` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `bool` | No |  |
| `kif` | `map[string]any` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map[string]any` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `map[string]any` | No |  |
| `version` | `int` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.User(nil).Load(map[string]any{"id": "user_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

#### `Remove(reqmatch, ctrl map[string]any) (any, error)`

Remove the entity matching the given criteria.

```go
result, err := client.User(nil).Remove(map[string]any{"id": "user_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `UserEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewBluefinDecryptxP2peSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

