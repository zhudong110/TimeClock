//
//  CountriesController.h
//  时针练习
//
//  Created by MAC on 16/4/19.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CountriesControllerDelegate <NSObject>

- (void)countriesControllerDidSelectStr:(NSString *)countryName;

@end
@interface CountriesController : UITableViewController
@property (nonatomic,weak) id<CountriesControllerDelegate> delegate;
@end
