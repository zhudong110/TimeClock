//
//  HMTabBarController.m
//  时针练习
//
//  Created by MAC on 16/4/17.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "HMTabBarController.h"
#import "WorldClockController.h"
#import "TimeClockController.h"
#import "SecondClockController.h"
#import "TimerCountController.h"
#import "WorldNavigationController.h"
#import "TimeClockNavigationController.h"
#import "SecondNavigationController.h"
#import "TimerCountNavigationController.h"

#define randomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]

@interface HMTabBarController ()

@end

@implementation HMTabBarController
- (void)viewDidLoad{
    WorldClockController *worldVC = [[WorldClockController alloc] initWithStyle:UITableViewStylePlain];
    worldVC.view.backgroundColor = randomColor;
    WorldNavigationController *worldNC = [[WorldNavigationController alloc] initWithRootViewController:worldVC];
    
    TimeClockController *timeClockC = [[TimeClockController alloc] initWithStyle:UITableViewStylePlain];
    timeClockC.view.backgroundColor = randomColor;
    TimeClockNavigationController *timeNC = [[TimeClockNavigationController alloc] initWithRootViewController:timeClockC];
    
    SecondClockController *secondCC = [[SecondClockController alloc] initWithStyle:UITableViewStylePlain];
    secondCC.view.backgroundColor = randomColor;
    SecondNavigationController *secondNC = [[SecondNavigationController alloc] initWithRootViewController:secondCC];
    
    TimerCountController *timerCC = [[TimerCountController alloc] initWithStyle:UITableViewStylePlain];
    timerCC.view.backgroundColor = randomColor;
    TimerCountNavigationController *timerNC = [[TimerCountNavigationController alloc] initWithRootViewController:timerCC];
    
    [self addChildViewController:worldNC];
    [self addChildViewController:timeNC];
    [self addChildViewController:secondNC];
    [self addChildViewController:timerNC];
}
@end
