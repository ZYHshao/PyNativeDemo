//
//  BridgeLabel.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "BridgeLabel.h"
#import "BridgeColor.h"

@implementation BridgeLabel

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
    self.textColor = [BridgeColor colorWith:color];
}

- (void)setT:(NSString *)t {
    _t = t;
    self.text = t;
}

- (void)setFont_size:(NSNumber *)font_size {
    _font_size = font_size;
    self.font = [UIFont systemFontOfSize:font_size.intValue];
}

- (void)setBackground_color:(NSString *)background_color {
    _background_color = background_color;
    self.backgroundColor = [BridgeColor colorWith:background_color];
}

@end
