# BluefinDecryptxP2pe JavaScript SDK



The JavaScript SDK for the BluefinDecryptxP2pe API — an entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Attestation()` — each with a small set of operations (`list`, `load`, `create`, `update`, `remove`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```js
npm install bluefin-decryptx-p2pe
```
## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.


### Create a Client

```js
const { BluefinDecryptxP2peSDK } = require('@voxgig-sdk/bluefin-decryptx-p2pe-js')

const client = new BluefinDecryptxP2peSDK({
  apikey: process.env.BLUEFIN_DECRYPTX_P2PE_APIKEY,
})
```

### Load an Attestation

```js
const attestation = await client.Attestation().load({ id: 'attestation_id' })
console.log(attestation)
```

### List Attestation Records

```js
const attestations = await client.Attestation().list()
for (const attestation of attestations) {
  console.log(attestation)
}
```

### Create a Attestation

```js
const created = await client.Attestation().create({
  client: {},
  completeDate: 'example_completeDate',
})
console.log(created)
```

### Direct API Access

Use `client.direct()` to call any API endpoint directly:

```js
const result = await client.direct({
  path: '/custom/endpoint/{id}',
  method: 'GET',
  params: { id: 'abc123' },
})

if (result.ok) {
  console.log(result.data)
}
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

For endpoints not covered by entity methods:

```js
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

```js
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

```js
const client = BluefinDecryptxP2peSDK.test()

const devicetype = await client.DeviceType().list()
// devicetype is the entity, populated with mock response data
// — call devicetype.data() for the record itself
console.log(devicetype)
```

You can also use the instance method:

