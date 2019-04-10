//
//  WDNavigationController.m
//  LeanCloudDemo
//
//  Created by 王笛 on 2019/3/26.
//  Copyright © 2019 王笛. All rights reserved.
//

#import "WDNavigationController.h"

@interface WDNavigationController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation WDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = WDColor999999;
//    self.navigationBar.translucent = NO;
    NSDictionary *navTitleAttDict = @{
                           NSForegroundColorAttributeName:WDColor000000,
                           NSFontAttributeName : WDMediumFont(18)
                           };
    self.navigationBar.titleTextAttributes = navTitleAttDict;
    
    //设置手势代理，导航控制器的代理
    __weak WDNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}

- (void)clickBack
{
    WDLog(@"----");
    [self popViewControllerAnimated:YES];
}

#pragma -UINavigationControllerDelegate//转场时禁用手势识别，加载完成后再启用
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    if (self.childViewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;//viewController是将要被push的控制器
    }
    
    if (self.childViewControllers.count > 0) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 70, 30);
        [backButton setImage:WDImage(@"nav_back") forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        backButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

- (void)dealloc
{
    WDLog(@"导航控制器释放了");
}

@end
