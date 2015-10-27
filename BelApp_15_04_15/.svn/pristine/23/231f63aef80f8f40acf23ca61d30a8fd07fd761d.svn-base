//
//  RepaymentPlanViewController.m
//  BelApp
//
//  Created by Danny on 15/3/10.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "RepaymentPlanViewController.h"
#import "RepaymentCell.h"

@interface RepaymentPlanViewController ()
@property (weak, nonatomic) IBOutlet UILabel *controlTotal;
@property (weak, nonatomic) IBOutlet UILabel *principalTotal;
@property (weak, nonatomic) IBOutlet UILabel *interestTotal;

@end

@implementation RepaymentPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
}

-(void)loadData{

    self.controlTotal.text = [NSString stringWithFormat:@"%.2f",self.repaymentModel.controlTotal];
    self.principalTotal.text = [NSString stringWithFormat:@"%.2f",self.repaymentModel.principalTotal];
    self.interestTotal.text = [NSString stringWithFormat:@"%.2f",self.repaymentModel.interestTotal];
    
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.repaymentArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    RepaymentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repaymentCell"];

    cell.repayment = self.repaymentArr[indexPath.row];
    
    return cell;
}


@end
