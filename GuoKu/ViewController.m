//
//  ViewController.m
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "ViewController.h"
#import "HomePageViewController.h"
#import "SafariViewController.h"
#import "NoticeViewController.h"
#import "SetUpViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    for(NSString *fontfamilyname in [UIFont familyNames])
    //    {
    //        NSLog(@"family:'%@'",fontfamilyname);
    //        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
    //        {
    //            NSLog(@"\tfont:'%@'",fontName);
    //        }
    //        NSLog(@"-------------");
    //    }
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(75,160,300, 50)];
    label.text = @"Live Different ";
    label.textColor = BACK_COLOR;
    UIFont *font = [UIFont fontWithName:@"FultonsHand" size:30];
    label.font = font;
    [self.view addSubview:label];
    //
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 100, 300,75)];
    label1.text = @"果 库 ";
    label1.textColor = BACK_COLOR;
    UIFont *font1 = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:50];
    label1.font = font1;
    [self.view addSubview:label1];
//    UIView *clearView = [[UIView alloc] initWithFrame:self.view.frame];
//    clearView.backgroundColor = [UIColor colorWithRed:206.0/225 green:10.0/225 blue:134.0/225 alpha:01]
//;
//    [self.view addSubview:clearView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:3.0];
    label1.alpha = 0.3;// 动画alpha 从大到小就不对
    [UIView commitAnimations];
//    [self creatTabBarController];
}
-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
//
    self.barController = [[UITabBarController alloc] init];
        HomePageViewController *c1 = [[HomePageViewController alloc]init];
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:c1];
    
        nav1.navigationBarHidden = YES;
        c1.tabBarItem.title = @"首页";
        c1.tabBarItem.image = [UIImage imageNamed:@"star"];
    
        SafariViewController *c2=[[SafariViewController alloc]init];
        c2.tabBarItem.title = @"商品";
        c2.tabBarItem.image = [UIImage imageNamed:@"search"];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:c2];
    
    
        NoticeViewController *c3=[[NoticeViewController alloc]init];
        c3.tabBarItem.title = @"图文";
        c3.tabBarItem.image = [UIImage imageNamed:@"notice"];
    
        SetUpViewController *c4=[[SetUpViewController alloc]init];
        c4.tabBarItem.title = @"我的";
        c4.tabBarItem.image = [UIImage imageNamed:@"person"];
        UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:c4];
        
        _barController.viewControllers = @[nav1,nav2,c3,nav4];

    [self.navigationController pushViewController:self.barController animated:YES];
}
- (void)creatTabBarController
{
    self.barController = [[UITabBarController alloc] init];
    
    HomePageViewController *c1=[[HomePageViewController alloc]init];
    c1.tabBarItem.title=@"Home";
    
    SafariViewController *c2=[[SafariViewController alloc]init];
    c2.tabBarItem.title=@"Safari";

    NoticeViewController *c3=[[NoticeViewController alloc]init];
    c3.tabBarItem.title=@"Notice";
    
    SetUpViewController *c4=[[SetUpViewController alloc]init];
    c4.tabBarItem.title=@"SetUp";
    
    _barController.viewControllers=@[c1,c2,c3,c4];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
