//
//  HotArticleTableViewCell.m
//  GuoKu
//
//  Created by BEN on 16/6/11.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "HotArticleTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HotArticleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
+ (instancetype)hotArticleCellWithTableView: (UITableView *)tableView{
    static NSString *cellIdentifer = @"cellIdentifer";
    HotArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HotArticleTableViewCell" owner:nil options:nil] firstObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (void)setHotArticle:(articleDAO *)hotArticle{
    
    _hotArticle = hotArticle;
    NSString *completeURLString = [NSString stringWithFormat:@"http://imgcdn.guoku.com/%@",hotArticle.cover];
    [self.HotArticleChiefImage  sd_setImageWithURL:[NSURL URLWithString:completeURLString] placeholderImage:nil];
    self.hotArticleTitle.text = hotArticle.title;
    self.hotArticleContent.text = hotArticle.content;    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
