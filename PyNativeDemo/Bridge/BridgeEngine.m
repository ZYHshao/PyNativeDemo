//
//  BridgeEngine.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "BridgeEngine.h"
#import "DisplayRender.h"
#import "PythonRun.h"

@interface BridgeEngine ()

@end

@implementation BridgeEngine

IMPLEMENTATION_INSTANCE

+ (UIViewController *)setupEngine {
    [SELF_INSTANCE startEngine];
    [SELF_INSTANCE loadLib];
    [SELF_INSTANCE runMain];
    return [SELF_INSTANCE renderRoot];
}

- (void)startEngine {
    NSString* frameworkPath = [NSString stringWithFormat:@"%@/Resources",[SELF_INSTANCE p_pythonFrameworkPath]];
    wchar_t *pythonHome = [SELF_INSTANCE stingTowWchar_t:frameworkPath];
    Py_SetPythonHome(pythonHome);
    Py_Initialize();
    PyEval_InitThreads();
    if (Py_IsInitialized()) {
        NSLog(@"😄初始化环境成功😄");
    } else {
        NSLog(@"😢Python初始化环境失败😢");
        exit(0);
    }
}

- (void)loadLib {
    NSString *path = [NSString stringWithFormat:@"import sys\nsys.path.append(\"%@\")",[[NSBundle mainBundle] resourcePath]];
    PyRun_SimpleString([path UTF8String]);
    NSLog(@"😄lib加载成功😄");
}

- (void)runMain {
    PyObject * pModule = PyImport_ImportModule([@"main" UTF8String]);//导入模块
    [PythonRun sharedInstance].mainItemDic = PyModule_GetDict(pModule);
}

- (UIViewController *)renderRoot {
    return [[DisplayRender sharedInstance] renderRoot:@"Main"];
}

- (wchar_t *)stingTowWchar_t:(NSString*)string {
    return (wchar_t*)[string cStringUsingEncoding:NSUTF32StringEncoding];
}

- (NSString*)p_pythonFrameworkPath{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Python" ofType:@"framework"];
    return path;
}

- (void)dealloc {
    Py_Finalize();
}

@end
