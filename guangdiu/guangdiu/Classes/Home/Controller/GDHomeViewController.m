//
//  GDHomeViewController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/29.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDHomeViewController.h"
#import "GDListModel.h"
#import "GDListCell.h"
#import "GDHotViewController.h"
#import "GDNavigationController.h"
#import "GDDetailViewController.h"

#import <AFNetworking.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import <UITableView+FDTemplateLayoutCell.h>

@interface GDHomeViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation GDHomeViewController

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
    
    [self setupNav];
    
    [self setupRefresh];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GDListCell class]) bundle:nil]
         forCellReuseIdentifier:@"123"];
}

- (void)setupNav
{
    UIButton *hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hotButton setImage:[UIImage imageNamed:@"hot_icon"] forState:UIControlStateNormal];
    [hotButton sizeToFit];
    [hotButton addTarget:self action:@selector(hotBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:hotButton];
}

- (void)hotBtnClick
{
    GDHotViewController *hotVC = [[GDHotViewController alloc] init];
    GDNavigationController *navVC = [[GDNavigationController alloc] initWithRootViewController:hotVC];
    [self presentViewController:navVC animated:YES completion:nil];
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
    [self.manager GET:@"http://guangdiu.com/api/getlist.php"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                  weakSelf.listArray = [GDListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                  [weakSelf.tableView reloadData];
                  [weakSelf.tableView.mj_header endRefreshing];
                  weakSelf.tableView.mj_footer =
                  [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
              }
              failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                  NSLog(@"%@", error);
              }];
}

- (void)loadMoreData
{
    GDWeakSelf;
    [self.manager GET:@"http://guangdiu.com/api/getlist.php"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                  [weakSelf.listArray
                   addObjectsFromArray:[GDListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]]];
                  [weakSelf.tableView reloadData];
                  [weakSelf.tableView.mj_footer endRefreshing];
              }
              failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                  NSLog(@"%@", error);
              }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"123"
                                    cacheByIndexPath:indexPath
                                       configuration:^(GDListCell *cell) {
                                           cell.model = self.listArray[indexPath.row];
                                       }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GDListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"123"];
    cell.model = self.listArray[indexPath.row];
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    
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
