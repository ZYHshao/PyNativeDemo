//
//  DisplayRender.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "DisplayRender.h"
#import "PythonRun.h"
#import "BridgeColor.h"
#import "ViewMaker.h"

@interface DisplayRender ()

@property (nonatomic, strong) UIViewController *rootController;

@property (nonatomic, strong) NSMutableArray<UIView *> *subViews;

@end

@implementation DisplayRender

IMPLEMENTATION_INSTANCE

- (UIViewController *)renderRoot:(NSString *)main {
    NSDictionary *root = [[PythonRun sharedInstance] run:[main UTF8String] method:[@"render_main_view" UTF8String]];
    NSLog(@"AppLaunchFinish🙅‍♀️");
    [self renderController:root];
    return self.rootController;
}

- (void)renderController:(NSDictionary *)info {
    [self.subViews enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.subViews removeAllObjects];
    
    NSString *bg = [info objectForKey:@"color"];
    self.rootController.view.backgroundColor = [BridgeColor colorWith:bg];
    NSArray *views = [info objectForKey:@"subViews"];
    for (NSUInteger i = 0; i < views.count; i++) {
        id view = [ViewMaker makerView:[views[i] objectForKey:@"name"]];
        for (NSString *key in [views[i] allKeys]) {
            if (![key isEqualToString:@"name"]) {
                [view setValue:[views[i] objectForKey:key] forKey:key];
            }
        }
        [self.subViews addObject:view];
        [self.rootController.view addSubview:view];
    }
}

- (UIViewController *)rootController {
    if (!_rootController) {
        _rootController = [[UIViewController alloc] init];
    }
    return _rootController;
}

@end
