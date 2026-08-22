import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceList, DeviceListLoadMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceListEntity extends BluefinDecryptxP2peEntityBase<DeviceList> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceListEntity): DeviceListEntity;
    load(this: any, reqmatch?: DeviceListLoadMatch, ctrl?: Control): Promise<DeviceListEntity>;
}
export { DeviceListEntity };
