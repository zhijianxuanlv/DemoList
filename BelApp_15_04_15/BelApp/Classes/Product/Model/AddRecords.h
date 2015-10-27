//
//  AddRecords.h
//  BelApp
//
//  Created by Danny on 15/3/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//加入记录

#import <Foundation/Foundation.h>

@interface AddRecords : NSObject
//投资人
@property (nonatomic,strong) NSString *loginName;
//投资金额
@property (nonatomic) double efodPrincipal;
//投资时间
@property (nonatomic,strong) NSString *createTime;

@end
