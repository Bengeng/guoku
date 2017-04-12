//
//  GoodTableViewCell.m
//  GuoKu
//
//  Created by BEN on 16/6/1.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "GoodTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "YGSandBoxData.h"
@implementation GoodTableViewCell
- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)goodCellWithTableView: (UITableView *)tableView{
    static NSString *cellIdentifer = @"cellIdentifer";
    GoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GoodTableViewCell" owner:nil options:nil] firstObject];
    }
    
    [cell.likeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateSelected];
    cell.likeCount.layer.cornerRadius = 20.f;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

- (IBAction)likeClick:(id)sender {
    
    UIButton  *btn = (UIButton *)sender;
    btn.selected = !btn.selected;
    if (btn.selected) {
        NSNumber *old_likeCount =  self.good.content.entity.like_count;
        int oldLike = [old_likeCount intValue];
        int newLike = oldLike + 1;
        NSString *newStringLike = [NSString stringWithFormat:@"%d",newLike];
        [YGSandBoxData saveString:newStringLike withName:CURRENTLIKECOUNT];

    }
    
//    写入一个代理
//    外面刷新所在的一行数据
//    把新的 赞存入数据库中
}

- (void)setGood:(goodsDAO *)good{
    _good = good;
    [self.chiefImage sd_setImageWithURL:[NSURL URLWithString:good.content.entity.chief_image] placeholderImage:[UIImage imageNamed:@"kuang"]];
    
    self.content.text = good.content.note.content;
    
    self.likeCount.text = [NSString stringWithFormat:@"%@",good.content.entity.like_count];
    

    // 先把赞存入数据库中
    [YGSandBoxData saveString:self.likeCount.text withName:CURRENTLIKECOUNT];
    //
    NSString *likeCountPath = [NSString stringWithContentsOfFile: [NSHOMEDIRECTORY stringByAppendingPathComponent:CURRENTLIKECOUNT]  encoding:NSUTF8StringEncoding error:nil];
    
    if (likeCountPath == nil) {
        
    }
}

@end
