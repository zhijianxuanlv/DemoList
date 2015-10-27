//
//  LCProgressView.m
//  圆形进度条
//
//  Created by 罗成 on 15/3/13.
//  Copyright (c) 2015年 罗成. All rights reserved.
//

#import "LCProgressView.h"
#define PAADING 1.0
@implementation LCProgressView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
//    self.backgroundColor = RGBColor(245, 61, 61);
    self.tintColor = RGBColor(245, 61, 61);
    self.layer.cornerRadius = self.bounds.size.height / 2.0;
    self.layer.masksToBounds = YES;
    
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated{
//    self.backgroundColor = [UIColor blueColor];
    self.progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    //画圈的进度条
    if (self.progress != 0){
        CGRect frame = self.bounds;
        
        CGFloat lineW = frame.size.height - 2 * PAADING;
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        [self.tintColor set] ;
        
        CGContextSetLineCap(ctx, kCGLineCapRound);
        
        CGContextSetLineWidth(ctx, lineW);
        
        
        CGContextMoveToPoint(ctx , PAADING + lineW / 2 ,frame.size.height/2);
        
        CGFloat pointX =  ( frame.size.width - PAADING * 2 - lineW ) * self.progress ;
        
        if ( pointX < PAADING + lineW / 2){
            pointX = PAADING + lineW / 2;
        } else {
            pointX += lineW;
        }
        
        CGContextAddLineToPoint(ctx ,pointX, frame.size.height/2);
        
        
        CGContextStrokePath(ctx);
    }
}

@end
