//
//  PythonRun.h
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrdgeDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface PythonRun : NSObject

INTERFACE_INSTANCE

@property (nonatomic, assign) PyObject *mainItemDic;

- (NSDictionary *)run:(const char *)item method:(const char *)method;

@end

NS_ASSUME_NONNULL_END
