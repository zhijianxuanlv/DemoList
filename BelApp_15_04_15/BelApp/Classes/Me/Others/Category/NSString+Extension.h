//
//  NSString+Extension.h
//  OaMobile
//
//  Created by Leon on 12/16/14.
//  Copyright (c) 2014 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (CGSize)sizeWithFont:(UIFont*) font maxSize:(CGSize)maxSize;
/**
 *  手机号加星号
 */
- (NSString *)toAsteriskPhoneNum;

- (NSString *)toAsteriskName;

@end
