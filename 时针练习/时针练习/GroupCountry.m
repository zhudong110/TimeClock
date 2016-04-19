//
//  GroupCountry.m
//  时针练习
//
//  Created by MAC on 16/4/19.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "GroupCountry.h"

@implementation GroupCountry
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)groupCountryWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
+ (NSArray *)groupCountries{
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"groupCountries.plist" ofType:nil]];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arrM addObject:[GroupCountry groupCountryWithDict:obj]];
    }];
    return arrM.copy;
}
@end
