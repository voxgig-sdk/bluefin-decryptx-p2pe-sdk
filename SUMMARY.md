# Decryptx External Api

# Overview The purpose of the Decryptx management APIs are to provide Decryptx Partners and Key Injection Facilities (KIFs) a way to integrate their services to the Decryptx Platform. These APIs allow them to integrate P2PE Manager functionality into their own services, therefore providing their merchants an alternative to the P2PE Manager for common tasks. ### Deleting Resource With the Management APIs, as with the P2PE Manager, once a resource has been utilized it cannot be deleted. For example, if a user has logged into the system even once they cannot be deleted. Instead of deleting resources that have been deleted, they shhould be set to inactive. ### Transactions endpoints The transaction endpoints are included in the Management APIs for Partners that have their own (Domain 5) P2PE compliant decryption environment and who wish to use our platform to manage their partners, merchants and devices. Our transactions endpoints allow Partners journal their decryption activity into the P2PE Manager, allowing the Partner to utilize the device management and chain-of-custody functionality of the P2PE Manager. Even when decryptions occur outside of the Decryptx system, the Partner&#39;s Client can still benefit from the P2PE Manager&#39;s device management, chain of custody, and historical decryption activity logs functionality. # Authentication All calls to our Management APIs support basic and HMAC authentication. For instruction of how to implement HMAC please refer to the guide on our developer portal (https://developers.bluefin.com/p2pe-manager/apiguides/hmac). Basic authentication is a simple authentication scheme built into the HTTP protocol, the client sends HTTP requests with an Authorization header that contains the word *&#39;Basic&#39;*, followed by a space and a base64-encoded string username:password. For example, for the username and password, user and password, the authentication header is as follows: ~~~ //Authorization: Basic base64(user:pasword) ~~~ Output: ~~~ Authorization: Basic dXNlcjpwYXNzd29yZA== ~~~ The Management accept the same usernames and passwords from the P2PEManager; importantly, access to respourse are limited based on the user role. A KIF user can access number of API endpoints that the Patner user cannot and vice versa. On the other hand, there are a number of APIs that are common to both types of Users. ### Partner User Access The following table outlines the REST operations that a Partner user can access. Client level users are not allowed to integrate with theses APIs, instead these APIs are designed so that the Client&#39;s Partner would integrate functionality to their service. That design decision has resulted in the Partners having increased access to P2PE resources on the APIs when compared to the P2PEManager GUI. For example, a Partner can alter a device&#39;s state with the Management APIs, whereas they cannot on the P2PE Manager GUI. | EndPoint | GET (all) | POST | GET (Single) | PATCH | DELETE | |----------------------|:---------:|:----:|:------------:|:-----:|:------:| | /api/v1/users | ✔ | ✔ | ✔ | ✔ | ✔* | | /api/v1/partners | ✔ | ✔ | ✔ | ✔ | | | /api/v1/clients | ✔ | ✔ | ✔ | ✔ | | | /api/v1/decryption | | ✔ | | | | | /api/v1/devices | ✔ | ✔ | ✔ | ✔ | ✔* | | /api/v1/deviceBuilds | ✔ | | ✔ | | | | /api/v1/deviceTypes | ✔ | | ✔ | | | | /api/v1/deviceStates | ✔ | | | | | | /api/v1/devices/&#123;serial&#125;/&#123;type&#125;/custody | ✔ | ✔ | ✔ | | | | /api/v1/locations | ✔ | ✔ | ✔ | ✔ | ✔* | | /api/v1/shipments | | | | | | | /api/v1/attestations | ✔ | ✔ | ✔ | | | | /api/v1/transactions | ✔ | ✔ | ✔ | ✔ | | | /api/v1/kifs | ✔ | | | | | | /api/v1/injectkeys | | | | | | | /api/v1/virtualDevices/&#123;partner&#125; | | ✔ | ✔ | | ✔ | * A resource that has been used one or more times cannot be deleted. ### KIF User Access The following table outlines the subset of Management APIs that a KIF user can access. Within this subset, some resources will only appear if they are in a particular state. For example, a Device will appear in the GET all endpoint if its deviceState is set to Unassigned, Assigned, or Injected. Once it is received by the merchant and set to *&#39;stored&#39;* or *&#39;activating&#39;* it will no longer appear on the GET all devices response for the originating KIF. | Endpoint | GET (all) | POST | GET (Single) | PATCH | DELETE | |----------------------|:---------:|:----:|:------------:|:-----:|:------:| | /api/v1/users | ✔ | ✔ | ✔ | ✔ | ✔* | | /api/v1/partners | ✔ | | ✔ | | | | /api/v1/clients | ✔ | | ✔ | | | | /api/v1/decryption | | ✔ | | | | | /api/v1/devices | ✔ | ✔ | ✔ | | | | /api/v1/deviceBuilds | ✔ | | ✔ | | | | /api/v1/deviceTypes | ✔ | | ✔ | | | | /api/v1/deviceStates | ✔ | | | | | | /api/v1/devices/&#123;serial&#125;/&#123;type&#125;/custody | | | | | | | /api/v1/locations | ✔ | ✔ | ✔ | ✔ | ✔* | | /api/v1/shipments | ✔ | ✔ | ✔ | ✔ | | | /api/v1/attestations | | | | | | | /api/v1/transactions | | | | | | | /api/v1/kifs | ✔ | | | | | | /api/v1/injectkeys | ✔ | | ✔ | | | | /api/v1/virtualDevices/&#123;partner&#125; | | | | | | * A resource that has been used one or more times it cannot be deleted.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 22 entities and 52 HTTP routes. There are 23 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### [Attestation](docs/api/attestation.html)

