//
//  ProductTableViewController.m
//  BelApp
//
//  Created by 罗成 on 15/3/7.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ProductTableViewController.h"
#import "ProductModel.h"
#import "ProductCell.h"
#import "ProductDetialController.h"
#import "LCProgressView.h"

@interface ProductTableViewController ()



@end

@implementation ProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)loadNewData
{
    self.pageNo = 1;
    
    NSDictionary *param = @{@"signature":@"",
                            @"pageNo":@(self.pageNo),
                            @"pageSize":@(self.pageSize)};
    
    [HttpRequest postWithURL:@"invest/invest_list.html" params:param success:^(id json) {
        NSString *status = [json objectForKey:@"status"];
        NSString *info = [json objectForKey:@"info"];
        LCLog(@"--%@",json);
        if ([status isEqualToString:@"y"]) {
            [self.dataArray removeAllObjects];
            NSArray *array = [json objectForKey:@"data"];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            
            for (NSDictionary *dic in array) {
                ProductModel *productModel = [[ProductModel alloc]init];
                productModel.title = [dic objectForKey:@"title"];
                productModel.orderId = [dic objectForKey:@"id"];
                productModel.amount  = [dic objectForKey:@"amount"];
                productModel.periods = [dic objectForKey:@"periods"];
                productModel.rate = [dic objectForKey:@"rate"];
                productModel.progress = [dic objectForKey:@"progress"];
                productModel.orderNumber = [dic objectForKey:@"orderNumber"];
                productModel.actualRate = [dic[@"actualRate"] doubleValue];
                productModel.orderTradeStatu =(OrderTradeStatus)[dic[@"orderTradeStatu"] integerValue];
                [self.dataArray addObject:productModel];
                
            }
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
    
    [HttpRequest postWithURL:@"invest/invest_list.html" params:param success:^(id json) {
        NSString *status = [json objectForKey:@"status"];
        NSString *info = [json objectForKey:@"info"];
        LCLog(@"--%@",json);
        if ([status isEqualToString:@"y"]) {
            NSArray *array = [json objectForKey:@"data"];
            if (array.count < self.pageSize) {
                [self noMoreData];
            } else {
                [self needMoreData];
            }
            for (NSDictionary *dic in array) {
                ProductModel *productModel = [[ProductModel alloc]init];
                productModel.title = [dic objectForKey:@"title"];
                productModel.orderId = [dic objectForKey:@"id"];
                productModel.amount  = [dic objectForKey:@"amount"];
                productModel.periods = [dic objectForKey:@"periods"];
                productModel.rate = [dic objectForKey:@"rate"];
                productModel.progress = [dic objectForKey:@"progress"];
                productModel.actualRate = [dic[@"actualRate"] doubleValue];
                productModel.orderTradeStatu =(OrderTradeStatus)[dic[@"orderTradeStatu"] integerValue];
                productModel.orderNumber = [dic objectForKey:@"orderNumber"];
                [self.dataArray addObject:productModel];
                [self.tableView reloadData];
            }
            
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
    
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    cell.productModel = self.dataArray [indexPath.row];
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ProductDetialController *detial = segue.destinationViewController;
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    
    ProductModel *productModel = self.dataArray [path.row];
    detial.productModel = productModel;
}



@end
