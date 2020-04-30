//
//  ViewMaker.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "ViewMaker.h"
#import "BridgeLabel.h"

@implementation ViewMaker

+ (id)makerView:(NSString *)name {
    if ([name isEqualToString:@"Label"]) {
        return [[BridgeLabel alloc] init];
    }
    return nil;
}

@end
