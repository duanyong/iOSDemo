//
//  ViewController.m
//  11-UISwitch
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize uiSWitch = uiSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    uiSwitch = [[UISwitch alloc] init];
    [uiSwitch setFrame:CGRectMake(100, 100, 80, 40)];
    [uiSwitch setOn:YES animated:YES];
    
    [uiSwitch setTintColor:[UIColor orangeColor]];
    [uiSwitch setOnTintColor:[UIColor redColor]];
    [uiSwitch setThumbTintColor:[UIColor blueColor]];

    [uiSwitch addTarget:self action:@selector(switch:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:uiSwitch];
}


- (void) switch: (UISwitch *) sw {
    if ([sw isOn]) {
        NSLog(@"UISwitch value: on");
    } else {
        NSLog(@"UISwitch value: off");
    }
    
}

@end
