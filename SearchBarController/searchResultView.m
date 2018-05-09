//
//  searchResultView.m
//  SearchBarController
//
//  Created by 王永福 on 2018/5/7.
//  Copyright © 2018年 王永福. All rights reserved.
//

#import "searchResultView.h"

@interface searchResultView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation searchResultView

- (instancetype)initWithFrame:(CGRect)frame withArr:(NSMutableArray *)tableViewArr
{
    if (self == [super initWithFrame:frame]) {
        self.tableViewArr = [[NSMutableArray alloc] initWithArray:tableViewArr];
        self.backgroundColor = [UIColor blackColor];
        
        [self initTableView];
    }
    return self;
}

- (void)initTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"123"];
    [self addSubview:self.tableView];
    
    if (self.tableViewArr.count <= 0) {
        self.tableView.hidden = YES;
    } else {
        self.tableView.hidden = NO;
    }
}

- (void)updateTableViewData:(NSArray *)tableViewArr;
{
    self.tableViewArr = [[NSMutableArray alloc] init];
    for (id info in tableViewArr) {
        [self.tableViewArr addObject:info];
    }
    self.alpha = 1.0;
    [self.tableView reloadData];
    
    if (self.tableViewArr.count <= 0) {
        self.tableView.hidden = YES;
    } else {
        self.tableView.hidden = NO;
    }
}

#pragma mark -- UITableViewDelegat
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewArr == nil ? 0 : self.tableViewArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = self.tableViewArr[indexPath.row];
    return cell;
}

@end
