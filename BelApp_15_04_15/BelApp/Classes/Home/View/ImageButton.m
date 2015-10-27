//
//  ImageButton.m
//  BelApp
//
//  Created by Leon on 15/3/6.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "ImageButton.h"
#define kImageButtonImageRatio 0.7

@implementation ImageButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //1 设置图片填充模式为居中
        [self initUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.imageView.contentMode = UIViewContentModeCenter;
    //2 设置标题的大小与对齐方式
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    [self setTitleColor:RGBColor(136, 136, 136) forState:UIControlStateNormal];
//    [self setTitleColor:RGBColor(86, 111, 237) forState:UIControlStateSelected];
}

#pragma mark - 取消按钮高亮
- (void)setHighlighted:(BOOL)highlighted{}

#pragma mark - 重新设置图片的尺寸位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageH = self.frame.size.height * kImageButtonImageRatio;
    CGFloat imageW = self.frame.size.width;
    return  CGRectMake(0, 0, imageW, imageH);
}

#pragma mark - 重新设置标题的尺寸位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = self.frame.size.height * kImageButtonImageRatio;
    CGFloat titleH = self.frame.size.height - titleY - self.frame.size.height * 0.1;
    CGFloat titleW = self.frame.size.width;
    return  CGRectMake(0, titleY, titleW, titleH);
}

@end
