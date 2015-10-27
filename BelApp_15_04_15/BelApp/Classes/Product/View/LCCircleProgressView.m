//
//  LCProgressView.m
//  圆形进度条
//
//  Created by 罗成 on 15/3/13.
//  Copyright (c) 2015年 罗成. All rights reserved.
//

#import "LCCircleProgressView.h"
#import <QuartzCore/QuartzCore.h>


static const CGFloat kBorderWith = 4.0f;
#pragma mark -
#pragma mark LCCircleProgressLayer


@interface LCCircleProgressLayer : CALayer
@property (nonatomic, strong) UIColor *progressTintColor;
@property (nonatomic, strong) UIColor *borderTintColor;
@property (nonatomic) CGFloat progress;

@end
@implementation LCCircleProgressLayer
@dynamic progressTintColor;
@dynamic borderTintColor;

+ (BOOL)needsDisplayForKey:(NSString *)key {

    return [key isEqualToString:@"progress"]?YES :[super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)context {

    CGRect rect = self.bounds;
    CGRect progressRect = rect;
    CGFloat progressRadius = CGRectGetHeight(progressRect) / 2.0f - kBorderWith / 2.0;
    CGContextSetStrokeColorWithColor(context, self.borderTintColor.CGColor);
    [self drawRectangleInContext:context inRext:progressRect withRadius:progressRadius withProgress:1];
    CGContextStrokePath(context);
    CGContextSetStrokeColorWithColor(context, self.progressTintColor.CGColor);
    [self drawRectangleInContext:context inRext:progressRect withRadius:progressRadius withProgress:_progress];
    CGContextStrokePath(context);



}

- (void)drawRectangleInContext:(CGContextRef)context inRext:(CGRect)rect withRadius:(CGFloat)radius withProgress:(CGFloat)progress {

    CGFloat centerX = CGRectGetWidth(rect) *0.5;
    CGFloat centerY = CGRectGetHeight(rect) *0.5;
    CGContextSetLineWidth(context, kBorderWith);
    CGContextAddArc(context, centerX, centerY, CGRectGetHeight(rect) / 2.0f - kBorderWith / 2.0, (CGFloat)-M_PI_2, (CGFloat)(-M_PI_2 +M_PI *2 *progress), 0);

}


@end

#pragma mark -
#pragma mark LCCircleProgressView

@implementation LCCircleProgressView

- (id)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        
        [self initialize];
    }
    return self;

}

- (void)initialize {

    self.backgroundColor = [UIColor clearColor];
    _animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    _animation.duration = 1.0f;
    _animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
}

- (void)didMoveToWindow {

    self.progressLayer.contentsScale = self.window.screen.scale;


}

+ (Class)layerClass {


    return [LCCircleProgressLayer class];


}

- (LCCircleProgressLayer *)progressLayer {


    return (LCCircleProgressLayer *)self.layer;

}

#pragma mark Getters & Setters

- (CGFloat)progress {

    return self.progressLayer.progress;

}

- (void)setProgress:(CGFloat)progress {

    [self setProgress:progress animated:NO];

}

- (void) setProgress:(CGFloat)progress animated:(BOOL)animated {

    [self.progressLayer removeAnimationForKey:@"progress"];
    CGFloat pinnedProgress = progress != 0 ? progress:1.0;
    if (animated) {
        if (self.progress != 1) {
            _animation.fromValue = [NSNumber numberWithFloat:self.progress];
        }else {
        
            _animation.fromValue = [NSNumber numberWithFloat:0.0f];
        
        }
        _animation.toValue = [NSNumber numberWithFloat:pinnedProgress];
        
        [self.progressLayer addAnimation:_animation forKey:@"progress"];
    }else {
        
        [self.progressLayer setNeedsDisplay];
    
    }
    self.progressLayer.progress = pinnedProgress;

}

- (UIColor *)progressTintColor {

    return self.progressLayer.progressTintColor;

}

- (void)setProgressTintColor:(UIColor *)progressTintColor {

    self.progressLayer.progressTintColor = progressTintColor;
    [self.progressLayer setNeedsDisplay];

}




- (UIColor *)borderTintColor {
    
    return self.progressLayer.borderTintColor;

}

- (void)setBorderTintColor:(UIColor *)borderTintColor {
    
    self.progressLayer.borderTintColor = borderTintColor;
    [self.progressLayer setNeedsDisplay];


}


@end
