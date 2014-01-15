//
//  RootViewController.h
//  Combine
//
//  Created by Matthew Mascioni on 1/13/2014.
//  Copyright (c) 2014 Matthew Mascioni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ResultLabel;

@interface RootViewController : UIViewController

@property (strong, nonatomic) UIView *window;
@property (strong, nonatomic) ResultLabel *result;

/**
 * The scratchpad is used to store numbers added from operator buttons. It should be cleared once a calculation is over.
 */
@property (nonatomic) int scratchpad;

/**
 * This should be set to YES after a number has been added, and we need to reset the result window to add a new number.
 * @warning Without setting this to YES, numbers will append on eachother in the result window.
 */
@property (nonatomic) BOOL shouldReset;

/**
 * This should be set to YES after the user has pressed the equals button, so we can perform further calculations on the current result.
 */
@property (nonatomic) BOOL shouldNotDouble;

@end
