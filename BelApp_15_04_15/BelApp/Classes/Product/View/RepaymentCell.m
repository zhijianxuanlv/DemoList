//
//  RepaymentCell.m
//  BelApp
//
//  Created by Danny on 15/3/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "RepaymentCell.h"
@interface RepaymentCell ()

@property (nonatomic, weak) IBOutlet UILabel *index;
@property (nonatomic, weak) IBOutlet UILabel *efcontrolPrincipal;
@property (nonatomic, weak) IBOutlet UILabel *efcontrolTotal;
@property (nonatomic, weak) IBOutlet UILabel *efcontrolInterest;


@end


@implementation RepaymentCell

- (void)setRepayment:(RepaymentModel *)repayment
{
    _repayment = repayment;
    self.index.text = [NSString stringWithFormat:@"%d",_repayment.index];
    self.efcontrolTotal.text = [NSString stringWithFormat:@"%.2f",_repayment.efcontrolTotal];
    self.efcontrolPrincipal.text = [NSString stringWithFormat:@"%.2f",_repayment.efcontrolPrincipal];
    self.efcontrolInterest.text = [NSString stringWithFormat:@"%.2f",_repayment.efcontrolInterest];
}

@end
