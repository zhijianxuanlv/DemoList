//
//  TranferDetailController.h
//  BelApp
//
//  Created by Leon on 15/3/19.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransferModel.h"


@protocol TranferDetailDelegate <NSObject>

- (void)tranferListDelete:(TransferModel *)transferModel;

@end

@interface TranferDetailController : UITableViewController

@property (nonatomic, strong) TransferModel *transferModel;
@property (nonatomic, weak) id<TranferDetailDelegate> delegate;

@end
