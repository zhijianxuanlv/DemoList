//
//  NSString+Encryption.m
//  BelApp
//
//  Created by Leon on 15/4/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "NSString+Encryption.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Encryption)

- (NSString *)mdsString {
    const char*cStr =[self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return[NSString stringWithFormat:
           @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
           result[0], result[1], result[2], result[3],
           result[4], result[5], result[6], result[7],
           result[8], result[9], result[10], result[11],
           result[12], result[13], result[14], result[15]
           ];
}

+ (NSString *)genUUID {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}

- (NSString *)sha1String {
    //  将字符串转换成 C字符串
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    //  C字符串转换成二进制数据
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (uint32_t)data.length, digest);
    
    NSMutableString *encryptionString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [encryptionString appendFormat:@"%02x", digest[i]];
    }
    return encryptionString;
}

+ (NSString *)dateString{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [format stringFromDate:[NSDate date]];
    return dateString;
}

@end
