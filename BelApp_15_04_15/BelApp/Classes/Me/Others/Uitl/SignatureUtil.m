//
//  EncryptionUtil.m
//  BelApp
//
//  Created by Leon on 15/4/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "SignatureUtil.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+Encryption.h"

@implementation SignatureUtil

+ (NSString *) signature {
    NSString *timeStirng = [NSString dateString];
    NSString *uuid = [NSString genUUID];
    NSString *token = [uuid mdsString];
    NSString *apply_id = @"ios";
    NSString *sourceSign = [NSString stringWithFormat:@"%@:%@:%@:%@",@"zzl_apt",apply_id,timeStirng,token];
    NSString *encryptSign = [ sourceSign sha1String];
    NSDictionary *sign = @{@"time":timeStirng,
                            @"apply_id":apply_id,
                            @"sigature":encryptSign,
                            @"token":token};
    
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:sign
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
