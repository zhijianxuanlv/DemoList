//
//  TransferInfo.h
//  BelApp
//
//  Created by Leon on 15/3/20.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransferInfo : NSObject

/**受让人*/
@property (nonatomic,strong) NSString *buyName;

/**出让人*/
@property (nonatomic,strong) NSString *selName;

/**转让金额*/
@property (nonatomic) double transfermoney;

/**成交时间*/
@property (nonatomic,strong) NSString *ctime;

@end
