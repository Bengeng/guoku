//
//  CircleScrollView.m
//  BaseEmaty01
//
//  Created by Ben-IOS on 15-11-11.
//  Copyright (c) 2015年 Ben. All rights reserved.
//

#import "YGCircleScrollView.h"
#import "MYTapGestureRecognizer.h"
@implementation YGCircleScrollView
{
    UIScrollView *myScrollView;
    UIPageControl *pageControl;
    NSTimer *timer;
    int _speed;
    BOOL isDrag;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myScrollView = [[UIScrollView alloc] init];
        [self addSubview:myScrollView];
        pageControl =[[UIPageControl alloc] init];
        [self addSubview:pageControl];
    }
    return self;
}
- (void)layoutSubviews
{
    myScrollView.frame = self.bounds;
    myScrollView.delegate = self;
    myScrollView.userInteractionEnabled = YES;
    myScrollView.pagingEnabled = YES;
    myScrollView.bounces = NO;
    myScrollView.showsHorizontalScrollIndicator = self.showsHorizontalScrollIndicator;
    myScrollView.showsVerticalScrollIndicator = self.showsVerticalScrollIndicator;
    myScrollView.contentSize= CGSizeMake(self.bounds.size.width*(self.imagesArray.count+2), 1);
    for (int i=0; i<self.imagesArray.count; i++) {
        UIImageView *img = [self.imagesArray objectAtIndex:i];
        img.frame = CGRectMake((i+1)*self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
        img.userInteractionEnabled = YES;
        img.tag=i;
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
        [dict setObject:@(img.tag) forKey:@"pagetag"];
        MYTapGestureRecognizer *tapGesture = [[MYTapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:) userInfo:dict];
        tapGesture.numberOfTapsRequired = 1;
        [img addGestureRecognizer:tapGesture];
        [myScrollView addSubview:img];
    }
    UIImageView *firstImg = [self.imagesArray lastObject];
    UIImageView *first = [[UIImageView alloc] initWithImage:firstImg.image];
    first.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    UIImageView *lastImg = [self.imagesArray firstObject];
    UIImageView *last = [[UIImageView alloc] initWithImage:lastImg.image];
    last.frame = CGRectMake(self.bounds.size.width*(self.imagesArray.count+1), 0, self.bounds.size.width, self.bounds.size.height);
    [myScrollView addSubview:first];
    [myScrollView addSubview:last];
    [myScrollView scrollRectToVisible:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height) animated:NO];
    pageControl.frame = CGRectMake(self.frame.size.width/2-50, self.frame.size.height - 20, 100, 10);
    pageControl.numberOfPages = self.imagesArray.count;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x>self.bounds.size.width*self.imagesArray.count) {
        scrollView.contentOffset=CGPointMake(self.bounds.size.width, 0);
    }
    if (scrollView.contentOffset.x<self.bounds.size.width) {
        scrollView.contentOffset = CGPointMake(self.bounds.size.width*self.imagesArray.count, 0);
    }
    pageControl.currentPage = (scrollView.contentOffset.x-self.bounds.size.width)/self.bounds.size.width;
    isDrag = NO;
    if (self.isTimer) {
        [NSThread detachNewThreadSelector:@selector(creatTimer) toTarget:self withObject:nil];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isDrag =YES;
    [timer invalidate];
    timer  = nil;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == self.bounds.size.width*self.imagesArray.count&&isDrag == NO) {
        [myScrollView scrollRectToVisible:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) animated:NO];
    }
}
#pragma mark  ---creat timer
- (void)creatTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoRolling) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] run];
}
#pragma mark---timer  selector
- (void)autoRolling
{
    _speed = 1;
    static int i;
    i++;
    pageControl.currentPage+=_speed;
    
    if (i%self.imagesArray.count==0)
    {
        pageControl.currentPage=0;
    }
    static int m = 0;
    m ++;
    int n = m % self.imagesArray.count;
    [myScrollView setContentOffset:CGPointMake(self.bounds.size.width * (n+1), 0) animated:YES];
    
}
#pragma mark ---tapAction
- (void)tapAction:(MYTapGestureRecognizer *)tapGesture
{
    NSNumber *number = [tapGesture.userdict objectForKey:@"pagetag"];
    NSInteger a = [number intValue];
    [self.delegate scrollView:myScrollView  didSelectPageAtImages:a];
    
}
- (void)setShowPageControl:(BOOL)isShow
{
    _showPageControl = isShow;
    if (!self.showPageControl) {
        pageControl.hidden = YES;
    }
}
- (void)setIsTimer:(BOOL)isTimer
{
    _isTimer = isTimer;
    if (_isTimer) {
       [NSThread detachNewThreadSelector:@selector(creatTimer) toTarget:self withObject:nil];
    }
}


@end
