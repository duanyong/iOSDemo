//
//  ViewController.m
//  13-UIStepper
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize uiStepper = uiStepper;
@synthesize uiSegmentedCtl = uiSegmentedCtl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    uiStepper = [[UIStepper alloc] initWithFrame: CGRectMake(100, 100, 80, 40)];
    [uiStepper setTintColor: [UIColor greenColor]];
    [uiStepper setMinimumValue: 0.0];
    [uiStepper setMaximumValue: 100.0];
    
    [uiStepper setValue: 20.0];
    [uiStepper setStepValue: 5.0];
    
    [uiStepper setAutorepeat: YES];
    [uiStepper setContinuous: YES];
    
    [uiStepper addTarget: self action: @selector(updateStepper:) forControlEvents: UIControlEventValueChanged];
    
    
    uiSegmentedCtl = [[UISegmentedControl alloc] initWithFrame: CGRectMake(100, 200, 200, 20)];
    [uiSegmentedCtl setTintColor: [UIColor greenColor]];
    [uiSegmentedCtl setSelectedSegmentTintColor: [UIColor blueColor]];
    [uiSegmentedCtl addTarget: self action: @selector(updateSegmentValue:) forControlEvents: UIControlEventValueChanged];
    
    [uiSegmentedCtl insertSegmentWithTitle: @"0" atIndex: 0 animated: YES];
    [uiSegmentedCtl insertSegmentWithTitle: @"1" atIndex: 1 animated: YES];
    [uiSegmentedCtl insertSegmentWithTitle: @"2" atIndex: 2 animated: YES];
    [uiSegmentedCtl insertSegmentWithTitle: @"3" atIndex: 3 animated: YES];
    [uiSegmentedCtl insertSegmentWithTitle: @"4" atIndex: 4 animated: YES];
    [uiSegmentedCtl setSelectedSegmentIndex: 0];
    
    [[self view] addSubview: uiStepper];
    [[self view] addSubview: uiSegmentedCtl];
}

- (void) updateStepper: (UIStepper *) uiStepper {
    NSLog(@"value's %f", [uiStepper value]);
}

- (void) updateSegmentValue: (UISegmentedControl *) uiSegmentedCtl {
    NSLog(@"value's %ld", [uiSegmentedCtl selectedSegmentIndex]);
}

@end
