//
//  MyInvestTabBarController.m
//  BelApp
//
//  Created by Leon on 15/3/16.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "MyInvestTabBarController.h"
#import "SINavigationMenuView.h"
#import "MyInvestController.h"

@interface MyInvestTabBarController () <SINavigationMenuDelegate>

@property (nonatomic, weak) SINavigationMenuView *menu;

@end

@implementation MyInvestTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    for (MyInvestController *controller in self.childViewControllers) {
        controller.type = [self.childViewControllers indexOfObject:controller];
    }
    
    if (self.navigationItem) {
        CGRect frame = CGRectMake(0.0, 0.0, 100, self.navigationController.navigationBar.bounds.size.height);
        SINavigationMenuView *menu = [[SINavigationMenuView alloc] initWithFrame:frame title:@"投资中项目"];
        [menu displayMenuInView:self.view];
        menu.items = @[@"投资中项目", @"还款中项目", @"已结清项目", @"出售中债权", @"已出售债权"];
        menu.delegate = self;
        self.navigationItem.titleView = menu;
        self.menu = menu;
    }
}

- (void)didSelectItemAtIndex:(NSUInteger)index
{
    LCLog(@"did selected item at index %d", index);
    
    self.selectedIndex = index;
//    self.type = index;
//    self.pageNumber = 0;
    self.menu.title = self.menu.items[index];
//    [self.dataArray removeAllObjects];
//    [self loadData];
}


@end