Results: Attestation create response; Attestations list; Attestation details.

SDK operations: `create`, `list`, `load`.

Key fields to recognise:

- `client`: Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.
- `completeDate`: The date and time that the Attestation took place.
- `created`: Creation timestamp in ISO 8601 format.
- `device`: Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.
- `id`: Attestation Id

### [Client](docs/api/client.html)

Results: Client create response; Clients list; Client details; Client has been deleted successfully.

SDK operations: `create`, `list`, `load`, `remove`.

Key fields to recognise:

- `contact`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `created`: Creation timestamp in ISO 8601 format.
- `directPartner`: Reference to the associated Partner. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.
- `id`: ID of newly created resource
- `isActive`: This property indicates if the Client account is active or disabled. It is not possible to delete Clients, however their account can be set to inactive.

### [CreateResult](docs/api/create_result.html)

Results: Device Custody create response.

SDK operations: `create`.

### [Decryption](docs/api/decryption.html)

Results: Decryption response.

SDK operations: `create`.

Key fields to recognise:

- `success`: true if the payload decryption was successful.

### [Device](docs/api/device.html)

Results: Device create response; Device list; Device details.

SDK operations: `create`, `list`, `load`.

Key fields to recognise:

- `activatedBy`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `activationDate`: Timestamp from when the Device was activated.
- `alternateKey`: The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device&#39;s casing or its packaging. If there is a difference between the two, the serial number on the casing or packaging should be used as the alternative key and also in the alterntive key property of any related Shipments entries.
- `auditNextDate`: Date and time that the Device is due its next PCI Audit.
- `auditNotificationDate`: Date and time that a notification should be sent that a PCI audit is due.

### [DeviceBuild](docs/api/device_build.html)

Results: Device Builds list; Device Build details.

SDK operations: `list`, `load`.

Key fields to recognise:

- `appVersion`: If a Device Type has more than one Application Code version the supported version is specified here.
- `buildNumber`: The Build Number.
- `configFileName`: The name of the configuration file that is uploaded to the device.
- `created`: Creation timestamp in ISO 8601 format.
- `deviceType`: The Device Type Name.

### [DeviceCustodyDetail](docs/api/device_custody_detail.html)

Results: Device Custody Details.

SDK operations: `load`.

Key fields to recognise:

- `completeDate`: The date and time that the Custody change took place.
- `created`: Creation timestamp in ISO 8601 format.
- `createdBy`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `custodian`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `device`: Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.

### [DeviceCustodyList](docs/api/device_custody_list.html)

Results: Device Custody list.

SDK operations: `list`.

Key fields to recognise:

- `completeDate`: The date and time that the Custody change took place. If this value is omitted from the API call the custody change will have to be manually completed on the P2PE Manager GUI.
- `created`: Creation timestamp in ISO 8601 format.
- `createdBy`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `custodian`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `device`: Reference to the associated Device resource. When used for POST and PATCH API calls, the reference can contain either the ID or Serial Number. With GET API calls, both properties are included in the response.

### [DeviceList](docs/api/device_list.html)

Results: Virtual Device list.

SDK operations: `load`.

Key fields to recognise:

- `data`: List of Devices.
- `total`: Total number of Devices available (not the number of Users in the response).

### [DeviceReceiveResult](docs/api/device_receive_result.html)

