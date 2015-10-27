//
//  ServeViewController.m
//  BelApp
//
//  Created by 罗成 on 15/3/9.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "AgreementController.h"

@interface AgreementController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)AgreeAction;
@end

@implementation AgreementController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView.delegate = self;
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:self.agreementStr ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    self.agreeBtn.enabled = YES;
}


- (IBAction)AgreeAction {
    
    if ([self.delegate respondsToSelector:@selector(agreeUserAgreement) ]) {
        [self.delegate agreeUserAgreement];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
@end
