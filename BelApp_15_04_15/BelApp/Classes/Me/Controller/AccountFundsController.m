//
//  AccountFundsController.m
//  BelApp
//
//  Created by Leon on 15/3/6.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "AccountFundsController.h"
#import "AccountFunds.h"

@interface AccountFundsController ()
/**
 *  账户余额
 */
@property (weak, nonatomic) IBOutlet UILabel *amountTotalLabel;
/**
 *  可用余额
 */
@property (weak, nonatomic) IBOutlet UILabel *amountAvailableLabel;
/**
 *  冻结余额
 */
@property (weak, nonatomic) IBOutlet UILabel *amountFrozenLabel;
/**
 *  待收本金
 */
@property (weak, nonatomic) IBOutlet UILabel *outPrincipalLabel;
/**
 *  待收利息
 */
@property (weak, nonatomic) IBOutlet UILabel *outInterestLabel;
/**
 *  累计收益
 */
@property (weak, nonatomic) IBOutlet UILabel *inInterestLabel;
/**
 *  当月累计收益
 */
@property (weak, nonatomic) IBOutlet UILabel *moneyProfitLabel;




@end

@implementation AccountFundsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    
    NSDictionary *param = @{@"id" : [AccountUtil account].userinfo.login_id};
    
    [HttpRequest postWithURL:@"account/account_info.html" params:param success:^(id json) {
        LCLog(@"---> %@", json);
        if ([[json valueForKey:@"status" ] isEqualToString:@"y"]) {
            AccountFunds *funds = [AccountFunds  objectWithKeyValues:json];
            self.amountTotalLabel.text = [self moneyStringWith:funds.amount_total];
            self.amountAvailableLabel.text = [self moneyStringWith:funds.amount_available];
            self.amountFrozenLabel.text = [self moneyStringWith:funds.amount_frozen];
            self.outPrincipalLabel.text = [self moneyStringWith:funds.outPrincipal];
            self.outInterestLabel.text = [self moneyStringWith:funds.outInterest];
            self.moneyProfitLabel.text = [self moneyStringWith:funds.moneyProfit];
            self.inInterestLabel.text = [self moneyStringWith:funds.inInterest];
            
            //更新账户数据信息
            LoginAccount *account = [AccountUtil account];
            [account setAmount_total:funds.amount_total];
            [account setAmount_available:funds.amount_available];
            [account setAmount_frozen:funds.amount_frozen];
//            [account setAmount_on_the_way:funds.]
            [AccountUtil saveAccount:account];
            
        } else  {
//            [self loadData];
        }
    } failure:^(NSError *error) {
        LCLog(@"---> %@",error.description);
    }];
}

- (NSString *) moneyStringWith:(double) money {
    return [NSString stringWithFormat:@"%.2f元",money];
}

@end
