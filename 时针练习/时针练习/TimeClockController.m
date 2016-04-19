//
//  TimeClockController.m
//  时针练习
//
//  Created by MAC on 16/4/17.
//  Copyright © 2016年 itheima.com. All rights reserved.
//

#import "TimeClockController.h"
#import "AddClockController.h"
#import "AddClockNavigationController.h"

@interface TimeClockController ()
@property (nonatomic,strong) NSMutableArray *clocks;
@property (nonatomic,assign) BOOL edit;
@property (nonatomic,weak) UIBarButtonItem *editBtn;
@end

@implementation TimeClockController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edit = NO;
    self.title = @"闹钟";
    UIBarButtonItem *editBtn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editBtnClick:)];
    [editBtn setTintColor:[UIColor redColor]];
    self.editBtn = editBtn;
    
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnClick)];
    [addBtn setTintColor:[UIColor redColor]];
    self.navigationItem.leftBarButtonItem = editBtn;
    self.navigationItem.rightBarButtonItem = addBtn;
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = 80;
    
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
    AddClockController *addClock = [[AddClockController alloc] init];
    AddClockNavigationController *addClockNavigation = [[AddClockNavigationController alloc] initWithRootViewController:addClock];
//    addClock.delegate = self;
    [self presentViewController:addClockNavigation animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.clocks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeClock"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"timeClock"];
    }
    NSString *timeClock = self.clocks[indexPath.row];
    cell.textLabel.text = timeClock;
    cell.detailTextLabel.text = @"闹钟";
    return cell;
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        NSString *country = cell.textLabel.text;
        [self.clocks removeObject:country];
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

- (NSMutableArray *)clocks{
    if (_clocks == nil) {
        _clocks = [NSMutableArray array];
    }
    return  _clocks;
}
@end
