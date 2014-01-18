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

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag onTouch:(SEL)selector {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:(self.frame.size.width) / 2.571428571];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        UIColor *borderColor = buttonBorder;
        UIColor *textColor = buttonTextColor;
        [self setTag:tag];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:textColor forState:UIControlStateNormal];
        [[self layer] setBorderWidth:(self.frame.size.width) / 26];
        [[self layer] setBorderColor:borderColor.CGColor];
        [[self layer] setCornerRadius:(self.frame.size.width) / 2];
        
        [self addTarget:nil action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+ (CircularButton *)buttonWithFrame:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag onTouch:(SEL)selector {
    return [[CircularButton alloc] initWithFrame:frame andTitle:title andTag:tag onTouch:selector];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor whiteColor];
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundColor = [UIColor clearColor];
    }];
}

@end