```js
const client = new BluefinDecryptxP2peSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```js
const entity = client.DeviceType()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data.id)
```

### Add custom middleware

Pass features via the `extend` option:

```js
const logger = {
  hooks: {
    PreRequest: (ctx) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx) => {
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
cd js && npm test
```


## Reference

### BluefinDecryptxP2peSDK

#### Constructor

```js
new BluefinDecryptxP2peSDK(options?)
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
- `remove` resolves to `undefined`.

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```js
{
  ok: true,
  status: 200,
  headers: {},
  data: {}
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```js
{
  url: 'string',
  method: 'string',
  headers: {},
  body: undefined
}
```

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

Operations: create, list, load.

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

Operations: create, list, load.

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

Operations: list, load.

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

Operations: load.

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

Operations: list, load.

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

Operations: create, list, load, remove.

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

Operations: create, list, load.

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

Operations: create, list, load.

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

Operations: create, list, update.

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
| `client` | `Object` |  |
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `device` | `Object` |  |
| `id` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |

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
| `contact` | `Object` |  |
| `created` | `string` |  |
| `directPartner` | `Object` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `location` | `Object` |  |
| `mid` | `string` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `partner` | `Object` |  |
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
| `activatedBy` | `Object` |  |
| `activationDate` | `string` |  |
| `alternateKey` | `string` |  |
| `auditNextDate` | `string` |  |
| `auditNotificationDate` | `string` |  |
| `client` | `Object` |  |
| `created` | `string` |  |
| `createdBy` | `Object` |  |
| `deviceBuild` | `Object` |  |
| `deviceState` | `Object` |  |
| `deviceType` | `Object` |  |
| `errorCounter` | `number` |  |
| `errorLastDate` | `string` |  |
| `id` | `string` |  |
| `initializedBy` | `Object` |  |
| `initializedDate` | `string` |  |
| `injectKey` | `Object` |  |
| `isVirtual` | `boolean` |  |
| `kif` | `Object` |  |
| `lastActivityDate` | `string` |  |
| `location` | `Object` |  |
| `modified` | `string` |  |
| `modifiedBy` | `Object` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `partner` | `Object` |  |
| `serialNumber` | `string` |  |
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
  activatedBy: {},
  createdBy: {},
  initializedBy: {},
  location: {},
  modifiedBy: {},
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
| `appVersion` | `string` |  |
| `buildNumber` | `string` |  |
| `configFileName` | `string` |  |
| `created` | `string` |  |
| `deviceType` | `string` |  |
| `firmwareVersion` | `string` |  |
| `hardwareVersion` | `string` |  |
| `id` | `number` |  |
| `isActive` | `boolean` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `notes` | `string` |  |
| `version` | `number` |  |
| `whiteListingBinRanges` | `string` |  |
| `whiteListingUsed` | `boolean` |  |

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
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `Object` |  |
| `custodian` | `Object` |  |
| `device` | `Object` |  |
| `id` | `number` |  |
| `location` | `Object` |  |
| `modified` | `string` |  |
| `modifiedBy` | `Object` |  |
| `notes` | `string` |  |
| `status` | `Object` |  |
| `transferMethod` | `Object` |  |
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
| `completeDate` | `string` |  |
| `created` | `string` |  |
| `createdBy` | `Object` |  |
| `custodian` | `Object` |  |
| `device` | `Object` |  |
| `id` | `number` |  |
| `location` | `Object` |  |
| `modified` | `string` |  |
| `modifiedBy` | `Object` |  |
| `notes` | `string` |  |
| `status` | `Object` |  |
| `transferMethod` | `Object` |  |
| `version` | `number` |  |

#### Example: List

```ts
const device_custody_lists = await client.DeviceCustodyList().list({ device_type: "example", serial_number: "example" })
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
| `data` | `Array` |  |
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
| `isActive` | `boolean` |  |
| `isP2PE` | `boolean` |  |
| `keyType` | `string` |  |
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
| `billingId` | `string` |  |
| `clientCanOrderEquipment` | `boolean` |  |
| `contact` | `Object` |  |
| `created` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `location` | `Object` |  |
| `modified` | `string` |  |
| `name` | `string` |  |
| `parent` | `Object` |  |
| `partnerId` | `string` |  |
| `reference` | `string` |  |
| `verificationPhrase` | `string` |  |
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
| `client` | `Object` |  |
| `created` | `string` |  |
| `dateReceived` | `string` |  |
| `dateShipped` | `string` |  |
| `dcKif` | `Object` |  |
| `id` | `string` |  |
| `items` | `Array` |  |
| `kif` | `Object` |  |
| `modified` | `string` |  |
| `partner` | `Object` |  |
| `shipmentType` | `string` |  |
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
| `alternateKey` | `string` |  |
| `client` | `Object` |  |
| `clientRef` | `string` |  |
| `created` | `string` |  |
| `decrypted` | `number` |  |
| `deviceName` | `string` |  |
| `directPartner` | `Object` |  |
| `encrypted` | `number` |  |
| `endDate` | `string` |  |
| `errCode` | `string` |  |
| `errMessage` | `string` |  |
| `id` | `string` |  |
| `ipAddress` | `string` |  |
| `isVirtual` | `boolean` |  |
| `keyType` | `string` |  |
| `location` | `Object` |  |
| `messageId` | `string` |  |
| `method` | `string` |  |
| `partner` | `Object` |  |
| `reference` | `string` |  |
| `serialNumber` | `string` |  |
| `startDate` | `string` |  |
| `success` | `boolean` |  |
| `transactionSource` | `string` |  |

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
| `client` | `Object` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `kif` | `Object` |  |
| `lastName` | `string` |  |
| `partner` | `Object` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `Object` |  |
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
| `client` | `Object` |  |
| `created` | `string` |  |
| `email` | `string` |  |
| `firstName` | `string` |  |
| `id` | `string` |  |
| `isActive` | `boolean` |  |
| `kif` | `Object` |  |
| `lastName` | `string` |  |
| `modified` | `string` |  |
| `partner` | `Object` |  |
| `phone` | `string` |  |
| `userName` | `string` |  |
| `userRole` | `Object` |  |
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
│   ├── BluefinDecryptxP2peSDK.js        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
└── test/                   # Test suites
```

Import the SDK from the package root:

```js
const { BluefinDecryptxP2peSDK } = require('@voxgig-sdk/bluefin-decryptx-p2pe-js')
```

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
