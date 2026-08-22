import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceRkiActivateResult, DeviceRkiActivateResultCreateData } from '../BluefinDecryptxP2peTypes';
declare class DeviceRkiActivateResultEntity extends BluefinDecryptxP2peEntityBase<DeviceRkiActivateResult> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceRkiActivateResultEntity): DeviceRkiActivateResultEntity;
    create(this: any, reqdata?: DeviceRkiActivateResultCreateData, ctrl?: Control): Promise<DeviceRkiActivateResultEntity>;
}
export { DeviceRkiActivateResultEntity };
