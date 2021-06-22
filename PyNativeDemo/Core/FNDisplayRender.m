//
//  FNDisplayRender.m
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import "FNDisplayRender.h"
#import "FNPyRun.h"
#import "FNColorTool.h"
#import "FNViewMaker.h"

#define FN_SCENE_METHOD_RENDER @"render"

@implementation FNDisplayRender

IMPLEMENTATION_INSTANCE

- (UIViewController *)renderScene:(NSString *)sceneName {
    return [self render:sceneName];
}

- (UIViewController *)render:(NSString *)name {
    NSDictionary *scene = [[FNPyRun sharedInstance] run:name method:FN_SCENE_METHOD_RENDER];
    return [self renderController:scene];
}

- (UIViewController *)renderController:(NSDictionary *)scene {
    UIViewController *controller = [[UIViewController alloc] init];
    id view = [FNViewMaker makerView:[scene objectForKey:@"name"]];
    for (NSString *key in [scene allKeys]) {
        if (![key isEqualToString:@"name"]) {
            [view setValue:[scene objectForKey:key] forKey:key];
        }
    }
    [controller.view addSubview:view];
    return controller;
}


@end
