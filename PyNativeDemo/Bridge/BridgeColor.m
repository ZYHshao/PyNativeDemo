//
//  BridgeColor.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "BridgeColor.h"


@implementation BridgeColor

+ (UIColor *)colorWith:(NSString *)c {
    if ([c isEqualToString:@"red"]) {
        return [UIColor redColor];
    } else if ([c isEqualToString:@"white"]) {
        return [UIColor whiteColor];
    } else if ([c isEqualToString:@"purple"]) {
        return [UIColor purpleColor];
    }
    return [UIColor clearColor];
}

@end
