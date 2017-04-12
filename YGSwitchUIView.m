//
//  YGSwitchUIView.m
//  GuoKu
//
//  Created by 张泉 on 15-11-2.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "YGSwitchUIView.h"
@interface YGSwitchUIView ()
{
    int  _currentTag;
}
@end
@implementation YGSwitchUIView
//重写 initWithFrame
- (id)initWithFrame:(CGRect)frame  views:(NSMutableArray *)viewsArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.barView = [[UIImageView alloc] init];//这里只创建不 布局，因为init也会调用次方法，而frame并没有
        //
        self.redBarView = [[UIView alloc] init];
        self.redBarView.backgroundColor = [UIColor colorWithRed:206.0/225 green:10.0/225 blue:134.0/225 alpha:01];
        self.allViews = viewsArray;
        self.showView = [viewsArray objectAtIndex:0];
        [self addSubview:_showView];
        [self.barView addSubview:_redBarView];
    }
    return self;
}

// 布局 addSubview 会触发此方法
- (void)layoutSubviews
{
    _showView.frame = CGRectMake(0, 35, self.frame.size.width, self.frame.size.height - 35);
    _barView.frame = CGRectMake(0, 0, self.frame.size.width, 35);
    _barView.image = [UIImage imageNamed:@"placeholder.jpg"];
    _barView.alpha = 0.8;
    [self addSubview:self.barView];
    NSInteger buttonCount = self.titleArray.count;
    self.buttonWidth = [self.delegate buttonOfWidth];
     //设置红色杠子位置
    CGFloat  space = (self.frame.size.width - _buttonWidth * buttonCount)/(buttonCount + 1);
    self.redBarView.frame = CGRectMake(space * (_currentTag + 1) + _buttonWidth * _currentTag,30, _buttonWidth, 5);
    //
    for (int i = 0; i < buttonCount; i ++) {
        NSString *title = [self.titleArray objectAtIndex:i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button = [[UIButton alloc] init];
        button.tag = i;
        //button.titletext.text 直接赋直无效果，因为默认titletext没有frame
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(space * (i + 1) + _buttonWidth * i, 0, _buttonWidth, 35);
        [self  addSubview:button];
    }
    static int a;
    a++;
    NSLog(@"a = %d",a);
    [self addSubview:_showView];
    [super layoutSubviews];
}
- (void)btnClick:(UIButton *)btn
{
    _showView = [self.allViews objectAtIndex:btn.tag];
    [self addSubview:self.showView];
    _currentTag = btn.tag;
}

//- (void)drawRect:(CGRect)rect
//{
//    NSLog(@"rect %@",NSStringFromCGRect(rect));
//}


@end
