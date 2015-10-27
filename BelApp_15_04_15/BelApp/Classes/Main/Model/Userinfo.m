//
//  Userinfo.m
//  BelApp
//
//  Created by Leon on 15/3/7.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "Userinfo.h"

#define kCodeUsername       @"username"
#define kCodeloginId        @"loginId"
#define kCodeMobile         @"mobile"
#define kCodeRealname       @"realname"
#define kCodeFyValid        @"fyValid"
#define kCodeEmailValid     @"emailValid"
#define kCodeRealnameValid  @"realnameValid"


@implementation Userinfo

/**
 *  从文件中解析对象的时候调
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.username = [decoder decodeObjectForKey:kCodeUsername];
        self.login_id = [decoder decodeObjectForKey:kCodeloginId];
        self.mobile = [decoder decodeObjectForKey:kCodeMobile];
        self.realname = [decoder decodeObjectForKey:kCodeRealname];
        self.fy_valid = [decoder decodeObjectForKey:kCodeFyValid];
        self.email_valid = [decoder decodeObjectForKey:kCodeEmailValid];
        self.realname_valid = [decoder decodeObjectForKey:kCodeRealnameValid];
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.email_valid forKey:kCodeEmailValid];
    [encoder encodeObject:self.fy_valid forKey:kCodeFyValid];
    [encoder encodeObject:self.realname_valid forKey:kCodeRealnameValid];
    [encoder encodeObject:self.username forKey:kCodeUsername];
    [encoder encodeObject:self.login_id forKey:kCodeloginId];
    [encoder encodeObject:self.mobile forKey:kCodeMobile];
    [encoder encodeObject:self.realname forKey:kCodeRealname];

}


- (void) setFy_valid:(NSString *)fy_valid
{
    _fy_valid = fy_valid;
    _fyValid = [_fy_valid isEqualToString:@"1"];
}

- (void)setEmail_valid:(NSString *)email_valid
{
    _email_valid = email_valid;
    _emailValid = [_email_valid isEqualToString:@"1"];

}

- (void)setRealname_valid:(NSString *)realname_valid
{
    _realname_valid = realname_valid;
    _realnameValid = [_realname_valid isEqualToString:@"1"];
}



@end
