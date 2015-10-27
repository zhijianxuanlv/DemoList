//
//  BaseTableViewController.m
//  BelApp
//
//  Created by Leon on 15/3/5.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)hideKeyboard{
    [self.view endEditing:YES];
}

@end
