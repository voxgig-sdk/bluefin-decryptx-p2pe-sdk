import 'harness.dart';

import '../lib/BluefinDecryptxP2peSDK.dart';

void tests() {
  describe('exists', () {
    test('test-mode', (t) async {
      final testsdk = BluefinDecryptxP2peSDK.test();
      equal(true, null != testsdk);
    });
  });
}
