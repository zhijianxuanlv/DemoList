//
//  BorrowerInfo.h
//  BelApp
//
//  Created by Danny on 15/3/10.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//借款人信息

#import <Foundation/Foundation.h>

@interface BorrowerInfo : NSObject

//项目描述
@property (nonatomic,copy) NSString *applyPurpose;
//用户名
@property (nonatomic,copy) NSString *loginName;
//真实姓名
@property (nonatomic,copy) NSString *realname;
//性别
@property (nonatomic,copy) NSString *sex;
//年龄
@property (nonatomic,strong) NSNumber *age;
//婚姻状况
@property (nonatomic,copy) NSString *marital;
//手机号码
@property (nonatomic,copy) NSString *mobile;
//身份证号
@property (nonatomic,copy) NSString *ic;
//工作城市
@property (nonatomic,copy) NSString *comAddress;
//单位规模
@property (nonatomic,copy) NSString *companyScale;
//单位性质
@property (nonatomic,copy) NSString *companyNature;
//职业类型
@property (nonatomic,copy) NSString *jobName;
//本单位工作年限
@property (nonatomic,copy) NSString *enterpriseLife;


@end
