//
//  TitleButton.m
//  BelApp
//
//  Created by Leon on 15/3/16.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import "TitleButton.h"

@interface TitleButton ()

@property (nonatomic, strong) UIFont *titleFont;

@end

@implementation TitleButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.titleFont = [UIFont systemFontOfSize:20];
    self.titleLabel.font = self.titleFont;
    
    self.imageView.contentMode = UIViewContentModeCenter;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    NSDictionary *attrs = @{NSFontAttributeName:self.titleFont};
    CGFloat titleW = [self.currentTitle sizeWithAttributes:attrs].width;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 20;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}




@end
