//
//  MyInvestController.m
//  BelApp
//
//  Created by Leon on 15/3/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "MyInvestController.h"
#import "InvestModel.h"
#import "InvestCell.h"

@interface MyInvestController ()

@end

@implementation MyInvestController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self refreshData];
}

- (void)loadNewData{
    self.pageNo = 1;
    NSDictionary *param = @{@"login_id":[AccountUtil account].userinfo.login_id,
                            @"page_no":@(self.pageNo),
                            @"page_size":@(self.pageSize),
                            @"type":@(self.type)};
    
    [HttpRequest postWithURL:@"invest/my_invest.html" params:param success:^(id json) {
        LCLog(@"--> %@", json);
        if ([[json valueForKey:@"status"] isEqualToString:@"y"])
        {
            [self.dataArray removeAllObjects];
            NSArray *array =[InvestModel objectArrayWithKeyValuesArray:json[@"data"]];
            [array setValue:@(self.type) forKeyPath:@"type"];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
        }  else {
           
        }
         [self.header endRefreshing];
    } failure:^(NSError *error) {
        [self.header endRefreshing];
        LCLog(@"--> %@",error);
    }];

}



- (void)loadMoreData {
    self.pageNo ++;
    NSDictionary *param = @{@"login_id":[AccountUtil account].userinfo.login_id,
                            @"page_no":@(self.pageNo),
                            @"page_size":@(self.pageSize),
                            @"type":@(self.type)};
    
    [HttpRequest postWithURL:@"invest/my_invest.html" params:param success:^(id json) {
        LCLog(@"--> %@", json);
        if ([[json valueForKey:@"status"] isEqualToString:@"y"])
        {
            NSArray *array =[InvestModel objectArrayWithKeyValuesArray:json[@"data"]];
            [array setValue:@(self.type) forKeyPath:@"type"];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];

            self.loadMoreButton.hidden = array.count < self.pageSize;
        }  else {

        }
    } failure:^(NSError *error) {
        LCLog(@"--> %@",error);
    }];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InvestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"investCell"];
    
    cell.investModel = self.dataArray[indexPath.row];
    
    return cell;
}

@end
