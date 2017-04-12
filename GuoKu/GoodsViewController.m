//
//  GoodsViewController.m
//  GuoKu
//
//  Created by BEN on 16/4/28.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodTableViewCell.h"
#import "goodsDAO.h"
#import "UIImageView+WebCache.h"
#import "SVPullToRefresh.h"
#import "AFNetworking.h"
#import "GuokuHttpRequset.h"
#import "EnterGoodsViewController.h"
@interface GoodsViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.allGoodsArray = [[NSMutableArray alloc] init];
    [self initTabelView];
    [self pullToRefresh];
//    NSLog(@"good = %@",self.view);
    
}
- (void)initTabelView{
    _goodsTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _goodsTabelView.delegate = self;
    _goodsTabelView.backgroundColor = [UIColor grayColor];
    _goodsTabelView.rowHeight = 340;
    _goodsTabelView.dataSource =self;
    [self.view addSubview:_goodsTabelView];
}
#pragma mark -- UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allGoodsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GoodTableViewCell *cell = [GoodTableViewCell goodCellWithTableView:tableView];
    
    goodsDAO *EveryGood = [self.allGoodsArray objectAtIndex:indexPath.row];
    
    cell.good = EveryGood;
    
    return cell;
}
#pragma --mark  点击单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.switchView.navigationBarAnimation = YES;
    //进入商品详情
    
    EnterGoodsViewController *enterGoodsVC = [[EnterGoodsViewController alloc] init];
    
    enterGoodsVC.myGoods = [self.allGoodsArray  objectAtIndex:indexPath.row];
    
    [self presentViewController:enterGoodsVC animated:NO completion:^{
        
    }];
    
}
#pragma --mark  tableView添加下拉和上拉刷新
- (void)pullToRefresh
{
    __weak GoodsViewController *goodsVC = self;
    
    // setup pull-to-refresh
    [goodsVC.goodsTabelView addPullToRefreshWithActionHandler:^{
        [goodsVC  insertRowAtTopWithGoodsVC];
    }];
    
    // setup infinite scrolling
    [goodsVC.goodsTabelView  addInfiniteScrollingWithActionHandler:^{
        [goodsVC insertRowAtBottomWithGoodsVC];
    }];
}
#pragma mark ---下拉刷新 & 上拉刷新
- (void)insertRowAtTopWithGoodsVC {
    
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    //GCD 延迟执行
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.goodsTabelView beginUpdates];
        
        [GuokuHttpRequset sendGoodsRequsetWithCompletionBlock:^(NSMutableArray *array) {
            
            self.allGoodsArray = array;
            
            [self.goodsTabelView reloadData];
            
        }];
        
        [self.goodsTabelView endUpdates];
        
        [self.goodsTabelView.pullToRefreshView stopAnimating];
    });
}
- (void)insertRowAtBottomWithGoodsVC {
    
    int64_t delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.goodsTabelView beginUpdates];
        
        [self.goodsTabelView endUpdates];
        
        [self.goodsTabelView.infiniteScrollingView stopAnimating];
    });
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
