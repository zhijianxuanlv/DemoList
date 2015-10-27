//
//  ReceiptModel.h
//  BelApp
//
//  Created by Leon on 15/3/17.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReceiptModel : NSObject

@property (nonatomic, strong) NSString *productName;
/** 本金 */
@property (nonatomic) double efcontrolPrincipal;
/** 利息 */
@property (nonatomic) double efcontrolInterest;
/** 期数 */
@property (nonatomic) NSUInteger efcontrolPeriod;
/** 还款时间 */
@property (nonatomic, strong) NSString *resultTime;


//利息
//efcontrolInterest = "26.23";
//
//efcontrolPaystatus = 0;
//期数
//efcontrolPeriod = 5;
//本金
//efcontrolPrincipal = "1185.76";
//id = 2357;
//orderId = 39;
//产品名
//productName = "\U5b89\U7a33\U76c8";
//rate = "13.2";
//还款时间
//resultTime = "2015-08-04 15:54:02";

@end
