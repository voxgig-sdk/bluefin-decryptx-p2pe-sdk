<?php
declare(strict_types=1);

// BluefinDecryptxP2pe SDK exists test

require_once __DIR__ . '/../bluefindecryptxp2pe_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = BluefinDecryptxP2peSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
