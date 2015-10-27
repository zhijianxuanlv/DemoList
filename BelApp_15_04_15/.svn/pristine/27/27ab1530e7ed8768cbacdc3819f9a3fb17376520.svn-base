//
//  NSString+Extension.m
//  OaMobile
//
//  Created by Leon on 12/16/14.
//  Copyright (c) 2014 苏州中资联. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont*) font maxSize:(CGSize)maxSize{
    NSDictionary *dic = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

- (NSString *)toAsteriskPhoneNum{
    return [self stringByReplacingCharactersInRange:NSMakeRange(3,4) withString:@"****"];
}

- (NSString *)toAsteriskName{
    return [self stringByReplacingCharactersInRange:NSMakeRange(1,self.length-1) withString:@"**"];
}
@end
