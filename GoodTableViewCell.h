//
//  GoodTableViewCell.h
//  GuoKu
//
//  Created by BEN on 16/6/1.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "goodsDAO.h"

@protocol GoodTabelViewCellDelegate <NSObject>

- (void)reloadCellDataWithTableView: (UITableView *)tableView;

@end
@interface GoodTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *chiefImage;

@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *likeCount;


@property (strong, nonatomic) IBOutlet UIButton *likeButton;


+ (instancetype)goodCellWithTableView: (UITableView *)tableView;
@property (nonatomic, strong) goodsDAO *good;
@end
