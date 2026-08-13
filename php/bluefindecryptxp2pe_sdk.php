<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK

require_once __DIR__ . '/utility/struct/Struct.php';
require_once __DIR__ . '/core/UtilityType.php';
require_once __DIR__ . '/core/Spec.php';
require_once __DIR__ . '/core/Helpers.php';

// Load utility registration
require_once __DIR__ . '/utility/Register.php';

// Load config and features
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/features.php';

use Voxgig\Struct\Struct;

// Features record diagnostic state on the client as dynamic properties
// (_retry, _cache, _metrics, ...); allow them explicitly (PHP 8.2+
// deprecates implicit dynamic properties).
#[\AllowDynamicProperties]
class BluefinDecryptxP2peSDK
{
    public string $mode;
    public array $features;
    public ?array $options;

    private $_utility;
    private $_rootctx;

    public function __construct(array $options = [])
    {
        $this->mode = "live";
        $this->features = [];
        $this->options = null;

        $utility = new BluefinDecryptxP2peUtility();
        $this->_utility = $utility;

        $config = BluefinDecryptxP2peConfig::make_config();

        $this->_rootctx = ($utility->make_context)([
            "client" => $this,
            "utility" => $utility,
            "config" => $config,
            "options" => $options ?? [],
            "shared" => [],
        ], null);

        $this->options = ($utility->make_options)($this->_rootctx);

        if (Struct::getpath($this->options, "feature.test.active") === true) {
            $this->mode = "test";
        }

        $this->_rootctx->options = $this->options;

        // Add features in the resolved order (make_options puts an explicit
        // list order first, else defaults to test-first). Ordering matters: the
        // `test` feature installs the base mock transport and the transport
        // features (retry/cache/netsim/proxy/ratelimit) wrap whatever is
        // current, so `test` must be added before them to sit at the base.
        $feature_opts = BluefinDecryptxP2peHelpers::to_map(Struct::getprop($this->options, "feature"));
        if ($feature_opts) {
            $featureorder = Struct::getpath($this->options, "__derived__.featureorder");
            if (is_array($featureorder)) {
                foreach ($featureorder as $fname) {
                    $fopts = BluefinDecryptxP2peHelpers::to_map($feature_opts[$fname] ?? null);
                    if ($fopts && isset($fopts["active"]) && $fopts["active"] === true) {
                        ($utility->feature_add)($this->_rootctx, BluefinDecryptxP2peFeatures::make_feature($fname));
                    }
                }
            }
        }

        // Add extension features.
        $extend_val = Struct::getprop($this->options, "extend");
        if (is_array($extend_val)) {
            foreach ($extend_val as $f) {
                if (is_object($f) && method_exists($f, 'get_name')) {
                    ($utility->feature_add)($this->_rootctx, $f);
                }
            }
        }

        // Initialize features.
        foreach ($this->features as $f) {
            ($utility->feature_init)($this->_rootctx, $f);
        }

        ($utility->feature_hook)($this->_rootctx, "PostConstruct");
    }

    public function options_map(): array
    {
        $out = Struct::clone($this->options);
        return is_array($out) ? $out : [];
    }

    public function get_utility()
    {
        return BluefinDecryptxP2peUtility::copy($this->_utility);
    }

    public function get_root_ctx()
    {
        return $this->_rootctx;
    }

