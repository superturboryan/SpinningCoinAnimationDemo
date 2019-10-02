//
//  ViewController.m
//  SpinningCoinAnimationDemo
//
//  Created by Ryan David Forsyth on 2019-10-01.
//  Copyright © 2019 Ryan F. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property NSNumber *numToDisplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
}

-(void)setupView {
    
    [self hideNumber];
    
    [self.contentView setBackgroundColor:UIColor.blueColor];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    
    [gradient setColors: @[(id)[UIColor colorWithRed:15.0f/255.0f green:12.0f/255.0f blue:41.0f/255.0f alpha:1].CGColor,(id)[UIColor colorWithRed:48.0f/255.0f green:43.0f/255.0f blue:99.0f/255.0f alpha:1].CGColor,(id)[UIColor colorWithRed:36.0f/255.0f green:36.0f/255.0f blue:62.0f/255.0f alpha:1].CGColor]];
    
    [self.contentView.layer insertSublayer:gradient atIndex:0];
    
    self.spinButton.layer.cornerRadius = 5.0f;
}



- (IBAction)pressSpin:(id)sender {
    [self hideNumber];
    [self performSpinAnimation];
}

-(void)performSpinAnimation
{
    float randomSpinCount = roundf((((float)rand() / RAND_MAX) * 4) + 3);
    float randomDuration = (((float)rand() / RAND_MAX) * 0.15) + 0.35;
    
    CATransition* transition = [CATransition animation];
    transition.delegate = self;
    transition.startProgress = 0;
    transition.endProgress = 1.0;
    transition.type = @"flip";
    transition.subtype = @"fromRight";
    transition.duration = randomDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transition.repeatCount = randomSpinCount;

    [self setNumToDisplay:[NSNumber numberWithFloat:randomSpinCount]];

    [self.coinImage.layer addAnimation:transition forKey:@"transition"];
}

-(void)displayNumber:(NSNumber*)number
{
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        NSString *label = [NSString stringWithFormat:@"%@",number];
        [self.numberLabel setAlpha: 1];
        [self.numberLabel setText:label];
    } completion:nil];
    
    [UIView animateWithDuration:0.35 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGAffineTransform bigger = CGAffineTransformMakeScale(1.05, 1.05);
        self.coinImage.transform = bigger;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGAffineTransform normal = CGAffineTransformMakeScale(1, 1);
            self.coinImage.transform = normal;
        } completion:nil];
        
    }];
}

-(void)hideNumber
{
    [self.numberLabel setAlpha:0];
    [self.numberLabel setText:@""];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self displayNumber:self.numToDisplay];
}

@end
