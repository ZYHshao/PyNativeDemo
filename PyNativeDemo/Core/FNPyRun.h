//
//  FNPyRun.h
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface FNPyRun : NSObject

INTERFACE_INSTANCE

@property (nonatomic, assign) PyObject *mainItemDic;

- (NSDictionary *)run:(NSString *)item method:(NSString *)method;

- (void)runSimpleString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
