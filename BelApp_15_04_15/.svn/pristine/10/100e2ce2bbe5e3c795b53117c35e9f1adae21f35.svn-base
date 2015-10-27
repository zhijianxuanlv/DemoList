//
//  BaseListController.h
//  BelApp
//
//  Created by Leon on 15/3/17.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"


@interface BaseListController : UITableViewController <MJRefreshBaseViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) UIButton *loadMoreButton;

@property (nonatomic) NSInteger pageNo;
@property (nonatomic) NSInteger pageSize;

@property (nonatomic, weak) MJRefreshFooterView *footer;
@property (nonatomic, weak) MJRefreshHeaderView *header;

- (void)loadNewData;
- (void)loadMoreData;

- (void)noMoreData;
- (void)needMoreData;

@end
