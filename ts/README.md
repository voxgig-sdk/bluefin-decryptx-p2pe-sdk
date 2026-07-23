# BluefinDecryptxP2pe TypeScript SDK



The TypeScript SDK for the BluefinDecryptxP2pe API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Attestation()` — each with a small set of operations (`list`, `load`, `create`, `update`, `remove`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases](https://github.com/voxgig-sdk/bluefin-decryptx-p2pe-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { BluefinDecryptxP2peSDK } from '@voxgig-sdk/bluefin-decryptx-p2pe'

const client = new BluefinDecryptxP2peSDK({
  apikey: process.env.BLUEFIN_DECRYPTX_P2PE_APIKEY,
})
```

### 2. List attestation records

`list()` resolves to an array of Attestation objects — iterate it directly:

```ts
const attestations = await client.Attestation().list()

for (const attestation of attestations) {
  console.log(attestation)
}
```

### 3. Load a devicecustodydetail

DeviceCustodyDetail is nested under device_type, so provide the `device_type`.
`load()` returns the entity directly and throws on failure:

```ts
try {
  const devicecustodydetail = await client.DeviceCustodyDetail().load({
    device_type: 'example_device_type',
    serial_number: 'example_serial_number',
    id: 'example_id',
  })
  console.log(devicecustodydetail)
} catch (err) {
  console.error('load failed:', err)
}
```

### 4. Create, update, and remove

```ts
// Create — returns the created Attestation
const created = await client.Attestation().create({
  client: {},
  complete_date: 'example_complete_date',
})

```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const attestations = await client.Attestation().list()
  console.log(attestations)
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

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result instanceof Error) {
  throw result
}
if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = BluefinDecryptxP2peSDK.test()

