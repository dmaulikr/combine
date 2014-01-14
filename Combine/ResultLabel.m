//
//  ResultLabel.m
//  Combine
//
//  Created by Matthew Mascioni on 1/13/2014.
//  Copyright (c) 2014 Matthew Mascioni. All rights reserved.
//

#import "ResultLabel.h"

@implementation ResultLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:64.0f];
        self.adjustsFontSizeToFitWidth = YES;
        self.minimumScaleFactor = 0.2;
        self.numberOfLines = 1;
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentRight;
    }
    return self;
}

@end
