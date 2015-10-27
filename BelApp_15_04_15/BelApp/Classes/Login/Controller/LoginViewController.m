//
//  LoginViewController.m
//  BelApp
//
//  Created by Leon on 3/4/15.
//  Copyright (c) 2015 苏州中资联. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "Userinfo.h"
#import "LCGrayButton.h"


@interface LoginViewController() <UITextFieldDelegate>
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet LCGrayButton *loginBtn;
- (IBAction)loginAction;

@end

@implementation LoginViewController

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
    
    self.loginBtn.enabled = NO;
    self.loginBtn.normalColor = RGBColor(245, 61, 61);
    
    self.navigationController.navigationBar.translucent = NO;
    
    //监听文本框内容
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.usernameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.passwordField];

}

//监听输入框文本内容变化
-(void)textChange{
    
    if  (self.usernameField.text.length >= 4 && self.passwordField.text.length >= 6) {
        self.loginBtn.enabled = YES;
    } else {
        self.loginBtn.enabled = NO;
    }
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(self.usernameField == textField){
        
        [self.passwordField becomeFirstResponder];
        
    }else{
        
        [self loginAction];
        
    }
    return  YES;
    
}


- (IBAction)cancelAction:(UIBarButtonItem *)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)loginAction {
    
    [self.view endEditing:YES];
    if(!self.loginBtn.enabled)
        return;
    [MBProgressHUD showMessage:@"正在登录请等待"];
    NSDictionary *param = @{@"username":self.usernameField.text,@"password":self.passwordField.text};
    
    [HttpRequest postWithURL:@"account/login.html" params:param success:^(id json) {
        NSString *status = [json valueForKey:@"status"];
        if([status isEqualToString:@"y"]){
            
            [MBProgressHUD hideHUD];
            self.appDelegate.loginAccount = [LoginAccount objectWithKeyValues:json];
            [AccountUtil saveAccount:self.appDelegate.loginAccount];
            
            //登录成功
            [self.appDelegate loginToAccount:self.dismissToAccount];
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }  else  {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:[json valueForKey:@"info"]];
        }
    } failure:^(NSError *error) {
        LCLog(@"error --> %@",error.debugDescription);
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络异常,请稍后重试!"];
    }];
}

- (void)dealloc{
    [[NSNotificationCenter  defaultCenter] removeObserver:self];
}


@end

