//
//  WithdrawController.m
//  BelApp
//
//  Created by Leon on 15/4/3.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "WithdrawController.h"

@interface WithdrawController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) AppDelegate *appDelegate;
- (IBAction)backAction:(UIBarButtonItem *)sender;

@end

@implementation WithdrawController

- (AppDelegate *)appDelegate{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self.appDelegate updateAccount];
    [self.navigationController  popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    [MBProgressHUD showMessage:@"正在加载"];
    NSDictionary *param = @{@"type":self.type,
                            @"login_id":self.appDelegate.loginAccount.userinfo.login_id,
                            @"signature":@""};
    
    [HttpRequest postWithURL:@"account/fy_login.html" params:param success:^(id json) {
        LCLog(@"json --> %@ ", json);
        if ([json[@"status"] isEqualToString:@"y"]) {
            [self postTofy:json[@"fy_info"]];
        } else  {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"网络异常,请重试!"];
        }
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络异常,请重试!"];
    }];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"fyform\").submit(); "];
//    [MBProgressHUD hideHUD];
    NSString *theTitle=[webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    if (![theTitle isEqualToString:@""]) {
        self.webView.hidden = NO;
        [MBProgressHUD hideHUD];
    }
    
    
}

-  (void)postTofy:(NSString *)htmlString {
    [self.webView loadHTMLString:htmlString baseURL:nil];
}


@end
