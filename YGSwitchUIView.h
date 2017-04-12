//
//  YGSwitchUIView.h
//  GuoKu
//
//  Created by 张泉 on 15-11-2.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YGSwitchUIViewDelegate <NSObject>
@required
- (CGFloat)buttonOfWidth;
@end


@interface YGSwitchUIView : UIView
@property (nonatomic, strong)UIImageView  *barView;
@property (nonatomic, strong)UIView *redBarView;
@property (nonatomic, strong)UIView *showView;
@property (nonatomic, assign)CGFloat   buttonWidth;
@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)NSMutableArray *allViews;
//

@property (nonatomic, weak)  id<YGSwitchUIViewDelegate>  delegate;
- (id)initWithFrame:(CGRect)frame  views:(NSMutableArray *)viewsArray;
@end

