//
//  AddRecordCell.m
//  BelApp
//
//  Created by Danny on 15/3/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "AddRecordCell.h"

@interface AddRecordCell()

@property (weak, nonatomic) IBOutlet UILabel *loginName;
@property (weak, nonatomic) IBOutlet UILabel *efodPrincipal;
@property (weak, nonatomic) IBOutlet UILabel *createTime;

@end

@implementation AddRecordCell

- (void)setRecord:(AddRecords *)record
{
    _record = record;
    
    self.loginName.text = record.loginName;
    self.efodPrincipal.text = [NSString stringWithFormat:@"%.2f",record.efodPrincipal];
    self.createTime.text = record.createTime;
}
@end
