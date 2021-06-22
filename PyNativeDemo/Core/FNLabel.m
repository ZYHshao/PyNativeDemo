//
//  BridgeLabel.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "FNLabel.h"
#import "FNColorTool.h"
#import "FNViewMaker.h"

@implementation FNLabel

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

- (void)setColor:(NSString *)color {
    _color = color;
    self.textColor = [FNColorTool colorWith:color];
}

- (void)setT:(NSString *)t {
    _t = t;
    self.text = t;
}

- (void)setFontSize:(NSNumber *)font_size {
    _font_size = font_size;
    self.font = [UIFont systemFontOfSize:font_size.intValue];
}

- (void)setBackground_color:(NSString *)background_color {
    _background_color = background_color;
    self.backgroundColor = [FNColorTool colorWith:background_color];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
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

@end
