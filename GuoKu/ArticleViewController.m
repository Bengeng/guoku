//
//  ArticleViewController.m
//  GuoKu
//
//  Created by BEN on 16/4/28.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "ArticleViewController.h"
#import "articleDAO.h"
#import "UIImageView+WebCache.h"
#import "SVPullToRefresh.h"
#import "AFNetworking.h"
#import "GuokuHttpRequset.h"
#import "ArticleTableViewCell.h"
#import "EnterArticleViewsViewController.h"
@interface ArticleViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabelView];
    [self pullToRefresh];
}
- (void)initTabelView{
    
    _articlesTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _articlesTabelView.delegate = self;
    _articlesTabelView.backgroundColor = [UIColor grayColor];
    _articlesTabelView.rowHeight = 350;
    _articlesTabelView.dataSource =self;
    [self.view addSubview:_articlesTabelView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.allArticlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ArticleTableViewCell *cell = [ArticleTableViewCell articleCellWithTableView:tableView];
    
    articleDAO *EveryArticle = [self.allArticlesArray objectAtIndex:indexPath.row];
    
    cell.article = EveryArticle;
    
    return cell;

}
#pragma --mark  点击单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //进入图文详情
    EnterArticleViewsViewController *enterVC = [[EnterArticleViewsViewController alloc] init];
    enterVC.article = [self.allArticlesArray  objectAtIndex:indexPath.row];
    [self presentViewController:enterVC animated:YES completion:^{
        
    }];
    
    
}

#pragma mark-----  tableView添加下拉和上拉刷新
- (void)pullToRefresh
{
    __weak ArticleViewController *articleVC = self;
    
    [articleVC.articlesTabelView addPullToRefreshWithActionHandler:^{
        [articleVC insertRowAtTopWithArticleVC];
    }];
    
    // setup infinite scrolling
    [articleVC.articlesTabelView  addInfiniteScrollingWithActionHandler:^{
        [articleVC insertRowAtBottomWithArticleVC];
    }];
}
#pragma mark ---下拉刷新 & 上拉刷新
- (void)insertRowAtTopWithArticleVC {
    int64_t delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    //GCD 延迟执行
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.articlesTabelView beginUpdates];
        [GuokuHttpRequset sendArticlesRequsetWithCompletionBlock:^(NSMutableArray *array) {
            self.allArticlesArray = array;
            [self.articlesTabelView reloadData];
        }];
        
        [self.articlesTabelView  endUpdates];
        
        [self.articlesTabelView .pullToRefreshView stopAnimating];
    });
}
- (void)insertRowAtBottomWithArticleVC {
    int64_t delayInSeconds = 5.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.articlesTabelView  beginUpdates];
        
        [self.articlesTabelView  endUpdates];
        
        [self.articlesTabelView .infiniteScrollingView stopAnimating];
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
