//
//  ViewController.m
//  SearchBarController
//
//  Created by 王永福 on 2018/5/7.
//  Copyright © 2018年 王永福. All rights reserved.
//

#import "ViewController.h"
#import "searchResultView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) searchResultView *resultView;
@property (nonatomic, strong) NSArray *arr;
@end

@implementation ViewController

- (NSArray *)arr
{
    if (!_arr) {
        _arr = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", nil];
    }
    return _arr;
}

- (searchResultView *)resultView
{
    if (!_resultView) {
        
    }
    return _resultView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"搜索框";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"123"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    searchBar.showsCancelButton = NO;
    searchBar.delegate = self;
    [headView addSubview:searchBar];
    
    self.tableView.tableHeaderView = headView;
}

#pragma mark --UITableViewDelegat
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

#pragma make --UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [searchBar setShowsCancelButton:YES animated:YES];
    
    CGRect frame = self.tableView.tableHeaderView.frame;
    self.resultView = [[searchResultView alloc] initWithFrame:CGRectMake(0, frame.size.height + 20, ScreenWidth, ScreenHeight - frame.size.height - 20) withArr:nil];
    self.resultView.alpha = 0;
    [self.view addSubview:self.resultView];
    
    __weak __typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration  animations:^{
        weakSelf.resultView.alpha = 0.8;
    }];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"%@", searchText);
    NSArray *arr = [[NSArray alloc] initWithObjects:searchText, nil];
    [self.resultView updateTableViewData:arr];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [searchBar endEditing:YES];
    [searchBar setShowsCancelButton:NO animated:YES];
    __weak __typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration  animations:^{
        weakSelf.resultView.alpha = 0;
        [weakSelf.resultView removeFromSuperview];
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [searchBar endEditing:YES];
    [searchBar setShowsCancelButton:NO animated:YES];
    __weak __typeof(&*self)weakSelf = self;
    [UIView animateWithDuration:UINavigationControllerHideShowBarDuration  animations:^{
        weakSelf.resultView.alpha = 0;
        [weakSelf.resultView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