    public function prepare(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;
        $fetchargs = $fetchargs ?? [];

        $ctrl = BluefinDecryptxP2peHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "prepare",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $opts = $this->options;
        $path = Struct::getprop($fetchargs, "path") ?? "";
        $path = is_string($path) ? $path : "";
        $method_val = Struct::getprop($fetchargs, "method") ?? "GET";
        $method_val = is_string($method_val) ? $method_val : "GET";
        $params = BluefinDecryptxP2peHelpers::to_map(Struct::getprop($fetchargs, "params")) ?? [];
        $query = BluefinDecryptxP2peHelpers::to_map(Struct::getprop($fetchargs, "query")) ?? [];
        $headers = ($utility->prepare_headers)($ctx);

        $base = Struct::getprop($opts, "base") ?? "";
        $base = is_string($base) ? $base : "";
        $prefix = Struct::getprop($opts, "prefix") ?? "";
        $prefix = is_string($prefix) ? $prefix : "";
        $suffix = Struct::getprop($opts, "suffix") ?? "";
        $suffix = is_string($suffix) ? $suffix : "";

        $ctx->spec = new BluefinDecryptxP2peSpec([
            "base" => $base, "prefix" => $prefix, "suffix" => $suffix,
            "path" => $path, "method" => $method_val,
            "params" => $params, "query" => $query, "headers" => $headers,
            "body" => Struct::getprop($fetchargs, "body"),
            "step" => "start",
        ]);

        // Merge user-provided headers.
        $uh = Struct::getprop($fetchargs, "headers");
        if (is_array($uh)) {
            foreach ($uh as $k => $v) {
                $ctx->spec->headers[$k] = $v;
            }
        }

        [$_, $err] = ($utility->prepare_auth)($ctx);
        if ($err) {
            return ($utility->make_error)($ctx, $err);
        }

        [$fetchdef, $fd_err] = ($utility->make_fetch_def)($ctx);
        if ($fd_err) {
            return ($utility->make_error)($ctx, $fd_err);
        }
        return $fetchdef;
    }

    // Raw endpoint access is operator-controllable, like every entity op.
    // Blocking it means denying BOTH the 'direct' and 'graphql' tokens,
    // since either one reaches the same endpoint.
    public function direct(array $fetchargs = []): mixed
    {
        if (!$this->op_allowed("direct")) {
            return $this->op_denied("direct");
        }

        return $this->raw_request($fetchargs);
    }

    // Is this raw-access op permitted by the SDK's allow.op option?
    private function op_allowed(string $op): bool
    {
        $allow_op = Struct::getpath($this->options, "allow.op");
        return is_string($allow_op) && str_contains($allow_op, $op);
    }

    private function op_denied(string $op): array
    {
        $allow_op = Struct::getpath($this->options, "allow.op");
        return [
            "ok" => false,
            "err" => new BluefinDecryptxP2peError($op . "_allow",
                "BluefinDecryptxP2peSDK: " . $op . ": operation not allowed by" .
                " SDK option allow.op value: \"" . (string)$allow_op . "\""),
        ];
    }

    // Ungated request path shared by direct and graphql, each of which
    // checks its own allow.op token first. Private, rather than a flag on
    // fetchargs: a caller-supplied marker would let anyone opt straight back
    // out of the gate by passing it.
    private function raw_request(array $fetchargs = []): mixed
    {
        $utility = $this->_utility;

        // direct() is the raw-HTTP escape hatch: it never throws, it returns
        // an {ok, err, ...} dict. prepare() now raises on error, so catch it
        // and surface the failure through the dict instead.
        try {
            $fetchdef = $this->prepare($fetchargs);
        } catch (\Throwable $err) {
            return ["ok" => false, "err" => $err];
        }

        $fetchargs = $fetchargs ?? [];
        $ctrl = BluefinDecryptxP2peHelpers::to_map(Struct::getprop($fetchargs, "ctrl")) ?? [];

        $ctx = ($utility->make_context)([
            "opname" => "direct",
            "ctrl" => $ctrl,
        ], $this->_rootctx);

        $url = $fetchdef["url"] ?? "";
        [$fetched, $fetch_err] = ($utility->fetcher)($ctx, $url, $fetchdef);

        if ($fetch_err) {
            return ["ok" => false, "err" => $fetch_err];
        }

        if ($fetched === null) {
            return [
                "ok" => false,
                "err" => $ctx->make_error("direct_no_response", "response: undefined"),
            ];
        }

        if (is_array($fetched)) {
            $status = BluefinDecryptxP2peHelpers::to_int(Struct::getprop($fetched, "status"));
            $headers = Struct::getprop($fetched, "headers") ?? [];

            // No-body responses (204, 304) and explicit zero content-length
            // must skip JSON parsing — calling json() on an empty body errors.
            $content_length = is_array($headers) ? ($headers["content-length"] ?? null) : null;
            $no_body = $status === 204 || $status === 304 || (string)$content_length === "0";

            $json_data = null;
            if (!$no_body) {
                $jf = Struct::getprop($fetched, "json");
                if (is_callable($jf)) {
                    try {
                        $json_data = $jf();
                    } catch (\Throwable $e) {
                        // Non-JSON body — leave data null but keep status/ok.
                        $json_data = null;
                    }
                }
            }

            return [
                "ok" => $status >= 200 && $status < 300,
                "status" => $status,
                "headers" => Struct::getprop($fetched, "headers"),
                "data" => $json_data,
            ];
        }

        return [
            "ok" => false,
            "err" => $ctx->make_error("direct_invalid", "invalid response type"),
        ];
    }

