//
//  RepaymentPlanViewController.h
//  BelApp
//
//  Created by Danny on 15/3/10.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//还款计划

#import <UIKit/UIKit.h>
#import "RepaymentModel.h"

@interface RepaymentPlanViewController : UITableViewController
@property (nonatomic, strong) RepaymentModel *repaymentModel;
@property(nonatomic,strong) NSArray *repaymentArr;
@property(nonatomic,strong) NSDictionary *totalDic;
@end
