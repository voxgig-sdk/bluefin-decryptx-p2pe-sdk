# BluefinDecryptxP2pe Clojure SDK Reference

Complete API reference for the BluefinDecryptxP2pe Clojure SDK.


## Client

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Create a new SDK client instance. `options` is a `voxgig.struct` map.

**Options:**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Test client

#### `(api/test-sdk testopts sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```clojure
(def client (api/test-sdk nil nil))
```


### Client functions

#### `(api/attestation client data)`

Create a new `Attestation` entity instance. Pass `nil` for no initial data.

#### `(api/client client data)`

Create a new `Client` entity instance. Pass `nil` for no initial data.

#### `(api/create_result client data)`

Create a new `CreateResult` entity instance. Pass `nil` for no initial data.

#### `(api/decryption client data)`

Create a new `Decryption` entity instance. Pass `nil` for no initial data.

#### `(api/device client data)`

Create a new `Device` entity instance. Pass `nil` for no initial data.

#### `(api/device_build client data)`

Create a new `DeviceBuild` entity instance. Pass `nil` for no initial data.

#### `(api/device_custody_detail client data)`

Create a new `DeviceCustodyDetail` entity instance. Pass `nil` for no initial data.

#### `(api/device_custody_list client data)`

Create a new `DeviceCustodyList` entity instance. Pass `nil` for no initial data.

#### `(api/device_list client data)`

Create a new `DeviceList` entity instance. Pass `nil` for no initial data.

#### `(api/device_receive_result client data)`

Create a new `DeviceReceiveResult` entity instance. Pass `nil` for no initial data.

#### `(api/device_rki_activate_result client data)`

Create a new `DeviceRkiActivateResult` entity instance. Pass `nil` for no initial data.

#### `(api/device_state client data)`

Create a new `DeviceState` entity instance. Pass `nil` for no initial data.

#### `(api/device_type client data)`

Create a new `DeviceType` entity instance. Pass `nil` for no initial data.

#### `(api/inject_key client data)`

Create a new `InjectKey` entity instance. Pass `nil` for no initial data.

#### `(api/kif client data)`

Create a new `Kif` entity instance. Pass `nil` for no initial data.

#### `(api/location client data)`

Create a new `Location` entity instance. Pass `nil` for no initial data.

#### `(api/partner client data)`

Create a new `Partner` entity instance. Pass `nil` for no initial data.

#### `(api/shipment client data)`

Create a new `Shipment` entity instance. Pass `nil` for no initial data.

#### `(api/success client data)`

Create a new `Success` entity instance. Pass `nil` for no initial data.

#### `(api/transaction client data)`

Create a new `Transaction` entity instance. Pass `nil` for no initial data.

#### `(api/update_result client data)`

Create a new `UpdateResult` entity instance. Pass `nil` for no initial data.

#### `(api/user client data)`

Create a new `User` entity instance. Pass `nil` for no initial data.

#### `(api/options-map client) -> map`

Return a deep copy of the current SDK options.

#### `(api/get-utility client) -> utility`

Return a copy of the SDK utility object.

#### `(api/direct client fetchargs) -> map`

Make a direct HTTP request to any API endpoint. Returns a result `map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `(vs/getprop result "ok")`.

**Fetch args:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

**Returns:** a result `map`.

#### `(api/prepare client fetchargs) -> map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## Attestation

