//
//  WDBuglyManager.m
//  BaseProject
//
//  Created by 王笛 on 2019/3/26.
//  Copyright © 2019 王笛. All rights reserved.
//

#import "WDBuglyManager.h"
#import <Bugly/Bugly.h>

@implementation WDBuglyManager

+ (void)configBugly
{
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.reportLogLevel = BuglyLogLevelWarn;
    [Bugly startWithAppId:@"your bugly appid" config:config];
}

+ (void)reportErrorName:(NSString *)errorName errorReason:(NSString *)errorReason callStack:(NSArray *)aStackArray extraInfo:(NSDictionary *)info
{
    [Bugly reportExceptionWithCategory:3 name:errorName reason:errorReason callStack:aStackArray extraInfo:info terminateApp:NO];
}


@end
