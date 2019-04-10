//
//  AppDelegate+Controller.m
//  BaseProject
//
//  Created by 王笛 on 2019/4/10.
//  Copyright © 2019 王笛. All rights reserved.
//

#import "AppDelegate+Controller.h"
#import "WDTabBarController.h"

@implementation AppDelegate (Controller)

- (void)rootViewController
{
    self.window = [[UIWindow alloc] init];
    WDTabBarController *tabBarVC = [[WDTabBarController alloc] init];
    
    [self.window setRootViewController:tabBarVC];
    
    [self.window makeKeyAndVisible];
}

@end
