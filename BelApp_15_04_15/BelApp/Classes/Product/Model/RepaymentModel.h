//
//  RepaymentModel.h
//  BelApp
//
//  Created by Danny on 15/3/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//还款计划

#import <Foundation/Foundation.h>

@interface RepaymentModel : NSObject

//期数
@property (nonatomic) NSUInteger index;

//应还本息
@property (nonatomic) double efcontrolPrincipal;
//应还本金
@property (nonatomic) double efcontrolTotal;
//应还利息
@property (nonatomic) double efcontrolInterest;

//合计本息
@property (nonatomic) double controlTotal;
//合计本金
@property (nonatomic) double principalTotal;
//合计利息
@property (nonatomic) double interestTotal;

@end
