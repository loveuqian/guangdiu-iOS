//
//  GDNavigationController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/29.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDNavigationController.h"

@interface GDNavigationController ()

@end

@implementation GDNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count >= 1) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"back" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backButtonClick
{
    [self popViewControllerAnimated:YES];
}

@end
