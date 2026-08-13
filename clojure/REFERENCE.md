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
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `device` | `map` | No |  |
| `id` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |

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
| `directPartner` | `map` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
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
| `activatedBy` | `map` | Yes |  |
| `activationDate` | `string` | No |  |
| `alternateKey` | `string` | No |  |
| `auditNextDate` | `string` | No |  |
| `auditNotificationDate` | `string` | No |  |
| `client` | `map` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `map` | Yes |  |
| `deviceBuild` | `map` | No |  |
| `deviceState` | `map` | No |  |
| `deviceType` | `map` | No |  |
| `errorCounter` | `long` | No |  |
| `errorLastDate` | `string` | No |  |
| `id` | `string` | No |  |
| `initializedBy` | `map` | Yes |  |
| `initializedDate` | `string` | No |  |
| `injectKey` | `map` | No |  |
| `isVirtual` | `boolean` | No |  |
| `kif` | `map` | No |  |
| `lastActivityDate` | `string` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `map` | Yes |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `partner` | `map` | No |  |
| `serialNumber` | `string` | No |  |
| `version` | `long` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
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
| `appVersion` | `string` | No |  |
| `buildNumber` | `string` | No |  |
| `configFileName` | `string` | No |  |
| `created` | `string` | No |  |
| `deviceType` | `string` | No |  |
| `firmwareVersion` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `long` | No |  |
| `isActive` | `boolean` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `notes` | `string` | No |  |
| `version` | `long` | No |  |
| `whiteListingBinRanges` | `string` | No |  |
| `whiteListingUsed` | `boolean` | No |  |

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
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `map` | Yes |  |
| `custodian` | `map` | Yes |  |
| `device` | `map` | No |  |
| `id` | `long` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `map` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `map` | No |  |
| `transferMethod` | `map` | No |  |
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
| `completeDate` | `string` | No |  |
| `created` | `string` | No |  |
| `createdBy` | `map` | Yes |  |
| `custodian` | `map` | Yes |  |
| `device` | `map` | No |  |
| `id` | `long` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `modifiedBy` | `map` | Yes |  |
| `notes` | `string` | No |  |
| `status` | `map` | No |  |
| `transferMethod` | `map` | No |  |
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
| `deviceTypeMode` | `string` | No |  |
| `hardwareVersion` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `manufacturer` | `string` | No |  |
| `model` | `string` | No |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No |  |
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
| `isActive` | `boolean` | No |  |
| `isP2PE` | `boolean` | No |  |
| `keyType` | `string` | No |  |
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
| `billingId` | `string` | No |  |
| `clientCanOrderEquipment` | `boolean` | No |  |
| `contact` | `map` | No |  |
| `created` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `location` | `map` | Yes |  |
| `modified` | `string` | No |  |
| `name` | `string` | No |  |
| `parent` | `map` | No |  |
| `partnerId` | `string` | No |  |
| `reference` | `string` | No |  |
| `verificationPhrase` | `string` | No |  |
| `version` | `long` | No |  |

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
| `dateReceived` | `string` | No |  |
| `dateShipped` | `string` | No |  |
| `dcKif` | `map` | No |  |
| `id` | `string` | No |  |
| `items` | `vector` | No |  |
| `kif` | `map` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map` | No |  |
| `shipmentType` | `string` | No |  |
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
| `alternateKey` | `string` | No |  |
| `client` | `map` | No |  |
| `clientRef` | `string` | No |  |
| `created` | `string` | No |  |
| `decrypted` | `long` | No |  |
| `deviceName` | `string` | No |  |
| `directPartner` | `map` | No |  |
| `encrypted` | `long` | No |  |
| `endDate` | `string` | No |  |
| `errCode` | `string` | No |  |
| `errMessage` | `string` | No |  |
| `id` | `string` | No |  |
| `ipAddress` | `string` | No |  |
| `isVirtual` | `boolean` | No |  |
| `keyType` | `string` | No |  |
| `location` | `map` | Yes |  |
| `messageId` | `string` | No |  |
| `method` | `string` | No |  |
| `partner` | `map` | No |  |
| `reference` | `string` | No |  |
| `serialNumber` | `string` | No |  |
| `startDate` | `string` | No |  |
| `success` | `boolean` | No |  |
| `transactionSource` | `string` | No |  |

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
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `kif` | `map` | No |  |
| `lastName` | `string` | No |  |
| `partner` | `map` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `map` | No |  |
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
| `firstName` | `string` | No |  |
| `id` | `string` | No |  |
| `isActive` | `boolean` | No |  |
| `kif` | `map` | No |  |
| `lastName` | `string` | No |  |
| `modified` | `string` | No |  |
| `partner` | `map` | No |  |
| `phone` | `string` | No |  |
| `userName` | `string` | No |  |
| `userRole` | `map` | No |  |
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

