//
//  HomePageViewController.m
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "HomePageViewController.h"
#import "YGUpgrateSwitch.h"
#import "GoodsViewController.h"
#import "ArticleViewController.h"
@interface HomePageViewController ()
{
    YGUpgrateSwitch *switchView;
}
@end

@implementation HomePageViewController

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
    
    
    [self initSwitchVC];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
      
}
#pragma mark   初始化 YGUpgrateSwitch
- (void)initSwitchVC
{
    switchView = [[YGUpgrateSwitch alloc] init];
    switchView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT);
    switchView.titleArray = @[@"商品",@"图文"];
    self.goodsVC = [[GoodsViewController alloc] init];
    
    self.articleVC = [[ArticleViewController alloc] init];
//    
//    UIViewController *view1 = [[UIViewController alloc] init];
//    
//    UIViewController *view2 = [[UIViewController alloc] init];
//    UIViewController *view3 = [[UIViewController alloc] init];
//    UIViewController *view4 = [[UIViewController alloc] init];


    
    switchView.childVCArray = @[self.goodsVC,self.articleVC];
    
    [self.view addSubview:switchView];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
