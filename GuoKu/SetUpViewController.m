//
//  SetUpViewController.m
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "SetUpViewController.h"
#import "YGLabel.h"
#import "YGPersonHeaderView.h"
#import "EditViewController.h"
#import "SetViewController.h"

#define  HeaderViewHeight  100
@interface SetUpViewController ()<UITableViewDelegate,UITableViewDataSource,YGPersonHeaderViewDelegate>
{
    UITableView  *mainTableView;
    UIView       *navigation;
    
}
@end

@implementation SetUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    
    [mainTableView reloadData];
    UIView *subview = [navigation viewWithTag:10];
    
    if (subview) {
        [subview removeFromSuperview];
    }
    NSString *nickNametPath = [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTNICKNAME]  encoding:NSUTF8StringEncoding error:nil];
    NSString *string = nickNametPath;
    CGFloat  centerX = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat  width = [YGLabel calculateTextWidth:string];
    CGFloat  originX = centerX - width / 2;
    YGLabel *navigationText = [[YGLabel alloc] initWithFrame:CGRectMake(originX, 0, width, EVERY_TITLE_WIDTH)];
    navigationText.tag = 10;
    navigationText.textColor = [UIColor blackColor];
    navigationText.text = string;

    [navigation addSubview:navigationText];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, EVERY_TITLE_WIDTH , SCREEN_WIDTH, 150)];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    [mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    [self.view addSubview:mainTableView];
    [self navigationBar];
    
}
#pragma  --mark 导航栏
- (void)navigationBar{
    NSString *nickNametPath = [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTNICKNAME]  encoding:NSUTF8StringEncoding error:nil];
    NSString *string = nickNametPath;
    CGFloat  centerX = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat  width = [YGLabel calculateTextWidth:string];
    CGFloat  originX = centerX - width / 2;
    YGLabel *navigationText = [[YGLabel alloc] initWithFrame:CGRectMake(originX, 0, width, EVERY_TITLE_WIDTH)];
    navigationText.tag = 10;
    navigationText.textColor = [UIColor blackColor];
    navigationText.text = string;
    
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    setBtn.frame =  CGRectMake(SCREEN_WIDTH - 40, 10,20, 20);
    [setBtn setBackgroundImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
    [setBtn  addTarget:self action:@selector(toSetUpPage:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *lineImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"line"]];
    
    lineImage.frame = CGRectMake(0, EVERY_TITLE_WIDTH - 5, SCREEN_WIDTH, 5);
    
    navigation = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, EVERY_TITLE_WIDTH)];
    
    [navigation addSubview:navigationText];
    
    [navigation addSubview:setBtn];
    
    [navigation addSubview:lineImage];
    
    [self.view addSubview:navigation];
}
- (void)toSetUpPage:(UIButton *)button{
    SetViewController *setVC = [[SetViewController alloc] init];
    [self.navigationController pushViewController: setVC animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return HeaderViewHeight;
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//    return 2;
//
//}
//添加表头中的内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerSectionID = @"headerSectionID";
//    UITableViewHeaderFooterView *headerView = [tableView  dequeueReusableHeaderFooterViewWithIdentifier:headerSectionID];
//    
//    if (headerView == nil) {
    
        UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerSectionID];
        YGPersonHeaderView *personHeader = [[YGPersonHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HeaderViewHeight - 5)];
        NSString *imagePath = [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTIMAGE];
        personHeader.imgaePath = imagePath;
        personHeader.delegate = self;
        UIImageView *lineImage = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"line"]];
        lineImage.frame = CGRectMake(0, HeaderViewHeight - 5, SCREEN_WIDTH, 5);
        [headerView.contentView addSubview:personHeader];
        [headerView addSubview:lineImage];
//    }
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    return cell;
}
#pragma  --mark YGPersonHeaderViewDelegate
- (void)ygPerson:(YGPersonHeaderView *)ygPerson  didEdit:(NSString *)editMateria{
    
    EditViewController *editVC = [[EditViewController alloc] init];
    [self.navigationController pushViewController:editVC  animated:YES];
    
    
}
- (void)ygPerson:(YGPersonHeaderView *)ygPerson  didAttention:(NSString *)editMaterial{
    NSLog(@"进入关注页面");
}
- (void)ygPerson:(YGPersonHeaderView *)ygPerson  didFans:(NSString *)editMaterial{
    NSLog(@"进入粉丝页面");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

