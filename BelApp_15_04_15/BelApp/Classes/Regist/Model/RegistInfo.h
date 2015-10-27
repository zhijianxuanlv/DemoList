//
//  RegistInfo.h
//  BelApp
//
//  Created by Leon on 15/3/11.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistInfo : NSObject

/**用户名*/
@property (nonatomic,strong) NSString *username;
/**密码*/
@property (nonatomic,strong) NSString *password;
/**推广码*/
@property (nonatomic,strong) NSString *promote;
/**手机号码*/
@property (nonatomic,strong) NSString *mobile;
/**短信验证码*/
@property (nonatomic,strong) NSString *code;


@end
