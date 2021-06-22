//
//  FNEngine.m
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import "FNEngine.h"
#import "FNStaticCommand.h"
#import "FNPyRun.h"

static NSString *Py_Res = @"Resources";

@interface FNEngine ()

@end

@implementation FNEngine

IMPLEMENTATION_INSTANCE

+ (void)setupEngine {
    [SELF_INSTANCE startEngine];
    [SELF_INSTANCE loadLib];
    [SELF_INSTANCE runMain];
}

- (void)startEngine {
    NSString* frameworkPath = [NSString stringWithFormat:@"%@/%@",[SELF_INSTANCE p_pythonFrameworkPath], Py_Res];
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
    // 加载系统
    [[FNPyRun sharedInstance] runSimpleString:kFNCommandLoadPythonSystem];
    [[FNPyRun sharedInstance] runSimpleString:kFNCommandLoadPythonSystem];
    // 加载主bundle
    NSString *path = [NSString stringWithFormat:kFNCommandLoadPythonMudlue_T, [[NSBundle mainBundle] resourcePath]];
    [[FNPyRun sharedInstance] runSimpleString:path];
    NSLog(@"😄lib加载成功😄");
}

- (void)runMain {
    PyObject * pModule = PyImport_ImportModule([@"main" UTF8String]);//导入模块
    [FNPyRun sharedInstance].mainItemDic = PyModule_GetDict(pModule);
}


- (wchar_t *)stingTowWchar_t:(NSString*)string {
    const char * frameworkPath = [[NSString stringWithFormat:@"%@/Resources",[self p_pythonFrameworkPath]] UTF8String];
    wchar_t  *pythonHome = _Py_char2wchar(frameworkPath, NULL);
    return pythonHome;
}

- (NSString*)p_pythonFrameworkPath{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Python" ofType:@"framework"];
    return path;
}

- (void)dealloc {
    Py_Finalize();
}



@end
