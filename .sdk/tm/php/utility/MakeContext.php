<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BluefinDecryptxP2peMakeContext
{
    public static function call(array $ctxmap, ?BluefinDecryptxP2peContext $basectx): BluefinDecryptxP2peContext
    {
        return new BluefinDecryptxP2peContext($ctxmap, $basectx);
    }
}
