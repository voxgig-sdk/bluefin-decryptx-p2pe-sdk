<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: result_body

class BluefinDecryptxP2peResultBody
{
    public static function call(BluefinDecryptxP2peContext $ctx): ?BluefinDecryptxP2peResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
