//
//  BaseListController.m
//  BelApp
//
//  Created by Leon on 15/3/17.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "BaseListController.h"
#import "FooterView.h"

@interface BaseListController()<FooterViewDelegate>

@property (nonatomic, weak) FooterView *footerView;

@end

@implementation BaseListController


- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupRefreshView];
    
    FooterView *footerView = [[FooterView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
//    footerView.backgroundColor = [UIColor blueColor];
//    [footerView setNeedsLayout];
    footerView.delegate = self;
    self.footerView = footerView;
    self.footerView.hidden = YES;
    
    self.tableView.tableFooterView = footerView;
    
    self.pageSize = 10;
    
    
}

- (void)setupRefreshView
{
    // 1.下拉刷新
    MJRefreshHeaderView *header = [MJRefreshHeaderView header];
    header.scrollView = self.tableView;
    header.delegate = self;
    // 自动进入刷新状态
    [header beginRefreshing];
    self.header = header;
    
    // 2.上拉刷新(上拉加载更多数据)
//    MJRefreshFooterView *footer = [MJRefreshFooterView footer];
//    footer.scrollView = self.tableView;
//    footer.delegate = self;
//    self.footer = footer;
}

- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if ([refreshView isKindOfClass:[MJRefreshFooterView class]]) { // 上拉刷新
        [self loadMoreData];
    } else { // 下拉刷新
        [self loadNewData];
    }
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.dataArray.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)noMoreData {
    self.footerView.hidden = NO;
    [self.footerView noMoreData];
}

- (void)needMoreData {
    self.footerView.hidden = NO;
    [self.footerView hasMoreData];
}

- (void)clickLoadMoreWithFooterView:(FooterView *)footerView {
    [self loadMoreData];
}

- (void)loadNewData{
    //override
}

- (void)loadMoreData{
    //override
}

- (void)dealloc
{
    [self.header free];
}

@end
