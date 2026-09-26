// Generated instance test for the virtual_device entity.

#include "ctest.h"

int main(void) {
  BluefinDecryptxP2peSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefindecryptxp2pe_virtual_device(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "virtual_device", "entity get_name");

  TEST_SUMMARY("virtual_device_entity");
}
