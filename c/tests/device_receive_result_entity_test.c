// Generated instance test for the device_receive_result entity.

#include "ctest.h"

int main(void) {
  BluefinDecryptxP2peSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefindecryptxp2pe_device_receive_result(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "device_receive_result", "entity get_name");

  TEST_SUMMARY("device_receive_result_entity");
}
