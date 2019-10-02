//
//  ViewController.h
//  SpinningCoinAnimationDemo
//
//  Created by Ryan David Forsyth on 2019-10-01.
//  Copyright © 2019 Ryan F. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet UIImageView *coinImage;

@property (weak, nonatomic) IBOutlet UIButton *spinButton;

- (IBAction)pressSpin:(id)sender;

@end

