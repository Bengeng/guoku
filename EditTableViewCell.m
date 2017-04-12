//
//  EditTableViewCell.m
//  GuoKu
//
//  Created by BEN on 16/5/26.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "EditTableViewCell.h"
#import "YGLabel.h"
@implementation EditTableViewCell
{
    YGLabel  *ygLabel;
}
- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        ygLabel = [[YGLabel alloc] init];
        ygLabel.textAlignment = NSTextAlignmentRight;
        ygLabel.textColor = [UIColor blackColor];
        ygLabel.frame = CGRectMake(SCREEN_WIDTH - 150 - 40, 0,150, EVERY_TITLE_WIDTH);

        self.rightLabel = ygLabel;
        [self.contentView addSubview:ygLabel];
    }
    return self;
}

- (void)setRightString:(NSString *)rightString{
    ygLabel.text = rightString;
    CGFloat width = [YGLabel calculateTextWidth:rightString];
    ygLabel.frame = CGRectMake(SCREEN_WIDTH - width - 40, 0, width, EVERY_TITLE_WIDTH);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
