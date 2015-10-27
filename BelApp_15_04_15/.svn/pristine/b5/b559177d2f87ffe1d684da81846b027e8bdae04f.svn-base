//
//  TransferInfoCell.m
//  BelApp
//
//  Created by Leon on 15/3/20.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//


#import "TransferInfoCell.h"
#import "NSString+Extension.h"

@interface TransferInfoCell()

@property (weak, nonatomic) IBOutlet UILabel *buyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *selNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *transfermoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *ctimeLabel;

@end


@implementation TransferInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTransferInfo:(TransferInfo *)transferInfo
{
    _transferInfo = transferInfo;
    self.buyNameLabel.text = [_transferInfo.buyName toAsteriskName];
    self.selNameLabel.text = [_transferInfo.selName toAsteriskName];
    self.transfermoneyLabel.text = [NSString stringWithFormat:@"%.2f",_transferInfo.transfermoney];
    
    self.ctimeLabel.text = [_transferInfo.ctime substringToIndex:10];
}

@end
