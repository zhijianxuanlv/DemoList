//
//  MainViewController.m
//  BelApp
//
//  Created by Leon on 15/3/4.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@property (nonatomic) NSUInteger lastIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = RGBColor(245, 61, 61);
    
    BaseNavigationController *home = [[UIStoryboard storyboardWithName:@"home" bundle:nil] instantiateInitialViewController];
    BaseNavigationController *product = [[UIStoryboard storyboardWithName:@"product" bundle:nil] instantiateInitialViewController];
    BaseNavigationController *me = [[UIStoryboard storyboardWithName:@"me" bundle:nil] instantiateInitialViewController];
    BaseNavigationController *more = [[UIStoryboard storyboardWithName:@"more" bundle:nil] instantiateInitialViewController];
    
//    NSArray *titles = @[@"贝尔在线",@"产品列表",@"我的账户",@"更多"];
    
    [self addChildViewController:home];
    [self addChildViewController:product];
    [self addChildViewController:me];
    [self addChildViewController:more];
}

- (void)performLogin{
    BaseNavigationController *login = [[UIStoryboard storyboardWithName:@"login" bundle:nil] instantiateInitialViewController];
    LoginViewController *loginCtrl =(LoginViewController *) login.topViewController;
    loginCtrl.dismissToAccount = YES;
    [self presentViewController:login animated:YES completion:nil];
}

- (void)performLock {
    UIViewController *lock = [[UIStoryboard storyboardWithName:@"lock" bundle:nil] instantiateInitialViewController];
    [self presentViewController:lock animated:NO completion:nil];
}

@end
