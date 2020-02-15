//
//  ViewController.h
//  13-UIStepper
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UIStepper *uiStepper;
    UISegmentedControl *uiSegmentedCtl;
}


@property(retain, nonatomic) UIStepper *uiStepper;
@property(retain, nonatomic) UISegmentedControl *uiSegmentedCtl;

@end

