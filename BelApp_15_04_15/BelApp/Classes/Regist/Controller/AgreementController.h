//
//  ServeViewController.h
//  BelApp
//
//  Created by 罗成 on 15/3/9.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AgreementDelegate <NSObject>

- (void)agreeUserAgreement;

@end

@interface AgreementController : UIViewController

@property (nonatomic, weak) id<AgreementDelegate> delegate;
@property (nonatomic, strong) NSString *agreementStr;

@end