//
//  CircularButton.h
//  Combine
//
//  Created by Matthew Mascioni on 1/13/2014.
//  Copyright (c) 2014 Matthew Mascioni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CircularButton : UIButton

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag onTouch:(SEL)selector;

@end
