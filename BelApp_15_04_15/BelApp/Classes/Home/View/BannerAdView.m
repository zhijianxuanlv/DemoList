//
//  AdView.m
//  AdViewDemo
//
//  Created by Leon on 10/30/14.
//  Copyright (c) 2014 Leon. All rights reserved.
//

#import "BannerAdView.h"
#import "UIButton+WebCache.h"
//广告轮播间隔
#define ADTimeInterval 15

@interface BannerAdView() <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int page;
@end

@implementation BannerAdView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        [self initUI];
    }
    return  self;
}

- (void)setImageArray:(NSArray *)imageArray{
    [self removeTimer];
    //设置展示数据属性
    _imageArray = imageArray;
    
    //设置页数
    _pageControl.numberOfPages = _imageArray.count;
    _pageControl.currentPage = 0;
    
    _pageControl.enabled = NO;
    
    //添加按钮
    for (int i = 0 ; i < _imageArray.count ; i ++) {
        CGRect btnFrame = CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width,self.bounds.size.height);
        UIButton *btn = [[UIButton alloc] initWithFrame:btnFrame];
        [btn setBackgroundImageWithURL:[NSURL URLWithString:_imageArray[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setAdjustsImageWhenHighlighted:NO];
        btn.tag = i;
        [_scrollView addSubview:btn];
    }
    //设置滚动视图尺寸
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * _imageArray.count, 0);
    
    //添加定时器
    [self addTimer];
    
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self initUI];
    
}


- (void)btnClick:(UIButton *)btn{
    if ([self.adViewDelegate respondsToSelector:@selector(imageClick:inAdView:) ]){
        [self.adViewDelegate imageClick:btn inAdView:self];
    }
}

- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:ADTimeInterval target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextImage
{
    // 1.增加pageControl的页码
    if (self.pageControl.currentPage == _imageArray.count - 1) {
        _page = 0;
    } else {
        _page = self.pageControl.currentPage + 1;
    }
    _currentPage = _page;
    // 2.计算scrollView滚动的位置
    CGFloat offsetX = _page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void) initUI{
    LCLog(@"frame -> %@", NSStringFromCGRect(self.bounds));
    UIScrollView *scorllView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    CGRect rect = CGRectMake(0, self.frame.size.height - 30, self.frame.size.width, 20);
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:rect];
    
    _pageControl = pageControl;

    scorllView.pagingEnabled = YES;
    self.backgroundColor = [UIColor lightGrayColor];
    
    _scrollView = scorllView;
    _scrollView.showsHorizontalScrollIndicator = NO;
    scorllView.delegate = self;
    
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
}

- (void) awakeFromNib{
    [self initUI];
}


#pragma mark - 代理方法
/**
 *  当scrollView正在滚动就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 根据scrollView的滚动位置决定pageControl显示第几页
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
}

/**
 *  开始拖拽的时候调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
}

/**
 *  停止拖拽的时候调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 开启定时器
    [self addTimer];
}

- (void)dealloc{
    [self removeTimer];
}

@end
