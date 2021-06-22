//
//  FNView.h
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FNView : UIView

@property (nonatomic, strong) NSNumber *left;
@property (nonatomic, strong) NSNumber *top;
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSNumber *height;
@property (nonatomic, copy) NSString *background_color;

@property (nonatomic, strong) NSArray<NSDictionary *> *sub_views;

@end

NS_ASSUME_NONNULL_END
