# BluefinDecryptxP2pe Golang SDK



The Golang SDK for the BluefinDecryptxP2pe API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Attestation(nil)` — each with the same small set of operations (`List`, `Load`, `Create`, `Update`, `Remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go=../bluefin-decryptx-p2pe-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    "os"
    sdk "github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go"
)

func main() {
    client := sdk.NewBluefinDecryptxP2peSDK(map[string]any{
        "apikey": os.Getenv("BLUEFIN_DECRYPTX_P2PE_APIKEY"),
    })

    // List attestation records — the value is the array of records itself.
    attestations, err := client.Attestation(nil).List(nil, nil)
    if err != nil {
        panic(err)
    }
    for _, item := range attestations.([]any) {
        fmt.Println(item)
    }

    // Load a single attestation — the value is the loaded record.
    attestation, err := client.Attestation(nil).Load(map[string]any{"id": "example_id"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(attestation)

    // Create a attestation.
    created, err := client.Attestation(nil).Create(map[string]any{"client": map[string]any{}, "complete_date": "example_complete_date"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(created)
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
attestations, err := client.Attestation(nil).List(nil, nil)
if err != nil {
    // handle err
    return
}
_ = attestations
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

attestation, err := client.Attestation(nil).List(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(attestation) // the returned mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewBluefinDecryptxP2peSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_DECRYPTX_P2PE_TEST_LIVE=TRUE
BLUEFIN_DECRYPTX_P2PE_APIKEY=<your-key>
```

Then run:

```bash
cd go && go test ./test/...
```


## Reference

### NewBluefinDecryptxP2peSDK

```go
func NewBluefinDecryptxP2peSDK(options map[string]any) *BluefinDecryptxP2peSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"apikey"` | `string` | API key for authentication. |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *BluefinDecryptxP2peSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### BluefinDecryptxP2peSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Attestation` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create an Attestation entity instance. |
| `Client` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Client entity instance. |
| `CreateResult` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a CreateResult entity instance. |
| `Decryption` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Decryption entity instance. |
| `Device` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Device entity instance. |
| `DeviceBuild` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceCustodyList entity instance. |
| `DeviceList` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceState entity instance. |
| `DeviceType` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a DeviceType entity instance. |
| `InjectKey` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create an InjectKey entity instance. |
| `Kif` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Kif entity instance. |
| `Location` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Location entity instance. |
| `Partner` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Partner entity instance. |
| `Shipment` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Shipment entity instance. |
| `Success` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Success entity instance. |
| `Transaction` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create a Transaction entity instance. |
| `UpdateResult` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create an UpdateResult entity instance. |
| `User` | `(data map[string]any) BluefinDecryptxP2peEntity` | Create an User entity instance. |

### Entity interface (BluefinDecryptxP2peEntity)

All entities implement the `BluefinDecryptxP2peEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` / `Update` / `Remove` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    attestation, err := client.Attestation(nil).List(map[string]any{/* fields */}, nil)
    if err != nil { /* handle */ }
    // attestation is the returned record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `"client"` |  |
| `"complete_date"` |  |
| `"created"` |  |
| `"device"` |  |
| `"id"` |  |
| `"name"` |  |
| `"note"` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `"contact"` |  |
| `"created"` |  |
| `"direct_partner"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"location"` |  |
| `"mid"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"partner"` |  |
| `"version"` |  |

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
| `"success"` |  |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `"activated_by"` |  |
| `"activation_date"` |  |
| `"alternate_key"` |  |
| `"audit_next_date"` |  |
| `"audit_notification_date"` |  |
| `"client"` |  |
| `"created"` |  |
| `"created_by"` |  |
| `"device_build"` |  |
| `"device_state"` |  |
| `"device_type"` |  |
| `"error_counter"` |  |
| `"error_last_date"` |  |
| `"id"` |  |
| `"initialized_by"` |  |
| `"initialized_date"` |  |
| `"inject_key"` |  |
| `"is_virtual"` |  |
| `"kif"` |  |
| `"last_activity_date"` |  |
| `"location"` |  |
| `"modified"` |  |
| `"modified_by"` |  |
| `"name"` |  |
| `"note"` |  |
| `"partner"` |  |
| `"serial_number"` |  |
| `"version"` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `"app_version"` |  |
| `"build_number"` |  |
| `"config_file_name"` |  |
| `"created"` |  |
| `"device_type"` |  |
| `"firmware_version"` |  |
| `"hardware_version"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"note"` |  |
| `"version"` |  |
| `"white_listing_bin_range"` |  |
| `"white_listing_used"` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `"complete_date"` |  |
| `"created"` |  |
| `"created_by"` |  |
| `"custodian"` |  |
| `"device"` |  |
| `"id"` |  |
| `"location"` |  |
| `"modified"` |  |
| `"modified_by"` |  |
| `"note"` |  |
| `"status"` |  |
| `"transfer_method"` |  |
| `"version"` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `"complete_date"` |  |
| `"created"` |  |
| `"created_by"` |  |
| `"custodian"` |  |
| `"device"` |  |
| `"id"` |  |
| `"location"` |  |
| `"modified"` |  |
| `"modified_by"` |  |
| `"note"` |  |
| `"status"` |  |
| `"transfer_method"` |  |
| `"version"` |  |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `"data"` |  |
| `"total"` |  |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `"success"` |  |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `"success"` |  |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `"id"` |  |
| `"name"` |  |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `"created"` |  |
| `"device_type_mode"` |  |
| `"hardware_version"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"manufacturer"` |  |
| `"model"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"photo_url"` |  |
| `"product_name"` |  |
| `"version"` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `"created"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"is_p2_pe"` |  |
| `"key_type"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"version"` |  |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `"id"` |  |
| `"name"` |  |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `"address1"` |  |
| `"address2"` |  |
| `"billing_id"` |  |
| `"city"` |  |
| `"country"` |  |
| `"created"` |  |
| `"custom_reference"` |  |
| `"id"` |  |
| `"location_type"` |  |
| `"mail_address1"` |  |
| `"mail_address2"` |  |
| `"mail_city"` |  |
| `"mail_country"` |  |
| `"mail_postal_code"` |  |
| `"mail_state_province"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"name_of_business"` |  |
| `"note"` |  |
| `"postal_code"` |  |
| `"state_province"` |  |
| `"unique_id"` |  |
| `"version"` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `"billing_id"` |  |
| `"client_can_order_equipment"` |  |
| `"contact"` |  |
| `"created"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"location"` |  |
| `"modified"` |  |
| `"name"` |  |
| `"parent"` |  |
| `"partner_id"` |  |
| `"reference"` |  |
| `"verification_phrase"` |  |
| `"version"` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `"carrier"` |  |
| `"client"` |  |
| `"created"` |  |
| `"date_received"` |  |
| `"date_shipped"` |  |
| `"dc_kif"` |  |
| `"id"` |  |
| `"item"` |  |
| `"kif"` |  |
| `"modified"` |  |
| `"partner"` |  |
| `"shipment_type"` |  |
| `"tracking"` |  |
| `"version"` |  |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `"success"` |  |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `"alternate_key"` |  |
| `"client"` |  |
| `"client_ref"` |  |
| `"created"` |  |
| `"decrypted"` |  |
| `"device_name"` |  |
| `"direct_partner"` |  |
| `"encrypted"` |  |
| `"end_date"` |  |
| `"err_code"` |  |
| `"err_message"` |  |
| `"id"` |  |
| `"ip_address"` |  |
| `"is_virtual"` |  |
| `"key_type"` |  |
| `"location"` |  |
| `"message_id"` |  |
| `"method"` |  |
| `"partner"` |  |
| `"reference"` |  |
| `"serial_number"` |  |
| `"start_date"` |  |
| `"success"` |  |
| `"transaction_source"` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `"client"` |  |
| `"email"` |  |
| `"first_name"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"kif"` |  |
| `"last_name"` |  |
| `"partner"` |  |
| `"phone"` |  |
| `"user_name"` |  |
| `"user_role"` |  |
| `"version"` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `"client"` |  |
| `"created"` |  |
| `"email"` |  |
| `"first_name"` |  |
| `"id"` |  |
| `"is_active"` |  |
| `"kif"` |  |
| `"last_name"` |  |
| `"modified"` |  |
| `"partner"` |  |
| `"phone"` |  |
| `"user_name"` |  |
| `"user_role"` |  |
| `"version"` |  |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `attestation := client.Attestation(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map[string]any` |  |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `device` | `map[string]any` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |

#### Example: Load

```go
attestation, err := client.Attestation(nil).Load(map[string]any{"id": "attestation_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(attestation) // the loaded record
```

#### Example: List

```go
attestations, err := client.Attestation(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(attestations) // the array of records
```

#### Example: Create

```go
result, err := client.Attestation(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Client

Create an instance: `client_ := client.Client(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `map[string]any` |  |
| `created` | `string` |  |
| `direct_partner` | `map[string]any` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `location` | `map[string]any` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `map[string]any` |  |
| `version` | `int` |  |

#### Example: Load

```go
client_, err := client.Client(nil).Load(map[string]any{"id": "client_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(client_) // the loaded record
```

#### Example: List

```go
client_s, err := client.Client(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(client_s) // the array of records
```

#### Example: Create

```go
result, err := client.Client(nil).Create(map[string]any{
    "location": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### CreateResult

Create an instance: `createResult := client.CreateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Example: Create

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


### Decryption

Create an instance: `decryption := client.Decryption(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```go
result, err := client.Decryption(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Device

Create an instance: `device := client.Device(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `map[string]any` |  |
| `activation_date` | `string` |  |
| `alternate_key` | `string` |  |
| `audit_next_date` | `string` |  |
| `audit_notification_date` | `string` |  |
| `client` | `map[string]any` |  |
| `created` | `string` |  |
| `created_by` | `map[string]any` |  |
| `device_build` | `map[string]any` |  |
| `device_state` | `map[string]any` |  |
| `device_type` | `map[string]any` |  |
| `error_counter` | `int` |  |
| `error_last_date` | `string` |  |
| `id` | `string` |  |
| `initialized_by` | `map[string]any` |  |
| `initialized_date` | `string` |  |
| `inject_key` | `map[string]any` |  |
| `is_virtual` | `bool` |  |
| `kif` | `map[string]any` |  |
| `last_activity_date` | `string` |  |
| `location` | `map[string]any` |  |
| `modified` | `string` |  |
| `modified_by` | `map[string]any` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `partner` | `map[string]any` |  |
| `serial_number` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```go
device, err := client.Device(nil).Load(map[string]any{"id": "device_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(device) // the loaded record
```

#### Example: List

```go
devices, err := client.Device(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(devices) // the array of records
```

#### Example: Create

```go
result, err := client.Device(nil).Create(map[string]any{
    "activated_by": map[string]any{},
    "created_by": map[string]any{},
    "initialized_by": map[string]any{},
    "location": map[string]any{},
    "modified_by": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### DeviceBuild

Create an instance: `deviceBuild := client.DeviceBuild(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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
| `id` | `int` |  |
| `is_active` | `bool` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `version` | `int` |  |
| `white_listing_bin_range` | `string` |  |
| `white_listing_used` | `bool` |  |

#### Example: Load

```go
deviceBuild, err := client.DeviceBuild(nil).Load(map[string]any{"id": "device_build_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceBuild) // the loaded record
```

#### Example: List

```go
deviceBuilds, err := client.DeviceBuild(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceBuilds) // the array of records
```


### DeviceCustodyDetail

Create an instance: `deviceCustodyDetail := client.DeviceCustodyDetail(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `map[string]any` |  |
| `custodian` | `map[string]any` |  |
| `device` | `map[string]any` |  |
| `id` | `int` |  |
| `location` | `map[string]any` |  |
| `modified` | `string` |  |
| `modified_by` | `map[string]any` |  |
| `note` | `string` |  |
| `status` | `map[string]any` |  |
| `transfer_method` | `map[string]any` |  |
| `version` | `int` |  |

#### Example: Load

```go
deviceCustodyDetail, err := client.DeviceCustodyDetail(nil).Load(map[string]any{"id": "device_custody_detail_id", "device_type": "device_type", "serial_number": "serial_number"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceCustodyDetail) // the loaded record
```


### DeviceCustodyList

Create an instance: `deviceCustodyList := client.DeviceCustodyList(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `map[string]any` |  |
| `custodian` | `map[string]any` |  |
| `device` | `map[string]any` |  |
| `id` | `int` |  |
| `location` | `map[string]any` |  |
| `modified` | `string` |  |
| `modified_by` | `map[string]any` |  |
| `note` | `string` |  |
| `status` | `map[string]any` |  |
| `transfer_method` | `map[string]any` |  |
| `version` | `int` |  |

#### Example: List

```go
deviceCustodyLists, err := client.DeviceCustodyList(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceCustodyLists) // the array of records
```


### DeviceList

Create an instance: `deviceList := client.DeviceList(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `[]any` |  |
| `total` | `int` |  |

#### Example: Load

```go
deviceList, err := client.DeviceList(nil).Load(map[string]any{"share_partner_to": "share_partner_to"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceList) // the loaded record
```


### DeviceReceiveResult

Create an instance: `deviceReceiveResult := client.DeviceReceiveResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```go
result, err := client.DeviceReceiveResult(nil).Create(map[string]any{
    "success": true,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### DeviceRkiActivateResult

Create an instance: `deviceRkiActivateResult := client.DeviceRkiActivateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```go
result, err := client.DeviceRkiActivateResult(nil).Create(map[string]any{
    "success": true,
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### DeviceState

Create an instance: `deviceState := client.DeviceState(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```go
deviceStates, err := client.DeviceState(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceStates) // the array of records
```


### DeviceType

Create an instance: `deviceType := client.DeviceType(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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
| `version` | `int` |  |

#### Example: Load

```go
deviceType, err := client.DeviceType(nil).Load(map[string]any{"id": "device_type_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceType) // the loaded record
```

#### Example: List

```go
deviceTypes, err := client.DeviceType(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(deviceTypes) // the array of records
```


### InjectKey

Create an instance: `injectKey := client.InjectKey(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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
| `version` | `int` |  |

#### Example: Load

```go
injectKey, err := client.InjectKey(nil).Load(map[string]any{"id": "inject_key_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(injectKey) // the loaded record
```

#### Example: List

```go
injectKeys, err := client.InjectKey(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(injectKeys) // the array of records
```


### Kif

Create an instance: `kif := client.Kif(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `int` |  |
| `name` | `string` |  |

#### Example: List

```go
kifs, err := client.Kif(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(kifs) // the array of records
```


### Location

Create an instance: `location := client.Location(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Remove(match, ctrl)` | Remove the matching entity. |

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
| `version` | `int` |  |

#### Example: Load

```go
location, err := client.Location(nil).Load(map[string]any{"id": "location_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(location) // the loaded record
```

#### Example: List

```go
locations, err := client.Location(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(locations) // the array of records
```

#### Example: Create

```go
result, err := client.Location(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Partner

Create an instance: `partner := client.Partner(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client_can_order_equipment` | `bool` |  |
| `contact` | `map[string]any` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `location` | `map[string]any` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `map[string]any` |  |
| `partner_id` | `string` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```go
partner, err := client.Partner(nil).Load(map[string]any{"id": "partner_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(partner) // the loaded record
```

#### Example: List

```go
partners, err := client.Partner(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(partners) // the array of records
```

#### Example: Create

```go
result, err := client.Partner(nil).Create(map[string]any{
    "location": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Shipment

Create an instance: `shipment := client.Shipment(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `map[string]any` |  |
| `created` | `string` |  |
| `date_received` | `string` |  |
| `date_shipped` | `string` |  |
| `dc_kif` | `map[string]any` |  |
| `id` | `string` |  |
| `item` | `[]any` |  |
| `kif` | `map[string]any` |  |
| `modified` | `string` |  |
| `partner` | `map[string]any` |  |
| `shipment_type` | `string` |  |
| `tracking` | `string` |  |
| `version` | `int` |  |

#### Example: Load

```go
shipment, err := client.Shipment(nil).Load(map[string]any{"id": "shipment_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(shipment) // the loaded record
```

#### Example: List

```go
shipments, err := client.Shipment(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(shipments) // the array of records
```

#### Example: Create

```go
result, err := client.Shipment(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Success

Create an instance: `success := client.Success(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `bool` |  |

#### Example: Create

```go
result, err := client.Success(nil).Create(map[string]any{
    "share_partner_to": "example_share_partner_to",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### Transaction

Create an instance: `transaction := client.Transaction(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `string` |  |
| `client` | `map[string]any` |  |
| `client_ref` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `int` |  |
| `device_name` | `string` |  |
| `direct_partner` | `map[string]any` |  |
| `encrypted` | `int` |  |
| `end_date` | `string` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `string` |  |
| `ip_address` | `string` |  |
| `is_virtual` | `bool` |  |
| `key_type` | `string` |  |
| `location` | `map[string]any` |  |
| `message_id` | `string` |  |
| `method` | `string` |  |
| `partner` | `map[string]any` |  |
| `reference` | `string` |  |
| `serial_number` | `string` |  |
| `start_date` | `string` |  |
| `success` | `bool` |  |
| `transaction_source` | `string` |  |

#### Example: Load

```go
transaction, err := client.Transaction(nil).Load(map[string]any{"id": "transaction_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(transaction) // the loaded record
```

#### Example: List

```go
transactions, err := client.Transaction(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(transactions) // the array of records
```

#### Example: Create

```go
result, err := client.Transaction(nil).Create(map[string]any{
    "location": map[string]any{},
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### UpdateResult

Create an instance: `updateResult := client.UpdateResult(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Create(data, ctrl)` | Create a new entity with the given data. |
| `Update(data, ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map[string]any` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `kif` | `map[string]any` |  |
| `last_name` | `string` |  |
| `partner` | `map[string]any` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `map[string]any` |  |
| `version` | `int` |  |

#### Example: List

```go
updateResults, err := client.UpdateResult(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(updateResults) // the array of records
```

#### Example: Create

```go
result, err := client.UpdateResult(nil).Create(map[string]any{
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result)
```


### User

Create an instance: `user := client.User(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |
| `Remove(match, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map[string]any` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `bool` |  |
| `kif` | `map[string]any` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `map[string]any` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `map[string]any` |  |
| `version` | `int` |  |

#### Example: Load

```go
user, err := client.User(nil).Load(map[string]any{"id": "user_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(user) // the loaded record
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go/
├── bluefin-decryptx-p2pe.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `List`, the entity
stores the returned data and match criteria internally.

```go
attestation := client.Attestation(nil)
attestation.List(nil, nil)

// attestation.Data() now returns the attestation data from the last list
// attestation.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
