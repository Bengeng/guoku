//
//  HeadPictureTableViewCell.m
//  GuoKu
//
//  Created by BEN on 16/5/28.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "HeadPictureTableViewCell.h"

@implementation HeadPictureTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(SCREEN_WIDTH - 70, 20,EVERY_TITLE_WIDTH, EVERY_TITLE_WIDTH);
        imageView.layer.cornerRadius = EVERY_TITLE_WIDTH / 2;
        imageView.clipsToBounds = YES;
        self.headImageView = imageView;
        [self.contentView addSubview:imageView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return  self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
