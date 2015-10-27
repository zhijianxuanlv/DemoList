//
//  SettleCell.m
//  BelApp
//
//  Created by Leon on 15/3/17.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "SettleCell.h"

@interface SettleCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodLabel;

@end

@implementation SettleCell

- (void)setSettleModel:(SettleModel *)settleModel
{
    _settleModel = settleModel;
    self.titleLabel.text = _settleModel.title;
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f",_settleModel.efredPrincipal + _settleModel.efredInterest + _settleModel.prepaymentPenalty];
    self.timeLabel.text = [_settleModel.efredCtime substringToIndex:10];
    self.periodLabel.text = _settleModel.efredPeriod;
    
}

@end
