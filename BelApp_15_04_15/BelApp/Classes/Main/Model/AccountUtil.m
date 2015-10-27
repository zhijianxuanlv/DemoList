//
//  AccountUtil.m
//  BelApp
//
//  Created by Leon on 15/3/24.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "AccountUtil.h"
#import "LoginAccount.h"


#define BelAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]

@implementation AccountUtil

+ (void)saveAccount:(LoginAccount *)account
{
    // 计算账号的过期时间
//    NSDate *now = [NSDate date];
//    account.expiresTime = [now dateByAddingTimeInterval:account.expires_in];
    
    [NSKeyedArchiver archiveRootObject:account toFile:BelAccountFile];
}

+ (LoginAccount *)account
{
    // 取出账号
    LoginAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:BelAccountFile];
    
    // 判断账号是否过期
//    NSDate *now = [NSDate date];
//    if ([now compare:account.expiresTime] == NSOrderedAscending) { // 还没有过期
//        return account;
//    } else { // 过期
//        return nil;
//    }
    return account;
}

+ (BOOL)cleanAccount {
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:BelAccountFile]) {
        [UserDefaults removeObjectForKey:@"gesturePassword"];
        [UserDefaults synchronize];
        return [defaultManager removeItemAtPath:BelAccountFile error:nil];
    }

    
    return false;
}

@end