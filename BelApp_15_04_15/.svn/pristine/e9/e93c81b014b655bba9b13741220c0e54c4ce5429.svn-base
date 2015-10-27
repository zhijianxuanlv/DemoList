//
//  InfoViewController.m
//  BelApp
//
//  Created by Leon on 15/3/19.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = [[NSBundle mainBundle]pathForResource:self.htmlName ofType:nil];
    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
}

@end
