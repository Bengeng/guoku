//
//  SafariViewController.m
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "SafariViewController.h"
#import "GoodsCollectionViewCell.h"
#import "GuokuHttpRequset.h"
#import "UIImageView+WebCache.h"
#import "EnterGoodsViewController.h"
@interface SafariViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@end

@implementation SafariViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    
    [GuokuHttpRequset sendHotGoodsRequsetWithCompletionBlock:^(NSMutableArray *array) {
        
        self.hotGoodsArr = array;
        // 异步刷新
        [self.collectionView reloadData];
    }];
    
    
    
}
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView registerNib:[UINib nibWithNibName:@"GoodsCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"goods"];
    [self.view addSubview:self.collectionView];
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.hotGoodsArr.count;
    
    
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goods" forIndexPath:indexPath];
    goodsDAO *good = [self.hotGoodsArr objectAtIndex:indexPath.row];
    [cell.goodsChiefImage  sd_setImageWithURL:[NSURL URLWithString:good.content.entity.chief_image] placeholderImage:[UIImage imageNamed:@"kuang"]];
    
    cell.goodsName.text = good.content.entity.title;
    
    cell.goodsPrice.text = [NSString stringWithFormat:@"¥ %@",good.content.entity.price];
    
    
    return cell;
  
}

#pragma mark --UICollectionViewDelegateFlowLayout

////定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 200);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark --UICollectionViewDelegate

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //临时改变个颜色，看好，只是临时改变的。如果要永久改变，可以先改数据源，然后在cellForItemAtIndexPath中控制。（和UITableView差不多吧！O(∩_∩)O~）
//    cell.backgroundColor = BACK_COLOR;
    
    EnterGoodsViewController *enterGoodsVC = [[EnterGoodsViewController alloc] init];
    
    enterGoodsVC.myGoods = [self.hotGoodsArr objectAtIndex:indexPath.item];
    
    enterGoodsVC.isNavBack = YES;
    
    [self.navigationController pushViewController:enterGoodsVC animated:YES];

}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//#pragma mark  ---创建顶部视图
//- (UIView *)creatTableHeaderView
//{
//    UIView  *search = [self creatSearchBar];
//    UIView  *scroller = [self creatScrollerView];
//    UIView *__autoreleasing view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
//    [view addSubview:scroller];
//    [view addSubview:search];
//    return view;
//}
//#pragma mark ---初始化广告牌
//- (UIView *)creatScrollerView
//{
//    UIScrollView *__autoreleasing scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,43, self.view.frame.size.width,120)];
//    scrollerView.backgroundColor = [UIColor orangeColor];
//    scrollerView.contentSize = CGSizeMake(self.view.frame.size.width * 3, 120);
//    scrollerView.delegate = self;
//    scrollerView.pagingEnabled = YES;
//    //    scrollerView.showsHorizontalScrollIndicator = NO;
//    //    scrollerView.showsVerticalScrollIndicator = NO;
//    return scrollerView;
//}
//#pragma mark ---初始化搜索框
//- (UIView *)creatSearchBar
//{
//
//    YGsearchBar *__autoreleasing mySearchBar = [[YGsearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,40)];
//    mySearchBar.delegate = self;
//    return mySearchBar;
//}
//#pragma mark ---点击搜索框的时候调用的方法
//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
//{
//    SearchViewController *searchViewController = [[SearchViewController alloc] init];
//    [self.navigationController pushViewController:searchViewController animated:YES];
//    [searchBar resignFirstResponder];
//    return NO;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
