//
//  FNView.m
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import "FNView.h"
#import "FNColorTool.h"
#import "FNViewMaker.h"

@implementation FNView

- (void)setLeft:(NSNumber *)left {
    _left = left;
    self.frame = CGRectMake(left.floatValue, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setTop:(NSNumber *)top {
    _top = top;
    self.frame = CGRectMake(self.frame.origin.x, top.floatValue, self.frame.size.width, self.frame.size.height);
}

- (void)setWidth:(NSNumber *)width {
    _width = width;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width.floatValue, self.frame.size.height);
}

- (void)setHeight:(NSNumber *)height {
    _height = height;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height.floatValue);
}


- (void)setBackground_color:(NSString *)background_color {
    _background_color = background_color;
    self.backgroundColor = [FNColorTool colorWith:background_color];
}

- (void)setSub_views:(NSArray<NSDictionary *> *)sub_views {
    _sub_views = sub_views;
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
    for (NSUInteger i = 0; i < sub_views.count; i++) {
        id view = [FNViewMaker makerView:[sub_views[i] objectForKey:@"name"]];
        for (NSString *key in [sub_views[i] allKeys]) {
            if (![key isEqualToString:@"name"]) {
                [view setValue:[sub_views[i] objectForKey:key] forKey:key];
            }
        }
        [self addSubview:view];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