Results: Device activation result.

SDK operations: `create`.

Key fields to recognise:

- `success`: Indicates if the action succeeded.

### [DeviceRkiActivateResult](docs/api/device_rki_activate_result.html)

Results: Device activation result.

SDK operations: `create`.

Key fields to recognise:

- `success`: Indicates if the RKI activation succeeded.

### [DeviceState](docs/api/device_state.html)

Results: Device States list.

SDK operations: `list`.

Key fields to recognise:

- `id`: Unique identifier for this Device state.
- `name`: Descriptive name for this Device state.

### [DeviceType](docs/api/device_type.html)

Results: Device Types list; Device Type details.

SDK operations: `list`, `load`.

Key fields to recognise:

- `created`: Creation timestamp in ISO 8601 format.
- `deviceTypeMode`: The Device type.
- `hardwareVersion`: The Device hardware version.
- `id`: Unique idenifier.
- `isActive`: This property indicates if the DeviceType is active. Once a DeviceType has been used once it can no longer be deleted. However a Device can be set to inactive.

### [InjectKey](docs/api/inject_key.html)

Results: Inject Keys list; Inject Key details.

SDK operations: `list`, `load`.

Key fields to recognise:

- `created`: Creation timestamp in ISO 8601 format.
- `id`: unique idenifier
- `isActive`: Active flag, inactive keys cannot be assigned to devices.
- `isP2PE`: Flags if a key is for a P2PE compliant cypher.
- `keyType`: The cipher type that the key works with.

### [Kif](docs/api/kif.html)

Results: KIFs list.

SDK operations: `list`.

Key fields to recognise:

- `id`: This resource&#39;s unique identifier.
- `name`: The KIF&#39;s name.

### [Location](docs/api/location.html)

Results: Location create response; Locations list; Location details; Location has been deleted successfully.

SDK operations: `create`, `list`, `load`, `remove`.

Key fields to recognise:

- `address1`: The Location&#39;s street address.
- `address2`: The Location&#39;s street address.
- `billingId`: \?
- `city`: The Location&#39;s city.
- `country`: The Location&#39;s country.

### [Partner](docs/api/partner.html)

Results: Partner create response; Partners list; Partner details.

SDK operations: `create`, `list`, `load`.

Key fields to recognise:

- `billingId`: The Partner&#39;s billing identifier.
- `clientCanOrderEquipment`: This property indicates if the Partner is allowed to order Equipment.
- `contact`: Reference to the associated User resource. When used for POST and PATCH API calls, the reference must contain the User&#39;s id.
- `created`: Creation timestamp in ISO 8601 format.
- `id`: ID of newly created resource

### [Shipment](docs/api/shipment.html)

Results: Shipment create response; Shipments list; Shipment details.

SDK operations: `create`, `list`, `load`.

Key fields to recognise:

- `carrier`: The name of the courier.
- `client`: Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.
- `created`: Creation timestamp in ISO 8601 format.
- `dateReceived`: The date and time that a package was recieved.
- `dateShipped`: The date and time that a package is shipped.

### [Success](docs/api/success.html)

Results: Ok.

SDK operations: `create`, `remove`.

Key fields to recognise:

- `success`: Indicates if the action was a success.

### [Transaction](docs/api/transaction.html)

Results: Transaction create response; Transactions list; Transaction details.

SDK operations: `create`, `list`, `load`.

Key fields to recognise:

- `alternateKey`: The alternative key is used when a Device outputs a different serial number from its firmware/software when compared to the serial number that is printed on the Device&#39;s casing or its packaging. If there is a difference between the two, the serial number on the casing or packaging should be used as the alternative key and also in the alterntive key property of any related Shipments entries.
- `client`: Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.
- `clientRef`: Client Reference property that is included in the decrypt API call.
- `created`: Creation timestamp in ISO 8601 format.
- `decrypted`: A Transcation can process muliple decryptions. This property contains the total decryption count.

### [UpdateResult](docs/api/update_result.html)

Results: User create response; Users list; Client update response; Device update response; Location update response; Partner update response; Shipment update response; Transaction update response; User update response.

SDK operations: `create`, `list`, `update`.

Key fields to recognise:

- `client`: Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.
- `email`: The User&#39;s email address.
- `firstName`: The User&#39;s name.
- `id`: ID of newly created resource
- `isActive`: This property indicates if the User account is active or disabled. Once a user has logged into the system, their account cannot be deleted. As an alternative, their account can be set to inactive.

### [User](docs/api/user.html)

