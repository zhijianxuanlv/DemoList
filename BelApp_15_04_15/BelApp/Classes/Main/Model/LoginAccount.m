//
//  LoginAccount.m
//  BelApp
//
//  Created by Leon on 15/3/6.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "LoginAccount.h"

#define kCodeAmountTotal        @"amountTotal"
#define kCodeAmountAvailable    @"amountAvailable"
#define kCodeAmountFrozen       @"amountFrozen"
#define kCodeAmountOnTheWay     @"amountOnTheWay"
#define kCodeUserInfo           @"userInfo"

@implementation LoginAccount


//+ (id)allocWithZone:(struct _NSZone *)zone
//{
//    static LoginAccount *instance;
//    
//    // dispatch_once是线程安全的，onceToken默认为0
//    static dispatch_once_t onceToken;
//    // dispatch_once宏可以保证块代码中的指令只被执行一次
//    dispatch_once(&onceToken, ^{
//        // 在多线程环境下，永远只会被执行一次，instance只会被实例化一次
//        instance = [super allocWithZone:zone];
//    });
//    
//    return instance;
//}
//
//+ (instancetype)sharedLoginAccount
//{
//    return [[self alloc] init];
//}

/**
 *  从文件中解析对象的时候调
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.amount_total = [decoder decodeDoubleForKey:kCodeAmountTotal];
        self.amount_available = [decoder decodeDoubleForKey:kCodeAmountAvailable];
        self.amount_frozen = [decoder decodeDoubleForKey:kCodeAmountFrozen];
        self.amount_on_the_way = [decoder decodeDoubleForKey:kCodeAmountOnTheWay];
        self.userinfo = [decoder decodeObjectForKey:kCodeUserInfo];
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeDouble:self.amount_total forKey:kCodeAmountTotal];
    [encoder encodeDouble:self.amount_available forKey:kCodeAmountAvailable];
    [encoder encodeDouble:self.amount_frozen forKey:kCodeAmountFrozen];
    [encoder encodeDouble:self.amount_on_the_way forKey:kCodeAmountOnTheWay];
    
    [encoder encodeObject:self.userinfo forKey:kCodeUserInfo];
}


@end
