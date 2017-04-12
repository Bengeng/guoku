//
//  EnterGoodsViewController.h
//  GuoKu
//
//  Created by BEN on 16/6/2.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "YGNavigationController.h"
#import "goodsDAO.h"
@interface EnterGoodsViewController : YGNavigationController
@property (nonatomic, retain) goodsDAO  *myGoods;
@property (nonatomic, assign) BOOL      isNavBack;
@end
