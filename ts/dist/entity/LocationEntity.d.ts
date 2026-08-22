import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { Location, LocationLoadMatch, LocationListMatch, LocationCreateData, LocationRemoveMatch } from '../BluefinDecryptxP2peTypes';
declare class LocationEntity extends BluefinDecryptxP2peEntityBase<Location> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: LocationEntity): LocationEntity;
    load(this: any, reqmatch?: LocationLoadMatch, ctrl?: Control): Promise<LocationEntity>;
    list(this: any, reqmatch?: LocationListMatch, ctrl?: Control): Promise<LocationEntity[]>;
    create(this: any, reqdata?: LocationCreateData, ctrl?: Control): Promise<LocationEntity>;
    remove(this: any, reqmatch?: LocationRemoveMatch, ctrl?: Control): Promise<LocationEntity>;
}
export { LocationEntity };
