<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: prepare_path

class BluefinDecryptxP2pePreparePath
{
    public static function call(BluefinDecryptxP2peContext $ctx): string
    {
        $point = $ctx->point;
        $parts = [];
        if ($point) {
            $p = \Voxgig\Struct\Struct::getprop($point, 'parts');
            if (is_array($p)) {
                $parts = $p;
            }
        }
        return \Voxgig\Struct\Struct::join($parts, '/', true);
    }
}