    // Raw GraphQL access: the pressure valve that makes the generated
    // surface's deliberate omissions (per-call selection sets, typed filter
    // builders, batching, subscriptions) livable — the whole schema stays
    // reachable.
    //
    // Thin wrapper over the same prepare/fetch path direct uses, with the
    // one thing raw direct cannot do for GraphQL: a GraphQL failure rides
    // HTTP 200 as a top-level `errors` array, so status alone would report
    // a failed query as ok.
    //
    // NOTE: like direct, this bypasses the feature pipeline — no retry,
    // ratelimit or paging features apply.
    public function graphql(string $query, ?array $variables = null, ?array $ctrl = null): mixed
    {
        if (!$this->op_allowed("graphql")) {
            return $this->op_denied("graphql");
        }

        $res = $this->raw_request([
            "method" => "POST",
            "headers" => ["content-type" => "application/json"],
            "body" => ["query" => $query, "variables" => $variables ?? []],
            "ctrl" => $ctrl ?? [],
        ]);

        if (!is_array($res)) {
            return $res;
        }

        // Errors are read BEFORE any status check: a GraphQL parse or
        // validation failure comes back as HTTP 400 carrying the standard
        // { errors: [...] } body, and the raw path represents a non-2xx as
        // ok:false with no err — so returning early on status would discard
        // the server's own diagnostics, which are the only useful part of
        // that response.
        $errors = Struct::getpath($res, "data.errors");

        if (is_array($errors) && 0 < count($errors)) {
            $first = is_array($errors[0]) ? $errors[0] : [];
            $msg = $first["message"] ?? "";
            if (!is_string($msg) || "" === $msg) {
                $msg = "graphql error";
            }
            $res["ok"] = false;
            $res["err"] = new BluefinDecryptxP2peError("graphql_error",
                "BluefinDecryptxP2peSDK: graphql: " . $msg);
            $res["graphql"] = $errors;
        }

        return $res;
    }


    private $_attestation = null;

    // Canonical facade: $client->Attestation()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->attestation()
    // resolves here too.
    public function Attestation($data = null)
    {
        require_once __DIR__ . '/entity/attestation_entity.php';
        if ($data === null) {
            if ($this->_attestation === null) {
                $this->_attestation = new AttestationEntity($this, null);
            }
            return $this->_attestation;
        }
        return new AttestationEntity($this, $data);
    }


    private $_client_ = null;

    // Canonical facade: $client->Client()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->client()
    // resolves here too.
    public function Client($data = null)
    {
        require_once __DIR__ . '/entity/client_entity.php';
        if ($data === null) {
            if ($this->_client_ === null) {
                $this->_client_ = new ClientEntity($this, null);
            }
            return $this->_client_;
        }
        return new ClientEntity($this, $data);
    }


    private $_create_result = null;

    // Canonical facade: $client->CreateResult()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->create_result()
    // resolves here too.
    public function CreateResult($data = null)
    {
        require_once __DIR__ . '/entity/create_result_entity.php';
        if ($data === null) {
            if ($this->_create_result === null) {
                $this->_create_result = new CreateResultEntity($this, null);
            }
            return $this->_create_result;
        }
        return new CreateResultEntity($this, $data);
    }


    private $_decryption = null;

    // Canonical facade: $client->Decryption()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->decryption()
    // resolves here too.
    public function Decryption($data = null)
    {
        require_once __DIR__ . '/entity/decryption_entity.php';
        if ($data === null) {
            if ($this->_decryption === null) {
                $this->_decryption = new DecryptionEntity($this, null);
            }
            return $this->_decryption;
        }
        return new DecryptionEntity($this, $data);
    }


    private $_device = null;

    // Canonical facade: $client->Device()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device()
    // resolves here too.
    public function Device($data = null)
    {
        require_once __DIR__ . '/entity/device_entity.php';
        if ($data === null) {
            if ($this->_device === null) {
                $this->_device = new DeviceEntity($this, null);
            }
            return $this->_device;
        }
        return new DeviceEntity($this, $data);
    }


