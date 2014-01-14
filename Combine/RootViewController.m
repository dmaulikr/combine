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
    ButtonZero = 0,
    ButtonOne = 1,
    ButtonTwo = 2,
    ButtonThree = 3,
    ButtonFour = 4,
    ButtonFive = 5,
    ButtonSix = 6,
    ButtonSeven = 7,
    ButtonEight = 8,
    ButtonNine = 9
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
    
    UIView *numberPad = [[UIView alloc] initWithFrame:CGRectMake(20, 160, 300, 500)];
    numberPad.center = self.view.center;
    [numberPad setFrame:CGRectOffset(numberPad.frame, 0, 140)];
    [self.view addSubview:numberPad];
    
    CircularButton *nine = [[CircularButton alloc] initWithFrame:CGRectMake(28, 0, 64, 64)];
    nine.tag = ButtonNine;
    [nine setTitle:@"9" forState:UIControlStateNormal];
    [nine addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:nine];
    
    CircularButton *eight = [[CircularButton alloc] initWithFrame:CGRectOffset(nine.frame, 90, 0)];
    eight.tag = ButtonEight;
    [eight setTitle:@"8" forState:UIControlStateNormal];
    [eight addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:eight];
    
    CircularButton *seven = [[CircularButton alloc] initWithFrame:CGRectOffset(eight.frame, 90, 0)];
    seven.tag = ButtonSeven;
    [seven setTitle:@"7" forState:UIControlStateNormal];
    [seven addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:seven];
    
    CircularButton *six = [[CircularButton alloc] initWithFrame:CGRectOffset(nine.frame, 0, 90)];
    six.tag = ButtonSix;
    [six setTitle:@"6" forState:UIControlStateNormal];
    [six addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:six];
    
    CircularButton *five = [[CircularButton alloc] initWithFrame:CGRectOffset(six.frame, 90, 0)];
    five.tag = ButtonFive;
    [five setTitle:@"5" forState:UIControlStateNormal];
    [five addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:five];
    
    CircularButton *four = [[CircularButton alloc] initWithFrame:CGRectOffset(five.frame, 90, 0)];
    four.tag = ButtonFour;
    [four setTitle:@"4" forState:UIControlStateNormal];
    [four addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:four];
    
    CircularButton *three = [[CircularButton alloc] initWithFrame:CGRectOffset(six.frame, 0, 90)];
    three.tag = ButtonThree;
    [three setTitle:@"3" forState:UIControlStateNormal];
    [three addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:three];
    
    CircularButton *two = [[CircularButton alloc] initWithFrame:CGRectOffset(three.frame, 90, 0)];
    two.tag = ButtonTwo;
    [two setTitle:@"2" forState:UIControlStateNormal];
    [two addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:two];
    
    CircularButton *one = [[CircularButton alloc] initWithFrame:CGRectOffset(two.frame, 90, 0)];
    one.tag = ButtonTwo;
    [one setTitle:@"1" forState:UIControlStateNormal];
    [one addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:one];
}

- (void)calcButtonPressed:(id)sender {
    switch ([sender tag]) {
        case ButtonNine:
            NSLog(@"9");
            break;
            
        case ButtonEight:
            NSLog(@"8");
            break;
            
        case ButtonSeven:
            NSLog(@"7");
            break;
            
        case ButtonSix:
            NSLog(@"6");
            break;
            
        case ButtonFive:
            NSLog(@"5");
            break;
            
        case ButtonFour:
            NSLog(@"4");
            break;
            
        case ButtonThree:
            NSLog(@"3");
            break;
            
        case ButtonTwo:
            NSLog(@"2");
            break;
            
        case ButtonOne:
            NSLog(@"1");
            break;
            
        default:
            break;
    }
}

@end
