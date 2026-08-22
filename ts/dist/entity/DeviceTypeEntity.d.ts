import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceType, DeviceTypeLoadMatch, DeviceTypeListMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceTypeEntity extends BluefinDecryptxP2peEntityBase<DeviceType> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceTypeEntity): DeviceTypeEntity;
    load(this: any, reqmatch?: DeviceTypeLoadMatch, ctrl?: Control): Promise<DeviceTypeEntity>;
    list(this: any, reqmatch?: DeviceTypeListMatch, ctrl?: Control): Promise<DeviceTypeEntity[]>;
}
export { DeviceTypeEntity };
