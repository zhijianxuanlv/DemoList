//
//  LCLockView.h
//  BelApp
//
//  Created by Leon on 15/3/21.
//  Copyright (c) 2015年 苏州中资联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LCLockView;

@protocol LCLockViewDelegate <NSObject>

@optional
- (void)lockView:(LCLockView *)lockView didFinishPath:(NSString *)path;

@end

@interface LCLockView : UIView

@property (nonatomic, weak) IBOutlet id<LCLockViewDelegate> delegate;

- (void) displayError;

- (void) cleanView;

@end
