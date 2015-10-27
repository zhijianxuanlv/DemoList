//
//  NSString+Encryption.h
//  BelApp
//
//  Created by Leon on 15/4/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

- (NSString *)mdsString;
+ (NSString *)genUUID;
- (NSString *)sha1String;
+ (NSString *)dateString;

@end
