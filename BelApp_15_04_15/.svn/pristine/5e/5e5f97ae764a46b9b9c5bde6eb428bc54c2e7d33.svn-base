//
//  LCCircleView.m
//  BelApp
//
//  Created by Leon on 15/3/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "LCCircleView.h"

@implementation LCCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

/**
 初始化
 */
- (void)setup
{
    // 设置按钮不可用
    self.userInteractionEnabled = NO;
    
    // 设置默认的背景图片
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
    
    // 设置选中时的背景图片(selected)
    [self setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
    
//    self.backgroundColor = [UIColor blackColor];
    

}

@end
