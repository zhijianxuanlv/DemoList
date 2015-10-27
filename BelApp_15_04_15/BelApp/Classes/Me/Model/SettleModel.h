//
//  SettleModel.h
//  BelApp
//
//  Created by Leon on 15/3/17.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettleModel : NSObject
/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  利息
 */
@property (nonatomic) double efredInterest;
/**
 *  期数
 */
@property (nonatomic, strong) NSString *efredPeriod;
/**
 *  本金
 */
@property (nonatomic) double efredPrincipal;
/**
 *  提前还款违约金
 */
@property (nonatomic) double prepaymentPenalty;

/**
 *  结清时间
 */
@property (nonatomic, strong) NSString *efredCtime;


@end
