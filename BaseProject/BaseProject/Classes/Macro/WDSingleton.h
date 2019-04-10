//
//  WDSingleton.h
//  单例Demo
//
//  Created by 王笛 on 2016/12/1.
//  Copyright © 2016年 王笛. All rights reserved.
//

#define WDSingletonH(name) + (instancetype)share##name;

#if __has_feature(objc_arc)
//ARC
#define WDSingletonM(name) static id _instance;\
+ (instancetype)share##name\
{\
return [[self alloc] init];\
}\
\
- (instancetype)init\
{\
@synchronized(self){\
if(_instance == nil){\
return [super init];\
}\
}\
return _instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
@synchronized(self){\
if (_instance == nil) {\
_instance = [super allocWithZone:zone];\
}\
}\
return _instance;\
}\
\
- (id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}

#else
//非ARC
#define WDSingletonM(name) static id _instance;\
+ (instancetype)share##name\
{\
return [[self alloc] init];\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
\
if (_instance == nil) {\
_instance = [super allocWithZone:zone];\
}\
});\
return _instance;\
}\
\
- (id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
\
- (oneway void)release\
{\
}\
\
- (instancetype)retain\
{\
return _instance;\
}\
\
- (NSUInteger)retainCount\
{\
return MAXFLOAT;\
}

#endif
