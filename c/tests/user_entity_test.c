// Generated instance test for the user entity.

#include "ctest.h"

int main(void) {
  BluefinDecryptxP2peSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefindecryptxp2pe_user(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "user", "entity get_name");

  TEST_SUMMARY("user_entity");
}
