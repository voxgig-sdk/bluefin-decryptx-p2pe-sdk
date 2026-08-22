import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceReceiveResult, DeviceReceiveResultCreateData } from '../BluefinDecryptxP2peTypes';
declare class DeviceReceiveResultEntity extends BluefinDecryptxP2peEntityBase<DeviceReceiveResult> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceReceiveResultEntity): DeviceReceiveResultEntity;
    create(this: any, reqdata?: DeviceReceiveResultCreateData, ctrl?: Control): Promise<DeviceReceiveResultEntity>;
}
export { DeviceReceiveResultEntity };
