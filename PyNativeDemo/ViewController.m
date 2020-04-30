//
//  ViewController.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/3.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "ViewController.h"
#import "BridgeEngine.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"启动引擎" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 200, 30);
    [btn addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
}

- (void)go {
    UIViewController *controller = [BridgeEngine setupEngine];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
