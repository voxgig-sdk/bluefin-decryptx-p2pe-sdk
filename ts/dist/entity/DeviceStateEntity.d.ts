import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceState, DeviceStateListMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceStateEntity extends BluefinDecryptxP2peEntityBase<DeviceState> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceStateEntity): DeviceStateEntity;
    list(this: any, reqmatch?: DeviceStateListMatch, ctrl?: Control): Promise<DeviceStateEntity[]>;
}
export { DeviceStateEntity };
