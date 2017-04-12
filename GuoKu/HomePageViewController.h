//
//  HomePageViewController.h
//  GuoKu
//
//  Created by 张泉 on 15-10-30.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsViewController.h"
#import "ArticleViewController.h"
@interface HomePageViewController : UIViewController
@property (nonatomic, strong) GoodsViewController *goodsVC;
@property (nonatomic, strong) ArticleViewController *articleVC;
@end
