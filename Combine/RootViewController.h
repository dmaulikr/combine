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

@property (strong, nonatomic) ResultLabel *result;
@property (nonatomic) int scratchpad;

@end
