<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class BluefinDecryptxP2peFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinDecryptxP2peBaseFeature();
            case "test":
                return new BluefinDecryptxP2peTestFeature();
            default:
                return new BluefinDecryptxP2peBaseFeature();
        }
    }
}
