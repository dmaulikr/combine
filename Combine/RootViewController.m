//
//  RootViewController.m
//  Combine
//
//  Created by Matthew Mascioni on 1/13/2014.
//  Copyright (c) 2014 Matthew Mascioni. All rights reserved.
//

#import "RootViewController.h"
#import "ResultLabel.h"
#import "CircularButton.h"
#import "Constants.h"

@interface RootViewController ()

typedef NS_ENUM(NSUInteger, buttons) {
    MMCalculatorOne = 1,
    
};

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildResultWindow];
    [self stormOfButtons];
}

- (void)buildResultWindow {
    UIView *window = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 140)];
    window.backgroundColor = calculatorWindowBlue;
    [self.view addSubview:window];
    
    self.result = [[ResultLabel alloc] initWithFrame:CGRectMake(20, 25, 290, 100)];
    self.result.text = @"0";
    [window addSubview:self.result];
}

- (void)stormOfButtons {
    CircularButton *one = [[CircularButton alloc] initWithFrame:CGRectMake(100, 200, 64, 64)];
    one.tag = 1;
    [one setTitle:@"1" forState:UIControlStateNormal];
    [self.view addSubview:one];
}

@end
