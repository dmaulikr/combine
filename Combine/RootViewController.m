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
    
    UISwipeGestureRecognizer *downRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedDown:)];
    [downRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
    [downRecognizer setNumberOfTouchesRequired:2];
    downRecognizer.delaysTouchesBegan = YES;
    [[self view] addGestureRecognizer:downRecognizer];
    
    UISwipeGestureRecognizer *upRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedUp:)];
    [upRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
    [upRecognizer setNumberOfTouchesRequired:2];
    upRecognizer.delaysTouchesBegan = YES;
    [[self view] addGestureRecognizer:upRecognizer];
    
    [self buildResultWindow];
    [self stormOfButtons];
}

- (void)buildResultWindow {
    self.window = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 140)];
    self.window.backgroundColor = calculatorWindowBlue;
    [self.view addSubview:self.window];
    
    self.result = [[ResultLabel alloc] initWithFrame:CGRectMake(20, 25, 280, 100)];
    self.result.text = @"0";
    [self.window addSubview:self.result];
}

- (void)stormOfButtons {
    
    CGFloat buttonMargin;
    CGFloat buttonSize;
    CGFloat buttonXOffset;
    CGFloat clearXOffset;
    CGFloat clearYOffset;
    
    if ([self isiPhone5]) {
        buttonMargin = 82;
        buttonSize = 72;
        buttonXOffset = 32;
        clearXOffset = 216;
        clearYOffset = 150;
    } else {
        buttonMargin = 70;
        buttonSize = 60;
        buttonXOffset = 20;
        clearXOffset = 250;
        clearYOffset = 175;
    }
    
    CircularButton *clear = [CircularButton buttonWithFrame:CGRectMake(clearXOffset, clearYOffset, 50, 50) andTitle:@"C" andTag:ButtonClear onTouch:@selector(calcButtonPressed:)];
    
    UIView *numberPad = [[UIView alloc] initWithFrame:CGRectMake(20, 160, 300, 500)];
    numberPad.center = self.view.center;
    [numberPad setFrame:CGRectOffset(numberPad.frame, 0, 185)];
    [self.view addSubview:numberPad];
    [self.view addSubview:clear];
    
    CircularButton *nine = [CircularButton buttonWithFrame:CGRectMake(buttonXOffset, 0, buttonSize, buttonSize) andTitle:@"9" andTag:ButtonNine onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:nine];
    
    CircularButton *eight = [CircularButton buttonWithFrame:CGRectOffset(nine.frame, buttonMargin, 0) andTitle:@"8" andTag:ButtonEight onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:eight];
    
    CircularButton *seven = [CircularButton buttonWithFrame:CGRectOffset(eight.frame, buttonMargin, 0) andTitle:@"7" andTag:ButtonSeven onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:seven];
    
    CircularButton *six = [CircularButton buttonWithFrame:CGRectOffset(nine.frame, 0, buttonMargin) andTitle:@"6" andTag:ButtonSix onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:six];
    
    CircularButton *five = [CircularButton buttonWithFrame:CGRectOffset(six.frame, buttonMargin, 0) andTitle:@"5" andTag:ButtonFive onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:five];
    
    CircularButton *four = [CircularButton buttonWithFrame:CGRectOffset(five.frame, buttonMargin, 0) andTitle:@"4" andTag:ButtonFour onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:four];
    
    CircularButton *three = [CircularButton buttonWithFrame:CGRectOffset(six.frame, 0, buttonMargin) andTitle:@"3" andTag:ButtonThree onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:three];
    
    CircularButton *two = [CircularButton buttonWithFrame:CGRectOffset(three.frame, buttonMargin, 0) andTitle:@"2" andTag:ButtonTwo onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:two];
    
    CircularButton *one = [CircularButton buttonWithFrame:CGRectOffset(two.frame, buttonMargin, 0) andTitle:@"1" andTag:ButtonOne onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:one];
    
    CircularButton *zero = [CircularButton buttonWithFrame:CGRectOffset(three.frame, 0, buttonMargin) andTitle:@"0" andTag:ButtonZero onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:zero];
    
    CircularButton *plus = [CircularButton buttonWithFrame:CGRectOffset(zero.frame, buttonMargin, 0) andTitle:@"+" andTag:ButtonAdd onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:plus];
    
    CircularButton *equals = [CircularButton buttonWithFrame:CGRectOffset(plus.frame, buttonMargin, 0) andTitle:@"=" andTag:ButtonEquals onTouch:@selector(calcButtonPressed:)];
    [numberPad addSubview:equals];
    
}

#pragma mark - Switchboard

- (void)calcButtonPressed:(CircularButton *)sender {
    
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
            [self clearCalculator];
            break;
            
        case ButtonAdd:
            // We need to instruct the result label to reset it's text once more numbers are ready to be appended.
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

#pragma mark - Building the Calculator 

- (CircularButton *)addButtonWithFrame:(CGRect)frame andTitle:(NSString *)title andTag:(NSInteger)tag onTouch:(SEL)selector {
    CircularButton *button = [CircularButton buttonWithFrame:frame andTitle:title andTag:tag onTouch:@selector(calcButtonPressed:)];
    return button;
    [self.view addSubview:button];
}

#pragma mark - Calculator Functions

- (void)appendNumber:(int)number {
    if (self.shouldReset) {
        self.result.text = @"";
        self.shouldReset = NO;
    }
    NSString *result = self.result.text;
    NSNumber *n = [NSNumber numberWithInt:number];
    NSString *appended = [result stringByAppendingString:[n stringValue]];
    self.result.text = appended;
}

- (void)addNumber {
    if (!self.shouldNotDouble) {
        NSInteger n = [self.result.text integerValue];
        self.scratchpad += n;
        self.result.text = [NSString stringWithFormat:@"%i", self.scratchpad];
    } else {
        self.shouldNotDouble = NO;
        NSInteger n = [self.result.text integerValue];
        self.scratchpad += n;
    }
}

- (void)timeToCombine {
    CGRect initial = self.result.frame;
    self.scratchpad += [self.result.text intValue];
    [UIView animateWithDuration:0.25 animations:^{
        self.result.alpha = 0;
        self.result.frame = CGRectOffset(self.result.frame, 100, 0);
        self.result.text = [NSString stringWithFormat:@"%i", self.scratchpad];
        self.result.frame = initial;
        self.result.alpha = 1;
    }];
    NSLog(@"Scratchpad after equal: %i", self.scratchpad);
    // Let's let the user add further to the result.
    self.shouldNotDouble = YES;
}

- (void)clearCalculator {
    self.shouldNotDouble = YES;
    self.scratchpad = 0;
    self.result.text = @"0";
}

#pragma mark - Into Darkness or to Light

- (void)swipedDown:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ThemeChanged" object:nil];
    [UIView animateWithDuration:0.2 animations:^{
        self.view.backgroundColor = backgroundDark;
        self.window.backgroundColor = calculatorWindowDark;
    }];
}

- (void)swipedUp:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ThemeChanged" object:nil];
    [UIView animateWithDuration:0.2 animations:^{
        self.view.backgroundColor = backgroundBlue;
        self.window.backgroundColor = calculatorWindowBlue;
    }];
}

#pragma mark - Helpers

- (BOOL)isiPhone5 {
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        return true;
    }
    
    return false;
}



@end
