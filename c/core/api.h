// BluefinDecryptxP2pe SDK public API (generated).

#ifndef BLUEFINDECRYPTXP2PE_API_H
#define BLUEFINDECRYPTXP2PE_API_H

#include "sdk.h"

// Attestation entity.
Entity* attestation_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_attestation(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* attestation_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Client entity.
Entity* client_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_client(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* client_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// CreateResult entity.
Entity* create_result_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_create_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* create_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Decryption entity.
Entity* decryption_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_decryption(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* decryption_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Device entity.
Entity* device_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceBuild entity.
Entity* device_build_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_build(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_build_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceCustodyDetail entity.
Entity* device_custody_detail_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_custody_detail(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_custody_detail_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceCustodyList entity.
Entity* device_custody_list_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_custody_list(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_custody_list_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceList entity.
Entity* device_list_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_list(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_list_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceReceiveResult entity.
Entity* device_receive_result_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_receive_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_receive_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceRkiActivateResult entity.
Entity* device_rki_activate_result_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_rki_activate_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_rki_activate_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceState entity.
Entity* device_state_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_state(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_state_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// DeviceType entity.
Entity* device_type_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_device_type(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* device_type_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// InjectKey entity.
Entity* inject_key_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_inject_key(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* inject_key_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Kif entity.
Entity* kif_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_kif(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* kif_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Location entity.
Entity* location_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_location(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* location_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Partner entity.
Entity* partner_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_partner(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* partner_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Shipment entity.
Entity* shipment_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_shipment(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* shipment_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Success entity.
Entity* success_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_success(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* success_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// Transaction entity.
Entity* transaction_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_transaction(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* transaction_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// UpdateResult entity.
Entity* update_result_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_update_result(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* update_result_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);
// User entity.
Entity* user_entity_new(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
Entity* bluefindecryptxp2pe_user(BluefinDecryptxP2peSDK* client, voxgig_value* entopts);
voxgig_value* user_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);

#endif // BLUEFINDECRYPTXP2PE_API_H
