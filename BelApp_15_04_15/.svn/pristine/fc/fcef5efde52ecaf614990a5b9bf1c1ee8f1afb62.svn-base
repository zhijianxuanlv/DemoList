//
//  InvestModel.h
//  BelApp
//
//  Created by Leon on 15/3/16.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    InvestTypeInvestment = 0,
    InvestTypeRepayment,
    InvestTypeSettlement,
    InvestTypeCreditorOnSell,
    InvestTypeCreditorSold
}InvestType;


@interface InvestModel : NSObject

//"allow_sell" = y;
//createTime = "2015-03-03 14:58:46";
//efStatus = 1;
//efodCleartime = "2016-03-03 15:46:02";
//efodEfTime = "2015-03-03 15:46:02";
//efodPrincipal = 8000;
//efodSal = 0;
//efodSaltime = "<null>";
//id = 177;
//"login_id" = 141;
//orderId = 40;
//orderTradeStatu = 1;
//periods = 12;
//productName = "\U5b89\U7a33\U76c8";
//rate = "34.56";

@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *productName;
@property (nonatomic, strong) NSString *efodEfTime;
@property (nonatomic) NSUInteger orderId;
@property (nonatomic) NSUInteger id;
@property (nonatomic) NSUInteger periods;
@property (nonatomic) double efodPrincipal;
@property (nonatomic) double rate;
@property (nonatomic) InvestType type;
@property (nonatomic, strong) NSString *proName;
@property (nonatomic, strong) NSString *efodSaltime;
@property (nonatomic) double  transferMoney;
@property (nonatomic) NSUInteger transferPersiods;

@end
