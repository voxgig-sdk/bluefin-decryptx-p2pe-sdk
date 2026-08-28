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
| `client` | `map` | No | Reference to the associated Client resource. |
| `completeDate` | `string` | No | The date and time that the Attestation took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `device` | `map` | No | Reference to the associated Device resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `name` | `string` | No | Text describing the attestation. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Attestation. |

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
| `contact` | `map` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `directPartner` | `map` | No | Reference to the associated Partner. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Client account is active or disabled. |
| `location` | `map` | Yes | Reference to the associated Location resource. |
| `mid` | `string` | No | Some Partners will have an merchant ids on their own software offerings. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Client's name. |
| `partner` | `map` | No | Reference to the Client's root Partner. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `success` | `boolean` | No | true if the payload decryption was successful. |

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
| `activatedBy` | `map` | Yes | Reference to the associated User resource. |
| `activationDate` | `string` | No | Timestamp from when the Device was activated. |
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `auditNextDate` | `string` | No | Date and time that the Device is due its next PCI Audit. |
| `auditNotificationDate` | `string` | No | Date and time that a notification should be sent that a PCI audit is due. |
| `client` | `map` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map` | Yes | Reference to the associated User resource. |
| `deviceBuild` | `map` | No | Reference to the associated Device Build resource. |
| `deviceState` | `map` | No | Reference to the associated Device State resource. |
| `deviceType` | `map` | No | Reference to the associated Device Type resource. |
| `errorCounter` | `long` | No | The number times the Device has been in error. |
| `errorLastDate` | `string` | No | Timestamp from the last time that the Device had an error. |
| `id` | `string` | No | The Device's unique identifier. |
| `initializedBy` | `map` | Yes | Reference to the associated User resource. |
| `initializedDate` | `string` | No | Timestamp from when the Device was initialized. |
| `injectKey` | `map` | No | Reference to the associated Device resource. |
| `isVirtual` | `boolean` | No | Indicates if a Device is Virtual (represents a Device shared with a partner). |
| `kif` | `map` | No | Reference to the associated KIF resource. |
| `lastActivityDate` | `string` | No | Timestamp from the last time that the Device was used. |
| `location` | `map` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `map` | Yes | Reference to the associated User resource. |
| `name` | `string` | No | The Device's name. |
| `notes` | `string` | No | Arbitary note that can be attached to a Device entry. |
| `partner` | `map` | No | Reference to the associated Partner. |
| `serialNumber` | `string` | No | The Device's serial number. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `appVersion` | `string` | No | If a Device Type has more than one Application Code version the supported version is specified here. |
| `buildNumber` | `string` | No | The Build Number. |
| `configFileName` | `string` | No | The name of the configuration file that is uploaded to the device. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceType` | `string` | No | The Device Type Name. |
| `firmwareVersion` | `string` | No | A list of firmware versions that this Device Build covers. |
| `hardwareVersion` | `string` | No | A list of hardware versions that this Device Build covers. |
| `id` | `long` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the device build is still active and not succeeded by subsequent build. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Device Builds's name. |
| `notes` | `string` | No | Notes attached to the device build by Bluefin CISO. |
| `version` | `long` | No | The number of times that this resource has been updated. |
| `whiteListingBinRanges` | `string` | No | A comma separated list of BIN ranges that aren't encrypted by the terminal. |
| `whiteListingUsed` | `boolean` | No | This value is used in conjunction with whiteListingBinRanges to indicate the range card numbers that aren't encrypted by the terminal. |

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map` | Yes | Reference to the associated User resource. |
| `custodian` | `map` | Yes | Reference to the associated User resource. |
| `device` | `map` | No | Reference to the associated Device resource. |
| `id` | `long` | No | This resource's unique identifier. |
| `location` | `map` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `map` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map` | No | Reference to the associated Custody Status. |
| `transferMethod` | `map` | No | Reference to the associated Transfer Method. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `completeDate` | `string` | No | The date and time that the Custody change took place. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `createdBy` | `map` | Yes | Reference to the associated User resource. |
| `custodian` | `map` | Yes | Reference to the associated User resource. |
| `device` | `map` | No | Reference to the associated Device resource. |
| `id` | `long` | No | This resource's unique identifier. |
| `location` | `map` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `modifiedBy` | `map` | Yes | Reference to the associated User resource. |
| `notes` | `string` | No | Free form field that allows the Client associate notes with the Custody Change. |
| `status` | `map` | No | Reference to the associated Custody Status. |
| `transferMethod` | `map` | No | Reference to the associated Transfer Method. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `data` | `vector` | No | List of Devices. |
| `total` | `long` | No | Total number of Devices available (not the number of Users in the response). |

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
| `success` | `boolean` | Yes | Indicates if the action succeeded. |

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
| `success` | `boolean` | Yes | Indicates if the RKI activation succeeded. |

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
| `id` | `long` | No | Unique identifier for this Device state. |
| `name` | `string` | No | Descriptive name for this Device state. |

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `deviceTypeMode` | `string` | No | The Device type. |
| `hardwareVersion` | `string` | No | The Device hardware version. |
| `id` | `string` | No | Unique idenifier. |
| `isActive` | `boolean` | No | This property indicates if the DeviceType is active. |
| `manufacturer` | `string` | No | The Device manufacturer. |
| `model` | `string` | No | The Device model. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The DeviceType name. |
| `photoUrl` | `string` | No |  |
| `productName` | `string` | No | The Device name. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | unique idenifier |
| `isActive` | `boolean` | No | Active flag, inactive keys cannot be assigned to devices. |
| `isP2PE` | `boolean` | No | Flags if a key is for a P2PE compliant cypher. |
| `keyType` | `string` | No | The cipher type that the key works with. |
| `modified` | `string` | No | Last modified timestamp in ISO 8601 format. |
| `name` | `string` | No | Key name. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `id` | `long` | No | This resource's unique identifier. |
| `name` | `string` | No | The KIF's name. |

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
| `address1` | `string` | No | The Location's street address. |
| `address2` | `string` | No | The Location's street address. |
| `billingId` | `string` | No | \? |
| `city` | `string` | No | The Location's city. |
| `country` | `string` | No | The Location's country. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `customReference` | `string` | No | A Partner specified reference for a location. |
| `id` | `string` | No | This resource's unique identifier. |
| `locationType` | `string` | No | The Location's clasification. |
| `mailAddress1` | `string` | No | The Location's street address. |
| `mailAddress2` | `string` | No | The Location's street address. |
| `mailCity` | `string` | No | The Location's city. |
| `mailCountry` | `string` | No | The Location's street address. |
| `mailPostalCode` | `string` | No | The Location's postal code. |
| `mailStateProvince` | `string` | No | The Location's street state or province. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Location's name. |
| `nameOfBusiness` | `string` | No | The name of the business at this location. |
| `notes` | `string` | No | Note for delivery driver. |
| `postalCode` | `string` | No | The Location's postal code. |
| `stateProvince` | `string` | No | The Location's street state or province. |
| `uniqueId` | `string` | No | Unique Identifier for the Location. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `billingId` | `string` | No | The Partner's billing identifier. |
| `clientCanOrderEquipment` | `boolean` | No | This property indicates if the Partner is allowed to order Equipment. |
| `contact` | `map` | No | Reference to the associated User resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the Parter account is active or disabled. |
| `location` | `map` | Yes | Reference to the associated Location resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `name` | `string` | No | The Partner's name. |
| `parent` | `map` | No | Reference to the associated Partner. |
| `partnerId` | `string` | No | The Partner's id. |
| `reference` | `string` | No | The Partner's reference string. |
| `verificationPhrase` | `string` | No | The verification phrase is a message that the Partner creates. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `carrier` | `string` | No | The name of the courier. |
| `client` | `map` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `dateReceived` | `string` | No | The date and time that a package is recieved. |
| `dateShipped` | `string` | No | The date and time that a package is shipped. |
| `dcKif` | `map` | No | Reference to the associated KIF resource. |
| `id` | `string` | No | This resource's unique identifier. |
| `items` | `vector` | No |  |
| `kif` | `map` | No | Reference to the associated KIF resource. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `map` | No | Reference to the associated Partner. |
| `shipmentType` | `string` | No | The type of shipment. |
| `tracking` | `string` | No | The courier's tracking number. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `success` | `boolean` | No | Indicates if the action was a success. |

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
| `alternateKey` | `string` | No | The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device's casing or its packaging. |
| `client` | `map` | No | Reference to the associated Client resource. |
| `clientRef` | `string` | No | Client Reference property that is included in the decrypt API call. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `decrypted` | `long` | No | A Transcation can process muliple decryptions. |
| `deviceName` | `string` | No | The name of the Device that generated the payload to decrypt. |
| `directPartner` | `map` | No | Reference to the associated Partner. |
| `encrypted` | `long` | No | A Transcation can process muliple encryptions. |
| `endDate` | `string` | No | Timestamp from the end of the transaction. |
| `errCode` | `string` | No | The error code that is sent in response to a failed decrypt API call. |
| `errMessage` | `string` | No | The error messge that is sent in response to a failed decrypt API call. |
| `id` | `string` | No | This resource's unique identifier. |
| `ipAddress` | `string` | No | The IP address of the http client that makes the decrypt API call. |
| `isVirtual` | `boolean` | No | Indicates if the Transaction came from a virtual Device. |
| `keyType` | `string` | No | The type of cipher used during decrytion. |
| `location` | `map` | Yes | Reference to the associated Location resource. |
| `messageId` | `string` | No | Message ID. |
| `method` | `string` | No | The decryption cypher/method. |
| `partner` | `map` | No | Reference to the associated Partner. |
| `reference` | `string` | No | The reference property that the Client includes in the decrypt API call. |
| `serialNumber` | `string` | No | The serial number of the Device that generated the payload to decrypt. |
| `startDate` | `string` | No | Timestamp from the beginning of the transaction. |
| `success` | `boolean` | No | The success indicator. |
| `transactionSource` | `string` | No | The source of the Transaction. |

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
| `client` | `map` | No | Reference to the associated Client resource. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | ID of newly created resource |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `map` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `partner` | `map` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `map` | No | Reference to the associated User Role. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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
| `client` | `map` | No | Reference to the associated Client resource. |
| `created` | `string` | No | Creation timestamp in ISO 8601 format. |
| `email` | `string` | No | The User's email address. |
| `firstName` | `string` | No | The User's name. |
| `id` | `string` | No | This resource's unique identifier. |
| `isActive` | `boolean` | No | This property indicates if the User account is active or disabled. |
| `kif` | `map` | No | Reference to the associated KIF resource. |
| `lastName` | `string` | No | The User's Surname. |
| `modified` | `string` | No | Last modified timestamp. |
| `partner` | `map` | No | Reference to the associated Partner. |
| `phone` | `string` | No | The User's phone number without dashes, spaces, or brackets. |
| `userName` | `string` | No | The User's unique username. |
| `userRole` | `map` | No | Reference to the associated User Role. |
| `version` | `long` | No | The number of times that this resource has been updated. |

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

```clojure
(def client
  (api/make-sdk
    (vs/jm "feature"
      (vs/jm
        "audit" (vs/jm "active" true)
        "clienttrack" (vs/jm "active" true)
        "idempotency" (vs/jm "active" true)
        "log" (vs/jm "active" true)
        "metrics" (vs/jm "active" true)
        "paging" (vs/jm "active" true)
        "ratelimit" (vs/jm "active" true)
        "retry" (vs/jm "active" true)
        "telemetry" (vs/jm "active" true)
        "test" (vs/jm "active" true)
        "timeout" (vs/jm "active" true)
        ))))
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

