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
    ButtonNine = 9,
    ButtonClear = 10,
    ButtonAdd = 11,
    ButtonEquals = 12
};

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = backgroundBlue;
    
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
    
    CGFloat buttonMargin = 78;
    
    CircularButton *clear = [[CircularButton alloc] initWithFrame:CGRectMake(215, 150, 50, 50)];
    clear.tag = ButtonClear;
    [clear setTitle:@"C" forState:UIControlStateNormal];
    [clear addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clear];
    
    UIView *numberPad = [[UIView alloc] initWithFrame:CGRectMake(20, 160, 300, 500)];
    numberPad.center = self.view.center;
    [numberPad setFrame:CGRectOffset(numberPad.frame, 0, 185)];
    [self.view addSubview:numberPad];
    
    CircularButton *nine = [[CircularButton alloc] initWithFrame:CGRectMake(40, 0, 64, 64)];
    nine.tag = ButtonNine;
    [nine setTitle:@"9" forState:UIControlStateNormal];
    [nine addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:nine];
    
    CircularButton *eight = [[CircularButton alloc] initWithFrame:CGRectOffset(nine.frame, buttonMargin, 0)];
    eight.tag = ButtonEight;
    [eight setTitle:@"8" forState:UIControlStateNormal];
    [eight addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:eight];
    
    CircularButton *seven = [[CircularButton alloc] initWithFrame:CGRectOffset(eight.frame, buttonMargin, 0)];
    seven.tag = ButtonSeven;
    [seven setTitle:@"7" forState:UIControlStateNormal];
    [seven addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:seven];
    
    CircularButton *six = [[CircularButton alloc] initWithFrame:CGRectOffset(nine.frame, 0, buttonMargin)];
    six.tag = ButtonSix;
    [six setTitle:@"6" forState:UIControlStateNormal];
    [six addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:six];
    
    CircularButton *five = [[CircularButton alloc] initWithFrame:CGRectOffset(six.frame, buttonMargin, 0)];
    five.tag = ButtonFive;
    [five setTitle:@"5" forState:UIControlStateNormal];
    [five addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:five];
    
    CircularButton *four = [[CircularButton alloc] initWithFrame:CGRectOffset(five.frame, buttonMargin, 0)];
    four.tag = ButtonFour;
    [four setTitle:@"4" forState:UIControlStateNormal];
    [four addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:four];
    
    CircularButton *three = [[CircularButton alloc] initWithFrame:CGRectOffset(six.frame, 0, buttonMargin)];
    three.tag = ButtonThree;
    [three setTitle:@"3" forState:UIControlStateNormal];
    [three addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:three];
    
    CircularButton *two = [[CircularButton alloc] initWithFrame:CGRectOffset(three.frame, buttonMargin, 0)];
    two.tag = ButtonTwo;
    [two setTitle:@"2" forState:UIControlStateNormal];
    [two addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:two];
    
    CircularButton *one = [[CircularButton alloc] initWithFrame:CGRectOffset(two.frame, buttonMargin, 0)];
    one.tag = ButtonOne;
    [one setTitle:@"1" forState:UIControlStateNormal];
    [one addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:one];
    
    CircularButton *zero = [[CircularButton alloc] initWithFrame:CGRectOffset(three.frame, 0, buttonMargin)];
    zero.tag = ButtonZero;
    [zero setTitle:@"0" forState:UIControlStateNormal];
    [zero addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:zero];
    
    CircularButton *plus = [[CircularButton alloc] initWithFrame:CGRectOffset(zero.frame, buttonMargin, 0)];
    plus.tag = ButtonAdd;
    [plus setTitle:@"+" forState:UIControlStateNormal];
    [plus addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:plus];
    
    CircularButton *equals = [[CircularButton alloc] initWithFrame:CGRectOffset(plus.frame, buttonMargin, 0)];
    equals.tag = ButtonEquals;
    [equals setTitle:@"=" forState:UIControlStateNormal];
    [equals addTarget:self action:@selector(calcButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [numberPad addSubview:equals];
    
}

- (void)calcButtonPressed:(id)sender {
    
    if ([self.result.text isEqualToString:@"0"]) {
        self.result.text = @"";
    }
    
    switch ([sender tag]) {
        case ButtonNine:
            [self appendNumber:9];
            break;
            
        case ButtonEight:
            [self appendNumber:8];
            break;
            
        case ButtonSeven:
            [self appendNumber:7];
            break;
            
        case ButtonSix:
            [self appendNumber:6];
            break;
            
        case ButtonFive:
            [self appendNumber:5];
            break;
            
        case ButtonFour:
            [self appendNumber:4];
            break;
            
        case ButtonThree:
            [self appendNumber:3];
            break;
            
        case ButtonTwo:
            [self appendNumber:2];
            break;
            
        case ButtonOne:
            [self appendNumber:1];
            break;
            
        case ButtonZero:
            [self appendNumber:0];
            break;
            
        case ButtonClear:
            self.scratchpad = 0;
            self.result.text = @"0";
            break;
            
        case ButtonAdd:
            self.shouldReset = YES;
            [self addNumber];
            break;
            
        case ButtonEquals:
            [self timeToCombine];
            break;
            
        default:
            break;
    }
}

- (void)appendNumber:(int)number {
    if (self.shouldReset) {
        self.result.text = @"";
        NSString *result = self.result.text;
        NSNumber *n = [NSNumber numberWithInt:number];
        NSString *stringVal = [n stringValue];
        NSString *appended = [result stringByAppendingString:stringVal];
        self.result.text = appended;
        self.shouldReset = NO;
    } else {
        NSString *result = self.result.text;
        NSNumber *n = [NSNumber numberWithInt:number];
        NSString *stringVal = [n stringValue];
        NSString *appended = [result stringByAppendingString:stringVal];
        self.result.text = appended;
    }
}

- (void)addNumber {
    if (self.scratchpad != [self.result.text intValue]) {
        NSInteger n = [self.result.text integerValue];
        self.scratchpad = self.scratchpad + n;
        self.result.text = [NSString stringWithFormat:@"%i", self.scratchpad];
    }
    NSLog(@"%i", self.scratchpad);
}

- (void)timeToCombine {
    if (self.scratchpad == [self.result.text intValue]) {
        int i = self.scratchpad * 2;
        self.result.text = [NSString stringWithFormat:@"%i", i];
    } else {
        self.scratchpad += [self.result.text intValue];
        self.result.text = [NSString stringWithFormat:@"%i", self.scratchpad];
    }
}

@end
