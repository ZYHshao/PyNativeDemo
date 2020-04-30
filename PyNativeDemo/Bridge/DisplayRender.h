//
//  DisplayRender.h
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BrdgeDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface DisplayRender : NSObject

INTERFACE_INSTANCE

- (UIViewController *)renderRoot:(NSString *)main;

@end

NS_ASSUME_NONNULL_END
