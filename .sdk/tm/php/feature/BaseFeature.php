<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK base feature

class BluefinDecryptxP2peBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(BluefinDecryptxP2peContext $ctx, array $options): void {}
    public function PostConstruct(BluefinDecryptxP2peContext $ctx): void {}
    public function PostConstructEntity(BluefinDecryptxP2peContext $ctx): void {}
    public function SetData(BluefinDecryptxP2peContext $ctx): void {}
    public function GetData(BluefinDecryptxP2peContext $ctx): void {}
    public function GetMatch(BluefinDecryptxP2peContext $ctx): void {}
    public function SetMatch(BluefinDecryptxP2peContext $ctx): void {}
    public function PrePoint(BluefinDecryptxP2peContext $ctx): void {}
    public function PreSpec(BluefinDecryptxP2peContext $ctx): void {}
    public function PreRequest(BluefinDecryptxP2peContext $ctx): void {}
    public function PreResponse(BluefinDecryptxP2peContext $ctx): void {}
    public function PreResult(BluefinDecryptxP2peContext $ctx): void {}
    public function PreDone(BluefinDecryptxP2peContext $ctx): void {}
    public function PreUnexpected(BluefinDecryptxP2peContext $ctx): void {}
}
