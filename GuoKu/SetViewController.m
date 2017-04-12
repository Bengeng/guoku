//
//  SetViewController.m
//  GuoKu
//
//  Created by BEN on 16/5/25.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()<YGNavigationDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView *mainTableView;
    
}
@property (nonatomic, strong)  NSArray  *cellTitleArray;

@end
@implementation SetViewController
- (NSArray *)cellTitleArray
{
    if ( _cellTitleArray == nil ) {
        //.plist 数组里存了字典
        _cellTitleArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setPage_cellTitle.plist" ofType:nil]] ;
    }
    return _cellTitleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"设置";
    self.delegate = self;
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, EVERY_TITLE_WIDTH, SCREEN_WIDTH, EVERY_TITLE_WIDTH * self.cellTitleArray.count + 15) style:UITableViewStylePlain];
    mainTableView.showsVerticalScrollIndicator = NO;
    mainTableView.delegate = self;
    mainTableView.bounces = NO;
    mainTableView.scrollEnabled = NO;
    mainTableView.dataSource = self;
    [mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    [self.view addSubview:mainTableView];
}
#pragma --mark  UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellTitleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = self.cellTitleArray[indexPath.row][@"cell_title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma  --mark YGNavigationDelegate
- (void)ygPerson:(YGNavigationController *)ygPerson backToBefore:(NSString *)backTitle{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
