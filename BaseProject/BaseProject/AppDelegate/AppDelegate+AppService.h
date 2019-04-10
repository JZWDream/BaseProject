//
//  AppDelegate+AppService.h
//  BaseProject
//
//  Created by 王笛 on 2019/4/10.
//  Copyright © 2019 王笛. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (AppService)

- (void)setupAvoidCrash;


- (void)setupRealm;


- (void)setupBugly;


- (void)setupIQKeyboardManager;

@end

NS_ASSUME_NONNULL_END