    private $_device_build = null;

    // Canonical facade: $client->DeviceBuild()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_build()
    // resolves here too.
    public function DeviceBuild($data = null)
    {
        require_once __DIR__ . '/entity/device_build_entity.php';
        if ($data === null) {
            if ($this->_device_build === null) {
                $this->_device_build = new DeviceBuildEntity($this, null);
            }
            return $this->_device_build;
        }
        return new DeviceBuildEntity($this, $data);
    }


    private $_device_custody_detail = null;

    // Canonical facade: $client->DeviceCustodyDetail()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_custody_detail()
    // resolves here too.
    public function DeviceCustodyDetail($data = null)
    {
        require_once __DIR__ . '/entity/device_custody_detail_entity.php';
        if ($data === null) {
            if ($this->_device_custody_detail === null) {
                $this->_device_custody_detail = new DeviceCustodyDetailEntity($this, null);
            }
            return $this->_device_custody_detail;
        }
        return new DeviceCustodyDetailEntity($this, $data);
    }


    private $_device_custody_list = null;

    // Canonical facade: $client->DeviceCustodyList()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_custody_list()
    // resolves here too.
    public function DeviceCustodyList($data = null)
    {
        require_once __DIR__ . '/entity/device_custody_list_entity.php';
        if ($data === null) {
            if ($this->_device_custody_list === null) {
                $this->_device_custody_list = new DeviceCustodyListEntity($this, null);
            }
            return $this->_device_custody_list;
        }
        return new DeviceCustodyListEntity($this, $data);
    }


    private $_device_list = null;

    // Canonical facade: $client->DeviceList()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_list()
    // resolves here too.
    public function DeviceList($data = null)
    {
        require_once __DIR__ . '/entity/device_list_entity.php';
        if ($data === null) {
            if ($this->_device_list === null) {
                $this->_device_list = new DeviceListEntity($this, null);
            }
            return $this->_device_list;
        }
        return new DeviceListEntity($this, $data);
    }


    private $_device_receive_result = null;

    // Canonical facade: $client->DeviceReceiveResult()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_receive_result()
    // resolves here too.
    public function DeviceReceiveResult($data = null)
    {
        require_once __DIR__ . '/entity/device_receive_result_entity.php';
        if ($data === null) {
            if ($this->_device_receive_result === null) {
                $this->_device_receive_result = new DeviceReceiveResultEntity($this, null);
            }
            return $this->_device_receive_result;
        }
        return new DeviceReceiveResultEntity($this, $data);
    }


    private $_device_rki_activate_result = null;

    // Canonical facade: $client->DeviceRkiActivateResult()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_rki_activate_result()
    // resolves here too.
    public function DeviceRkiActivateResult($data = null)
    {
        require_once __DIR__ . '/entity/device_rki_activate_result_entity.php';
        if ($data === null) {
            if ($this->_device_rki_activate_result === null) {
                $this->_device_rki_activate_result = new DeviceRkiActivateResultEntity($this, null);
            }
            return $this->_device_rki_activate_result;
        }
        return new DeviceRkiActivateResultEntity($this, $data);
    }


    private $_device_state = null;

    // Canonical facade: $client->DeviceState()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_state()
    // resolves here too.
    public function DeviceState($data = null)
    {
        require_once __DIR__ . '/entity/device_state_entity.php';
        if ($data === null) {
            if ($this->_device_state === null) {
                $this->_device_state = new DeviceStateEntity($this, null);
            }
            return $this->_device_state;
        }
        return new DeviceStateEntity($this, $data);
    }


    private $_device_type = null;

    // Canonical facade: $client->DeviceType()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->device_type()
    // resolves here too.
    public function DeviceType($data = null)
    {
        require_once __DIR__ . '/entity/device_type_entity.php';
        if ($data === null) {
            if ($this->_device_type === null) {
                $this->_device_type = new DeviceTypeEntity($this, null);
            }
            return $this->_device_type;
        }
        return new DeviceTypeEntity($this, $data);
    }


    private $_inject_key = null;

    // Canonical facade: $client->InjectKey()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->inject_key()
    // resolves here too.
    public function InjectKey($data = null)
    {
        require_once __DIR__ . '/entity/inject_key_entity.php';
        if ($data === null) {
            if ($this->_inject_key === null) {
                $this->_inject_key = new InjectKeyEntity($this, null);
            }
            return $this->_inject_key;
        }
        return new InjectKeyEntity($this, $data);
    }