Results: User details; User has been deleted successfully.

SDK operations: `load`, `remove`.

Key fields to recognise:

- `client`: Reference to the associated Client resource. When used for POST and PATCH API calls, the reference can contain either the ID or Name. With GET API calls, both properties are populated.
- `created`: Creation timestamp in ISO 8601 format.
- `email`: The User&#39;s email address.
- `firstName`: The User&#39;s name.
- `id`: This resource&#39;s unique identifier.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| [Attestation](docs/api/attestation.html) | `create` | `POST /attestations` | Required |
| [Attestation](docs/api/attestation.html) | `list` | `GET /attestations` | Required |
| [Attestation](docs/api/attestation.html) | `load` | `GET /attestations/{id}` | Required |
| [Client](docs/api/client.html) | `create` | `POST /clients` | Required |
| [Client](docs/api/client.html) | `list` | `GET /clients` | Required |
| [Client](docs/api/client.html) | `load` | `GET /clients/{id}` | Required |
| [Client](docs/api/client.html) | `remove` | `DELETE /clients/{id}` | Required |
| [CreateResult](docs/api/create_result.html) | `create` | `POST /devices/{serialNumber}/{deviceType}/custody` | Required |
| [Decryption](docs/api/decryption.html) | `create` | `POST /decryption` | Required |
| [Device](docs/api/device.html) | `create` | `POST /devices` | Required |
| [Device](docs/api/device.html) | `list` | `GET /devices` | Required |
| [Device](docs/api/device.html) | `load` | `GET /devices/{serialNumber}/{deviceType}` | Required |
| [Device](docs/api/device.html) | `load` | `GET /devices/{id}` | Required |
| [DeviceBuild](docs/api/device_build.html) | `list` | `GET /deviceBuilds` | Required |
| [DeviceBuild](docs/api/device_build.html) | `load` | `GET /deviceBuilds/{id}` | Required |
| [DeviceCustodyDetail](docs/api/device_custody_detail.html) | `load` | `GET /devices/{serialNumber}/{deviceType}/custody/{id}` | Required |
| [DeviceCustodyList](docs/api/device_custody_list.html) | `list` | `GET /devices/{serialNumber}/{deviceType}/custody` | Required |
| [DeviceList](docs/api/device_list.html) | `load` | `GET /virtualDevices/{sharePartnerTo}` | Required |
| [DeviceReceiveResult](docs/api/device_receive_result.html) | `create` | `POST /devices/receive` | Required |
| [DeviceRkiActivateResult](docs/api/device_rki_activate_result.html) | `create` | `POST /devices/rki/activate` | Required |
| [DeviceState](docs/api/device_state.html) | `list` | `GET /deviceStates` | Required |
| [DeviceType](docs/api/device_type.html) | `list` | `GET /deviceTypes` | Required |
| [DeviceType](docs/api/device_type.html) | `load` | `GET /deviceTypes/{id}` | Required |
| [InjectKey](docs/api/inject_key.html) | `list` | `GET /injectKeys` | Required |
| [InjectKey](docs/api/inject_key.html) | `load` | `GET /injectKeys/{id}` | Required |
| [Kif](docs/api/kif.html) | `list` | `GET /kifs` | Required |
| [Location](docs/api/location.html) | `create` | `POST /locations` | Required |
| [Location](docs/api/location.html) | `list` | `GET /locations` | Required |
| [Location](docs/api/location.html) | `load` | `GET /locations/{id}` | Required |
| [Location](docs/api/location.html) | `remove` | `DELETE /locations/{id}` | Required |
| [Partner](docs/api/partner.html) | `create` | `POST /partners` | Required |
| [Partner](docs/api/partner.html) | `list` | `GET /partners` | Required |
| [Partner](docs/api/partner.html) | `load` | `GET /partners/{id}` | Required |
| [Shipment](docs/api/shipment.html) | `create` | `POST /shipments` | Required |
| [Shipment](docs/api/shipment.html) | `list` | `GET /shipments` | Required |
| [Shipment](docs/api/shipment.html) | `load` | `GET /shipments/{id}` | Required |
| [Success](docs/api/success.html) | `create` | `POST /virtualDevices/{sharePartnerTo}` | Required |
| [Success](docs/api/success.html) | `remove` | `DELETE /virtualDevices/{sharePartnerTo}` | Required |
| [Transaction](docs/api/transaction.html) | `create` | `POST /transactions` | Required |
| [Transaction](docs/api/transaction.html) | `list` | `GET /transactions` | Required |
| [Transaction](docs/api/transaction.html) | `load` | `GET /transactions/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `create` | `POST /users` | Required |
| [UpdateResult](docs/api/update_result.html) | `list` | `GET /users` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /clients/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /devices/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /locations/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /partners/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /shipments/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /transactions/{id}` | Required |
| [UpdateResult](docs/api/update_result.html) | `update` | `PATCH /users/{id}` | Required |
| [User](docs/api/user.html) | `load` | `GET /users/{id}` | Required |
| [User](docs/api/user.html) | `remove` | `DELETE /users/{id}` | Required |

