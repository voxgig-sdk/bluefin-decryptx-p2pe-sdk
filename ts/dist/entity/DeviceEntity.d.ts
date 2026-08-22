import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Device, DeviceLoadMatch, DeviceListMatch, DeviceCreateData } from '../BluefinDecryptxP2peTypes';
declare class DeviceEntity extends BluefinDecryptxP2peEntityBase<Device> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: DeviceEntity): DeviceEntity;
    load(this: any, reqmatch?: DeviceLoadMatch, ctrl?: Control): Promise<DeviceEntity>;
    list(this: any, reqmatch?: DeviceListMatch, ctrl?: Control): Promise<DeviceEntity[]>;
    create(this: any, reqdata?: DeviceCreateData, ctrl?: Control): Promise<DeviceEntity>;
}
export { DeviceEntity };
