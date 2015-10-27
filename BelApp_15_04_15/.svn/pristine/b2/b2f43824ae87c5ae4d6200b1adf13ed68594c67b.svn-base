//
//  AppDelegate.h
//  BelApp
//
//  Created by Leon on 15/3/3.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL loginStatus;
@property (nonatomic) NSInteger productListType;
@property (nonatomic, strong) MainViewController *mainViewCtrl;
@property (nonatomic, strong) LoginAccount *loginAccount;

- (void)loginToAccount:(BOOL)toAccount;
- (void)logout;

- (void)showProductWithType:(NSInteger )type;

- (void)updateAccount;

- (void)toMyAccount;

@end

