//
//  LockController.m
//  BelApp
//
//  Created by Leon on 15/3/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "LockController.h"
#import "LCLockView.h"
#import "AppDelegate.h"

@interface LockController () <LCLockViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet LCLockView *lockView;
@property (nonatomic) NSInteger remainTime;
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;
@property (nonatomic, strong) AppDelegate *appDelegate;

- (IBAction)forgetPwdAction;

@end

@implementation LockController

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取到手势密码次数
    NSString *pwdTimes = [UserDefaults valueForKey:@"gesturePwdTime"];
    if (pwdTimes)
    {
        self.remainTime = [pwdTimes integerValue];
    } else
    {
        self.remainTime = 5;
    }
    
    self.lockView.delegate = self;

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)lockView:(LCLockView *)lockView didFinishPath:(NSString *)path{
    
    if ( [path isEqualToString:[UserDefaults valueForKey:@"gesturePassword"]])
    {
        [UserDefaults setInteger:5 forKey:@"gesturePwdTime"];
        [UserDefaults synchronize];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    else
    {
        [self.lockView displayError];
        self.remainTime--;
        if (self.remainTime == 0) {
            self.lockView.userInteractionEnabled = NO;
            //需要重新登录
            [self forgetPwdAction];
            
        } else  {
            self.noticeLabel.text = [NSString stringWithFormat:@"密码错误,你还可以输入%ld次",(long)self.remainTime];
            [UserDefaults setInteger:self.remainTime forKey:@"gesturePwdTime"];
            [UserDefaults synchronize];
        }
        
    }
}

- (IBAction)forgetPwdAction {
    [[[UIAlertView alloc]initWithTitle:@"手势密码已失效" message:@"请重新登录贝尔在线,登录后可在我的账户中管理手势密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.appDelegate logout];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    LCLog(@"0--> dealloc");
}

@end
