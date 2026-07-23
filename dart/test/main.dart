// BluefinDecryptxP2pe SDK test suite entry. GENERATED — do not edit.

import 'dart:io';

import 'harness.dart' as harness;

import 'exists_test.dart' as exists_test;
import 'struct_test.dart' as struct_test;
import 'primary_test.dart' as primary_test;
import 'pipeline_test.dart' as pipeline_test;
import 'feature_test.dart' as feature_test;
import 'netsim_test.dart' as netsim_test;
import 'custom_test.dart' as custom_test;
import 'readme_examples_test.dart' as readme_examples_test;
import 'entity/attestation/AttestationEntity_test.dart' as attestation_entity_test;
import 'entity/attestation/AttestationDirect_test.dart' as attestation_direct_test;
import 'entity/client/ClientEntity_test.dart' as client_entity_test;
import 'entity/client/ClientDirect_test.dart' as client_direct_test;
import 'entity/create_result/CreateResultEntity_test.dart' as create_result_entity_test;
import 'entity/decryption/DecryptionEntity_test.dart' as decryption_entity_test;
import 'entity/device/DeviceEntity_test.dart' as device_entity_test;
import 'entity/device/DeviceDirect_test.dart' as device_direct_test;
import 'entity/device_build/DeviceBuildEntity_test.dart' as device_build_entity_test;
import 'entity/device_build/DeviceBuildDirect_test.dart' as device_build_direct_test;
import 'entity/device_custody_detail/DeviceCustodyDetailEntity_test.dart' as device_custody_detail_entity_test;
import 'entity/device_custody_detail/DeviceCustodyDetailDirect_test.dart' as device_custody_detail_direct_test;
import 'entity/device_custody_list/DeviceCustodyListEntity_test.dart' as device_custody_list_entity_test;
import 'entity/device_custody_list/DeviceCustodyListDirect_test.dart' as device_custody_list_direct_test;
import 'entity/device_list/DeviceListEntity_test.dart' as device_list_entity_test;
import 'entity/device_list/DeviceListDirect_test.dart' as device_list_direct_test;
import 'entity/device_receive_result/DeviceReceiveResultEntity_test.dart' as device_receive_result_entity_test;
import 'entity/device_rki_activate_result/DeviceRkiActivateResultEntity_test.dart' as device_rki_activate_result_entity_test;
import 'entity/device_state/DeviceStateEntity_test.dart' as device_state_entity_test;
import 'entity/device_state/DeviceStateDirect_test.dart' as device_state_direct_test;
import 'entity/device_type/DeviceTypeEntity_test.dart' as device_type_entity_test;
import 'entity/device_type/DeviceTypeDirect_test.dart' as device_type_direct_test;
import 'entity/inject_key/InjectKeyEntity_test.dart' as inject_key_entity_test;
import 'entity/inject_key/InjectKeyDirect_test.dart' as inject_key_direct_test;
import 'entity/kif/KifEntity_test.dart' as kif_entity_test;
import 'entity/kif/KifDirect_test.dart' as kif_direct_test;
import 'entity/location/LocationEntity_test.dart' as location_entity_test;
import 'entity/location/LocationDirect_test.dart' as location_direct_test;
import 'entity/partner/PartnerEntity_test.dart' as partner_entity_test;
import 'entity/partner/PartnerDirect_test.dart' as partner_direct_test;
import 'entity/shipment/ShipmentEntity_test.dart' as shipment_entity_test;
import 'entity/shipment/ShipmentDirect_test.dart' as shipment_direct_test;
import 'entity/success/SuccessEntity_test.dart' as success_entity_test;
import 'entity/transaction/TransactionEntity_test.dart' as transaction_entity_test;
import 'entity/transaction/TransactionDirect_test.dart' as transaction_direct_test;
import 'entity/update_result/UpdateResultEntity_test.dart' as update_result_entity_test;
import 'entity/update_result/UpdateResultDirect_test.dart' as update_result_direct_test;
import 'entity/user/UserEntity_test.dart' as user_entity_test;
import 'entity/user/UserDirect_test.dart' as user_direct_test;

Future<void> main() async {
  exists_test.tests();
  struct_test.tests();
  primary_test.tests();
  pipeline_test.tests();
  feature_test.tests();
  netsim_test.tests();
  custom_test.tests();
  readme_examples_test.tests();
  attestation_entity_test.tests();
  attestation_direct_test.tests();
  client_entity_test.tests();
  client_direct_test.tests();
  create_result_entity_test.tests();
  decryption_entity_test.tests();
  device_entity_test.tests();
  device_direct_test.tests();
  device_build_entity_test.tests();
  device_build_direct_test.tests();
  device_custody_detail_entity_test.tests();
  device_custody_detail_direct_test.tests();
  device_custody_list_entity_test.tests();
  device_custody_list_direct_test.tests();
  device_list_entity_test.tests();
  device_list_direct_test.tests();
  device_receive_result_entity_test.tests();
  device_rki_activate_result_entity_test.tests();
  device_state_entity_test.tests();
  device_state_direct_test.tests();
  device_type_entity_test.tests();
  device_type_direct_test.tests();
  inject_key_entity_test.tests();
  inject_key_direct_test.tests();
  kif_entity_test.tests();
  kif_direct_test.tests();
  location_entity_test.tests();
  location_direct_test.tests();
  partner_entity_test.tests();
  partner_direct_test.tests();
  shipment_entity_test.tests();
  shipment_direct_test.tests();
  success_entity_test.tests();
  transaction_entity_test.tests();
  transaction_direct_test.tests();
  update_result_entity_test.tests();
  update_result_direct_test.tests();
  user_entity_test.tests();
  user_direct_test.tests();

  final failed = await harness.runAll();
  if (0 < failed) {
    exitCode = 1;
  }
}
