//
//  GesturePwdViewController.m
//  BelApp
//
//  Created by Leon on 15/3/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "GesturePwdViewController.h"
#import "LCLockView.h"

@interface GesturePwdViewController () <LCLockViewDelegate>


@property (weak, nonatomic) IBOutlet LCLockView *lockView;
@property (nonatomic, strong) NSString *gesturePassword;
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;

@property (nonatomic) BOOL getSecondPwd;

@end

@implementation GesturePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.lockView.normalColor = RGBColor(32, 210, 254);
//    self.navigationController.navigationBar.hidden = YES;
}


- (void)lockView:(LCLockView *)lockView didFinishPath:(NSString *)path{
    
    LCLog(@"获得用户的手势路径:%@", path);
    
    if (path.length < 3) {
        [MBProgressHUD showError:@"密码太短,请重新输入"];
        [self.lockView cleanView];
        return;
    }
    
    if ( self.getSecondPwd) {
        if ([self.gesturePassword isEqualToString:path]) {
//            [self.lockView cleanView];
            self.noticeLabel.text = @"设置成功";
            
            [UserDefaults setValue:path forKey:@"gesturePassword"];
            [UserDefaults setInteger:5 forKey:@"gesturePwdTime"];
            [UserDefaults synchronize];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        }
        else {
            self.getSecondPwd = NO;

            self.noticeLabel.text = @"与上次输入不一致,请重新设置";
//            self.lockView.normalColor = [UIColor redColor];
            [self.lockView displayError];
        }
    } else  {

        self.gesturePassword = path;
        self.getSecondPwd = YES;
        self.noticeLabel.text = @"请再次绘制解锁图形";
        [self.lockView cleanView];
    }
}



@end
