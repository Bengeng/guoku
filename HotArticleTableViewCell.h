//
//  HotArticleTableViewCell.h
//  GuoKu
//
//  Created by BEN on 16/6/11.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "articleDAO.h"
@interface HotArticleTableViewCell : UITableViewCell
+ (instancetype)hotArticleCellWithTableView: (UITableView *)tableView;

@property (strong, nonatomic) IBOutlet UIImageView *HotArticleChiefImage;
@property (strong, nonatomic) IBOutlet UILabel *hotArticleTitle;
@property (strong, nonatomic) IBOutlet UILabel *hotArticleContent;

@property (nonatomic, strong) articleDAO *hotArticle;

@end
