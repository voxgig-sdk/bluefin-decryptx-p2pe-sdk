<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: feature_hook

class BluefinDecryptxP2peFeatureHook
{
    public static function call(BluefinDecryptxP2peContext $ctx, string $name): void
    {
        if (!$ctx->client) {
            return;
        }
        $features = $ctx->client->features ?? null;
        if (!$features) {
            return;
        }
        foreach ($features as $f) {
            if (method_exists($f, $name)) {
                $f->$name($ctx);
            }
        }
    }
}
