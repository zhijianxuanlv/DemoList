//
//  AccountViewController.m
//  BelApp
//
//  Created by Leon on 15/3/5.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "AccountViewController.h"
#import "AppDelegate.h"
#import "WithdrawController.h"

@interface AccountViewController () <UIActionSheetDelegate>
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UIView *accInfoView;

@property (weak, nonatomic) IBOutlet UILabel *amountTotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountAvailableLabel;
@property (nonatomic, strong) LoginAccount *loginAccount;

- (IBAction)logoutAction:(UIButton *)sender;
- (IBAction)rechargeAction;
- (IBAction)withdrawAction;


@end

@implementation AccountViewController

- (AppDelegate *)appDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginAccount = self.appDelegate.loginAccount;
    self.navigationController.navigationBar.translucent = NO;
    
    self.accInfoView.frame = CGRectMake(0, 0, ScreenWidth, 122);
    [self.loginAccount addObserver:self forKeyPath:@"amount_total" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [self.loginAccount addObserver:self forKeyPath:@"amount_available" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.amountAvailableLabel.text = [NSString stringWithFormat:@"%.2f",self.appDelegate.loginAccount.amount_available];
    self.amountTotalLabel.text = [NSString stringWithFormat:@"账户余额:%.2f元",self.appDelegate.loginAccount.amount_total];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"amount_available"])
    {
        self.amountAvailableLabel.text = [NSString stringWithFormat:@"%.2f",self.appDelegate.loginAccount.amount_available];
    } else  if  ([keyPath isEqualToString:@"amount_total"] ){
        self.amountTotalLabel.text = [NSString stringWithFormat:@"账户余额:%.2f元",self.appDelegate.loginAccount.amount_total];
    }
}

- (IBAction)logoutAction:(UIButton *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定要退出吗?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles: nil];
    [sheet showInView:self.view];
//    [self.appDelegate logout];
}

- (IBAction)rechargeAction {
    Userinfo *userInfo = self.appDelegate.loginAccount.userinfo;
    if (userInfo.isRealnameValid) {
        if (userInfo.isFyValid) {
            [self performSegueWithIdentifier:@"recharge" sender:nil];
        } else {
            [MBProgressHUD showError:@"您还没有进行富友认证"];
        }
    } else {
        [MBProgressHUD showError:@"请先进行实名认证"];
    }
}

- (IBAction)withdrawAction {
    Userinfo *userInfo = self.appDelegate.loginAccount.userinfo;
    if (userInfo.isRealnameValid) {
        if (userInfo.isFyValid) {
            [self performSegueWithIdentifier:@"withdraw" sender:nil];
        } else {
            [MBProgressHUD showError:@"您还没有进行富友认证"];
        }
    } else {
        [MBProgressHUD showError:@"请先进行实名认证"];
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0) {
        [MBProgressHUD showMessage:@"正在注销"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.appDelegate logout];
        });
        
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSString *segueIdentifier = segue.identifier;
    
    
    if ([segueIdentifier isEqualToString:@"recharge"]){
        WithdrawController *withCtrl = (WithdrawController *)segue.destinationViewController;
        withCtrl.title = @"充值";
        withCtrl.type = @"0024";
    } else if ([segueIdentifier isEqualToString:@"withdraw"]) {
        WithdrawController *withCtrl = (WithdrawController *)segue.destinationViewController;
        withCtrl.title = @"提现";
        withCtrl.type = @"0022";
    }
}

- (void)dealloc {
    [self.loginAccount removeObserver:self forKeyPath:@"amount_total"];
    [self.loginAccount removeObserver:self forKeyPath:@"amount_available"];
}

@end
