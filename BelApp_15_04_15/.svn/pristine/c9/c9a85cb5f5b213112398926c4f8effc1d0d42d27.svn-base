//
//  AdView.h
//  AdViewDemo
//
//  Created by Leon on 10/30/14.
//  Copyright (c) 2014 Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BannerAdView;


@protocol AdViewDelegate <NSObject>

@optional
- (void)imageClick:(UIButton *)btn inAdView:(BannerAdView *)adView;

@end

@interface BannerAdView : UIView

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, weak) id<AdViewDelegate> adViewDelegate;

@property (nonatomic, assign, readonly) int currentPage;
@end
