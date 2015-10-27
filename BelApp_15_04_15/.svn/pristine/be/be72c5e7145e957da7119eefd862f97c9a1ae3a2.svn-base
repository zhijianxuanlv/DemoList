//
//  FooterView.h
//  BelApp
//
//  Created by Leon on 15/4/13.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FooterView;

@protocol FooterViewDelegate <NSObject>

- (void)clickLoadMoreWithFooterView:(FooterView *)footerView;

@end

@interface FooterView : UIView


@property (nonatomic, weak) id<FooterViewDelegate> delegate;

- (void)hasMoreData;
- (void)noMoreData;

@end
