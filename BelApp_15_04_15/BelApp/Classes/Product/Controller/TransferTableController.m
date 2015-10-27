//
//  CreditAssignmentTableController.m
//  BelApp
//
//  Created by Leon on 15/3/19.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "TransferTableController.h"
#import "TransferModel.h"
#import "TransferCell.h"
#import "TranferDetailController.h"

@interface TransferTableController () <TranferDetailDelegate>

@end

@implementation TransferTableController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadNewData
{
    self.pageNo = 1;
    
    NSDictionary *param = @{@"signature":@"",
                            @"pageNo":@(self.pageNo),
                            @"pageSize":@(self.pageSize)};
    
    [HttpRequest postWithURL:@"transfer/transfer_list.html" params:param success:^(id json) {
        NSString *status = [json objectForKey:@"status"];
        NSString *info = [json objectForKey:@"info"];
        LCLog(@"--%@",json);
        if ([status isEqualToString:@"y"]) {
            [self.dataArray removeAllObjects];
            NSArray *array = [TransferModel objectArrayWithKeyValuesArray:json[@"data"]];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }

            [self.dataArray addObjectsFromArray:array];
        }else {
            [MBProgressHUD showError:info];
        }
        [self.header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        LCLog(@"%@",error);
        [self.header endRefreshing];
    }];
    
}

- (void)loadMoreData {
    
    self.pageNo++;
    
    NSDictionary *param = @{@"signature":@"",
                            @"pageNo":@(self.pageNo),
                            @"pageSize":@(self.pageSize)};
    
    [HttpRequest postWithURL:@"transfer/transfer_list.html" params:param success:^(id json) {
        NSString *status = [json objectForKey:@"status"];
        NSString *info = [json objectForKey:@"info"];
        LCLog(@"--%@",json);
        if ([status isEqualToString:@"y"]) {
            
            NSArray *array = [TransferModel objectArrayWithKeyValuesArray:json[@"data"]];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            
            [self.dataArray addObjectsFromArray:array];
        }else {
            [MBProgressHUD showError:info];
        }
        [self.footer endRefreshing];
    } failure:^(NSError *error) {
        LCLog(@"%@",error);
        [self.footer endRefreshing];
    }];
    
    
    
}


#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TransferCell *cell = [tableView dequeueReusableCellWithIdentifier:@"transferCell"];
    cell.transferModel = self.dataArray [indexPath.row];
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    TranferDetailController *detial = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    detial.delegate = self;
    detial.transferModel = self.dataArray [path.row];
}

- (void)tranferListDelete:(TransferModel *)transferModel {
    [self.dataArray removeObject:transferModel];
    [self.tableView reloadData];
}


@end
