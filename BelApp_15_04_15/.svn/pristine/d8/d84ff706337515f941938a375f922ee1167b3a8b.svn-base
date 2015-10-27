//
//  LCTimeProgressView.m
//  圆形进度条
//
//  Created by 罗成 on 15/3/13.
//  Copyright (c) 2015年 罗成. All rights reserved.
//
// 获得RGB颜色
//#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#import "LCTimeProgressView.h"

@implementation LCTimeProgressView

- (id)initWithFrame:(CGRect)frame {

    if ([super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        [self initUI];
    }

    return self;

}

- (void) initUI {

    UILabel *label = [[UILabel alloc]init];
    label.tag = 99;
    label.font = [UIFont systemFontOfSize:13];
   
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RGBColor(65, 65, 65);
    [self addSubview:label];
    
}

- (void)layoutSubviews {
    UILabel *label = (UILabel *)[self viewWithTag:99];
    CGFloat selfW = CGRectGetWidth(self.frame);
    CGFloat selfH =  CGRectGetHeight(self.frame);
    label.frame = CGRectMake((selfW - 50)/2.0, (selfH - 50)/ 2.0, 50, 50);
}

- (void)setStr:(NSString *)str {
   
    _str = str;
    UILabel *label = (UILabel *)[self viewWithTag:99];
    label.textColor = [UIColor redColor];
    label.text = _str;


}
@end
