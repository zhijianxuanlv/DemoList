//
//  VerifyMobileController.m
//  BelApp
//
//  Created by Leon on 15/3/11.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "VerifyMobileController.h"
#import "VerifyRegexTool.h"


@interface VerifyMobileController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (nonatomic) NSInteger timeout;
@property (nonatomic, strong) NSTimer *timer;


- (IBAction)getVerifyCode:(id)sender;
- (IBAction)finshRegist:(id)sender;

@end

@implementation VerifyMobileController

- (void)viewDidLoad {
    [super viewDidLoad];
    //监听文本框内容
}



- (IBAction)getVerifyCode:(id)sender {
    
    NSString *phoneNumber = self.phoneField.text;
    
    if ( ![VerifyRegexTool verifyMobilePhone:phoneNumber] ) {
        [MBProgressHUD showError:@"请输入正确的手机号"];
        return;
    }
    
    
    
    NSDictionary *param = @{@"mobile":self.phoneField.text,
                            @"type":@"1",
                            @"signature":@""
                            };
    [HttpRequest postWithURL:@"account/send_mobile_code.html" params:param success:^(id json) {
        NSString *status = [json objectForKey:@"status"];
        NSString *info = [json objectForKey:@"info"];
        if ([status isEqualToString:@"y"]) {
            
            [MBProgressHUD showSuccess:@"验证码已经发送"];
#warning 模拟短信验证码获取,发布时删除
            self.codeField.text = [json objectForKey:@"msg_code"];
            [self addTimer];
        }else {
            
            [MBProgressHUD showError:info];
            
        }
    } failure:^(NSError *error) {
        LCLog(@"%@",error);
    }];
    
    
}

- (IBAction)finshRegist:(id)sender {
    
    
    NSDictionary *param = @{@"username":self.registInfo.username,
                            @"password":self.registInfo.password,
                            @"promote":self.registInfo.promote,
                            @"mobile":self.phoneField.text,
                            @"code":self.codeField.text,
                            @"signature":@""};
    [HttpRequest postWithURL:@"account/register.html" params:param success:^(id json) {
        NSString *status = [json objectForKey:@"status"];
        NSString *info = [json objectForKey:@"info"];
        if ([status isEqualToString:@"y"]) {
            
            [MBProgressHUD showSuccess:[json objectForKey:@"info"]];
            [self removeTimer];
            [self dismissViewControllerAnimated:YES completion:nil];
        }else {
            
            [MBProgressHUD showError:info];
            
        }
        
    } failure:^(NSError *error) {
        LCLog(@"%@",error);
    }];
    
    
    
}


- (void)addTimer {
    self.timeout = 59;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(nextSeconds) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextSeconds {
    if(self.timeout<=0){ //倒计时结束，关闭
        [self removeTimer];
        //设置界面的按钮显示 根据自己需求设置
        [self.sendBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        self.sendBtn.userInteractionEnabled = YES;
    }else{
        //            int minutes = timeout / 60;
        int seconds = self.timeout % 60;
        NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
        //设置界面的按钮显示 根据自己需求设置
        LCLog(@"____%@",strTime);
        [self.sendBtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
        self.sendBtn.userInteractionEnabled = NO;
        self.timeout--;
    }
}

- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
    
}

- (void)dealloc {
    LCLog(@"%@-->dealloc", self);
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self removeTimer];
}
@end
