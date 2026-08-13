# BluefinDecryptxP2pe Clojure SDK



The Clojure SDK for the BluefinDecryptxP2pe API — an entity-oriented client
following idiomatic Clojure conventions (plain functions, immutable data, and
the vendored `voxgig.struct` value model).

The SDK exposes the API as capitalised, semantic **Entities** — for example `(api/attestation client nil)` — each
carrying a small, uniform set of operations (`list`, `load`, `create`, `update`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Clojars. Depend on it directly from the
GitHub release tag (`clojure/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)),
using a `tools.deps` git dependency:

```clojure
;; deps.edn
{:deps {bluefindecryptxp2pe/sdk
        {:git/url "https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk"
         :git/tag "clojure/vX.Y.Z"
         :git/sha "..."
         :deps/root "clojure"}}}
```

Or from a local source checkout:

```clojure
;; deps.edn
{:deps {bluefindecryptxp2pe/sdk {:local/root "../clojure"}}}
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.attestation :as e-attestation]
         '[sdk.entity.device_custody_detail :as e-device_custody_detail]
         '[voxgig.struct :as vs])

(def client (api/make-sdk (vs/jm "apikey" (System/getenv "BLUEFIN_DECRYPTX_P2PE_APIKEY"))))
```

### 2. List attestation records

`list` returns a vector of records (each a map) and raises on error —
iterate it directly.

```clojure
(try
  (doseq [attestation (e-attestation/list (api/attestation client nil) nil nil)]
    (println attestation))
  (catch Exception err
    (println "list failed:" (.getMessage err))))
```

### 3. Load a device_custody_detail

DeviceCustodyDetail is nested under device_type, so provide the
`device_type`. `load` returns the bare record (a map) and raises on error.

```clojure
(try
  (let [device_custody_detail (e-device_custody_detail/load (api/device_custody_detail client nil) (vs/jm "device_type" "example_device_type" "serial_number" "example_serial_number" "id" "example_id") nil)]
    (println device_custody_detail))
  (catch Exception err
    (println "load failed:" (.getMessage err))))
```

### 4. Create, update, and remove

```clojure
;; Create — returns the bare created record (a map)
(def created (e-attestation/create (api/attestation client nil) (vs/jm "client" (vs/jm) "completeDate" "example_completeDate") nil))

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

For endpoints not covered by entity operations:

```clojure
(def result
  (api/direct client
    (vs/jm "path" "/api/resource/{id}"
           "method" "GET"
           "params" (vs/jm "id" "example"))))

(if (vs/getprop result "ok")
  (do
    (println (vs/getprop result "status"))  ;; 200
    (println (vs/getprop result "data")))   ;; response body
  ;; A non-2xx response carries status + data (the error body); a
  ;; transport-level failure carries err instead. Only one is present.
  (println (vs/getprop result "status") (vs/getprop result "err")))
```

### Prepare a request without sending it

```clojure
;; prepare returns the fetch definition and raises on error.
(def fetchdef
  (api/prepare client
    (vs/jm "path" "/api/resource/{id}"
           "method" "DELETE"
           "params" (vs/jm "id" "example"))))

(println (vs/getprop fetchdef "url"))
(println (vs/getprop fetchdef "method"))
(println (vs/getprop fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```clojure
(require '[sdk.api :as api]
         '[sdk.entity.device_type :as e-device_type]
         '[voxgig.struct :as vs])

(def client (api/test-sdk nil nil))

;; Entity ops return the bare record and raise on error.
(def device_type (e-device_type/list (api/device_type client nil) nil nil))
;; device_type contains the mock response record
(println device_type)
```

### Use a custom fetch function

Replace the HTTP transport with your own function. A fetch fn takes the
URL and fetch definition and returns a `[response err]` pair; `response`
is a struct map carrying `status`, `headers`, and a `json` thunk:

```clojure
(defn mock-fetch [url fetchdef]
  [(vs/jm "status" 200
          "statusText" "OK"
          "headers" (vs/jm)
          "json" (fn [] (vs/jm "id" "mock01")))
   nil])

(def client
  (api/make-sdk
    (vs/jm "base" "http://localhost:8080"
           "system" (vs/jm "fetch" mock-fetch))))
```

### Run the test suite

The generated suite (pipeline, features, netsim, primary utility and the
vendored struct corpus) runs offline through a single `tools.deps` entry
point:

```bash
cd clojure && make test
```

To exercise the SDK against the live API, construct a client with real
credentials and call its operations directly.


## Reference

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Creates a new SDK client. `options` is a `voxgig.struct` map (or `nil`).

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `vector` | Additional feature atoms to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` fn). |

### test-sdk

```clojure
(def client (api/test-sdk testopts sdkopts))
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### Client functions

| Function | Signature | Description |
| --- | --- | --- |
| `options-map` | `(client) -> map` | Deep copy of current SDK options. |
| `get-utility` | `(client) -> utility` | Copy of the SDK utility object. |
| `prepare` | `(client fetchargs) -> map` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(client fetchargs) -> map` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `attestation` | `(client data) -> Attestation entity` | Create an Attestation entity instance. |
| `client` | `(client data) -> Client entity` | Create a Client entity instance. |
| `create_result` | `(client data) -> CreateResult entity` | Create a CreateResult entity instance. |
| `decryption` | `(client data) -> Decryption entity` | Create a Decryption entity instance. |
| `device` | `(client data) -> Device entity` | Create a Device entity instance. |
| `device_build` | `(client data) -> DeviceBuild entity` | Create a DeviceBuild entity instance. |
| `device_custody_detail` | `(client data) -> DeviceCustodyDetail entity` | Create a DeviceCustodyDetail entity instance. |
| `device_custody_list` | `(client data) -> DeviceCustodyList entity` | Create a DeviceCustodyList entity instance. |
| `device_list` | `(client data) -> DeviceList entity` | Create a DeviceList entity instance. |
| `device_receive_result` | `(client data) -> DeviceReceiveResult entity` | Create a DeviceReceiveResult entity instance. |
| `device_rki_activate_result` | `(client data) -> DeviceRkiActivateResult entity` | Create a DeviceRkiActivateResult entity instance. |
| `device_state` | `(client data) -> DeviceState entity` | Create a DeviceState entity instance. |
| `device_type` | `(client data) -> DeviceType entity` | Create a DeviceType entity instance. |
| `inject_key` | `(client data) -> InjectKey entity` | Create an InjectKey entity instance. |
| `kif` | `(client data) -> Kif entity` | Create a Kif entity instance. |
| `location` | `(client data) -> Location entity` | Create a Location entity instance. |
| `partner` | `(client data) -> Partner entity` | Create a Partner entity instance. |
| `shipment` | `(client data) -> Shipment entity` | Create a Shipment entity instance. |
| `success` | `(client data) -> Success entity` | Create a Success entity instance. |
| `transaction` | `(client data) -> Transaction entity` | Create a Transaction entity instance. |
| `update_result` | `(client data) -> UpdateResult entity` | Create an UpdateResult entity instance. |
| `user` | `(client data) -> User entity` | Create an User entity instance. |

### Entity interface

All entities share the same interface. Operations are functions in the
entity namespace (`sdk.entity.<name>`); state accessors are stored on the
entity map and are called via keyword lookup.

| Member | Signature | Description |
| --- | --- | --- |
| `load` | `(ent reqmatch ctrl) -> map` | Load a single entity by match criteria. Raises on error. |
| `list` | `(ent reqmatch ctrl) -> vector` | List entities matching the criteria. Raises on error. |
| `create` | `(ent reqdata ctrl) -> map` | Create a new entity. Raises on error. |
| `update` | `(ent reqdata ctrl) -> map` | Update an existing entity. Raises on error. |
| `remove` | `(ent reqmatch ctrl) -> map` | Remove an entity. Raises on error. |
| `:data-get` | `() -> map` | Get entity data. |
| `:data-set` | `(data)` | Set entity data. |
| `:match-get` | `() -> map` | Get entity match criteria. |
| `:match-set` | `(match)` | Set entity match criteria. |
| `:make` | `() -> entity` | Create a new instance with the same options. |
| `:get-name` | `() -> string` | Return the entity name. |

State accessors are called by looking up the fn and applying it, e.g.
`((:data-get ent))` or `((:data-set ent) (vs/jm "k" "v"))`.

### Result shape

Entity operations return the bare result data (a `map` for single-entity
ops, a `vector` for `list`) and raise (via `ex-info`) on error. Wrap
calls in `try`/`catch` to handle failures.

The `direct` escape hatch never raises — it returns a result `map` you
branch on via `(vs/getprop result "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `boolean` | `true` if the HTTP status is 2xx. |
| `status` | `long` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` contains the error value.

### Entities

#### Attestation

| Field | Description |
| --- | --- |
| `client` |  |
| `completeDate` |  |
| `created` |  |
| `device` |  |
| `id` |  |
| `name` |  |
| `notes` |  |

Operations: Create, List, Load.

API path: `/attestations`

#### Client

| Field | Description |
| --- | --- |
| `contact` |  |
| `created` |  |
| `directPartner` |  |
| `id` |  |
| `isActive` |  |
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
| `activatedBy` |  |
| `activationDate` |  |
| `alternateKey` |  |
| `auditNextDate` |  |
| `auditNotificationDate` |  |
| `client` |  |
| `created` |  |
| `createdBy` |  |
| `deviceBuild` |  |
| `deviceState` |  |
| `deviceType` |  |
| `errorCounter` |  |
| `errorLastDate` |  |
| `id` |  |
| `initializedBy` |  |
| `initializedDate` |  |
| `injectKey` |  |
| `isVirtual` |  |
| `kif` |  |
| `lastActivityDate` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `name` |  |
| `notes` |  |
| `partner` |  |
| `serialNumber` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/devices`

#### DeviceBuild

| Field | Description |
| --- | --- |
| `appVersion` |  |
| `buildNumber` |  |
| `configFileName` |  |
| `created` |  |
| `deviceType` |  |
| `firmwareVersion` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `modified` |  |
| `name` |  |
| `notes` |  |
| `version` |  |
| `whiteListingBinRanges` |  |
| `whiteListingUsed` |  |

Operations: List, Load.

API path: `/deviceBuilds`

#### DeviceCustodyDetail

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
| `version` |  |

Operations: Load.

API path: `/devices/{serialNumber}/{deviceType}/custody/{id}`

#### DeviceCustodyList

| Field | Description |
| --- | --- |
| `completeDate` |  |
| `created` |  |
| `createdBy` |  |
| `custodian` |  |
| `device` |  |
| `id` |  |
| `location` |  |
| `modified` |  |
| `modifiedBy` |  |
| `notes` |  |
| `status` |  |
| `transferMethod` |  |
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
| `deviceTypeMode` |  |
| `hardwareVersion` |  |
| `id` |  |
| `isActive` |  |
| `manufacturer` |  |
| `model` |  |
| `modified` |  |
| `name` |  |
| `photoUrl` |  |
| `productName` |  |
| `version` |  |

Operations: List, Load.

API path: `/deviceTypes`

#### InjectKey

| Field | Description |
| --- | --- |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `isP2PE` |  |
| `keyType` |  |
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
| `billingId` |  |
| `city` |  |
| `country` |  |
| `created` |  |
| `customReference` |  |
| `id` |  |
| `locationType` |  |
| `mailAddress1` |  |
| `mailAddress2` |  |
| `mailCity` |  |
| `mailCountry` |  |
| `mailPostalCode` |  |
| `mailStateProvince` |  |
| `modified` |  |
| `name` |  |
| `nameOfBusiness` |  |
| `notes` |  |
| `postalCode` |  |
| `stateProvince` |  |
| `uniqueId` |  |
| `version` |  |

Operations: Create, List, Load, Remove.

API path: `/locations`

#### Partner

| Field | Description |
| --- | --- |
| `billingId` |  |
| `clientCanOrderEquipment` |  |
| `contact` |  |
| `created` |  |
| `id` |  |
| `isActive` |  |
| `location` |  |
| `modified` |  |
| `name` |  |
| `parent` |  |
| `partnerId` |  |
| `reference` |  |
| `verificationPhrase` |  |
| `version` |  |

Operations: Create, List, Load.

API path: `/partners`

#### Shipment

| Field | Description |
| --- | --- |
| `carrier` |  |
| `client` |  |
| `created` |  |
| `dateReceived` |  |
| `dateShipped` |  |
| `dcKif` |  |
| `id` |  |
| `items` |  |
| `kif` |  |
| `modified` |  |
| `partner` |  |
| `shipmentType` |  |
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
| `alternateKey` |  |
| `client` |  |
| `clientRef` |  |
| `created` |  |
| `decrypted` |  |
| `deviceName` |  |
| `directPartner` |  |
| `encrypted` |  |
| `endDate` |  |
| `errCode` |  |
| `errMessage` |  |
| `id` |  |
| `ipAddress` |  |
| `isVirtual` |  |
| `keyType` |  |
| `location` |  |
| `messageId` |  |
| `method` |  |
| `partner` |  |
| `reference` |  |
| `serialNumber` |  |
| `startDate` |  |
| `success` |  |
| `transactionSource` |  |

Operations: Create, List, Load.

API path: `/transactions`

#### UpdateResult

| Field | Description |
| --- | --- |
| `client` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Create, List, Update.

API path: `/users`

#### User

| Field | Description |
| --- | --- |
| `client` |  |
| `created` |  |
| `email` |  |
| `firstName` |  |
| `id` |  |
| `isActive` |  |
| `kif` |  |
| `lastName` |  |
| `modified` |  |
| `partner` |  |
| `phone` |  |
| `userName` |  |
| `userRole` |  |
| `version` |  |

Operations: Load, Remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `(def attestation (api/attestation client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map` |  |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `device` | `map` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |

#### Example: Load

```clojure
(def attestation (e-attestation/load (api/attestation client nil) (vs/jm "id" "attestation_id") nil))
```

#### Example: List

```clojure
(def attestations (e-attestation/list (api/attestation client nil) nil nil))
```

#### Example: Create

```clojure
(def attestation
  (e-attestation/create (api/attestation client nil)
    (vs/jm
      )
    nil))
```


### Client

Create an instance: `(def client (api/client client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `map` |  |
| `created` | `string` |  |
| `directPartner` | `map` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `location` | `map` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `map` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def client (e-client/load (api/client client nil) (vs/jm "id" "client_id") nil))
```

#### Example: List

```clojure
(def clients (e-client/list (api/client client nil) nil nil))
```

#### Example: Create

```clojure
(def client
  (e-client/create (api/client client nil)
    (vs/jm
      "location" (vs/jm)  ;; map
      )
    nil))
```


### CreateResult

Create an instance: `(def create_result (api/create_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Example: Create

```clojure
(def create_result
  (e-create_result/create (api/create_result client nil)
    (vs/jm
      "device_type" "example_device_type"  ;; string
      "serial_number" "example_serial_number"  ;; string
      )
    nil))
```


### Decryption

Create an instance: `(def decryption (api/decryption client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```clojure
(def decryption
  (e-decryption/create (api/decryption client nil)
    (vs/jm
      )
    nil))
```


### Device

Create an instance: `(def device (api/device client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activatedBy` | `map` |  |
| `activationDate` | `string` |  |
| `alternateKey` | `string` |  |
| `auditNextDate` | `string` |  |
| `auditNotificationDate` | `string` |  |
| `client` | `map` |  |
| `created` | `string` |  |
| `createdBy` | `map` |  |
| `deviceBuild` | `map` |  |
| `deviceState` | `map` |  |
| `deviceType` | `map` |  |
| `errorCounter` | `long` |  |
| `errorLastDate` | `string` |  |
| `id` | `string` |  |
| `initializedBy` | `map` |  |
| `initializedDate` | `string` |  |
| `injectKey` | `map` |  |
| `isVirtual` | `boolean` |  |
| `kif` | `map` |  |
| `lastActivityDate` | `string` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `modifiedBy` | `map` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `partner` | `map` |  |
| `serialNumber` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def device (e-device/load (api/device client nil) (vs/jm "id" "device_id") nil))
```

#### Example: List

```clojure
(def devices (e-device/list (api/device client nil) nil nil))
```

#### Example: Create

```clojure
(def device
  (e-device/create (api/device client nil)
    (vs/jm
      "activatedBy" (vs/jm)  ;; map
      "createdBy" (vs/jm)  ;; map
      "initializedBy" (vs/jm)  ;; map
      "location" (vs/jm)  ;; map
      "modifiedBy" (vs/jm)  ;; map
      )
    nil))
```


### DeviceBuild

Create an instance: `(def device_build (api/device_build client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `appVersion` | `string` |  |
| `buildNumber` | `string` |  |
| `configFileName` | `string` |  |
| `created` | `string` |  |
| `deviceType` | `string` |  |
| `firmwareVersion` | `string` |  |
| `hardwareVersion` | `string` |  |
| `id` | `long` |  |
| `isActive` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `version` | `long` |  |
| `whiteListingBinRanges` | `string` |  |
| `whiteListingUsed` | `boolean` |  |

#### Example: Load

```clojure
(def device_build (e-device_build/load (api/device_build client nil) (vs/jm "id" "device_build_id") nil))
```

#### Example: List

```clojure
(def device_builds (e-device_build/list (api/device_build client nil) nil nil))
```


### DeviceCustodyDetail

Create an instance: `(def device_custody_detail (api/device_custody_detail client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `map` |  |
| `custodian` | `map` |  |
| `device` | `map` |  |
| `id` | `long` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `modifiedBy` | `map` |  |
| `notes` | `string` |  |
| `status` | `map` |  |
| `transferMethod` | `map` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def device_custody_detail (e-device_custody_detail/load (api/device_custody_detail client nil) (vs/jm "id" "device_custody_detail_id" "device_type" "device_type" "serial_number" "serial_number") nil))
```


### DeviceCustodyList

Create an instance: `(def device_custody_list (api/device_custody_list client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `map` |  |
| `custodian` | `map` |  |
| `device` | `map` |  |
| `id` | `long` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `modifiedBy` | `map` |  |
| `notes` | `string` |  |
| `status` | `map` |  |
| `transferMethod` | `map` |  |
| `version` | `long` |  |

#### Example: List

```clojure
(def device_custody_lists (e-device_custody_list/list (api/device_custody_list client nil) nil nil))
```


### DeviceList

Create an instance: `(def device_list (api/device_list client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `vector` |  |
| `total` | `long` |  |

#### Example: Load

```clojure
(def device_list (e-device_list/load (api/device_list client nil) (vs/jm "share_partner_to" "share_partner_to") nil))
```


### DeviceReceiveResult

Create an instance: `(def device_receive_result (api/device_receive_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```clojure
(def device_receive_result
  (e-device_receive_result/create (api/device_receive_result client nil)
    (vs/jm
      "success" true  ;; boolean
      )
    nil))
```


### DeviceRkiActivateResult

Create an instance: `(def device_rki_activate_result (api/device_rki_activate_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```clojure
(def device_rki_activate_result
  (e-device_rki_activate_result/create (api/device_rki_activate_result client nil)
    (vs/jm
      "success" true  ;; boolean
      )
    nil))
```


### DeviceState

Create an instance: `(def device_state (api/device_state client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `long` |  |
| `name` | `string` |  |

#### Example: List

```clojure
(def device_states (e-device_state/list (api/device_state client nil) nil nil))
```


### DeviceType

Create an instance: `(def device_type (api/device_type client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `deviceTypeMode` | `string` |  |
| `hardwareVersion` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photoUrl` | `string` |  |
| `productName` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def device_type (e-device_type/load (api/device_type client nil) (vs/jm "id" "device_type_id") nil))
```

#### Example: List

```clojure
(def device_types (e-device_type/list (api/device_type client nil) nil nil))
```


### InjectKey

Create an instance: `(def inject_key (api/inject_key client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `isP2PE` | `boolean` |  |
| `keyType` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def inject_key (e-inject_key/load (api/inject_key client nil) (vs/jm "id" "inject_key_id") nil))
```

#### Example: List

```clojure
(def inject_keys (e-inject_key/list (api/inject_key client nil) nil nil))
```


### Kif

Create an instance: `(def kif (api/kif client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `long` |  |
| `name` | `string` |  |

#### Example: List

```clojure
(def kifs (e-kif/list (api/kif client nil) nil nil))
```


### Location

Create an instance: `(def location (api/location client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `address1` | `string` |  |
| `address2` | `string` |  |
| `billingId` | `string` |  |
| `city` | `string` |  |
| `country` | `string` |  |
| `created` | `string` |  |
| `customReference` | `string` |  |
| `id` | `string` |  |
| `locationType` | `string` |  |
| `mailAddress1` | `string` |  |
| `mailAddress2` | `string` |  |
| `mailCity` | `string` |  |
| `mailCountry` | `string` |  |
| `mailPostalCode` | `string` |  |
| `mailStateProvince` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `nameOfBusiness` | `string` |  |
| `notes` | `string` |  |
| `postalCode` | `string` |  |
| `stateProvince` | `string` |  |
| `uniqueId` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def location (e-location/load (api/location client nil) (vs/jm "id" "location_id") nil))
```

#### Example: List

```clojure
(def locations (e-location/list (api/location client nil) nil nil))
```

#### Example: Create

```clojure
(def location
  (e-location/create (api/location client nil)
    (vs/jm
      )
    nil))
```


### Partner

Create an instance: `(def partner (api/partner client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billingId` | `string` |  |
| `clientCanOrderEquipment` | `boolean` |  |
| `contact` | `map` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `map` |  |
| `partnerId` | `string` |  |
| `reference` | `string` |  |
| `verificationPhrase` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def partner (e-partner/load (api/partner client nil) (vs/jm "id" "partner_id") nil))
```

#### Example: List

```clojure
(def partners (e-partner/list (api/partner client nil) nil nil))
```

#### Example: Create

```clojure
(def partner
  (e-partner/create (api/partner client nil)
    (vs/jm
      "location" (vs/jm)  ;; map
      )
    nil))
```


### Shipment

Create an instance: `(def shipment (api/shipment client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `map` |  |
| `created` | `string` |  |
| `dateReceived` | `string` |  |
| `dateShipped` | `string` |  |
| `dcKif` | `map` |  |
| `id` | `string` |  |
| `items` | `vector` |  |
| `kif` | `map` |  |
| `modified` | `string` |  |
| `partner` | `map` |  |
| `shipmentType` | `string` |  |
| `tracking` | `string` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def shipment (e-shipment/load (api/shipment client nil) (vs/jm "id" "shipment_id") nil))
```

#### Example: List

```clojure
(def shipments (e-shipment/list (api/shipment client nil) nil nil))
```

#### Example: Create

```clojure
(def shipment
  (e-shipment/create (api/shipment client nil)
    (vs/jm
      )
    nil))
```


### Success

Create an instance: `(def success (api/success client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(remove ent match ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```clojure
(def success
  (e-success/create (api/success client nil)
    (vs/jm
      "share_partner_to" "example_share_partner_to"  ;; string
      )
    nil))
```


### Transaction

Create an instance: `(def transaction (api/transaction client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(load ent match ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternateKey` | `string` |  |
| `client` | `map` |  |
| `clientRef` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `long` |  |
| `deviceName` | `string` |  |
| `directPartner` | `map` |  |
| `encrypted` | `long` |  |
| `endDate` | `string` |  |
| `errCode` | `string` |  |
| `errMessage` | `string` |  |
| `id` | `string` |  |
| `ipAddress` | `string` |  |
| `isVirtual` | `boolean` |  |
| `keyType` | `string` |  |
| `location` | `map` |  |
| `messageId` | `string` |  |
| `method` | `string` |  |
| `partner` | `map` |  |
| `reference` | `string` |  |
| `serialNumber` | `string` |  |
| `startDate` | `string` |  |
| `success` | `boolean` |  |
| `transactionSource` | `string` |  |

#### Example: Load

```clojure
(def transaction (e-transaction/load (api/transaction client nil) (vs/jm "id" "transaction_id") nil))
```

#### Example: List

```clojure
(def transactions (e-transaction/list (api/transaction client nil) nil nil))
```

#### Example: Create

```clojure
(def transaction
  (e-transaction/create (api/transaction client nil)
    (vs/jm
      "location" (vs/jm)  ;; map
      )
    nil))
```


### UpdateResult

Create an instance: `(def update_result (api/update_result client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(create ent data ctrl)` | Create a new entity with the given data. |
| `(list ent match ctrl)` | List entities, optionally matching the given criteria. |
| `(update ent data ctrl)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `kif` | `map` |  |
| `lastName` | `string` |  |
| `partner` | `map` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `map` |  |
| `version` | `long` |  |

#### Example: List

```clojure
(def update_results (e-update_result/list (api/update_result client nil) nil nil))
```

#### Example: Create

```clojure
(def update_result
  (e-update_result/create (api/update_result client nil)
    (vs/jm
      )
    nil))
```


### User

Create an instance: `(def user (api/user client nil))`

#### Operations

| Method | Description |
| --- | --- |
| `(load ent match ctrl)` | Load a single entity by match criteria. |
| `(remove ent match ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `map` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `kif` | `map` |  |
| `lastName` | `string` |  |
| `modified` | `string` |  |
| `partner` | `map` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `map` |  |
| `version` | `long` |  |

#### Example: Load

```clojure
(def user (e-user/load (api/user client nil) (vs/jm "id" "user_id") nil))
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

### Data as struct value maps

The Clojure SDK represents API data with the vendored `voxgig.struct`
value model (ordered, Java-backed maps and lists) rather than typed
records. This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with `(vs/jm "k" v ...)` and lists with
`(vs/jt v ...)`; read values with `(vs/getprop m "k")`. Use
`(vs/ismap x)` to safely check that a value is a map.

### Namespace structure

```
clojure/
├── src/sdk/api.clj        -- public API namespace (entity accessors)
├── src/sdk/client.clj     -- client constructors (make-sdk, test-sdk)
├── src/sdk/config.clj     -- generated configuration
├── src/sdk/core.clj       -- core types, context and pipeline
├── src/sdk/features.clj   -- feature factory
├── src/sdk/entity/        -- entity namespaces (one per entity)
├── src/voxgig/struct.clj  -- vendored struct value library
└── test/                  -- test suites
```

Require `[sdk.api :as api]` for the public surface, and an entity
namespace (e.g. `[sdk.entity.bluefindecryptxp2pe :as e-bluefindecryptxp2pe]`)
only when you call its operations directly.

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
