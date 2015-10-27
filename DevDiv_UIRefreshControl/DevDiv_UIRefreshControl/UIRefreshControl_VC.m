//
//  UIRefreshControl_VC.m
//  DevDiv_UIRefreshControl
//
//  Created by BeyondVincent on 12-6-15.
//  Copyright (c) 2012年 DevDiv. All rights reserved.
//

#import "UIRefreshControl_VC.h"

@interface UIRefreshControl_VC ()

@end


@implementation UIRefreshControl_VC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)RefreshViewControlEventValueChanged
{
    if (self.refreshControl.refreshing) {
        NSLog(@"refreshing");
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"刷新中"];

        [self performSelector:@selector(handleData) withObject:nil afterDelay:2];
    }
}

// 添加UIRefreshControl下拉刷新控件到UITableViewController的view中
-(void)addRefreshViewControl
{
    self.refreshControl = [[UIRefreshControl alloc]init];
//    self.refreshControl.tintColor = [UIColor blueColor];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.refreshControl addTarget:self action:@selector(RefreshViewControlEventValueChanged) forControlEvents:UIControlEventValueChanged];
}

- (void) handleData
{
    NSLog(@"refreshed");
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];

    self.count++;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addRefreshViewControl];

    self.count = 0;
    
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [self.tableView setBackgroundView:tableBg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text =  [NSString stringWithFormat:@"DevDiv.com移动技术开发社区_%d", indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
