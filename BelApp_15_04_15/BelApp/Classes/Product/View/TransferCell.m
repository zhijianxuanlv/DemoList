//
//  CreditAssignmentCell.m
//  BelApp
//
//  Created by Leon on 15/3/19.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "TransferCell.h"

@interface TransferCell()

@property (weak, nonatomic) IBOutlet UILabel *typeName;
@property (weak, nonatomic) IBOutlet UILabel *rateLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodsLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;


@end


@implementation TransferCell

- (void)setTransferModel:(TransferModel *)transferModel
{
    _transferModel = transferModel;
    self.typeName.text = _transferModel.typeName;
    self.rateLabel.text = [NSString stringWithFormat:@"%.1f%%",_transferModel.rate];
    self.periodsLabel.text = [NSString stringWithFormat:@"%lu个月",(unsigned long)_transferModel.periods];
    self.moneyLabel.text = [NSString stringWithFormat:@"%.0f元",_transferModel.capital];
}

@end
