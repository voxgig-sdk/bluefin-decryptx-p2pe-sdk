import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceCustodyListItem, DeviceCustodyListItemListMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceCustodyListItemEntity extends BluefinDecryptxP2peEntityBase<DeviceCustodyListItem> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceCustodyListItemEntity): DeviceCustodyListItemEntity;
    list(this: any, reqmatch?: DeviceCustodyListItemListMatch, ctrl?: Control): Promise<DeviceCustodyListItemEntity[]>;
}
export { DeviceCustodyListItemEntity };
