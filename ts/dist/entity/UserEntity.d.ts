import { BluefinDecryptxP2peEntityBase } from '../BluefinDecryptxP2peEntityBase';
import type { BluefinDecryptxP2peSDK } from '../BluefinDecryptxP2peSDK';
import type { Control } from '../types';
import type { User, UserLoadMatch, UserRemoveMatch } from '../BluefinDecryptxP2peTypes';
declare class UserEntity extends BluefinDecryptxP2peEntityBase<User> {
    constructor(client: BluefinDecryptxP2peSDK, entopts: any);
    make(this: UserEntity): UserEntity;
    load(this: any, reqmatch?: UserLoadMatch, ctrl?: Control): Promise<UserEntity>;
    remove(this: any, reqmatch?: UserRemoveMatch, ctrl?: Control): Promise<UserEntity>;
}
export { UserEntity };
