<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: prepare_headers

class BluefinDecryptxP2pePrepareHeaders
{
    public static function call(BluefinDecryptxP2peContext $ctx): array
    {
        $options = $ctx->client->options_map();
        $headers = \Voxgig\Struct\Struct::getprop($options, 'headers');
        if (!$headers) {
            return [];
        }
        $out = \Voxgig\Struct\Struct::clone($headers);
        return is_array($out) ? $out : [];
    }
}
