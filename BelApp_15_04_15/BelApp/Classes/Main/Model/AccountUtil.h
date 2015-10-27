//
//  AccountUtil.h
//  BelApp
//
//  Created by Leon on 15/3/24.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginAccount;

@interface AccountUtil : NSObject

+ (void)saveAccount:(LoginAccount *)account;

/**
 *  返回存储的账号信息
 */
+ (LoginAccount *)account;


+ (BOOL)cleanAccount;


@end
