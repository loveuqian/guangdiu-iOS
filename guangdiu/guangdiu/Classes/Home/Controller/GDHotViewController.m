//
//  GDHotViewController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/30.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDHotViewController.h"
#import "GDHotModel.h"

#import <AFNetworking.h>
#import <MJRefresh.h>
#import <MJExtension.h>

@interface GDHotViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) NSArray *hotArray;

@end

@implementation GDHotViewController

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNav];
    
    [self loadData];
}

- (void)setupNav
{
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setTitle:@"close" forState:UIControlStateNormal];
    [closeButton sizeToFit];
    [closeButton addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
}

- (void)closeBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadData
{
    GDWeakSelf;
    [self.manager GET:@"http://guangdiu.com/api/gethots.php"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                  weakSelf.hotArray = [GDHotModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
                  [weakSelf.tableView reloadData];
              }
              failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
                  NSLog(@"%@", error);
              }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.hotArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    GDHotModel *model = self.hotArray[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

@end
