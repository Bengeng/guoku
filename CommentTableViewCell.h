//
//  CommentTableViewCell.h
//  GuoKu
//
//  Created by BEN on 16/6/3.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "goodsDAO.h"
@interface CommentTableViewCell : UITableViewCell
+ (instancetype)commentCellWithTableView: (UITableView *)tableView;
@property (strong, nonatomic) IBOutlet UILabel *commentCount;
@property (strong, nonatomic) IBOutlet UIImageView *AvatorImage;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *commentCoent;
@property (strong, nonatomic) IBOutlet UIButton *likeBtn;

@property (strong, nonatomic) IBOutlet UIButton *commentBtn;

@property (nonatomic, strong) goodsDAO *good;

@end
