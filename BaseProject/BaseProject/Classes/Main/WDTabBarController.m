//
//  WDTabBarController.m
//  LeanCloudDemo
//
//  Created by 王笛 on 2019/3/26.
//  Copyright © 2019 王笛. All rights reserved.
//

#import "WDTabBarController.h"
#import "WDNavigationController.h"
#import "WDBaseController.h"

@interface WDTabBarController ()

@end

@implementation WDTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.barTintColor = WDColorFFFFFF;
//    self.tabBar.translucent = NO;
    
    [self setupTabBarVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - LoadUI
- (void)setupTabBarVC
{
    WDBaseController *mainController = [[WDBaseController alloc] init];
    WDNavigationController *mianNavigationController = [[WDNavigationController alloc] initWithRootViewController:mainController];
    mianNavigationController.tabBarItem = [self setTabBarItemWithTitle:@"首页" titleFont:WDRegularFont(12) selectedImage:@"tab_mine_press" normalImage:@"tab_mine_nomal" selectTitleColor:WDColor333333 normalTitleColor:WDColor999999];
    
    WDBaseController *secController = [[WDBaseController alloc] init];
    WDNavigationController *secNavigationController = [[WDNavigationController alloc] initWithRootViewController:secController];
    secNavigationController.tabBarItem = [self setTabBarItemWithTitle:@"功能" titleFont:WDRegularFont(12) selectedImage:@"tab_mine_press" normalImage:@"tab_mine_nomal" selectTitleColor:WDColor333333 normalTitleColor:WDColor999999];
    
    WDBaseController *thrController = [[WDBaseController alloc] init];
    WDNavigationController *thrNavigationController = [[WDNavigationController alloc] initWithRootViewController:thrController];
    thrNavigationController.tabBarItem = [self setTabBarItemWithTitle:@"我的" titleFont:WDRegularFont(12) selectedImage:@"tab_mine_press" normalImage:@"tab_mine_nomal" selectTitleColor:WDColor333333 normalTitleColor:WDColor999999];
    
    self.viewControllers = @[mianNavigationController, secNavigationController, thrNavigationController];
    
}

- (UITabBarItem *)setTabBarItemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont selectedImage:(NSString *)selectedImage normalImage:(NSString *)normalImage selectTitleColor:(UIColor *)selectTitleColor normalTitleColor:(UIColor *)normalTitleColor
{
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:WDOriginalImage(normalImage) selectedImage:WDOriginalImage(selectedImage)];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:normalTitleColor, NSFontAttributeName:titleFont} forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName:selectTitleColor, NSFontAttributeName:titleFont} forState:UIControlStateSelected];
    return tabBarItem;
}


@end
