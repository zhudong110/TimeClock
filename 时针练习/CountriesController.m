//
//  CountriesController.m
//  时针练习
//
//  Created by MAC on 16/4/19.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "CountriesController.h"
#import "GroupCountry.h"

@interface CountriesController ()
@property (nonatomic,strong) NSArray *groupCountries;
@end

@implementation CountriesController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.prompt = @"请选择城市";
#warning 如何添加搜索框？
    UISearchBar *searchB = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 100, 0)];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtnClick)];

    self.navigationItem.rightBarButtonItems = @[cancelBtn];
}
- (void)cancelBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//MARK:右侧索引栏
#warning 如何修改索引栏颜色以及如何实现索引跳转？
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *indexes = [NSMutableArray arrayWithCapacity:self.groupCountries.count];
    [self.groupCountries enumerateObjectsUsingBlock:^(GroupCountry *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [indexes addObject:obj.header];
    }];
    return indexes;
}
//MARK:选中方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupCountry *groupC = self.groupCountries[indexPath.section];
    NSString *country = groupC.countries[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(countriesControllerDidSelectStr:)]) {
        [self.delegate countriesControllerDidSelectStr:country];
    }
    [self dismissViewControllerAnimated:self completion:nil];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    GroupCountry *groupC = self.groupCountries[section];
    return groupC.header;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groupCountries.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GroupCountry *groupC = self.groupCountries[section];
    return groupC.countries.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"groupCountried";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    GroupCountry *groupC = self.groupCountries[indexPath.section];
    NSString *country = groupC.countries[indexPath.row];
    cell.textLabel.text = country;
    return cell;
}


- (NSArray *)groupCountries{
    if (_groupCountries == nil) {
        _groupCountries = [GroupCountry groupCountries];
    }
    return _groupCountries;
}
@end
