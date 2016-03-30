//
//  AppDelegate.m
//  guangdiu
//
//  Created by WangShengFeng on 16/3/29.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "AppDelegate.h"
#import "GDTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = [[GDTabBarController alloc] init];
    
    return YES;
}

@end
