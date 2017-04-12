//
//  YGShowCell.m
//  GuoKu
//
//  Created by 张泉 on 15-11-2.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "YGShowCell.h"

@implementation YGShowCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
        self.mainImageView = imageView;
        UILabel *tilabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.frame.size.width, 40)];
        tilabel.backgroundColor = [UIColor yellowColor];
        self.titleLabel = tilabel;
        UILabel *inlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, self.frame.size.width, 40)];
        self.introduceLabel = inlabel;
        UILabel *timelabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, 280, 60, 20)];
        [self addSubview:inlabel];
        [self addSubview:timelabel];
        [self addSubview:imageView];
        [self addSubview:tilabel];
}
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
