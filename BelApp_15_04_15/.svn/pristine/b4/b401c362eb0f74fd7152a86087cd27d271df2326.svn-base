//
//  LXDLoginController.m
//  BelTest
//
//  Created by Danny on 15/3/3.
//  Copyright (c) 2015年 zzl.com. All rights reserved.
//

#import "LXDLoginController.h"


@interface LXDLoginController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginAction;

@end

@implementation LXDLoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"用户登录";
    self.navigationController.navigationBar.translucent = NO;
    
    //取消按钮
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickCancel)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    
    //注册
    UIBarButtonItem *reg = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(clickReg)];
    self.navigationItem.rightBarButtonItem = reg;
    
    
    self.view.backgroundColor = RGBColor(234, 234, 234);
    
    
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;
    
    
    [self.usernameField becomeFirstResponder];
    
    
    //监听文本框内容
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.usernameField];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.passwordField];
    
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBg)];
    [self.view addGestureRecognizer:tap];
    
    
}



//点击取消按钮触发的事件
-(void)clickCancel{

    NSLog(@"cancel");

}

//点击注册按钮触发的事件
-(void)clickReg{

    NSLog(@"reg");
    
}

//监听输入框文本内容变化
-(void)textChange{

    self.loginBtn.enabled = (self.usernameField.text.length >= 4 && self.passwordField.text.length >= 6);
    
}

//添加手势点击背景
-(void)clickBg{

    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    if(self.usernameField == textField){
    
        [self.passwordField becomeFirstResponder];
        
    }else{
    
        [self loginAction];
        
    }
    return  YES;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction {
    
    [self.view endEditing:YES];
    if(!self.loginBtn.enabled)
        return;
//    [MBProgressHUD showMessage:@"正在登录请等待"];
//    NSDictionary *param = @{@"username":self.usernameField.text,@"password":self.passwordField.text};
//    
//    [HttpRequest postWithURL:@"account/login.html" params:param success:^(id json) {
//        NSLog(@"response --> %@", json);
//        
//        NSString *status = [json valueForKey:@"status"];
//        if([status isEqualToString:@"y"]){
//        
//            [MBProgressHUD hideHUD];
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            [self presentViewController:sb.instantiateInitialViewController animated:YES completion:nil];

//        }
//    } failure:^(NSError *error) {
//        NSLog(@"error --> %@",error.debugDescription);
//    }];
    
    
    
    
}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
