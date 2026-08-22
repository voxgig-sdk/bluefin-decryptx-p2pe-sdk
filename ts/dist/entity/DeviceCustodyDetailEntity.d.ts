import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceCustodyDetail, DeviceCustodyDetailLoadMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceCustodyDetailEntity extends BluefinDecryptxP2peEntityBase<DeviceCustodyDetail> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceCustodyDetailEntity): DeviceCustodyDetailEntity;
    load(this: any, reqmatch?: DeviceCustodyDetailLoadMatch, ctrl?: Control): Promise<DeviceCustodyDetailEntity>;
}
export { DeviceCustodyDetailEntity };
