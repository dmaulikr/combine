//
//  CircularButton.m
//  Combine
//
//  Created by Matthew Mascioni on 1/13/2014.
//  Copyright (c) 2014 Matthew Mascioni. All rights reserved.
//

#import "CircularButton.h"
#import "Constants.h"

@implementation CircularButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:(self.frame.size.width) / 2.571428571];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        UIColor *borderColor = buttonBorder;
        UIColor *textColor = buttonTextColor;
        [self setTitleColor:textColor forState:UIControlStateNormal];
        [[self layer] setBorderWidth:2.0f];
        [[self layer] setBorderColor:borderColor.CGColor];
        [[self layer] setCornerRadius:(self.frame.size.width) / 2];
    }
    return self;
}

@end
