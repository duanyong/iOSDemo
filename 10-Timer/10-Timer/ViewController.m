//
//  ViewController.m
//  10-Timer
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize timer = timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *start = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    start.frame = CGRectMake(100, 100, 80, 40);
    [start setTitle: @"Start" forState: UIControlStateNormal];
    [start addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];


    UIButton *stop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    stop.frame = CGRectMake(100, 200, 80, 40);
    [stop setTitle: @"Stop" forState: UIControlStateNormal];
    [stop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    
  
    [self.view addSubview:start];
    [self.view addSubview:stop];
}

- (void) pressStart {
    timer = [NSTimer scheduledTimerWithTimeInterval: 1 target:self selector:@selector(updateTimer:) userInfo:@"duanyong" repeats:YES];
}

- (void) pressStop {
    if (timer != nil) {
        [timer invalidate];
    }
}


- (void) updateTimer:(NSTimer *) timer  {
    NSLog(@"1 => %@", timer.userInfo);
}

@end
