//
//  GuideViewController.m
//  BelApp
//
//  Created by 罗成 on 15/4/7.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "GuideViewController.h"
#import "MainViewController.h"

#define kImageNumber 4

@interface GuideViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, weak) AppDelegate *appDelegate;

@end

@implementation GuideViewController

- (AppDelegate *)appDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewH = [UIScreen mainScreen].bounds.size.height;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, viewW, viewH)];
    scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView = scrollView;
    
    [self.view addSubview:self.scrollView];
    
    for (int i = 0; i < kImageNumber; i ++) {
        NSString *imageName = nil;
        if (iPhone4s) {
            imageName = [NSString stringWithFormat:@"640pic_welcom%d.jpg",i+1];
        }else{
            imageName = [NSString stringWithFormat:@"pic_welcom%d.jpg",i+1];
            
        }
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(self.scrollView.frame.size.width * i , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:imageView];
        if (i == 3) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.backgroundColor = [UIColor clearColor];
            btn.frame = CGRectMake(i * self.scrollView.frame.size.width ,viewH / 2, viewW, viewH / 2);
            [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:btn];
            
        }
    }
    
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(kImageNumber *viewW, viewH);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.delegate = self;
    
}

- (void)btnClick{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[kVersionKey];
    [UserDefaults setValue:currentVersion forKey:kVersionKey];
    [UserDefaults synchronize];

    [self curtainRevealViewController:self.appDelegate.mainViewCtrl transitionStyle:RECurtainTransitionHorizontal];
}

@end
