//
//  WDBuglyManager.h
//  LeanCloudDemo
//
//  Created by 王笛 on 2019/3/26.
//  Copyright © 2019 王笛. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDBuglyManager : NSObject

+ (void)configBugly;

+(void)reportErrorName:(NSString *)errorName errorReason:(NSString *)errorReason callStack:(NSArray *)aStackArray extraInfo:(NSDictionary *)info;

@end

NS_ASSUME_NONNULL_END
