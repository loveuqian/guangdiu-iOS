//
//  GDRankTableViewController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/29.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDRankTableViewController.h"
#import "GDListModel.h"
#import "GDDetailViewController.h"

#import <AFNetworking.h>
#import <MJRefresh.h>
#import <MJExtension.h>

@interface GDRankTableViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation GDRankTableViewController

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (NSMutableArray *)listArray
{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupRefresh];
}

- (void)setupRefresh
{
    self.tableView.mj_header =
    [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadData
{
    GDWeakSelf;
    self.listArray = nil;
    [self.manager GET:@"http://guangdiu.com/api/getranklist.php"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                  weakSelf.listArray = [GDListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                  [weakSelf.tableView reloadData];
                  [weakSelf.tableView.mj_header endRefreshing];
              }
              failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                  NSLog(@"%@", error);
              }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    GDListModel *model = self.listArray[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GDDetailViewController *vc = [[GDDetailViewController alloc] init];
    vc.model = self.listArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
