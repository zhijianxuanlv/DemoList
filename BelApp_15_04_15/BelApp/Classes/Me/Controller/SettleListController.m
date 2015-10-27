//
//  SettleListController.m
//  BelApp
//
//  Created by Leon on 15/3/16.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "SettleListController.h"
#import "SettleModel.h"
#import "SettleCell.h"


@implementation SettleListController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)loadNewData
{
    self.pageNo = 1;
    NSDictionary *param = @{@"login_id":[AccountUtil account].userinfo.login_id,
                            @"page_no":@(self.pageNo),
                            @"page_size":@(self.pageSize),
                            @"type":@1};
    
    [HttpRequest postWithURL:@"invest/invest_payinfo.html" params:param success:^(id json) {
        
        if ([json[@"status"] isEqualToString:@"y"] ){
            [self.dataArray removeAllObjects];
            NSArray *array = [SettleModel objectArrayWithKeyValuesArray:json[@"data"]];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            
            self.loadMoreButton.hidden = array.count < self.pageSize;
        }
        [self.header endRefreshing];
    } failure:^(NSError *error) {
        [self.header endRefreshing];
    }];
}

- (void)loadMoreData{
    self.pageNo++;
    NSDictionary *param = @{@"login_id":[AccountUtil account].userinfo.login_id,
                            @"page_no":@(self.pageNo),
                            @"page_size":@(self.pageSize),
                            @"type":@1};
    
    [HttpRequest postWithURL:@"invest/invest_payinfo.html" params:param success:^(id json) {
        
        if ([json[@"status"] isEqualToString:@"y"] ){
            NSArray *array = [SettleModel objectArrayWithKeyValuesArray:json[@"data"]];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            
            self.loadMoreButton.hidden = array.count < self.pageSize;
        }
        
    } failure:^(NSError *error) {
        
    }];
}

//- (void)loadMoreData{
//    self.pageNo++;
//    NSDictionary *param = @{@"login_id":[LoginAccount sharedLoginAccount].userinfo.login_id,
//                            @"page_no":@(self.pageNo),
//                            @"page_size":@(self.pageSize),
//                            @"type":@1};
//    
//    [HttpRequest postWithURL:@"invest/invest_payinfo.html" params:param success:^(id json) {
//        
//        if ([json[@"status"] isEqualToString:@"y"] ){
//            NSMutableArray *array = [NSMutableArray array];
//            for ( NSDictionary *dic in json[@"data"]) {
//                [array addObject:[SettleModel objectWithKeyValues:dic]];
//            }
//            [self.dataArray addObjectsFromArray:array];
//            
////            [self.refresh finishRefreshingDirection:RefreshDirectionTop];
//            [self.tableView reloadData];
//            self.loadMoreButton.hidden = array.count < self.pageSize;
//        }
//        
//        [self.header endRefreshing];
//    } failure:^(NSError *error) {
//        [self.header endRefreshing];
//    }];
//}

#pragma mark - Table view data source



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settleCell"];
    
    // Configure the cell...
    cell.settleModel = self.dataArray[indexPath.row];
    
    return cell;
}

@end
