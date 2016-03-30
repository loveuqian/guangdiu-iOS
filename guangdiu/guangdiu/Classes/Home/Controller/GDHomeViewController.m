//
//  GDHomeViewController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/29.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDHomeViewController.h"
#import "GDListModel.h"
#import "GDHotViewController.h"
#import "GDNavigationController.h"

#import <AFNetworking.h>
#import <MJRefresh.h>
#import <MJExtension.h>

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
    
    [self loadData];
}

- (void)setupNav
{
    UIButton *hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hotButton setTitle:@"hot" forState:UIControlStateNormal];
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

- (void)loadData
{
    GDWeakSelf;
    
    [self.manager GET:@"http://guangdiu.com/api/getlist.php"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                  weakSelf.listArray = [GDListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                  [weakSelf.tableView reloadData];
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
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
