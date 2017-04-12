//
//  GoodsCollectionViewCell.h
//  GuoKu
//
//  Created by BEN on 16/6/11.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "goodsDAO.h"
@interface GoodsCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *goodsPrice;

@property (strong, nonatomic) IBOutlet UILabel *goodsName;
@property (strong, nonatomic) IBOutlet UIImageView *goodsChiefImage;

@end
