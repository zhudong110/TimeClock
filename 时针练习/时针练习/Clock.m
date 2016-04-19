//
//  Clock.m
//  时针练习
//
//  Created by MAC on 16/4/19.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "Clock.h"

@interface Clock ()
@property (nonatomic,strong) CALayer *second;
@property (nonatomic,strong) CALayer *minute;
@property (nonatomic,strong) CALayer *hour;
@end
@implementation Clock
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //绘制图像
        CALayer *clockLayer = [CALayer layer];
        UIImage *clock = [UIImage imageNamed:@"clock"];
        clockLayer.contents = (__bridge id _Nullable)(clock.CGImage);
        clockLayer.frame = frame;
        [self.layer addSublayer:clockLayer];
        
        //秒针
        CALayer *second = [CALayer layer];
        second.position = self.center;
        CGFloat secondWidth = frame.size.width * 0.5;
        CGFloat  secondHeight = secondWidth * 0.05;
        second.bounds = CGRectMake(0, 0, secondWidth, secondHeight);
        second.anchorPoint = CGPointMake(0.15, 0.5);
        second.backgroundColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:second];

        //分针
        CALayer *minute = [CALayer layer];
        minute.position = self.center;
        CGFloat minuteWidth  = frame.size.width * 0.5 * 0.8;
        CGFloat minuteHeight = minuteWidth * 0.05;
        minute.bounds = CGRectMake(0, 0, minuteWidth, minuteHeight);
        minute.anchorPoint = CGPointMake(0.15, 0.5);
        minute.backgroundColor = [UIColor blackColor].CGColor;
        [self.layer addSublayer:minute];
        
        //时针
        CALayer *hour = [CALayer layer];
        hour.position = self.center;
        CGFloat hourWidth = frame.size.width * 0.5 * 0.6;
        CGFloat hourHeight = hourWidth * 0.05;
        hour.bounds = CGRectMake(0, 0, hourWidth, hourHeight);
        hour.anchorPoint = CGPointMake(0.15, 0.5);
        hour.backgroundColor = [UIColor blackColor].CGColor;
        [self.layer addSublayer:hour];
        
        
        self.second = second;
        self.minute = minute;
        self.hour = hour;
        
        [self timeChange];
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
        [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}
- (void)timeChange{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"hh-mm-ss";
    NSString *currentTime = [formatter stringFromDate:date];
    NSArray *times = [currentTime componentsSeparatedByString:@"-"];
    
    CGFloat secondTime = [times[2] floatValue];
    CGFloat minuteTime = [times[1] floatValue];
    CGFloat hourTime = [times[0] floatValue];
    
    CGFloat secondAngle = secondTime * (M_PI * 2 / 60) - M_PI_2;
    CGFloat minuteAngle = minuteTime * (M_PI * 2 / 60) - M_PI_2;
    CGFloat hourAngle = hourTime * (M_PI * 2 / 12) - M_PI_2 ;
    
    self.second.affineTransform = CGAffineTransformMakeRotation(secondAngle);
    self.minute.affineTransform = CGAffineTransformMakeRotation(minuteAngle);
    self.hour.affineTransform = CGAffineTransformMakeRotation(hourAngle);

}
@end
