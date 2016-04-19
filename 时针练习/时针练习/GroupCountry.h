//
//  GroupCountry.h
//  时针练习
//
//  Created by MAC on 16/4/19.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupCountry : NSObject
@property (nonatomic,copy) NSString *header;
@property (nonatomic,strong) NSArray *countries;
+ (instancetype)groupCountryWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (NSArray *)groupCountries;
@end
