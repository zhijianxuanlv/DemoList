//
//  ReceiptListController.m
//  BelApp
//
//  Created by Leon on 15/3/16.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ReceiptListController.h"
#import "ReceiptModel.h"
#import "ReceiptCell.h"

@interface ReceiptListController ()


@end

@implementation ReceiptListController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self refreshData];
}

- (void)loadNewData
{
    self.pageNo = 1;
    NSDictionary *param = @{@"login_id":[AccountUtil account].userinfo.login_id,
                            @"page_no":@(self.pageNo),
                            @"page_size":@(self.pageSize),
                            @"type":@0};
    
    [HttpRequest postWithURL:@"invest/invest_payinfo.html" params:param success:^(id json) {
        
        if ([json[@"status"] isEqualToString:@"y"] ){
            [self.dataArray removeAllObjects];
            NSArray *array = [ReceiptModel objectArrayWithKeyValuesArray:json[@"data"]];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            
            [self.dataArray addObjectsFromArray:array];
            
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
                            @"type":@0};
    
    [HttpRequest postWithURL:@"invest/invest_payinfo.html" params:param success:^(id json) {
        
        if ([json[@"status"] isEqualToString:@"y"] ){
            NSArray *array = [ReceiptModel objectArrayWithKeyValuesArray:json[@"data"]];
            
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

#pragma mark - Table view data source

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReceiptCell *cell = [tableView dequeueReusableCellWithIdentifier:@"receiptCell"];
    
    // Configure the cell...
    cell.receiptModel = self.dataArray[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
