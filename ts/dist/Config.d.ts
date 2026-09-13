import { BaseFeature } from './feature/base/BaseFeature';
declare const FEATURE_PLUGINS: Record<string, any[]>;
declare class Config {
    makeFeature(this: any, fn: string): BaseFeature;
    hasFeature(this: any, fn: string): boolean;
    main: {
        name: string;
        slug: string;
        version: string;
        target: string;
    };
    feature: {
        audit: {
            options: {
                active: boolean;
                actor: string;
                max: number;
            };
            transport: string;
        };
        clienttrack: {
            options: {
                active: boolean;
                clientVersion: string;
            };
            transport: string;
        };
        idempotency: {
            options: {
                active: boolean;
                header: string;
                methods: string[];
                ops: string[];
            };
            transport: string;
        };
        log: {
            options: {
                active: boolean;
            };
            transport: string;
        };
        metrics: {
            options: {
                active: boolean;
            };
            transport: string;
        };
        paging: {
            options: {
                active: boolean;
                afterVar: string;
                cursorParam: string;
                firstVar: string;
                limitParam: string;
                pageParam: string;
                startPage: number;
            };
            transport: string;
        };
        ratelimit: {
            options: {
                active: boolean;
                burst: number;
                rate: number;
            };
            transport: string;
        };
        retry: {
            options: {
                active: boolean;
                factor: number;
                maxDelay: number;
                minDelay: number;
                retries: number;
                statuses: number[];
            };
            transport: string;
        };
        telemetry: {
            options: {
                active: boolean;
            };
            transport: string;
        };
        test: {
            options: {
                active: boolean;
            };
            transport: string;
        };
        timeout: {
            options: {
                active: boolean;
                ms: number;
            };
            transport: string;
        };
    };
    options: {
        base: string;
        auth: {
            prefix: string;
            basic: boolean;
        };
        headers: {
            "content-type": string;
        };
        entity: {
            attestation: {};
            client: {};
            create_result: {};
            decryption: {};
            device: {};
            device_build: {};
            device_custody_detail: {};
            device_custody_list: {};
            device_list: {};
            device_receive_result: {};
            device_rki_activate_result: {};
            device_state: {};
            device_type: {};
            inject_key: {};
            kif: {};
            location: {};
            partner: {};
            shipment: {};
            success: {};
            transaction: {};
            update_result: {};
            user: {};
        };
    };
    entity: {
        attestation: {
            fields: ({
                name: string;
                short: string;
                type: string;
                format?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        client: {
            fields: ({
                name: string;
                op: {
                    list: {
                        req: boolean;
                        type: string;
                    };
                };
                short: string;
                type: string;
                format?: undefined;
                req?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
                op?: undefined;
                req?: undefined;
            } | {
                name: string;
                short: string;
                type: string;
                op?: undefined;
                format?: undefined;
                req?: undefined;
            } | {
                name: string;
                req: boolean;
                short: string;
                type: string;
                op?: undefined;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                remove: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        create_result: {
            fields: never[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                deviceType: string;
                                serialNumber: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        decryption: {
            fields: {
                name: string;
                short: string;
                type: string;
            }[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        device: {
            fields: ({
                name: string;
                req: boolean;
                short: string;
                type: string;
                format?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
                req?: undefined;
            } | {
                name: string;
                short: string;
                type: string;
                req?: undefined;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: ({
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                deviceType: string;
                                serialNumber: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    } | {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                        rename?: undefined;
                    })[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        device_build: {
            fields: ({
                name: string;
                short: string;
                type: string;
                format?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        device_custody_detail: {
            fields: ({
                format: string;
                name: string;
                short: string;
                type: string;
                req?: undefined;
            } | {
                name: string;
                req: boolean;
                short: string;
                type: string;
                format?: undefined;
            } | {
                name: string;
                short: string;
                type: string;
                format?: undefined;
                req?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                deviceType: string;
                                serialNumber: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        device_custody_list: {
            fields: ({
                format: string;
                name: string;
                short: string;
                type: string;
                req?: undefined;
            } | {
                name: string;
                req: boolean;
                short: string;
                type: string;
                format?: undefined;
            } | {
                name: string;
                short: string;
                type: string;
                format?: undefined;
                req?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                deviceType: string;
                                serialNumber: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        device_list: {
            fields: {
                name: string;
                short: string;
                type: string;
            }[];
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                            query: ({
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                sharePartnerTo: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        device_receive_result: {
            fields: {
                name: string;
                req: boolean;
                short: string;
                type: string;
            }[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        device_rki_activate_result: {
            fields: {
                name: string;
                req: boolean;
                short: string;
                type: string;
            }[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        device_state: {
            fields: ({
                format: string;
                name: string;
                short: string;
                type: string;
            } | {
                name: string;
                short: string;
                type: string;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        device_type: {
            fields: ({
                format: string;
                name: string;
                short: string;
                type: string;
            } | {
                name: string;
                short: string;
                type: string;
                format?: undefined;
            } | {
                name: string;
                type: string;
                format?: undefined;
                short?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        inject_key: {
            fields: ({
                format: string;
                name: string;
                short: string;
                type: string;
            } | {
                name: string;
                short: string;
                type: string;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        kif: {
            fields: ({
                format: string;
                name: string;
                short: string;
                type: string;
            } | {
                name: string;
                short: string;
                type: string;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        location: {
            fields: ({
                name: string;
                short: string;
                type: string;
                format?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                remove: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        partner: {
            fields: ({
                name: string;
                short: string;
                type: string;
                op?: undefined;
                format?: undefined;
                req?: undefined;
            } | {
                name: string;
                op: {
                    list: {
                        req: boolean;
                        type: string;
                    };
                };
                short: string;
                type: string;
                format?: undefined;
                req?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
                op?: undefined;
                req?: undefined;
            } | {
                name: string;
                req: boolean;
                short: string;
                type: string;
                op?: undefined;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        shipment: {
            fields: ({
                name: string;
                short: string;
                type: string;
                format?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
            } | {
                name: string;
                type: string;
                short?: undefined;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                                example?: undefined;
                            } | {
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                reqd?: undefined;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        success: {
            fields: {
                name: string;
                short: string;
                type: string;
            }[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                sharePartnerTo: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                remove: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        rename: {
                            param: {
                                sharePartnerTo: string;
                            };
                        };
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: string[][];
            };
        };
        transaction: {
            fields: ({
                name: string;
                short: string;
                type: string;
                format?: undefined;
                req?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
                req?: undefined;
            } | {
                name: string;
                req: boolean;
                short: string;
                type: string;
                format?: undefined;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                            } | {
                                example: string;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        update_result: {
            fields: {
                name: string;
                short: string;
                type: string;
            }[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        args: {};
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                list: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            query: ({
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                                example?: undefined;
                            } | {
                                example: number;
                                kind: string;
                                name: string;
                                orig: string;
                                type: string;
                            })[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: {
                            lit: string;
                        }[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                update: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        user: {
            fields: ({
                name: string;
                short: string;
                type: string;
                format?: undefined;
            } | {
                format: string;
                name: string;
                short: string;
                type: string;
            })[];
            id: {
                field: string;
                name: string;
            };
            name: string;
            op: {
                load: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
                remove: {
                    input: string;
                    name: string;
                    points: {
                        args: {
                            params: {
                                kind: string;
                                name: string;
                                orig: string;
                                reqd: boolean;
                                type: string;
                            }[];
                        };
                        kind: string;
                        method: string;
                        orig: string;
                        segments: ({
                            lit: string;
                            var?: undefined;
                        } | {
                            var: string;
                            lit?: undefined;
                        })[];
                        select: {
                            exist: string[];
                        };
                        transform: {
                            req: string;
                            res: string;
                        };
                        parts: string[];
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
    };
}
declare const config: Config;
export { config, FEATURE_PLUGINS, };
