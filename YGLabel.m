//
//  YGLabel.m
//  text
//
//  Created by BEN on 16/4/12.
//  Copyright © 2016年 Ben. All rights reserved.
//

#import "YGLabel.h"
#define  MAXWIDTH  [UIScreen mainScreen].bounds.size.width
@implementation YGLabel
// 根据 传入的text 计算text总宽度
+ (CGFloat)calculateTextWidth:(NSString *)string{
   
    CGRect  rect;
//    UIFont *nameFont=[UIFont fontWithName:@"Helvetica" size:13];
//    size = [string sizeWithFont:nameFont constrainedToSize:CGSizeMake(MAXFLOAT, 44)];
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
    rect = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attribute context:nil];
    return  rect.size.width;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ( self=[super initWithFrame:frame] ) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:15];
        self.textAlignment = NSTextAlignmentCenter;
        self.showColor = NO;
    }
    return self;
}
- (void)setShowColor:(BOOL)showColor{
    if (showColor) {
        self.textColor = BACK_COLOR;

    }else{
        self.textColor = [UIColor grayColor];
    }
}

@end
