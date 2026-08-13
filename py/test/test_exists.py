# BluefinDecryptxP2pe SDK exists test

import pytest
from bluefindecryptxp2pe_sdk import BluefinDecryptxP2peSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BluefinDecryptxP2peSDK.test(None, None)
        assert testsdk is not None
