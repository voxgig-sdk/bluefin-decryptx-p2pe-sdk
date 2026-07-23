<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: result_headers

class BluefinDecryptxP2peResultHeaders
{
    public static function call(BluefinDecryptxP2peContext $ctx): ?BluefinDecryptxP2peResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
