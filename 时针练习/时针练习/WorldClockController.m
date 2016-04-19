//
//  WorldClockController.m
//  时针练习
//
//  Created by MAC on 16/4/17.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "WorldClockController.h"
#import "CountriesNavigationController.h"
#import "CountriesController.h"
#import "Clock.h"

@interface WorldClockController ()<CountriesControllerDelegate>
@property (nonatomic,strong) NSMutableArray *countries;
@property (nonatomic,assign) BOOL edit;
@property (nonatomic,weak) UIBarButtonItem *editBtn;
@property (nonatomic,assign,getter=isAdd) BOOL add;
@end

@implementation WorldClockController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.add = NO;
    self.edit = NO;
    self.title = @"世界时钟";
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnClick)];
    [addBtn setTintColor:[UIColor redColor]];
    self.navigationItem.rightBarButtonItem = addBtn;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = 100;
    
    if (self.countries.count > 0) {
        self.navigationItem.leftBarButtonItem = self.editBtn;
        self.add = YES;
    }
}

- (UIBarButtonItem *)editBtn{
    if (_editBtn == nil) {
        UIBarButtonItem *editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editBtnClick:)];
        _editBtn = editBtn;
    }
    return _editBtn;
}
- (void)editBtnClick:(UIBarButtonItem *)editBtn{
    self.edit = !self.edit;
    if (self.edit == YES) {
        editBtn.title = @"完成";
    }else{
        editBtn.title = @"编辑";
    }
    self.tableView.editing = self.edit;
}

- (void)addBtnClick{
    
    if (self.edit == YES) {
        [self editBtnClick:self.editBtn];
    }
    CountriesController *countriesC = [[CountriesController alloc] initWithStyle:UITableViewStylePlain];
    CountriesNavigationController *countriesNC = [[CountriesNavigationController alloc] initWithRootViewController:countriesC];
    countriesC.delegate = self;
    [self presentViewController:countriesNC animated:YES completion:nil];
}

- (void)countriesControllerDidSelectStr:(NSString *)countryName{
    
    if (!self.isAdd) {
#warning 编辑按钮一开始隐藏
        self.navigationItem.leftBarButtonItem = self.editBtn;
        [self setNeedsStatusBarAppearanceUpdate];
    }
    
    [self.countries addObject:countryName];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.countries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"clock"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"clock"];
    }
    Clock *clock = [[Clock alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    cell.accessoryView = clock;
    NSString *country = self.countries[indexPath.row];
    cell.textLabel.text = country;
    cell.detailTextLabel.text = @"今天";
    return cell;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString *country = cell.textLabel.text;
        [self.countries removeObject:country];
        if (self.countries.count == 0) {
            self.navigationItem.leftBarButtonItems = nil;
            self.add = NO;
        }
        [self.tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }   
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

- (NSMutableArray *)countries{
    if (_countries == nil) {
        _countries = [NSMutableArray array];
    }
    return _countries;
}
@end
