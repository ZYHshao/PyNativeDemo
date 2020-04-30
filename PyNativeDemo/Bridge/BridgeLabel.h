//
//  BridgeLabel.h
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BridgeLabel : UILabel

@property (nonatomic, strong) NSNumber *left;
@property (nonatomic, strong) NSNumber *top;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, strong) NSNumber *font_size;

@property (nonatomic, copy) NSString *background_color;
@property (nonatomic, copy) NSString *t;
@property (nonatomic, copy) NSString *color;

@end

NS_ASSUME_NONNULL_END
