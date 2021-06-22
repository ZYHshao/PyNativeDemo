//
//  FNDisplayRender.h
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FNDefine.h"

@interface FNDisplayRender : NSObject

INTERFACE_INSTANCE

- (UIViewController *)renderScene:(NSString *)sceneName;

@end