```clojure
(require '[sdk.entity.attestation :as e-attestation])

(def attestation (api/attestation client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map` | No |  |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `map` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-attestation/create (api/attestation client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [attestation (e-attestation/list (api/attestation client nil) nil nil)]
  (println attestation))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-attestation/load (api/attestation client nil) (vs/jm "id" "attestation_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Attestation` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Client

```clojure
(require '[sdk.entity.client :as e-client])

(def client (api/client client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `contact` | `map` | No |  |
| `created` | `string` | No |  |
| `direct_partner` | `map` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `location` | `map` | Yes |  |
| `mid` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `partner` | `map` | No |  |
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-client/create (api/client client nil)
    (vs/jm
      "location" (vs/jm)  ;; map
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [client (e-client/list (api/client client nil) nil nil)]
  (println client))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-client/load (api/client client nil) (vs/jm "id" "client_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-client/remove (api/client client nil) (vs/jm "id" "client_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Client` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## CreateResult

```clojure
(require '[sdk.entity.create_result :as e-create_result])

(def create_result (api/create_result client nil))
```

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-create_result/create (api/create_result client nil)
    (vs/jm
      "device_type" "example_device_type"  ;; string
      "serial_number" "example_serial_number"  ;; string
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `CreateResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Decryption

```clojure
(require '[sdk.entity.decryption :as e-decryption])

(def decryption (api/decryption client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-decryption/create (api/decryption client nil)
    (vs/jm
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Decryption` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Device

```clojure
(require '[sdk.entity.device :as e-device])

(def device (api/device client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `activated_by` | `map` | Yes |  |
| `activation_date` | `string` | No |  |
| `alternate_key` | `string` | No |  |
| `audit_next_date` | `string` | No |  |
| `audit_notification_date` | `string` | No |  |
| `client` | `map` | No |  |
| `created` | `string` | No |  |
| `created_by` | `map` | Yes |  |
| `device_build` | `map` | No |  |
| `device_state` | `map` | No |  |
| `device_type` | `map` | No |  |
| `error_counter` | `long` | No |  |
| `error_last_date` | `string` | No |  |
| `id` | `string` | No |  |
| `initialized_by` | `map` | Yes |  |
| `initialized_date` | `string` | No |  |
| `inject_key` | `map` | No |  |
| `is_virtual` | `boolean` | No |  |
| `kif` | `map` | No |  |
| `last_activity_date` | `string` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `map` | Yes |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `partner` | `map` | No |  |
| `serial_number` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [device (e-device/list (api/device client nil) nil nil)]
  (println device))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-device/load (api/device client nil) (vs/jm "id" "device_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Device` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceBuild

```clojure
(require '[sdk.entity.device_build :as e-device_build])

(def device_build (api/device_build client nil))
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
| `is_active` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `note` | `string` | No |  |
| `version` | `long` | No |  |
| `white_listing_bin_range` | `string` | No |  |
| `white_listing_used` | `boolean` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [device_build (e-device_build/list (api/device_build client nil) nil nil)]
  (println device_build))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-device_build/load (api/device_build client nil) (vs/jm "id" "device_build_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceBuild` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceCustodyDetail

```clojure
(require '[sdk.entity.device_custody_detail :as e-device_custody_detail])

(def device_custody_detail (api/device_custody_detail client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `map` | Yes |  |
| `custodian` | `map` | Yes |  |
| `device` | `map` | No |  |
| `id` | `long` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `map` | Yes |  |
| `note` | `string` | No |  |
| `status` | `map` | No |  |
| `transfer_method` | `map` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-device_custody_detail/load (api/device_custody_detail client nil) (vs/jm "id" "device_custody_detail_id" "device_type" "device_type" "serial_number" "serial_number") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceCustodyDetail` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceCustodyList

```clojure
(require '[sdk.entity.device_custody_list :as e-device_custody_list])

(def device_custody_list (api/device_custody_list client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `complete_date` | `string` | No |  |
| `created` | `string` | No |  |
| `created_by` | `map` | Yes |  |
| `custodian` | `map` | Yes |  |
| `device` | `map` | No |  |
| `id` | `long` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `modified_by` | `map` | Yes |  |
| `note` | `string` | No |  |
| `status` | `map` | No |  |
| `transfer_method` | `map` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [device_custody_list (e-device_custody_list/list (api/device_custody_list client nil) nil nil)]
  (println device_custody_list))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceCustodyList` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceList

```clojure
(require '[sdk.entity.device_list :as e-device_list])

(def device_list (api/device_list client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `data` | `vector` | No |  |
| `total` | `long` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-device_list/load (api/device_list client nil) (vs/jm "share_partner_to" "share_partner_to") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceList` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceReceiveResult

```clojure
(require '[sdk.entity.device_receive_result :as e-device_receive_result])

(def device_receive_result (api/device_receive_result client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-device_receive_result/create (api/device_receive_result client nil)
    (vs/jm
      "success" true  ;; boolean
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceReceiveResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceRkiActivateResult

```clojure
(require '[sdk.entity.device_rki_activate_result :as e-device_rki_activate_result])

(def device_rki_activate_result (api/device_rki_activate_result client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | Yes |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-device_rki_activate_result/create (api/device_rki_activate_result client nil)
    (vs/jm
      "success" true  ;; boolean
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceRkiActivateResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceState

```clojure
(require '[sdk.entity.device_state :as e-device_state])

(def device_state (api/device_state client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `long` | No |  |
| `name` | `string` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [device_state (e-device_state/list (api/device_state client nil) nil nil)]
  (println device_state))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceState` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## DeviceType

```clojure
(require '[sdk.entity.device_type :as e-device_type])

(def device_type (api/device_type client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `device_type_mode` | `string` | No |  |
| `hardware_version` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photo_url` | `string` | No |  |
| `product_name` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [device_type (e-device_type/list (api/device_type client nil) nil nil)]
  (println device_type))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-device_type/load (api/device_type client nil) (vs/jm "id" "device_type_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `DeviceType` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## InjectKey

```clojure
(require '[sdk.entity.inject_key :as e-inject_key])

(def inject_key (api/inject_key client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `is_p2_pe` | `boolean` | No |  |
| `key_type` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [inject_key (e-inject_key/list (api/inject_key client nil) nil nil)]
  (println inject_key))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-inject_key/load (api/inject_key client nil) (vs/jm "id" "inject_key_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `InjectKey` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Kif

```clojure
(require '[sdk.entity.kif :as e-kif])

(def kif (api/kif client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `long` | No |  |
| `name` | `string` | No |  |

### Operations

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [kif (e-kif/list (api/kif client nil) nil nil)]
  (println kif))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Kif` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Location

```clojure
(require '[sdk.entity.location :as e-location])

(def location (api/location client nil))
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-location/create (api/location client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [location (e-location/list (api/location client nil) nil nil)]
  (println location))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-location/load (api/location client nil) (vs/jm "id" "location_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-location/remove (api/location client nil) (vs/jm "id" "location_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Location` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Partner

```clojure
(require '[sdk.entity.partner :as e-partner])

(def partner (api/partner client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `billing_id` | `string` | No |  |
| `client_can_order_equipment` | `boolean` | No |  |
| `contact` | `map` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `map` | No |  |
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

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-partner/create (api/partner client nil)
    (vs/jm
      "location" (vs/jm)  ;; map
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [partner (e-partner/list (api/partner client nil) nil nil)]
  (println partner))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-partner/load (api/partner client nil) (vs/jm "id" "partner_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Partner` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Shipment

```clojure
(require '[sdk.entity.shipment :as e-shipment])

(def shipment (api/shipment client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `carrier` | `string` | No |  |
| `client` | `map` | No |  |
| `created` | `string` | No |  |
| `date_received` | `string` | No |  |
| `date_shipped` | `string` | No |  |
| `dc_kif` | `map` | No |  |
| `id` | `string` | No |  |
| `item` | `vector` | No |  |
| `kif` | `map` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map` | No |  |
| `shipment_type` | `string` | No |  |
| `tracking` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-shipment/create (api/shipment client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [shipment (e-shipment/list (api/shipment client nil) nil nil)]
  (println shipment))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-shipment/load (api/shipment client nil) (vs/jm "id" "shipment_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Shipment` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Success

```clojure
(require '[sdk.entity.success :as e-success])

(def success (api/success client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `success` | `boolean` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-success/create (api/success client nil)
    (vs/jm
      "share_partner_to" "example_share_partner_to"  ;; string
      )
    nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-success/remove (api/success client nil) (vs/jm "share_partner_to" "share_partner_to") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Success` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Transaction

```clojure
(require '[sdk.entity.transaction :as e-transaction])

(def transaction (api/transaction client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `alternate_key` | `string` | No |  |
| `client` | `map` | No |  |
| `client_ref` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `long` | No |  |
| `device_name` | `string` | No |  |
| `direct_partner` | `map` | No |  |
| `encrypted` | `long` | No |  |
| `end_date` | `string` | No |  |
| `err_code` | `string` | No |  |
| `err_message` | `string` | No |  |
| `id` | `string` | No |  |
| `ip_address` | `string` | No |  |
| `is_virtual` | `boolean` | No |  |
| `key_type` | `string` | No |  |
| `location` | `map` | Yes |  |
| `message_id` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `map` | No |  |
| `reference` | `string` | No |  |
| `serial_number` | `string` | No |  |
| `start_date` | `string` | No |  |
| `success` | `boolean` | No |  |
| `transaction_source` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-transaction/create (api/transaction client nil)
    (vs/jm
      "location" (vs/jm)  ;; map
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [transaction (e-transaction/list (api/transaction client nil) nil nil)]
  (println transaction))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-transaction/load (api/transaction client nil) (vs/jm "id" "transaction_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `Transaction` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## UpdateResult

```clojure
(require '[sdk.entity.update_result :as e-update_result])

(def update_result (api/update_result client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `kif` | `map` | No |  |
| `last_name` | `string` | No |  |
| `partner` | `map` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `map` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-update_result/create (api/update_result client nil)
    (vs/jm
      )
    nil))
```

#### `(list ent reqmatch ctrl) -> vector`

List entities matching the given criteria. The match is optional — call with `nil` to list all records. Returns a vector and raises on error.

```clojure
(doseq [update_result (e-update_result/list (api/update_result client nil) nil nil)]
  (println update_result))
```

#### `(update ent reqdata ctrl) -> map`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```clojure
(def result
  (e-update_result/update (api/update_result client nil)
    (vs/jm
      "id" "id"
      ;; Fields to update
      )
    nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `UpdateResult` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## User

```clojure
(require '[sdk.entity.user :as e-user])

(def user (api/user client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `client` | `map` | No |  |
| `created` | `string` | No |  |
| `email` | `string` | No |  |
| `first_name` | `string` | No |  |
| `id` | `string` | No |  |
| `is_active` | `boolean` | No |  |
| `kif` | `map` | No |  |
| `last_name` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map` | No |  |
| `phone` | `string` | No |  |
| `user_name` | `string` | No |  |
| `user_role` | `map` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-user/load (api/user client nil) (vs/jm "id" "user_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-user/remove (api/user client nil) (vs/jm "id" "user_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `User` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```clojure
(def client
  (api/make-sdk
    (vs/jm "feature"
      (vs/jm
        "test" (vs/jm "active" true)
        ))))
```

