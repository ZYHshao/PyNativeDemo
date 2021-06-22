//
//  ViewMaker.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "FNViewMaker.h"
#import "FNLabel.h"
#import "FNView.h"

@implementation FNViewMaker

+ (id)makerView:(NSString *)name {
    if ([name isEqualToString:@"Label"]) {
        return [[FNLabel alloc] init];
    } else if ([name isEqualToString:@"View"]) {
        return [[FNView alloc] init];;
    }
    return nil;
}

@end
