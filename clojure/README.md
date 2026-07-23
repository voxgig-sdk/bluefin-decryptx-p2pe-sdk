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
(def created (e-attestation/create (api/attestation client nil) (vs/jm "client" (vs/jm) "complete_date" "example_complete_date") nil))

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
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `device` | `map` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |

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
| `direct_partner` | `map` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
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
| `activated_by` | `map` |  |
| `activation_date` | `string` |  |
| `alternate_key` | `string` |  |
| `audit_next_date` | `string` |  |
| `audit_notification_date` | `string` |  |
| `client` | `map` |  |
| `created` | `string` |  |
| `created_by` | `map` |  |
| `device_build` | `map` |  |
| `device_state` | `map` |  |
| `device_type` | `map` |  |
| `error_counter` | `long` |  |
| `error_last_date` | `string` |  |
| `id` | `string` |  |
| `initialized_by` | `map` |  |
| `initialized_date` | `string` |  |
| `inject_key` | `map` |  |
| `is_virtual` | `boolean` |  |
| `kif` | `map` |  |
| `last_activity_date` | `string` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `modified_by` | `map` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `partner` | `map` |  |
| `serial_number` | `string` |  |
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
      "activated_by" (vs/jm)  ;; map
      "created_by" (vs/jm)  ;; map
      "initialized_by" (vs/jm)  ;; map
      "location" (vs/jm)  ;; map
      "modified_by" (vs/jm)  ;; map
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
| `app_version` | `string` |  |
| `build_number` | `string` |  |
| `config_file_name` | `string` |  |
| `created` | `string` |  |
| `device_type` | `string` |  |
| `firmware_version` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `long` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `version` | `long` |  |
| `white_listing_bin_range` | `string` |  |
| `white_listing_used` | `boolean` |  |

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
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `map` |  |
| `custodian` | `map` |  |
| `device` | `map` |  |
| `id` | `long` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `modified_by` | `map` |  |
| `note` | `string` |  |
| `status` | `map` |  |
| `transfer_method` | `map` |  |
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
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `map` |  |
| `custodian` | `map` |  |
| `device` | `map` |  |
| `id` | `long` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `modified_by` | `map` |  |
| `note` | `string` |  |
| `status` | `map` |  |
| `transfer_method` | `map` |  |
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
| `device_type_mode` | `string` |  |
| `hardware_version` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `manufacturer` | `string` |  |
| `model` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `photo_url` | `string` |  |
| `product_name` | `string` |  |
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
| `is_active` | `boolean` |  |
| `is_p2_pe` | `boolean` |  |
| `key_type` | `string` |  |
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
| `billing_id` | `string` |  |
| `client_can_order_equipment` | `boolean` |  |
| `contact` | `map` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `location` | `map` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `map` |  |
| `partner_id` | `string` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
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
| `date_received` | `string` |  |
| `date_shipped` | `string` |  |
| `dc_kif` | `map` |  |
| `id` | `string` |  |
| `item` | `vector` |  |
| `kif` | `map` |  |
| `modified` | `string` |  |
| `partner` | `map` |  |
| `shipment_type` | `string` |  |
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
| `alternate_key` | `string` |  |
| `client` | `map` |  |
| `client_ref` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `long` |  |
| `device_name` | `string` |  |
| `direct_partner` | `map` |  |
| `encrypted` | `long` |  |
| `end_date` | `string` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `string` |  |
| `ip_address` | `string` |  |
| `is_virtual` | `boolean` |  |
| `key_type` | `string` |  |
| `location` | `map` |  |
| `message_id` | `string` |  |
| `method` | `string` |  |
| `partner` | `map` |  |
| `reference` | `string` |  |
| `serial_number` | `string` |  |
| `start_date` | `string` |  |
| `success` | `boolean` |  |
| `transaction_source` | `string` |  |

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
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `kif` | `map` |  |
| `last_name` | `string` |  |
| `partner` | `map` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `map` |  |
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
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `kif` | `map` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `map` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `map` |  |
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
