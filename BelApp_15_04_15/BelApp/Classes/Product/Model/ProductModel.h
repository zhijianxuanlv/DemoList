//
//  ProductModel.h
//  BelApp
//
//  Created by 罗成 on 15/3/10.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    /**可以交易*/
    OrderTradeStatusInvesting = 0,
    /**交易成功*/
    OrderTradeStatusDealed = 1,
    /**流标*/
    OrderTradeStatusPass = 2,
    /**满标*/
    OrderTradeStatusFull = 3,
    /**结清*/
    OrderTradeStatusSettle = 4,
    /**异常*/
    OrderTradeStatusError = 5,
    /**死亡*/
    OrderTradeStatusDead =6
} OrderTradeStatus;

@interface ProductModel : NSObject
/**标题*/
@property (nonatomic,strong) NSString *title;
/**金额*/
@property (nonatomic,strong) NSString *amount;
/**收益率*/
@property (nonatomic,strong) NSString *rate;
/**期数*/
@property (nonatomic,strong) NSString *periods;
/**进度条*/
@property (nonatomic,strong) NSString * progress;
/**订单ID*/
@property (nonatomic,strong) NSString *orderId;;
/** 订单编号*/
@property (nonatomic,strong) NSString *orderNumber;

@property (nonatomic) double actualRate;

@property (nonatomic) double surplusPrincal; 

@property (nonatomic) OrderTradeStatus orderTradeStatu;

@end