const attestation = await client.Attestation().list()
// attestation is a bare entity populated with mock response data
console.log(attestation)
```

You can also use the instance method:

```ts
const client = new BluefinDecryptxP2peSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Attestation()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data.id)
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new BluefinDecryptxP2peSDK({
  apikey: '...',
  extend: [logger],
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
cd ts && npm test
```


## Reference

### BluefinDecryptxP2peSDK

#### Constructor

```ts
new BluefinDecryptxP2peSDK(options?: {
  apikey?: string
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Attestation(data?)` | `AttestationEntity` | Create an Attestation entity instance. |
| `Client(data?)` | `ClientEntity` | Create a Client entity instance. |
| `CreateResult(data?)` | `CreateResultEntity` | Create a CreateResult entity instance. |
| `Decryption(data?)` | `DecryptionEntity` | Create a Decryption entity instance. |
| `Device(data?)` | `DeviceEntity` | Create a Device entity instance. |
| `DeviceBuild(data?)` | `DeviceBuildEntity` | Create a DeviceBuild entity instance. |
| `DeviceCustodyDetail(data?)` | `DeviceCustodyDetailEntity` | Create a DeviceCustodyDetail entity instance. |
| `DeviceCustodyList(data?)` | `DeviceCustodyListEntity` | Create a DeviceCustodyList entity instance. |
| `DeviceList(data?)` | `DeviceListEntity` | Create a DeviceList entity instance. |
| `DeviceReceiveResult(data?)` | `DeviceReceiveResultEntity` | Create a DeviceReceiveResult entity instance. |
| `DeviceRkiActivateResult(data?)` | `DeviceRkiActivateResultEntity` | Create a DeviceRkiActivateResult entity instance. |
| `DeviceState(data?)` | `DeviceStateEntity` | Create a DeviceState entity instance. |
| `DeviceType(data?)` | `DeviceTypeEntity` | Create a DeviceType entity instance. |
| `InjectKey(data?)` | `InjectKeyEntity` | Create an InjectKey entity instance. |
| `Kif(data?)` | `KifEntity` | Create a Kif entity instance. |
| `Location(data?)` | `LocationEntity` | Create a Location entity instance. |
| `Partner(data?)` | `PartnerEntity` | Create a Partner entity instance. |
| `Shipment(data?)` | `ShipmentEntity` | Create a Shipment entity instance. |
| `Success(data?)` | `SuccessEntity` | Create a Success entity instance. |
| `Transaction(data?)` | `TransactionEntity` | Create a Transaction entity instance. |
| `UpdateResult(data?)` | `UpdateResultEntity` | Create an UpdateResult entity instance. |
| `User(data?)` | `UserEntity` | Create an User entity instance. |
| `tester(testopts?, sdkopts?)` | `BluefinDecryptxP2peSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `BluefinDecryptxP2peSDK.test(testopts?, sdkopts?)` | `BluefinDecryptxP2peSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Entity>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<void>` | Remove an entity. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): BluefinDecryptxP2peSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load`, `create` and `update` resolve to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).
- `remove` resolves to `void`.

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

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

Operations: create, list, load.

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

Operations: create, list, load, remove.

API path: `/clients`

#### CreateResult

| Field | Description |
| --- | --- |

Operations: create.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### Decryption

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

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

Operations: create, list, load.

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

Operations: list, load.

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

Operations: load.

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

Operations: list.

API path: `/devices/{serialNumber}/{deviceType}/custody`

#### DeviceList

| Field | Description |
| --- | --- |
| `data` |  |
| `total` |  |

Operations: load.

API path: `/virtualDevices/{sharePartnerTo}`

#### DeviceReceiveResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

API path: `/devices/receive`

#### DeviceRkiActivateResult

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create.

API path: `/devices/rki/activate`

#### DeviceState

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: list.

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

Operations: list, load.

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

Operations: list, load.

API path: `/injectKeys`

#### Kif

| Field | Description |
| --- | --- |
| `id` |  |
| `name` |  |

Operations: list.

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

Operations: create, list, load, remove.

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

Operations: create, list, load.

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

Operations: create, list, load.

API path: `/shipments`

#### Success

| Field | Description |
| --- | --- |
| `success` |  |

Operations: create, remove.

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

Operations: create, list, load.

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

Operations: create, list, update.

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

Operations: load, remove.

API path: `/users/{id}`



## Entities


### Attestation

Create an instance: `const attestation = client.Attestation()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Record<string, any>` |  |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `device` | `Record<string, any>` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |

#### Example: Load

```ts
const attestation = await client.Attestation().load({ id: 'attestation_id' })
```

#### Example: List

```ts
const attestations = await client.Attestation().list()
```

#### Example: Create

```ts
const attestation = await client.Attestation().create({
})
```


### Client

Create an instance: `const client_ = client.Client()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `contact` | `Record<string, any>` |  |
| `created` | `string` |  |
| `direct_partner` | `Record<string, any>` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `location` | `Record<string, any>` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const client_ = await client.Client().load({ id: 'client_id' })
```

#### Example: List

```ts
const client_s = await client.Client().list()
```

#### Example: Create

```ts
const client_ = await client.Client().create({
  location: {},
})
```


### CreateResult

Create an instance: `const create_result = client.CreateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Example: Create

```ts
const create_result = await client.CreateResult().create({
  device_type: 'example_device_type',
  serial_number: 'example_serial_number',
})
```


### Decryption

Create an instance: `const decryption = client.Decryption()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```ts
const decryption = await client.Decryption().create({
})
```


### Device

Create an instance: `const device = client.Device()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `activated_by` | `Record<string, any>` |  |
| `activation_date` | `string` |  |
| `alternate_key` | `string` |  |
| `audit_next_date` | `string` |  |
| `audit_notification_date` | `string` |  |
| `client` | `Record<string, any>` |  |
| `created` | `string` |  |
| `created_by` | `Record<string, any>` |  |
| `device_build` | `Record<string, any>` |  |
| `device_state` | `Record<string, any>` |  |
| `device_type` | `Record<string, any>` |  |
| `error_counter` | `number` |  |
| `error_last_date` | `string` |  |
| `id` | `string` |  |
| `initialized_by` | `Record<string, any>` |  |
| `initialized_date` | `string` |  |
| `inject_key` | `Record<string, any>` |  |
| `is_virtual` | `boolean` |  |
| `kif` | `Record<string, any>` |  |
| `last_activity_date` | `string` |  |
| `location` | `Record<string, any>` |  |
| `modified` | `string` |  |
| `modified_by` | `Record<string, any>` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `serial_number` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const device = await client.Device().load({ id: 'device_id' })
```

#### Example: List

```ts
const devices = await client.Device().list()
```

#### Example: Create

```ts
const device = await client.Device().create({
  activated_by: {},
  created_by: {},
  initialized_by: {},
  location: {},
  modified_by: {},
})
```


### DeviceBuild

Create an instance: `const device_build = client.DeviceBuild()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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
| `id` | `number` |  |
| `is_active` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `note` | `string` |  |
| `version` | `number` |  |
| `white_listing_bin_range` | `string` |  |
| `white_listing_used` | `boolean` |  |

#### Example: Load

```ts
const device_build = await client.DeviceBuild().load({ id: 'device_build_id' })
```

#### Example: List

```ts
const device_builds = await client.DeviceBuild().list()
```


### DeviceCustodyDetail

Create an instance: `const device_custody_detail = client.DeviceCustodyDetail()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `Record<string, any>` |  |
| `custodian` | `Record<string, any>` |  |
| `device` | `Record<string, any>` |  |
| `id` | `number` |  |
| `location` | `Record<string, any>` |  |
| `modified` | `string` |  |
| `modified_by` | `Record<string, any>` |  |
| `note` | `string` |  |
| `status` | `Record<string, any>` |  |
| `transfer_method` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const device_custody_detail = await client.DeviceCustodyDetail().load({ id: 'device_custody_detail_id', device_type: 'device_type', serial_number: 'serial_number' })
```


### DeviceCustodyList

Create an instance: `const device_custody_list = client.DeviceCustodyList()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `complete_date` | `string` |  |
| `created` | `string` |  |
| `created_by` | `Record<string, any>` |  |
| `custodian` | `Record<string, any>` |  |
| `device` | `Record<string, any>` |  |
| `id` | `number` |  |
| `location` | `Record<string, any>` |  |
| `modified` | `string` |  |
| `modified_by` | `Record<string, any>` |  |
| `note` | `string` |  |
| `status` | `Record<string, any>` |  |
| `transfer_method` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: List

```ts
const device_custody_lists = await client.DeviceCustodyList().list()
```


### DeviceList

Create an instance: `const device_list = client.DeviceList()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `data` | `any[]` |  |
| `total` | `number` |  |

#### Example: Load

```ts
const device_list = await client.DeviceList().load({ share_partner_to: 'share_partner_to' })
```


### DeviceReceiveResult

Create an instance: `const device_receive_result = client.DeviceReceiveResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```ts
const device_receive_result = await client.DeviceReceiveResult().create({
  success: true,
})
```


### DeviceRkiActivateResult

Create an instance: `const device_rki_activate_result = client.DeviceRkiActivateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```ts
const device_rki_activate_result = await client.DeviceRkiActivateResult().create({
  success: true,
})
```


### DeviceState

Create an instance: `const device_state = client.DeviceState()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `number` |  |
| `name` | `string` |  |

#### Example: List

```ts
const device_states = await client.DeviceState().list()
```


### DeviceType

Create an instance: `const device_type = client.DeviceType()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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
| `version` | `number` |  |

#### Example: Load

```ts
const device_type = await client.DeviceType().load({ id: 'device_type_id' })
```

#### Example: List

```ts
const device_types = await client.DeviceType().list()
```


### InjectKey

Create an instance: `const inject_key = client.InjectKey()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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
| `version` | `number` |  |

#### Example: Load

```ts
const inject_key = await client.InjectKey().load({ id: 'inject_key_id' })
```

#### Example: List

```ts
const inject_keys = await client.InjectKey().list()
```


### Kif

Create an instance: `const kif = client.Kif()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | `number` |  |
| `name` | `string` |  |

#### Example: List

```ts
const kifs = await client.Kif().list()
```


### Location

Create an instance: `const location = client.Location()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

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
| `version` | `number` |  |

#### Example: Load

```ts
const location = await client.Location().load({ id: 'location_id' })
```

#### Example: List

```ts
const locations = await client.Location().list()
```

#### Example: Create

```ts
const location = await client.Location().create({
})
```


### Partner

Create an instance: `const partner = client.Partner()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `billing_id` | `string` |  |
| `client_can_order_equipment` | `boolean` |  |
| `contact` | `Record<string, any>` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `location` | `Record<string, any>` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `Record<string, any>` |  |
| `partner_id` | `string` |  |
| `reference` | `string` |  |
| `verification_phrase` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const partner = await client.Partner().load({ id: 'partner_id' })
```

#### Example: List

```ts
const partners = await client.Partner().list()
```

#### Example: Create

```ts
const partner = await client.Partner().create({
  location: {},
})
```


### Shipment

Create an instance: `const shipment = client.Shipment()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `carrier` | `string` |  |
| `client` | `Record<string, any>` |  |
| `created` | `string` |  |
| `date_received` | `string` |  |
| `date_shipped` | `string` |  |
| `dc_kif` | `Record<string, any>` |  |
| `id` | `string` |  |
| `item` | `any[]` |  |
| `kif` | `Record<string, any>` |  |
| `modified` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `shipment_type` | `string` |  |
| `tracking` | `string` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const shipment = await client.Shipment().load({ id: 'shipment_id' })
```

#### Example: List

```ts
const shipments = await client.Shipment().list()
```

#### Example: Create

```ts
const shipment = await client.Shipment().create({
})
```


### Success

Create an instance: `const success = client.Success()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | `boolean` |  |

#### Example: Create

```ts
const success = await client.Success().create({
  share_partner_to: 'example_share_partner_to',
})
```


### Transaction

Create an instance: `const transaction = client.Transaction()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `alternate_key` | `string` |  |
| `client` | `Record<string, any>` |  |
| `client_ref` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `number` |  |
| `device_name` | `string` |  |
| `direct_partner` | `Record<string, any>` |  |
| `encrypted` | `number` |  |
| `end_date` | `string` |  |
| `err_code` | `string` |  |
| `err_message` | `string` |  |
| `id` | `string` |  |
| `ip_address` | `string` |  |
| `is_virtual` | `boolean` |  |
| `key_type` | `string` |  |
| `location` | `Record<string, any>` |  |
| `message_id` | `string` |  |
| `method` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `reference` | `string` |  |
| `serial_number` | `string` |  |
| `start_date` | `string` |  |
| `success` | `boolean` |  |
| `transaction_source` | `string` |  |

#### Example: Load

```ts
const transaction = await client.Transaction().load({ id: 'transaction_id' })
```

#### Example: List

```ts
const transactions = await client.Transaction().list()
```

#### Example: Create

```ts
const transaction = await client.Transaction().create({
  location: {},
})
```


### UpdateResult

Create an instance: `const update_result = client.UpdateResult()`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |
| `list(match)` | List entities matching the criteria. |
| `update(data)` | Update an existing entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Record<string, any>` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `kif` | `Record<string, any>` |  |
| `last_name` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: List

```ts
const update_results = await client.UpdateResult().list()
```

#### Example: Create

```ts
const update_result = await client.UpdateResult().create({
})
```


### User

Create an instance: `const user = client.User()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |
| `remove(match)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `client` | `Record<string, any>` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `first_name` | `string` |  |
| `id` | `string` |  |
| `is_active` | `boolean` |  |
| `kif` | `Record<string, any>` |  |
| `last_name` | `string` |  |
| `modified` | `string` |  |
| `partner` | `Record<string, any>` |  |
| `phone` | `string` |  |
| `user_name` | `string` |  |
| `user_role` | `Record<string, any>` |  |
| `version` | `number` |  |

#### Example: Load

```ts
const user = await client.User().load({ id: 'user_id' })
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

### Module structure

```
bluefin-decryptx-p2pe/
├── src/
│   ├── BluefinDecryptxP2peSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { BluefinDecryptxP2peSDK } from '@voxgig-sdk/bluefin-decryptx-p2pe'
```

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const attestation = client.Attestation()
await attestation.list()

// attestation.data() now returns the attestation data from the last `list`
// attestation.match() returns the last match criteria
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
