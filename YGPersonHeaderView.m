//
//  YGPersonHeaderView.m
//  GuoKu
//
//  Created by BEN on 16/5/20.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "YGPersonHeaderView.h"
#define  headImageWidth   60
#define  headImageHeight  60
@implementation YGPersonHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews{
    
    UIImageView *headView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:self.imgaePath]];
    headView.frame = CGRectMake(20, 20, headImageWidth, headImageHeight);
    headView.layer.cornerRadius = headImageHeight / 2;
    headView.clipsToBounds = YES;
    UILabel *nickName = [[UILabel alloc] initWithFrame:CGRectMake(headImageWidth + 20 , 20, 60, 20)];
    nickName.text = self.nickName;
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [editBtn   setTitle:@"编辑个人资料" forState:UIControlStateNormal];
    [editBtn.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    editBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [editBtn   setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [editBtn addTarget:self action:@selector(enterEdit:) forControlEvents:UIControlEventTouchUpInside];
    editBtn.frame = CGRectMake(headImageWidth + 20, 20, 120, 30);
    
    UIButton *attentionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
    [attentionBtn setTintColor:[UIColor blackColor]];
    [attentionBtn addTarget:self action:@selector(enterAttention:) forControlEvents:UIControlEventTouchUpInside];
    attentionBtn.frame = CGRectMake(headImageHeight + 20, 20 + 30 + 20, 60, 20);
    
    UIButton *fansBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fansBtn setTitle:@"粉丝" forState:UIControlStateNormal];
    [fansBtn setTintColor:[UIColor blackColor]];
    [fansBtn addTarget:self action:@selector(enterFans:) forControlEvents:UIControlEventTouchUpInside];
    fansBtn.frame = CGRectMake(headImageHeight + 40 + 80, 20 + 30 + 20, 60, 20);
    
    [self addSubview:headView];
    [self addSubview:editBtn];
    [self addSubview:attentionBtn];
    [self addSubview:fansBtn];
    
}
- (void)enterEdit:(UIButton *)button{
    
    [self.delegate ygPerson:self didEdit:self.nickName];
}
- (void)enterAttention:(UIButton *)button{
    [self.delegate ygPerson:self didAttention:self.nickName];
    
}
- (void)enterFans:(UIButton *)button{
    [self.delegate ygPerson:self didFans:self.nickName];
}
@end
