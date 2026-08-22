import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { DeviceBuild, DeviceBuildLoadMatch, DeviceBuildListMatch } from '../BluefinDecryptxP2peTypes';
declare class DeviceBuildEntity extends BluefinDecryptxP2peEntityBase<DeviceBuild> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceBuildEntity): DeviceBuildEntity;
    load(this: any, reqmatch?: DeviceBuildLoadMatch, ctrl?: Control): Promise<DeviceBuildEntity>;
    list(this: any, reqmatch?: DeviceBuildListMatch, ctrl?: Control): Promise<DeviceBuildEntity[]>;
}
export { DeviceBuildEntity };
