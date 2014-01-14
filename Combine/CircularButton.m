//
//  CircularButton.m
//  Combine
//
//  Created by Matthew Mascioni on 1/13/2014.
//  Copyright (c) 2014 Matthew Mascioni. All rights reserved.
//

#import "CircularButton.h"

@implementation CircularButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:28.0f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [[self layer] setBorderWidth:2.0f];
        [[self layer] setBorderColor:[UIColor grayColor].CGColor];
        [[self layer] setCornerRadius:32.0f];
    }
    return self;
}

@end
