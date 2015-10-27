//
//  VerifyFYViewController.m
//  BelApp
//
//  Created by Leon on 15/3/9.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "VerifyFYViewController.h"
#import "FyModel.h"

#define FyURL @"https://jzh.fuiou.com/app/appWebReg.action"
#define FYExitString @"fuiou-suixinfu-ios://cordova/back"

@interface VerifyFYViewController () <UIWebViewDelegate,NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) FyModel *fyModel;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation VerifyFYViewController

- (AppDelegate *)appDelegate{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    
    NSDictionary *param = @{@"login_id" : [AccountUtil account].userinfo.login_id,
                            @"signature" :@""};
    
    [HttpRequest postWithURL:@"account/safety.html" params:param success:^(id json) {
        LCLog(@"json --> %@ ", json);
        if ([json[@"status"] isEqualToString:@"y"]) {
//            self.fyModel = [FyModel objectWithKeyValues:json[@"data"]];
            [self postTofy:json[@"data"]];
        }
    } failure:^(NSError *error) {
        
    }];
    
    
}

- (void)postTofy:(NSString *)html {
    [self.webView loadHTMLString:html baseURL:nil];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if ([title isEqualToString:@""]) {
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"Myform\").submit(); "];
    } else  if ([title isEqualToString:@"新用户注册"] || [title isEqualToString:@"开户协议"] ) {
        LCLog(@"title --> %@" , title);
    } else  {
        LCLog(@"---> %@", title);
    }
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    LCLog(@"request -->  %@", request.URL.absoluteString);
    
    NSString *requestString = request.URL.absoluteString;
    
    if ([requestString isEqualToString:FYExitString]) {
        [MBProgressHUD showMessage:@"正在处理信息,请稍后"];
        //这里重新请求认证状态
        NSDictionary *param = @{@"login_id":[AccountUtil account].userinfo.login_id,
                                @"signature":@""};
        
        [HttpRequest postWithURL:@"account/certification.html" params:param success:^(id json) {
            if ([json[@"status"] isEqualToString:@"y"]) {
                self.appDelegate.loginAccount.userinfo.fy_valid = json[@"fy_valid"];
                self.appDelegate.loginAccount.userinfo.fy_account = json[@"fy_account"];
                [AccountUtil saveAccount:self.appDelegate.loginAccount];
            }
            [MBProgressHUD hideHUD];
            [self.navigationController popViewControllerAnimated:YES];
            
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"网络异常,请重试"];
        }];
        return NO;
    } else {
        return YES;
    }

}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    LCLog(@"==> 加载");
}



- (void)postTofy {
    
    //    NSURL *url = [NSURL URLWithString: @"http://www.*******.com.cn:8081/index.php/Account/iphoneTopup"];
    //    NSString *body = [NSString stringWithFormat: @"email=%@&password=%@&amount=%@",@"a@a.com",@"1",@"12"];
    //    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    //    [request setHTTPMethod: @"POST"];
    //    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
    //    [WebView loadRequest: request];
    
        NSURL *url = [NSURL URLWithString:FyURL];
    
        NSMutableString *param = [NSMutableString stringWithFormat:@"capAcntNo=%@",self.fyModel.capAcntNo];
        [param appendString:[NSString stringWithFormat:@"&city_id=%@",self.fyModel.city_id]];
        [param appendString:[NSString stringWithFormat:@"&parent_bank_id=%@",self.fyModel.parent_bank_id]];
        [param appendString:[NSString stringWithFormat:@"&bank_nm=%@",self.fyModel.bank_nm]];
        [param appendString:[NSString stringWithFormat:@"&signature=%@",self.fyModel.signature]];
        [param appendString:[NSString stringWithFormat:@"&email=%@",self.fyModel.email]];
        [param appendString:[NSString stringWithFormat:@"&cust_nm=%@",self.fyModel.cust_nm]];
        [param appendString:[NSString stringWithFormat:@"&user_id_from=%@",self.fyModel.user_id_from]];
        [param appendString:[NSString stringWithFormat:@"&mobile_no=%@",self.fyModel.mobile_no]];
        [param appendString:[NSString stringWithFormat:@"&certif_id=%@",self.fyModel.certif_id]];
        [param appendString:[NSString stringWithFormat:@"&page_notify_url=%@",self.fyModel.page_notify_url]];
        [param appendString:[NSString stringWithFormat:@"&back_notify_url=%@",self.fyModel.back_notify_url]];
        [param appendString:[NSString stringWithFormat:@"&mchnt_cd=%@",self.fyModel.mchnt_cd]];
        [param appendString:[NSString stringWithFormat:@"&mchnt_txn_ssn=%@",self.fyModel.mchnt_txn_ssn]];
    
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    
        NSString *contentType = @"text/html";
    
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    ////
        NSData *data = [param dataUsingEncoding:NSUTF8StringEncoding];
    
        [request setHTTPMethod: @"POST"];
        [request setHTTPBody: data];
    
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
//        [self.webView loadRequest: request];
//        NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//        [NSURLConnection sendAsynchronousRequest:request
//                                           queue:queue
//                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
//                                   if (error) {
//                                       LCLog(@"Httperror:%@%d", error.localizedDescription,error.code);
//                                   }else{
//    
//                                       NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
//    
//                                       NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    
//                                       LCLog(@"HttpResponseCode:%d", responseCode);
//                                       LCLog(@"HttpResponseBody %@",responseString);
//                                   }
//                               }];
    
    [self.webView loadRequest:request];
    
    //
    
        
        
//        NSDictionary *param = @{
//                                @"capAcntNo": self.fyModel.capAcntNo,
//                                @"city_id" :self.fyModel.city_id,
//                                @"parent_bank_id": self.fyModel.parent_bank_id,
//                                @"bank_nm":self.fyModel.bank_nm,
//                                @"signature":self.fyModel.signature,
//                                @"email" :self.fyModel.email,
//                                @"cust_nm":self.fyModel.cust_nm,
//                                @"user_id_from":self.fyModel.user_id_from,
//                                @"mobile_no":self.fyModel.mobile_no,
//                                @"certif_id":self.fyModel.certif_id,
//                                @"page_notify_url":self.fyModel.page_notify_url,
//                                @"back_notify_url":self.fyModel.back_notify_url,
//                                @"mchnt_cd":self.fyModel.mchnt_cd,
//                                @"mchnt_txn_ssn":self.fyModel.mchnt_txn_ssn
//                                };
//        [HttpRequest postWithURL:@"https://jzh.fuiou.com/app/appWebReg.action"
//                          params:param
//                         success:^(id json) {
//                             LCLog(@"fy -->  json -->  %@", json);
//                         } failure:^(NSError *error) {
//                             LCLog(@"Error --> %@", error.description);
//                         }];
        //    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://jzh.fuiou.com/app/appWebReg.action"]];
        //    request set
    }



- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}


- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
}

- (void)dealloc {
    LCLog(@"---> dealloc");
}

@end
