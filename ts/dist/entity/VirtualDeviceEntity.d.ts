import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { VirtualDevice, VirtualDeviceLoadMatch } from '../BluefinDecryptxP2peTypes';
declare class VirtualDeviceEntity extends BluefinDecryptxP2peEntityBase<VirtualDevice> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: VirtualDeviceEntity): VirtualDeviceEntity;
    load(this: any, reqmatch?: VirtualDeviceLoadMatch, ctrl?: Control): Promise<VirtualDeviceEntity>;
}
export { VirtualDeviceEntity };
