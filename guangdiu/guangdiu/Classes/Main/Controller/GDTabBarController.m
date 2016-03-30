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
                             TabImage:@"tabicon_home"
                             NavImage:@"navtitle_home"];
    
    [self setUpOneChildViewController:[[GDAbroadTableViewController alloc] init]
                                Title:@"海淘折扣"
                             TabImage:@"tabicon_abroad"
                             NavImage:@"navtitle_abroad"];
    
    [self setUpOneChildViewController:[[GDRankTableViewController alloc] init]
                                Title:@"小时风云榜"
                             TabImage:@"tabicon_rank"
                             NavImage:@"navtitle_rank"];
}

- (void)setUpOneChildViewController:(UIViewController *)vc
                              Title:(NSString *)title
                           TabImage:(NSString *)tabImage
                           NavImage:(NSString *)navImage
{
    GDNavigationController *navVC = [[GDNavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:tabImage];
    UIImageView *navImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:navImage]];
    vc.navigationItem.titleView = navImageView;
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

@end
