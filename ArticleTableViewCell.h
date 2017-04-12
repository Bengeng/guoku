//
//  ArticleTableViewCell.h
//  GuoKu
//
//  Created by BEN on 16/6/5.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "articleDAO.h"
@interface ArticleTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *articleSmall;
+ (instancetype)articleCellWithTableView: (UITableView *)tableView;
@property (nonatomic, strong) articleDAO *article;
@property (strong, nonatomic) IBOutlet UIImageView *creatorAvator;
@property (strong, nonatomic) IBOutlet UILabel *creatNick;



@end
