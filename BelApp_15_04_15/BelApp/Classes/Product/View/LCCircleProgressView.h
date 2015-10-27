//
//  LCProgressView.h
//  圆形进度条
//
//  Created by 罗成 on 15/3/13.
//  Copyright (c) 2015年 罗成. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCCircleProgressView : UIView
@property (nonatomic, strong) UIColor *progressTintColor;
@property (nonatomic, strong) UIColor *borderTintColor;
@property (nonatomic)   CGFloat progress;
@property (nonatomic,strong) CABasicAnimation *animation;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
@end
