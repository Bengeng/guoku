//
//  EnterGoodsViewController.m
//  GuoKu
//
//  Created by BEN on 16/6/2.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "EnterGoodsViewController.h"
#import "YGCircleScrollView.h"
#import "ItemDAO.h"
#import "BuyViewController.h"
#import "CommentTableViewCell.h"
#define  HeaderViewHeight  400
@interface EnterGoodsViewController ()<YGNavigationDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView     *mainTableView;
    NSArray         *imgUrlArray;
    NSMutableArray  *scrollViewImages;
}
@end

@implementation EnterGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"商品";
    self.navigationController.navigationBarHidden = YES;
    self.delegate = self;
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, EVERY_TITLE_WIDTH+20 , SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.rowHeight = 280;
    [self.view addSubview:mainTableView];
  
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HeaderViewHeight;
}

//添加标头中的内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *headerSectionID = @"headerSectionID";
    UITableViewHeaderFooterView *headerView = [tableView  dequeueReusableHeaderFooterViewWithIdentifier:headerSectionID];
    headerView.backgroundColor = [UIColor clearColor];
    if (headerView == nil) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:headerSectionID];
        imgUrlArray =  self.myGoods.content.entity.detail_imagesArr;
        //商品名称
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 320, 60)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = self.myGoods.content.entity.title;
        
        //点赞button
        UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [likeBtn setImage:[UIImage imageNamed:@"expression"] forState:(UIControlStateNormal)];
        [likeBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateSelected];
        [likeBtn addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
        likeBtn.frame = CGRectMake(60, 300, 30, 30);
        //点评button
        UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentBtn setImage:[UIImage imageNamed:@"commment"] forState:(UIControlStateNormal)];
        [commentBtn addTarget:self action:@selector(commentClick:) forControlEvents:UIControlEventTouchUpInside];
        commentBtn.frame = CGRectMake(140, 300, 30, 30);
        //分享button
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setImage:[UIImage imageNamed:@"share"] forState:(UIControlStateNormal)];
        [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
        shareBtn.frame = CGRectMake(220, 300, 30, 30);
        //购买button
        ItemDAO *item = [self.myGoods.content.entity.item_listArr firstObject];
        UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        buyBtn.layer.cornerRadius = 5.f;
        buyBtn.clipsToBounds = YES;
        [buyBtn setBackgroundColor:[UIColor colorWithRed:123.0/255 green:211.0/255 blue:251.0/255 alpha:1]];
        [buyBtn addTarget:self action:@selector(buyClick:) forControlEvents:UIControlEventTouchUpInside];
        [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buyBtn setTitle:[NSString stringWithFormat:@"¥%@ 去购买",item.price] forState:UIControlStateNormal];
        buyBtn.frame = CGRectMake(20, 350, 280, 40);
        headerView.backgroundColor = [UIColor clearColor];
        [headerView addSubview:titleLabel];
        [headerView addSubview:likeBtn];
        [headerView addSubview:shareBtn];
        [headerView addSubview:commentBtn];
        [headerView addSubview:buyBtn];

        if (imgUrlArray.count == 0) {
            
            UIImageView *OnlyImg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
            NSURL *photourl = [NSURL URLWithString:self.myGoods.content.entity.chief_image];
            //url请求实在UI主线程中进行的
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];//通过网络url获取uiimage
            OnlyImg.image = image;
            [headerView addSubview:OnlyImg];
            
        }else{
            scrollViewImages = [[NSMutableArray alloc] init];
            for (int i=0; i<imgUrlArray.count; i++) {
                UIImageView *everyImg=[[UIImageView alloc] init];
                NSURL *photourl = [NSURL URLWithString:imgUrlArray[i]];
                //url请求实在UI主线程中进行的
                UIImage *images = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];//通过网络url获取uiimage
                everyImg.image = images;
                [scrollViewImages addObject:everyImg];
            }
            YGCircleScrollView *CircleScroll = [[YGCircleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
            CircleScroll.imagesArray = scrollViewImages;
            CircleScroll.showPageControl = YES;
            CircleScroll.isTimer = NO;
            [headerView addSubview:CircleScroll];

        }
    }
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.myGoods.content.note.is_selected intValue];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTableViewCell *cell = [CommentTableViewCell commentCellWithTableView:tableView];
    
    cell.good = self.myGoods;
    
    return cell;
}

// YGNavigationDelegate 返回
- (void)ygPerson:(YGNavigationController *)ygPerson  backToBefore:(NSString *)backTitle{
    
    if (self.isNavBack) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
        
    }
  
}
- (void)buyClick:(UIButton *)button{
    BuyViewController *buyVC = [[BuyViewController alloc] init];
    buyVC.myGoods = self.myGoods;
    [self presentViewController:buyVC  animated:YES completion:^{
        }];
    
}
- (void)likeClick:(UIButton *)button{
    button.selected = ! button.selected;
}
- (void)shareClick:(UIButton *)button{
}
- (void)commentClick:(UIButton *)button{
    
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
