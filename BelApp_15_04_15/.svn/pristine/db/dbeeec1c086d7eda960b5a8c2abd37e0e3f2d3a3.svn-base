//
//  LXDNavigationController.m
//  BelTest
//
//  Created by Danny on 15/2/28.
//  Copyright (c) 2015年 zzl.com. All rights reserved.
//

#import "LXDNavigationController.h"

@interface LXDNavigationController ()

@end

@implementation LXDNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+(void)initialize{

    //1.设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置背景图片
    NSString *bgName = nil;
    if(iOS7){
    
        bgName = @"navBg64";
        navBar.tintColor = [UIColor redColor];
        
    }else{
    
        bgName = @"navBg";
    }
    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    
    //设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    
    //2.设置BarButtonItem主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置文字颜色
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    if(!iOS7){
    
        //设置按钮背景
        [item setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
        //设置返回按钮背景
        [item setBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
