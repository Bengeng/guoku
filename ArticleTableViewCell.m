//
//  ArticleTableViewCell.m
//  GuoKu
//
//  Created by BEN on 16/6/5.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "ArticleTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ArticleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
+ (instancetype)articleCellWithTableView: (UITableView *)tableView{
    
    static NSString *cellIdentifer = @"cellIdentifer";
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ArticleTableViewCell" owner:nil options:nil] firstObject];
    }
    cell.creatorAvator.layer.cornerRadius = 20.f;
    cell.creatorAvator.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//http://imgcdn.guoku.com/images/0b09dced4025b2452c4654ee78e17370.jpg
//- (void)setArticle:(articleDAO *)article{
//    
//    _article = article;
//    NSString *completeURLString = [NSString stringWithFormat:@"http://imgcdn.guoku.com/%@",article.cover];
//    [self.headImage  sd_setImageWithURL:[NSURL URLWithString:completeURLString] placeholderImage:[UIImage imageNamed:@"kuang"]];
//    self.title.text = article.title;
//    self.articleSmall.text = article.digest;
//    self.creatorAvator.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:article.creator.avatar_small]]];
//    self.creatNick.text = article.creator.nickname;
//
//}
- (void)setArticle:(articleDAO *)article{
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
