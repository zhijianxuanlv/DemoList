//
//  AppDelegate.m
//  BelApp
//
//  Created by Leon on 15/3/3.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ProductRootController.h"
#import "BaseNavigationController.h"
#import "AccountUtil.h"
#import "LoginAccount.h"
#import "GuideViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

//@property (nonatomic, strong) MainViewController *mainViewCtrl;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    LoginAccount *account = [AccountUtil account];
    
    if (account) {
        self.loginStatus = YES;
        self.loginAccount = account;
    } else  {
        self.loginStatus = NO;
    }
    //获取上次保存的版本号
    NSString *lastVersion = [UserDefaults stringForKey:kVersionKey];
    //获取当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[kVersionKey];
    //第一次启用进入引导页面
    
    MainViewController *mainView = [[MainViewController alloc] init];
    mainView.delegate = self;
    self.mainViewCtrl = mainView;
    
    if (![currentVersion isEqualToString:lastVersion]) {
        self.window.rootViewController = [[GuideViewController alloc]init];
    }else {

        self.window.rootViewController = mainView;
    }
    
    [self.window makeKeyAndVisible];
    
    
     /** 注册推送通知功能*/
    if (iOS8)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings
                                                                             settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                             categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        //这里还是原来的代码
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
   
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    [self updateAccount];
    [self performLock];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [self updateAccount];
    [self performLock];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


///Token值成功获取的时候走的是这个方法（Token值不能带空格）
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    NSLog(@"%@",deviceToken);
    
}
///Token值获取失败的时候走的是这个方法
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    
    NSLog(@"%@",error);
}
///应用程序处在打开状态，且服务器有推送消息过来时，以及通过推送打开应用程序，走的是这个方法
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    for (id key in userInfo) {
        NSLog(@"%@:%@",key, [userInfo objectForKey:key]);
    }
    ///Icon推送数量设为0
    //    application.applicationIconBadgeNumber=0;
}


- (void) updateAccount {
    if (self.loginAccount != nil) {
        NSDictionary *param = @{@"login_id":self.loginAccount.userinfo.login_id,
                                @"signature":@""};
        
        [HttpRequest postWithURL:@"account/query_balance.html" params:param success:^(id json) {
            if ([json[@"status"] isEqualToString:@"y"]) {
                LoginAccount *account = [LoginAccount objectWithKeyValues:json];
                self.loginAccount = account;
                [AccountUtil saveAccount:self.loginAccount];
            }
        } failure:^(NSError *error) {
            LCLog(@"error -->  %@", error.description);
        }];
    }
}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSUInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if (index == 2 ){
        if (self.loginStatus) {
            return YES;
        } else {
            LCLog(@"--> login");
            MainViewController *mainView = (MainViewController *)tabBarController;
            [mainView performLogin];
            return  NO;
        }
    }
    return YES;
}

- (void)performLock{
    if (self.loginStatus) {
        if ([UserDefaults valueForKey:@"gesturePassword"]) {
            [self.mainViewCtrl performLock];
        }
    }
}

- (void)loginToAccount:(BOOL)toAccount {
    self.loginStatus = YES;
    if(toAccount) {
        self.mainViewCtrl.selectedIndex = 2;
    }
}

- (void)logout {
    self.loginStatus = NO;
    
    if ([AccountUtil cleanAccount])
    {
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        self.mainViewCtrl.selectedIndex = 0;
        //        });
    }
}

- (void)toMyAccount {
    self.mainViewCtrl.selectedIndex = 2;
}

- (void)showProductWithType:(NSInteger )type{
    self.productListType = type -1 ;
    self.mainViewCtrl.selectedIndex = 1;
}

@end
