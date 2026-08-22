# BluefinDecryptxP2pe Golang SDK



The Golang SDK for the BluefinDecryptxP2pe API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.Attestation(nil)` — each with the same small set of operations (`List`, `Load`, `Create`, `Update`, `Remove`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Also generated from this model: `c`, `clojure`, `cpp`, `csharp`, `dart`, `elixir`, `go-cli`, `go-mcp`, `java`, `js`, `kotlin`, `lua`, `ocaml`, `perl`, `php`, `py`, `rb`, `rust`, `scala`, `swift`, `ts`, `zig` — see
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
    created, err := client.Attestation(nil).Create(map[string]any{"client": map[string]any{}, "completeDate": "example_completeDate"}, nil)
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
devicetypes, err := client.DeviceType(nil).List(nil, nil)
if err != nil {
    // handle err
    return
}
_ = devicetypes
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

deviceType, err := client.DeviceType(nil).List(
    nil, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(deviceType) // the returned mock data
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
| `"client"` | Reference to the associated Client resource. |
| `"completeDate"` | The date and time that the Attestation took place. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"device"` | Reference to the associated Device resource. |
| `"id"` | This resource's unique identifier. |
| `"name"` | Text describing the attestation. |
| `"notes"` | Free form field that allows the Client associate notes with the Attestation. |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `"contact"` | Reference to the associated User resource. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"directPartner"` | Reference to the associated Partner. |
| `"id"` | This resource's unique identifier. |
| `"isActive"` | This property indicates if the Client account is active or disabled. |
| `"location"` | Reference to the associated Location resource. |
| `"mid"` | Some Partners will have an merchant ids on their own software offerings. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The Client's name. |
| `"partner"` | Reference to the Client's root Partner. |
| `"version"` | The number of times that this resource has been updated. |

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
| `"success"` | true if the payload decryption was successful. |

Operations: Create.

API path: `/decryption`

#### Device

| Field | Description |
| --- | --- |
| `"activatedBy"` | Reference to the associated User resource. |
| `"activationDate"` | Timestamp from when the Device was activated. |
| `"alternateKey"` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `"auditNextDate"` | Date and time that the Device is due its next PCI Audit. |
| `"auditNotificationDate"` | Date and time that a notification should be sent that a PCI audit is due. |
| `"client"` | Reference to the associated Client resource. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"createdBy"` | Reference to the associated User resource. |
| `"deviceBuild"` | Reference to the associated Device Build resource. |
| `"deviceState"` | Reference to the associated Device State resource. |
| `"deviceType"` | Reference to the associated Device Type resource. |
| `"errorCounter"` | The number times the Device has been in error. |
| `"errorLastDate"` | Timestamp from the last time that the Device had an error. |
| `"id"` | The Device's unique identifier. |
| `"initializedBy"` | Reference to the associated User resource. |
| `"initializedDate"` | Timestamp from when the Device was initialized. |
| `"injectKey"` | Reference to the associated Device resource. |
| `"isVirtual"` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `"kif"` | Reference to the associated KIF resource. |
| `"lastActivityDate"` | Timestamp from the last time that the Device was used. |
| `"location"` | Reference to the associated Location resource. |
| `"modified"` | Last modified timestamp. |
| `"modifiedBy"` | Reference to the associated User resource. |
| `"name"` | The Device's name. |
| `"notes"` | Arbitary note that can be attached to a Device entry. |
| `"partner"` | Reference to the associated Partner. |
| `"serialNumber"` | The Device's serial number. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `"appVersion"` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `"buildNumber"` | The Build Number. |
| `"configFileName"` | The name of the configuration file that is uploaded to the device. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"deviceType"` | The Device Type Name. |
| `"firmwareVersion"` | A list of firmware versions that this Device Build covers. |
| `"hardwareVersion"` | A list of hardware versions that this Device Build covers. |
| `"id"` | This resource's unique identifier. |
| `"isActive"` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The Device Builds's name. |
| `"notes"` | Notes attached to the device build by Bluefin CISO. |
| `"version"` | The number of times that this resource has been updated. |
| `"whiteListingBinRanges"` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `"whiteListingUsed"` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `"completeDate"` | The date and time that the Custody change took place. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"createdBy"` | Reference to the associated User resource. |
| `"custodian"` | Reference to the associated User resource. |
| `"device"` | Reference to the associated Device resource. |
| `"id"` | This resource's unique identifier. |
| `"location"` | Reference to the associated Location resource. |
| `"modified"` | Last modified timestamp. |
| `"modifiedBy"` | Reference to the associated User resource. |
| `"notes"` | Free form field that allows the Client associate notes with the Custody Change. |
| `"status"` | Reference to the associated Custody Status. |
| `"transferMethod"` | Reference to the associated Transfer Method. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `"completeDate"` | The date and time that the Custody change took place. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"createdBy"` | Reference to the associated User resource. |
| `"custodian"` | Reference to the associated User resource. |
| `"device"` | Reference to the associated Device resource. |
| `"id"` | This resource's unique identifier. |
| `"location"` | Reference to the associated Location resource. |
| `"modified"` | Last modified timestamp. |
| `"modifiedBy"` | Reference to the associated User resource. |
| `"notes"` | Free form field that allows the Client associate notes with the Custody Change. |
| `"status"` | Reference to the associated Custody Status. |
| `"transferMethod"` | Reference to the associated Transfer Method. |
| `"version"` | The number of times that this resource has been updated. |

Operations: List.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `"data"` | List of Devices. |
| `"total"` | Total number of Devices available (not the number of Users in the response). |

Operations: Load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `"success"` | Indicates if the action succeeded. |

Operations: Create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `"success"` | Indicates if the RKI activation succeeded. |

Operations: Create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `"id"` | Unique identifier for this Device state. |
| `"name"` | Descriptive name for this Device state. |

Operations: List.

API path: `/deviceStates`

#### DeviceType

| Field | Description |
| --- | --- |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"deviceTypeMode"` | The Device type. |
| `"hardwareVersion"` | The Device hardware version. |
| `"id"` | Unique idenifier. |
| `"isActive"` | This property indicates if the DeviceType is active. |
| `"manufacturer"` | The Device manufacturer. |
| `"model"` | The Device model. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The DeviceType name. |
| `"photoUrl"` |  |
| `"productName"` | The Device name. |
| `"version"` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"id"` | unique idenifier |
| `"isActive"` | Active flag, inactive keys cannot be assigned to devices. |
| `"isP2PE"` | Flags if a key is for a P2PE compliant cypher. |
| `"keyType"` | The cipher type that the key works with. |
| `"modified"` | Last modified timestamp in ISO 8601 format. |
| `"name"` | Key name. |
| `"version"` | The number of times that this resource has been updated. |

Operations: List, Load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `"id"` | This resource's unique identifier. |
| `"name"` | The KIF's name. |

Operations: List.

API path: `/kifs`

#### Location

| Field | Description |
| --- | --- |
| `"address1"` | The Location's street address. |
| `"address2"` | The Location's street address. |
| `"billingId"` | \? |
| `"city"` | The Location's city. |
| `"country"` | The Location's country. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"customReference"` | A Partner specified reference for a location. |
| `"id"` | This resource's unique identifier. |
| `"locationType"` | The Location's clasification. |
| `"mailAddress1"` | The Location's street address. |
| `"mailAddress2"` | The Location's street address. |
| `"mailCity"` | The Location's city. |
| `"mailCountry"` | The Location's street address. |
| `"mailPostalCode"` | The Location's postal code. |
| `"mailStateProvince"` | The Location's street state or province. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The Location's name. |
| `"nameOfBusiness"` | The name of the business at this location. |
| `"notes"` | Note for delivery driver. |
| `"postalCode"` | The Location's postal code. |
| `"stateProvince"` | The Location's street state or province. |
| `"uniqueId"` | Unique Identifier for the Location. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `"billingId"` | The Partner's billing identifier. |
| `"clientCanOrderEquipment"` | This property indicates if the Partner is allowed to order Equipment. |
| `"contact"` | Reference to the associated User resource. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"id"` | This resource's unique identifier. |
| `"isActive"` | This property indicates if the Parter account is active or disabled. |
| `"location"` | Reference to the associated Location resource. |
| `"modified"` | Last modified timestamp. |
| `"name"` | The Partner's name. |
| `"parent"` | Reference to the associated Partner. |
| `"partnerId"` | The Partner's id. |
| `"reference"` | The Partner's reference string. |
| `"verificationPhrase"` | The verification phrase is a message that the Partner creates. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `"carrier"` | The name of the courier. |
| `"client"` | Reference to the associated Client resource. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"dateReceived"` | The date and time that a package is recieved. |
| `"dateShipped"` | The date and time that a package is shipped. |
| `"dcKif"` | Reference to the associated KIF resource. |
| `"id"` | This resource's unique identifier. |
| `"items"` |  |
| `"kif"` | Reference to the associated KIF resource. |
| `"modified"` | Last modified timestamp. |
| `"partner"` | Reference to the associated Partner. |
| `"shipmentType"` | The type of shipment. |
| `"tracking"` | The courier's tracking number. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `"success"` | Indicates if the action was a success. |

