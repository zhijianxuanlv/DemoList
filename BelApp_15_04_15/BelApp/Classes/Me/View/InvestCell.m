//
//  InvestCell.m
//  BelApp
//
//  Created by Leon on 15/3/16.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "InvestCell.h"

@interface InvestCell ()

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *rate;
@property (weak, nonatomic) IBOutlet UILabel *periods;
@property (weak, nonatomic) IBOutlet UILabel *money;


@end

@implementation InvestCell

- (void)setInvestModel:(InvestModel *)investModel
{
    _investModel = investModel;
    self.productName.text = _investModel.productName;
    self.time.text = [_investModel.createTime substringToIndex:11];
    self.rate.text = [NSString stringWithFormat:@"%.2f%%",_investModel.rate];
    self.periods.text = [NSString stringWithFormat:@"%lu",(unsigned long)_investModel.periods];
    self.money.text = [NSString stringWithFormat:@"%.2f",_investModel.efodPrincipal];
    
    switch (_investModel.type) {
        case InvestTypeCreditorSold:
             self.productName.text = _investModel.proName;
            self.money.text = [NSString stringWithFormat:@"%.2f",_investModel.transferMoney];
            self.periods.text = [NSString stringWithFormat:@"%lu",(unsigned long)_investModel.transferPersiods];
            break;
        case InvestTypeCreditorOnSell:
            self.time.text = [_investModel.efodSaltime substringToIndex:10];
            break;
        case InvestTypeRepayment:
        case InvestTypeSettlement:
            self.time.text = [_investModel.efodEfTime substringToIndex:10];
            break;
        default:
            break;
    }
}

@end
