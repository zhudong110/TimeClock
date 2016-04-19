//
//  ClockNavigationController.m
//  时针练习
//
//  Created by MAC on 16/4/19.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "ClockNavigationController.h"

@interface ClockNavigationController ()

@end

@implementation ClockNavigationController

//第一次使用这个类的时候调用
+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setTintColor:[UIColor redColor]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