Operations: Create, Remove.

API path: `/virtualDevices/{sharePartnerTo}`

#### Transaction

| Field | Description |
| --- | --- |
| `"alternateKey"` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `"client"` | Reference to the associated Client resource. |
| `"clientRef"` | Client Reference property that is included in the decrypt API call. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"decrypted"` | A Transcation can process muliple decryptions. |
| `"deviceName"` | The name of the Device that generated the payload to decrypt. |
| `"directPartner"` | Reference to the associated Partner. |
| `"encrypted"` | A Transcation can process muliple encryptions. |
| `"endDate"` | Timestamp from the end of the transaction. |
| `"errCode"` | The error code that is sent in response to a failed decrypt API call. |
| `"errMessage"` | The error messge that is sent in response to a failed decrypt API call. |
| `"id"` | This resource's unique identifier. |
| `"ipAddress"` | The IP address of the http client that makes the decrypt API call. |
| `"isVirtual"` | Indicates if the Transaction came from a virtual Device. |
| `"keyType"` | The type of cipher used during decrytion. |
| `"location"` | Reference to the associated Location resource. |
| `"messageId"` | Message ID. |
| `"method"` | The decryption cypher/method. |
| `"partner"` | Reference to the associated Partner. |
| `"reference"` | The reference property that the Client includes in the decrypt API call. |
| `"serialNumber"` | The serial number of the Device that generated the payload to decrypt. |
| `"startDate"` | Timestamp from the beginning of the transaction. |
| `"success"` | The success indicator. |
| `"transactionSource"` | The source of the Transaction. |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `"client"` | Reference to the associated Client resource. |
| `"email"` | The User's email address. |
| `"firstName"` | The User's name. |
| `"id"` | ID of newly created resource |
| `"isActive"` | This property indicates if the User account is active or disabled. |
| `"kif"` | Reference to the associated KIF resource. |
| `"lastName"` | The User's Surname. |
| `"partner"` | Reference to the associated Partner. |
| `"phone"` | The User's phone number without dashes, spaces, or brackets. |
| `"userName"` | The User's unique username. |
| `"userRole"` | Reference to the associated User Role. |
| `"version"` | The number of times that this resource has been updated. |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `"client"` | Reference to the associated Client resource. |
| `"created"` | Creation timestamp in ISO 8601 format. |
| `"email"` | The User's email address. |
| `"firstName"` | The User's name. |
| `"id"` | This resource's unique identifier. |
| `"isActive"` | This property indicates if the User account is active or disabled. |
| `"kif"` | Reference to the associated KIF resource. |
| `"lastName"` | The User's Surname. |
| `"modified"` | Last modified timestamp. |
| `"partner"` | Reference to the associated Partner. |
| `"phone"` | The User's phone number without dashes, spaces, or brackets. |
| `"userName"` | The User's unique username. |
| `"userRole"` | Reference to the associated User Role. |
| `"version"` | The number of times that this resource has been updated. |

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
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `completeDate` | `string` | The date and time that the Attestation took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `device` | `map[string]any` | Reference to the associated Device resource. |
| `id` | `string` | This resource's unique identifier. |
| `name` | `string` | Text describing the attestation. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `map[string]any` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map[string]any` | Reference to the associated Partner. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Client account is active or disabled. |
| `location` | `map[string]any` | Reference to the associated Location resource. |
| `mid` | `string` | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Client's name. |
| `partner` | `map[string]any` | Reference to the Client's root Partner. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `success` | `bool` | true if the payload decryption was successful. |

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
| `activatedBy` | `map[string]any` | Reference to the associated User resource. |
| `activationDate` | `string` | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map[string]any` | Reference to the associated User resource. |
| `deviceBuild` | `map[string]any` | Reference to the associated Device Build resource. |
| `deviceState` | `map[string]any` | Reference to the associated Device State resource. |
| `deviceType` | `map[string]any` | Reference to the associated Device Type resource. |
| `errorCounter` | `int` | The number times the Device has been in error. |
| `errorLastDate` | `string` | Timestamp from the last time that the Device had an error. |
| `id` | `string` | The Device's unique identifier. |
| `initializedBy` | `map[string]any` | Reference to the associated User resource. |
| `initializedDate` | `string` | Timestamp from when the Device was initialized. |
| `injectKey` | `map[string]any` | Reference to the associated Device resource. |
| `isVirtual` | `bool` | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `map[string]any` | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | Timestamp from the last time that the Device was used. |
| `location` | `map[string]any` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `map[string]any` | Reference to the associated User resource. |
| `name` | `string` | The Device's name. |
| `notes` | `string` | Arbitary note that can be attached to a Device entry. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `serialNumber` | `string` | The Device's serial number. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `appVersion` | `string` | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | The Build Number. |
| `configFileName` | `string` | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | The Device Type Name. |
| `firmwareVersion` | `string` | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | A list of hardware versions that this Device Build covers. |
| `id` | `int` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Device Builds's name. |
| `notes` | `string` | Notes attached to the device build by Bluefin CISO. |
| `version` | `int` | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `bool` | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map[string]any` | Reference to the associated User resource. |
| `custodian` | `map[string]any` | Reference to the associated User resource. |
| `device` | `map[string]any` | Reference to the associated Device resource. |
| `id` | `int` | This resource's unique identifier. |
| `location` | `map[string]any` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `map[string]any` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map[string]any` | Reference to the associated Custody Status. |
| `transferMethod` | `map[string]any` | Reference to the associated Transfer Method. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `completeDate` | `string` | The date and time that the Custody change took place. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map[string]any` | Reference to the associated User resource. |
| `custodian` | `map[string]any` | Reference to the associated User resource. |
| `device` | `map[string]any` | Reference to the associated Device resource. |
| `id` | `int` | This resource's unique identifier. |
| `location` | `map[string]any` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `modifiedBy` | `map[string]any` | Reference to the associated User resource. |
| `notes` | `string` | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map[string]any` | Reference to the associated Custody Status. |
| `transferMethod` | `map[string]any` | Reference to the associated Transfer Method. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `data` | `[]any` | List of Devices. |
| `total` | `int` | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `bool` | Indicates if the action succeeded. |

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
| `success` | `bool` | Indicates if the RKI activation succeeded. |

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
| `id` | `int` | Unique identifier for this Device state. |
| `name` | `string` | Descriptive name for this Device state. |

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
| `version` | `int` | The number of times that this resource has been updated. |

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
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | unique idenifier |
| `isActive` | `bool` | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `bool` | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | The cipher type that the key works with. |
| `modified` | `string` | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | Key name. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `id` | `int` | This resource's unique identifier. |
| `name` | `string` | The KIF's name. |

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
| `version` | `int` | The number of times that this resource has been updated. |

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
| `billingId` | `string` | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `bool` | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `map[string]any` | Reference to the associated User resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the Parter account is active or disabled. |
| `location` | `map[string]any` | Reference to the associated Location resource. |
| `modified` | `string` | Last modified timestamp. |
| `name` | `string` | The Partner's name. |
| `parent` | `map[string]any` | Reference to the associated Partner. |
| `partnerId` | `string` | The Partner's id. |
| `reference` | `string` | The Partner's reference string. |
| `verificationPhrase` | `string` | The verification phrase is a message that the Partner creates. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `carrier` | `string` | The name of the courier. |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | The date and time that a package is recieved. |
| `dateShipped` | `string` | The date and time that a package is shipped. |
| `dcKif` | `map[string]any` | Reference to the associated KIF resource. |
| `id` | `string` | This resource's unique identifier. |
| `items` | `[]any` |  |
| `kif` | `map[string]any` | Reference to the associated KIF resource. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `shipmentType` | `string` | The type of shipment. |
| `tracking` | `string` | The courier's tracking number. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `success` | `bool` | Indicates if the action was a success. |

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
| `alternateKey` | `string` | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `clientRef` | `string` | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `decrypted` | `int` | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `map[string]any` | Reference to the associated Partner. |
| `encrypted` | `int` | A Transcation can process muliple encryptions. |
| `endDate` | `string` | Timestamp from the end of the transaction. |
| `errCode` | `string` | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | This resource's unique identifier. |
| `ipAddress` | `string` | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `bool` | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | The type of cipher used during decrytion. |
| `location` | `map[string]any` | Reference to the associated Location resource. |
| `messageId` | `string` | Message ID. |
| `method` | `string` | The decryption cypher/method. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `reference` | `string` | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | Timestamp from the beginning of the transaction. |
| `success` | `bool` | The success indicator. |
| `transactionSource` | `string` | The source of the Transaction. |

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
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | ID of newly created resource |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `map[string]any` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `map[string]any` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

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
| `client` | `map[string]any` | Reference to the associated Client resource. |
| `created` | `string` | Creation timestamp in ISO 8601 format. |
| `email` | `string` | The User's email address. |
| `firstName` | `string` | The User's name. |
| `id` | `string` | This resource's unique identifier. |
| `isActive` | `bool` | This property indicates if the User account is active or disabled. |
| `kif` | `map[string]any` | Reference to the associated KIF resource. |
| `lastName` | `string` | The User's Surname. |
| `modified` | `string` | Last modified timestamp. |
| `partner` | `map[string]any` | Reference to the associated Partner. |
| `phone` | `string` | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | The User's unique username. |
| `userRole` | `map[string]any` | Reference to the associated User Role. |
| `version` | `int` | The number of times that this resource has been updated. |

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
devicetype := client.DeviceType(nil)
devicetype.List(nil, nil)

// devicetype.Data() now returns the devicetype data from the last list
// devicetype.Match() returns the last match criteria
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
