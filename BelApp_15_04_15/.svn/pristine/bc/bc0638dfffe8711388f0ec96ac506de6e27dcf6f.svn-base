//
//  UIImage+Extension.m
//  OaMobile
//
//  Created by Leon on 14/12/18.
//  Copyright (c) 2014年 苏州中资联. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *) resizeImageWithImageName:(NSString *)imageName
{
    UIImage *normal = [UIImage imageNamed:imageName];
    CGFloat w = normal.size.width * 0.5;
    CGFloat h = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
}

@end
