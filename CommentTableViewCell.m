//
//  CommentTableViewCell.m
//  GuoKu
//
//  Created by BEN on 16/6/3.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "CommentTableViewCell.h"
@implementation CommentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
+ (instancetype)commentCellWithTableView: (UITableView *)tableView{
    
    static NSString *cellIdentifer = @"cellIdentifer";
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:nil options:nil] firstObject];
    }
    
    [cell.likeBtn setImage:[UIImage imageNamed:@"thumb"] forState:UIControlStateSelected];
    cell.AvatorImage.layer.cornerRadius = 30.f;
    cell.AvatorImage.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (void)setGood:(goodsDAO *)good{
    
    _good = good;
    
    self.commentCount.text = [NSString stringWithFormat:@"%@人评论",good.content.note.is_selected];
    self.AvatorImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:good.content.note.creator.avatar_small]]];
    self.nickName.text = good.content.note.creator.nickname;
    self.commentCoent.text = good.content.note.content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
