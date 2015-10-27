//
//  ProductRootController.m
//  BelApp
//
//  Created by Leon on 15/3/9.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ProductRootController.h"
#import "AppDelegate.h"
#import "ProductTableViewController.h"

@interface ProductRootController ()

@property (nonatomic,strong) AppDelegate *appDelegate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *titleArray;

@end



@implementation ProductRootController

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!iOS8) {
        self.navigationController.navigationBar.translucent = NO;
    }
    
    self.titleArray = @[@"产品列表",@"债权转让"];
    
    //设置两个视图
    [self setViewControllers:@[[self.storyboard instantiateViewControllerWithIdentifier:@"productTable"], [self.storyboard instantiateViewControllerWithIdentifier:@"zhaiquanTable"]] titles:self.titleArray];
    
    //定义通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(selectIndex:) name:kProductType object:nil];
    
    if (self.appDelegate.productListType == 1) {
        self.segmentedControl.selectedSegmentIndex = 1;
        self.selectedViewControllerIndex = 1;
    }
    
    self.title = self.titleArray[self.segmentedControl.selectedSegmentIndex];
}

- (void)selectIndex:(NSNotification *) notification {
    
    //获取到首页点击按钮的tag值
    NSInteger index = ((UIButton *)notification.object).tag - 1;
    
    if (index != self.selectedViewControllerIndex ) {
        self.segmentedControl.selectedSegmentIndex = index;
        self.selectedViewControllerIndex = index;
    }
    
    //更换标题
    self.title = self.titleArray[self.segmentedControl.selectedSegmentIndex];
}


- (void)segmentedControlSelected:(id)sender{
    [super segmentedControlSelected:sender];
    self.title = self.titleArray[self.segmentedControl.selectedSegmentIndex];
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
