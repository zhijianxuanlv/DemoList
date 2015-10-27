//
//  ReceiptCell.m
//  BelApp
//
//  Created by Leon on 15/3/17.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ReceiptCell.h"

@interface ReceiptCell()

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation ReceiptCell

- (void)setReceiptModel:(ReceiptModel *)receiptModel
{
    _receiptModel  = receiptModel;
    
    self.nameLabel.text = _receiptModel.productName;
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", _receiptModel.efcontrolPrincipal + _receiptModel.efcontrolInterest];
    self.periodLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)_receiptModel.efcontrolPeriod];
    self.timeLabel.text = [_receiptModel.resultTime substringToIndex:10];
}

@end
