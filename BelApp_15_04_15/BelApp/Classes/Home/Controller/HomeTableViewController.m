//
//  HomeTableViewController.m
//  BelApp
//
//  Created by Leon on 15/3/4.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "HomeTableViewController.h"
#import "BannerAdView.h"
#import "Banner.h"
#import "AppDelegate.h"
#import "WithdrawController.h"
#import "InfoViewController.h"

@interface HomeTableViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet BannerAdView *bannerView;

- (IBAction)callAction;
- (IBAction)productAction:(UIButton *)sender;


- (IBAction)registAction;
- (IBAction)loginAction;
- (IBAction)guideAction;


- (IBAction)rechargeAction;
- (IBAction)myInvestAction;
- (IBAction)receiptAction;


@property (weak, nonatomic) IBOutlet UIView *unloginView;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation HomeTableViewController

- (AppDelegate *)appDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.appDelegate.loginStatus) {
        self.unloginView.hidden = YES;
        self.loginView.hidden = NO;
    } else {
        self.unloginView.hidden = NO;
        self.loginView.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.bannerView.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth * 0.4);
    

    [self loadData];
}



- (void) loadData {
    NSDictionary *param = @{@"signature":@""};
    [HttpRequest postWithURL:@"invest/index.html" params:param success:^(id json) {
        LCLog(@"json --> %@", json);
        if ([@"y" isEqualToString:[json valueForKey:@"status"]]){
//            NSArray *banners = [Banner keyValuesArrayWithObjectArray:[json valueForKey:@"banners"]];
            NSMutableArray *banners = [NSMutableArray array];
            for ( NSDictionary *dic in [json valueForKey:@"banners"]) {
                [banners addObject:[Banner objectWithKeyValues:dic]];
            }
            self.bannerView.imageArray = [banners valueForKeyPath:@"coverImgurl"];
        }
        
    } failure:^(NSError *error) {
        LCLog(@"error -> %@", error.description);
    }];
}

- (IBAction)callAction {
    LCLog(@"------call");
    
    NSMutableString *str = [[NSMutableString alloc]initWithFormat:@"tel:%@",@"400-0686-600" ];
    UIWebView *callWebView = [[UIWebView alloc]init];
    [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebView];
}

- (IBAction)productAction:(UIButton *)sender {
    [self.appDelegate showProductWithType:sender.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductType object:sender];
}

- (IBAction)loginAction {
    BaseNavigationController *login =[[UIStoryboard storyboardWithName:@"login" bundle:nil] instantiateInitialViewController];
    [self presentViewController:login animated:YES completion:nil];
}

- (IBAction)guideAction {
    InfoViewController *info = [[UIStoryboard storyboardWithName:@"more" bundle:nil] instantiateViewControllerWithIdentifier:@"infoViewController"] ;
    info.htmlName = @"about.html";
    info.title = @"平台介绍";
    [self.navigationController pushViewController:info animated:YES];
}

- (IBAction)rechargeAction {
    Userinfo *userInfo = self.appDelegate.loginAccount.userinfo;
    if (userInfo.isRealnameValid) {
        if (userInfo.isFyValid) {
            WithdrawController *recharge = [[UIStoryboard storyboardWithName:@"me" bundle:nil] instantiateViewControllerWithIdentifier:@"withdrawController"];
            recharge.title = @"充值";
            recharge.type = @"0024";
            [self.navigationController pushViewController:recharge animated:YES];
            
        } else {
            [MBProgressHUD showError:@"您还没有进行富友认证"];
        }
    } else {
        [MBProgressHUD showError:@"请先进行实名认证"];
    }
}

- (IBAction)myInvestAction {
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"me" bundle:nil] instantiateViewControllerWithIdentifier:@"myInvestController"] animated:YES];
}

- (IBAction)receiptAction {
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"me" bundle:nil] instantiateViewControllerWithIdentifier:@"receiptRecordController"] animated:YES];
}

- (IBAction)registAction {
    BaseNavigationController *regist =[[UIStoryboard storyboardWithName:@"login" bundle:nil] instantiateViewControllerWithIdentifier:@"regist"];
    [self presentViewController:regist animated:YES completion:nil];
}


@end
