//
//  FNDefine.h
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#ifndef FNDefine_h
#define FNDefine_h
#import <Python/Python.h>

#define INTERFACE_INSTANCE + (instancetype)sharedInstance;

#define IMPLEMENTATION_INSTANCE             \
+ (instancetype)sharedInstance {            \
    static id instance = nil;               \
    static dispatch_once_t onceToken;       \
    dispatch_once(&onceToken, ^{            \
        if (!instance) {                    \
            instance = [[self alloc] init]; \
        }                                   \
    });                                     \
    return instance;                        \
}

#define SELF_INSTANCE [self.class sharedInstance]

#endif /* FNDefine_h */
