//
//  ViewController.m
//  12-SliderBar
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize uiSlider = uiSlider;
@synthesize uiProgressView = uiProgressView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    uiSlider = [[UISlider alloc] init];
    [uiSlider setFrame: CGRectMake(10, 100, 200, 40)];

    [uiSlider setValue: 100.0];
    [uiSlider setMinimumValue: 0.0];
    [uiSlider setMaximumValue: 100.0];
    [uiSlider setMinimumTrackTintColor: [UIColor blueColor]];
    [uiSlider setMaximumTrackTintColor: [UIColor greenColor]];
    [uiSlider addTarget:self action:@selector(updateSlider:) forControlEvents: UIControlEventValueChanged];

    
    uiProgressView = [[UIProgressView alloc] init];
    [uiProgressView setFrame: CGRectMake(10, 200, 200, 40)];
    [uiProgressView setProgressViewStyle: UIProgressViewStyleDefault];
//    [uiProgressView setTintColor: [UIColor orangeColor]];
    [uiProgressView setTrackTintColor: [UIColor greenColor]];
    [uiProgressView setProgressTintColor: [UIColor redColor]];
    
    [uiProgressView setProgress:0.9];

    [[self view] addSubview: uiSlider];
    [[self view] addSubview: uiProgressView];
}


- (void) updateSlider: (UISlider *) uiSlider {
    NSLog(@"value's %f", [uiSlider value]);
}

@end