    private $_kif = null;

    // Canonical facade: $client->Kif()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->kif()
    // resolves here too.
    public function Kif($data = null)
    {
        require_once __DIR__ . '/entity/kif_entity.php';
        if ($data === null) {
            if ($this->_kif === null) {
                $this->_kif = new KifEntity($this, null);
            }
            return $this->_kif;
        }
        return new KifEntity($this, $data);
    }


    private $_location = null;

    // Canonical facade: $client->Location()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->location()
    // resolves here too.
    public function Location($data = null)
    {
        require_once __DIR__ . '/entity/location_entity.php';
        if ($data === null) {
            if ($this->_location === null) {
                $this->_location = new LocationEntity($this, null);
            }
            return $this->_location;
        }
        return new LocationEntity($this, $data);
    }


    private $_partner = null;

    // Canonical facade: $client->Partner()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->partner()
    // resolves here too.
    public function Partner($data = null)
    {
        require_once __DIR__ . '/entity/partner_entity.php';
        if ($data === null) {
            if ($this->_partner === null) {
                $this->_partner = new PartnerEntity($this, null);
            }
            return $this->_partner;
        }
        return new PartnerEntity($this, $data);
    }


    private $_shipment = null;

    // Canonical facade: $client->Shipment()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->shipment()
    // resolves here too.
    public function Shipment($data = null)
    {
        require_once __DIR__ . '/entity/shipment_entity.php';
        if ($data === null) {
            if ($this->_shipment === null) {
                $this->_shipment = new ShipmentEntity($this, null);
            }
            return $this->_shipment;
        }
        return new ShipmentEntity($this, $data);
    }


    private $_success = null;

    // Canonical facade: $client->Success()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->success()
    // resolves here too.
    public function Success($data = null)
    {
        require_once __DIR__ . '/entity/success_entity.php';
        if ($data === null) {
            if ($this->_success === null) {
                $this->_success = new SuccessEntity($this, null);
            }
            return $this->_success;
        }
        return new SuccessEntity($this, $data);
    }


    private $_transaction = null;

    // Canonical facade: $client->Transaction()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->transaction()
    // resolves here too.
    public function Transaction($data = null)
    {
        require_once __DIR__ . '/entity/transaction_entity.php';
        if ($data === null) {
            if ($this->_transaction === null) {
                $this->_transaction = new TransactionEntity($this, null);
            }
            return $this->_transaction;
        }
        return new TransactionEntity($this, $data);
    }


    private $_update_result = null;

    // Canonical facade: $client->UpdateResult()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->update_result()
    // resolves here too.
    public function UpdateResult($data = null)
    {
        require_once __DIR__ . '/entity/update_result_entity.php';
        if ($data === null) {
            if ($this->_update_result === null) {
                $this->_update_result = new UpdateResultEntity($this, null);
            }
            return $this->_update_result;
        }
        return new UpdateResultEntity($this, $data);
    }


    private $_user = null;

    // Canonical facade: $client->User()->list() / ->load(["id" => ...]).
    // PHP method names are case-insensitive, so lowercase $client->user()
    // resolves here too.
    public function User($data = null)
    {
        require_once __DIR__ . '/entity/user_entity.php';
        if ($data === null) {
            if ($this->_user === null) {
                $this->_user = new UserEntity($this, null);
            }
            return $this->_user;
        }
        return new UserEntity($this, $data);
    }



    public static function test(?array $testopts = null, ?array $sdkopts = null): self
    {
        $sdkopts = $sdkopts ?? [];
        $sdkopts = Struct::clone($sdkopts);
        $sdkopts = is_array($sdkopts) ? $sdkopts : [];

        $testopts = $testopts ?? [];
        $testopts = Struct::clone($testopts);
        $testopts = is_array($testopts) ? $testopts : [];
        $testopts["active"] = true;

        if (!isset($sdkopts["feature"])) {
            $sdkopts["feature"] = [];
        }
        $sdkopts["feature"]["test"] = $testopts;

        $sdk = new BluefinDecryptxP2peSDK($sdkopts);
        $sdk->mode = "test";
        return $sdk;
    }
}
