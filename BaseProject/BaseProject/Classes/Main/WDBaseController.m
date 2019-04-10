//
//  WDBaseController.m
//  LeanCloudDemo
//
//  Created by 王笛 on 2019/3/26.
//  Copyright © 2019 王笛. All rights reserved.
//

#import "WDBaseController.h"
#import <MBProgressHUD.h>

@interface WDBaseController ()

@end

@implementation WDBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WDColorFFFFFF;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self preferredStatusBarStyle];
    self.navigationItem.title = @"主页";
}

//设置StatusBar样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


@end
