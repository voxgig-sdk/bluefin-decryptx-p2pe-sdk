// Generated existence test: the SDK constructs in test mode.

use bluefin_decryptx_p2pe_sdk::{test_sdk, Value};

#[test]
fn exists_test_mode() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    assert_eq!(*testsdk.mode.borrow(), "test");
}
