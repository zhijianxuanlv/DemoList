//
//  CustomButton.m
//  ButtonDemo
//
//  Created by Leon on 4/13/15.
//  Copyright (c) 2015 苏州中资联. All rights reserved.
//

#import "LCGrayButton.h"

@implementation LCGrayButton

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.disabledColor = [UIColor lightGrayColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.disabledColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        self.backgroundColor = self.normalColor;
    } else {
        //
        self.backgroundColor = self.disabledColor;
    }
}

@end
