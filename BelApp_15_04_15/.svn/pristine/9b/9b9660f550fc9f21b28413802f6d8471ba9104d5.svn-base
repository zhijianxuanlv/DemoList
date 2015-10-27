//
//  FooterView.m
//  BelApp
//
//  Created by Leon on 15/4/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "FooterView.h"

@interface FooterView ()

@property (nonatomic, weak) UIButton *loadMoreBtn;

@end


@implementation FooterView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}

- (void)setup {
    
    UIButton *loadMoreBtn = [[UIButton alloc] init];
    loadMoreBtn.translatesAutoresizingMaskIntoConstraints = NO;
    loadMoreBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    [loadMoreBtn setTitle:@"加载更多" forState:UIControlStateNormal];
    [loadMoreBtn setTitle:@"正在加载" forState:UIControlStateSelected];
    [loadMoreBtn setTitle:@"加载完毕" forState:UIControlStateDisabled];
//    loadMoreBtn.backgroundColor = [UIColor greenColor];
    
    loadMoreBtn.layer.borderColor = [RGBColor(245,61,61) CGColor];
    loadMoreBtn.layer.borderWidth = 1;
    loadMoreBtn.layer.cornerRadius = 5;
    
    [loadMoreBtn setTitleColor:RGBColor(245, 61, 61) forState:UIControlStateNormal];
    [loadMoreBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
    self.loadMoreBtn = loadMoreBtn;
    
    [self addSubview:loadMoreBtn];
    
   
    [loadMoreBtn addTarget:self action:@selector(loadMore) forControlEvents:UIControlEventTouchUpInside];
    
    NSDictionary *views = @{@"loadMoreBtn":loadMoreBtn};
    
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[loadMoreBtn]-10-|"
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[loadMoreBtn]-5-|"
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    
    [self addConstraints:c1];
    [self addConstraints:c2];
    
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

- (void)loadMore {
    if ([self.delegate respondsToSelector:@selector(clickLoadMoreWithFooterView:)]) {
        [self.delegate clickLoadMoreWithFooterView:self];
//        [self loading];
    }
}

- (void)loading{
    self.loadMoreBtn.selected = YES;
}

- (void)noMoreData {
    [self.loadMoreBtn setEnabled:NO];
    self.loadMoreBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

- (void)hasMoreData {
    [self.loadMoreBtn setEnabled:YES];
    self.loadMoreBtn.layer.borderColor = [RGBColor(245, 61, 61) CGColor];
}

@end
