// Generated instance test for the success entity.

#include "ctest.h"

int main(void) {
  BluefinDecryptxP2peSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefindecryptxp2pe_success(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "success", "entity get_name");

  TEST_SUMMARY("success_entity");
}
