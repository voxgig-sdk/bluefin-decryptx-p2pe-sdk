<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: prepare_body

class BluefinDecryptxP2pePrepareBody
{
    public static function call(BluefinDecryptxP2peContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
