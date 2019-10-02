//
//  ViewController.m
//  SpinningCoinAnimationDemo
//
//  Created by Ryan David Forsyth on 2019-10-01.
//  Copyright © 2019 Ryan F. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    
    [self.contentView setBackgroundColor:UIColor.blueColor];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    
    [gradient setColors: @[(id)[UIColor colorWithRed:15.0f/255.0f green:12.0f/255.0f blue:41.0f/255.0f alpha:1].CGColor,(id)[UIColor colorWithRed:48.0f/255.0f green:43.0f/255.0f blue:99.0f/255.0f alpha:1].CGColor,(id)[UIColor colorWithRed:36.0f/255.0f green:36.0f/255.0f blue:62.0f/255.0f alpha:1].CGColor]];
    
    
    [self.contentView.layer insertSublayer:gradient atIndex:0];
    
}

- (IBAction)pressSpin:(id)sender {
}
@end
