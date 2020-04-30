//
//  PythonRun.m
//  PyNativeDemo
//
//  Created by 珲少 on 2020/4/30.
//  Copyright © 2020 jaki. All rights reserved.
//

#import "PythonRun.h"

@implementation PythonRun

IMPLEMENTATION_INSTANCE

- (NSDictionary *)run:(const char *)item method:(const char *)method {
    PyObject* pClassCalc = PyDict_GetItemString(self.mainItemDic,item);
    PyObject* pInstanceCalc = PyInstanceMethod_New(pClassCalc);
    PyObject* pRet = PyObject_CallMethod(pClassCalc, method, "O", pInstanceCalc);
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
    for (NSString *k in dic.allKeys) {
        if ([k isEqualToString:@"subViews"]) {
            NSMutableArray *array = [NSMutableArray array];
            for (NSUInteger i = 0; i < [dic[k] count]; i++) {
                  [array addObject:[self dumpString:[dic[k][i] UTF8String]]];
            }
            dic[k] = [array copy];
        }
    }
    NSLog(@"dumpInfo❄️:%@", dic);
    return [dic copy];
}

@end
