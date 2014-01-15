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

/**
 * Initializes a new circular button with a few neat options.
 * @param frame The bounds to build the new button within.
 * @param title The title of the button created.
 * @param tag The tag to initialize the button with.
 * @param selector Fires this selector upon being touched.
 */
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag onTouch:(SEL)selector;

@end
