//
//  AppDelegate.h
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIViewController *viewController;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *barController;
@end
