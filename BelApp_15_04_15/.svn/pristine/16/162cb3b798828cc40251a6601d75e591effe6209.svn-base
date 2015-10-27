//
//  UIView+Extension.m
//  OaMobile
//
//  Created by Leon on 14/12/23.
//  Copyright (c) 2014年 苏州中资联. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (UIViewController *) viewController
{
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    return nil;
}

@end
