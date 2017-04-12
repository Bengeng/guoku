//
//  CircleScrollView.h
//  BaseEmaty01
//
//  Created by Ben-IOS on 15-11-11.
//  Copyright (c) 2015年 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YGCircleScrollView;
@protocol YGCircleScrollDelegate <NSObject>
@optional
#pragma mark ---点击图片时才调用的协议方法
- (void)scrollView:(YGCircleScrollView *)scrollView didSelectPageAtImages:(NSInteger)pageInteger;

@end

@interface YGCircleScrollView : UIView<UIScrollViewDelegate>
@property (nonatomic, assign)BOOL   showPageControl;//是否显示pageControl
@property (nonatomic, assign)BOOL   isTimer;//是否开启定时器自动滚动
@property (nonatomic, retain)NSMutableArray *imagesArray;//scrollView的图片数
@property (nonatomic, assign)BOOL   showsHorizontalScrollIndicator;
@property (nonatomic, assign)BOOL   showsVerticalScrollIndicator;
@property (nonatomic, assign) id <YGCircleScrollDelegate>    delegate;

@end

