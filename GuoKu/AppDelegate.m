//
//  AppDelegate.m
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomePageViewController.h"
#import "SafariViewController.h"
#import "NoticeViewController.h"
#import "SetUpViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    navController.navigationBarHidden = YES;
    self.window.rootViewController = navController;
//    
//    self.barController = [[UITabBarController alloc] init];
//    HomePageViewController *c1 = [[HomePageViewController alloc]init];
//    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
//    
//    nav1.navigationBarHidden = YES;
//    c1.tabBarItem.title = @"首页";
//    c1.tabBarItem.image = [UIImage imageNamed:@"star"];
//    
//    SafariViewController *c2=[[SafariViewController alloc]init];
//    c2.tabBarItem.title = @"商品";
//    c2.tabBarItem.image = [UIImage imageNamed:@"search"];
//    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:c2];
//    
//    
//    NoticeViewController *c3=[[NoticeViewController alloc]init];
//    c3.tabBarItem.title = @"图文";
//    c3.tabBarItem.image = [UIImage imageNamed:@"notice"];
//    
//    SetUpViewController *c4=[[SetUpViewController alloc]init];
//    c4.tabBarItem.title = @"我的";
//    c4.tabBarItem.image = [UIImage imageNamed:@"person"];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:c4];
//    
//    _barController.viewControllers = @[nav1,nav2,c3,nav4];
//    self.window.rootViewController = self.barController;

    
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
