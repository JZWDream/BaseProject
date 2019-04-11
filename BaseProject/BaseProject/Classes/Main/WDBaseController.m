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
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation WDBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WDColorFFFFFF;
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 200)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView];
    
    [self testBlock];
    
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

- (void)testBlock
{
    NSURL *url = [NSURL URLWithString:@"https://cdn.pixabay.com/photo/2019/04/02/09/37/cat-4097325_1280.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *section = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [section dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"+++++%d++++", [NSThread isMainThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"+++++%d------", [NSThread isMainThread]);
            self.imageView.image = [UIImage imageWithData:data];
        });
        
    }];
    [dataTask resume];
}


@end