## Connect to the API

- API server: `https://apis.p2pemanager.com/api/v1`
- API server: `http://apis.p2pemanager.com/api/v1`

The default credential is sent in the `Authorization` header with the `Basic` prefix.

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| [C](docs/sdks/c.html) | `c/` | Build from source |
| [Clojure](docs/sdks/clojure.html) | `clojure/` | Build from source |
| [C++](docs/sdks/cpp.html) | `cpp/` | Build from source |
| [C#](docs/sdks/csharp.html) | `csharp/` | Build from source |
| [Dart](docs/sdks/dart.html) | `dart/` | Build from source |
| [Elixir](docs/sdks/elixir.html) | `elixir/` | Build from source |
| [Golang](docs/sdks/go.html) | `go/` | Build from source |
| [Haskell](docs/sdks/haskell.html) | `haskell/` | Build from source |
| [Java](docs/sdks/java.html) | `java/` | Build from source |
| [JavaScript](docs/sdks/js.html) | `js/` | Build from source |
| [Kotlin](docs/sdks/kotlin.html) | `kotlin/` | Build from source |
| [Lean](docs/sdks/lean.html) | `lean/` | Build from source |
| [Lua](docs/sdks/lua.html) | `lua/` | Build from source |
| [OCaml](docs/sdks/ocaml.html) | `ocaml/` | Build from source |
| [Perl](docs/sdks/perl.html) | `perl/` | Build from source |
| [PHP](docs/sdks/php.html) | `php/` | Build from source |
| [Python](docs/sdks/py.html) | `py/` | Build from source |
| [Ruby](docs/sdks/rb.html) | `rb/` | Build from source |
| [Rust](docs/sdks/rust.html) | `rust/` | Build from source |
| [Scala](docs/sdks/scala.html) | `scala/` | Build from source |
| [Swift](docs/sdks/swift.html) | `swift/` | Build from source |
| [TypeScript](docs/sdks/ts.html) | `ts/` | Build from source |
| [Zig](docs/sdks/zig.html) | `zig/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### [Go CLI](docs/tools/go-cli.html)

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### [Go MCP server](docs/tools/go-mcp.html)

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `bluefin-decryptx-p2pe_list`: List records for an entity. Supported entities: `attestation`, `client`, `device`, `device_build`, `device_custody_list`, `device_state`, `device_type`, `inject_key`, `kif`, `location`, `partner`, `shipment`, `transaction`, `update_result`.
- `bluefin-decryptx-p2pe_load`: Load one record for an entity. Supported entities: `attestation`, `client`, `device`, `device_build`, `device_custody_detail`, `device_list`, `device_type`, `inject_key`, `location`, `partner`, `shipment`, `transaction`, `user`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- [`audit`](docs/features/audit.html): Structured audit trail of operations
- [`clienttrack`](docs/features/clienttrack.html): Client identity and per-request correlation headers
- [`debug`](docs/features/debug.html): Request/response capture ring buffer for debugging
- [`idempotency`](docs/features/idempotency.html): Idempotency keys for safe retries of mutating operations
- [`log`](docs/features/log.html): Structured request and response logging
- [`metrics`](docs/features/metrics.html): Statistics capture: per-operation counters and latency
- [`paging`](docs/features/paging.html): Pagination signals for list operations
- [`ratelimit`](docs/features/ratelimit.html): Client-side rate limiting via a token bucket
- [`retry`](docs/features/retry.html): Automatic retry of transient failures with exponential backoff
- [`telemetry`](docs/features/telemetry.html): Distributed tracing spans with W3C trace-context propagation
- [`test`](docs/features/test.html): In-memory mock transport for testing without a live server
- [`timeout`](docs/features/timeout.html): Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the [first-call guide](docs/guides/first-call.html) for the setup sequence.
- Read the [authentication guide](docs/guides/authentication.html) before using protected routes.
- Use the [API reference](docs/api/index.html) for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

