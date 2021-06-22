//
//  FNPyRun.m
//  PyNativeDemo
//
//  Created by 珲少 on 2021/6/22.
//  Copyright © 2021 jaki. All rights reserved.
//

#import "FNPyRun.h"

@implementation FNPyRun

IMPLEMENTATION_INSTANCE

- (NSDictionary *)run:(NSString *)item method:(NSString *)method {
    PyObject* pClassCalc = PyDict_GetItemString(self.mainItemDic, [item UTF8String]);
    PyObject* pInstanceCalc = PyObject_CallFunctionObjArgs(pClassCalc, NULL);
    PyObject* pRet = PyObject_CallMethod(pClassCalc, [method UTF8String], "O", pInstanceCalc);
    return [self dumpInfo:pRet];
}

- (NSDictionary *)dumpInfo:(PyObject *)pRet {
    // 解析数据
    char * resultCString = NULL;
    PyArg_Parse(pRet, "s", &resultCString);
    //将python类型的返回值转换为c
    return [self dumpString:resultCString];
}

- (NSDictionary *)dumpString:(const char *)resultCString {
    NSString *jsonString = [NSString stringWithCString:resultCString encoding:NSUTF8StringEncoding];
    NSDictionary *info = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:info];
    NSLog(@"dumpInfo❄️:%@", dic);
    return [dic copy];
}

- (void)runSimpleString:(NSString *)string {
    PyRun_SimpleString([string UTF8String]);
}

@end
