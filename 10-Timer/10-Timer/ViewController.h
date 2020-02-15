//
//  ViewController.h
//  10-Timer
//
//  Created by duanyong on 2020/2/15.
//  Copyright © 2020 duanyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *timer;
}

// 属性
@property(retain, nonatomic) NSTimer *timer;

@end

