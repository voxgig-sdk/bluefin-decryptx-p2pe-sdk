import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceCustodyList, DeviceCustodyListListMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceCustodyListEntity extends BluefinDecryptxP2peEntityBase<DeviceCustodyList> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceCustodyListEntity): DeviceCustodyListEntity;
    list(this: any, reqmatch?: DeviceCustodyListListMatch, ctrl?: Control): Promise<DeviceCustodyListEntity[]>;
}
export { DeviceCustodyListEntity };
