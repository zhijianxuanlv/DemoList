//
//  NameAuthViewController.m
//  BelApp
//
//  实名认证
//
//  Created by Leon on 15/3/7.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "VerifyNameController.h"
#import "VerifyRegexTool.h"

#define IS_CH_SYMBOL(chr) ((int)(chr)>127)

@interface VerifyNameController () <UITextFieldDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *idCardField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


- (IBAction)submitAction;
@end

@implementation VerifyNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameField.delegate = self;
    self.idCardField.delegate = self;
    
    [self.nameField becomeFirstResponder];
    
    
    //监听文本框内容
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.idCardField];
}

//监听输入框文本内容变化
-(void)textChange{
    self.submitButton.enabled = (self.nameField.text.length >= 2 && self.idCardField.text.length == 18);
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(self.nameField == textField){
        [self.idCardField becomeFirstResponder];
    }else{
        [self submitAction];
    }
    return  YES;
}


- (IBAction)submitAction {
    
    NSString *name = self.nameField.text;
    
    
    //判断姓名输入是否为中文
    for (int i = 0 ; i < name.length ; i ++)
    {
        const char *c = [[name substringWithRange:NSMakeRange(i, 1)] UTF8String];
        if (strlen(c)!=3) {
            [MBProgressHUD showError:@"请填写真实姓名"];
            [self.nameField becomeFirstResponder];
            return;
        }
    }
    
    // 校验身份证号码
    if ( ![VerifyRegexTool verifyIDCardNumber:self.idCardField.text]) {
        [MBProgressHUD showError:@"身份证格式不正确"];
        [self.idCardField becomeFirstResponder];
        return;
    }
    
    NSDictionary *param = @{
                            @"realname":name,
                            @"ic":self.idCardField.text,
                            @"login_id":[AccountUtil account].userinfo.login_id
                            };
    [HttpRequest postWithURL:@"account/chk_ic.html" params:param success:^(id json) {
        LCLog(@"----> %@", json);
        if ([[json valueForKey:@"status"] isEqualToString:@"y"]) {
            [MBProgressHUD hideHUD];
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            LoginAccount *account = appDelegate.loginAccount;
            account.userinfo.realname_valid = @"1";
            account.userinfo.realname = self.nameField.text;
            [AccountUtil saveAccount:account];
            
            [[[UIAlertView alloc] initWithTitle:json[@"info"] message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
            
        } else  {
            [MBProgressHUD showError:[json valueForKey:@"info"]];
        }
    } failure:^(NSError *error) {
         LCLog(@"----> %@", error);
    }];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
