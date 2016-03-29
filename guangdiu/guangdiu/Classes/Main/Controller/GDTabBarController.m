//
//  GDTabBarController.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/29.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "GDTabBarController.h"
#import "GDNavigationController.h"
#import "GDHomeViewController.h"
#import "GDAbroadTableViewController.h"
#import "GDRankTableViewController.h"

@interface GDTabBarController ()

@end

@implementation GDTabBarController

- (void)viewDidLoad
{
    [self setupChildViewController];
    
//    [self setupTabBar];
//    
//    [self setupItems];
}

- (void)setupChildViewController
{
    [self setUpOneChildViewController:[[GDHomeViewController alloc] init]
                                Title:@"首页"
                                image:@"tabicon_home"];
    
    [self setUpOneChildViewController:[[GDAbroadTableViewController alloc] init]
                                Title:@"海淘折扣"
                                image:@"tabicon_abroad"];
    
    [self setUpOneChildViewController:[[GDRankTableViewController alloc] init]
                                Title:@"小时风云榜"
                                image:@"tabicon_rank"];
}

- (void)setUpOneChildViewController:(UIViewController *)vc
                              Title:(NSString *)title
                              image:(NSString *)image
{
    GDNavigationController *navVC = [[GDNavigationController alloc] initWithRootViewController:vc];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    
    [self addChildViewController:navVC];
}

- (void)setupTabBar
{
//    [self setValue:[[XMTabBar alloc] init] forKey:@"tabBar"];
//    
//    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
//    bgView.backgroundColor = [UIColor darkGrayColor];
//    [self.tabBar insertSubview:bgView atIndex:0];
//    [self.tabBar setShadowImage:[[UIImage alloc] init]];
//    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
}

- (void)setupItems
{
//    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
//    normalAttrs[NSForegroundColorAttributeName] = XMCommonLightGrayColor;
//    
//    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSForegroundColorAttributeName] = XMCommonGlodColor;
//    
//    UITabBarItem *item = [UITabBarItem appearance];
//    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
//    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

//- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
//{
//    if ([item.title isEqualToString:@"我"]) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:XMAnimate object:nil];
//    }
//}

@end
