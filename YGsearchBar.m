//
//  SearchBar.m
//  GuoKu
//
//  Created by 张泉 on 15-11-5.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "YGsearchBar.h"
#import <QuartzCore/QuartzCore.h>
//  UISearchBar上的子控件有一个UIView  这个 UIView上又有  UISearchBarBackground   UISearchBarTextField这两个字控件；
@implementation YGsearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}
-(void) layoutSubviews
{
    [super layoutSubviews];
    
    UITextField*   searchField;
    NSArray *subViewArr = self.subviews;
    
    for(int i = 0; i < subViewArr.count ; i++) {
        UIView *viewSub = [subViewArr objectAtIndex:i];
        if ( [viewSub isKindOfClass:[UIView class]] ) {
            NSArray *subSubViewArr = viewSub.subviews;
            for (UIView* view in subSubViewArr) {
                if ([view isKindOfClass:[UITextField class]]) {
                    searchField = (UITextField*)view;
                }
            }
        }
    }
    NSLog(@"searchField = %@",searchField);
    //自定义UISearchBar
    if(searchField) {
        
//        searchField.frame= CGRectMake(5, 4, 310, 36);
        searchField.placeholder = @"输入要查找的关键字";
//        [searchField setBorderStyle:UITextBorderStyleLine];
        
        searchField.layer.borderWidth = 2.0f;
        searchField.layer.borderColor = [[UIColor whiteColor] CGColor];
//        searchField.backgroundColor = [UIColor colorWithRed:130.0/225 green:170.0/225 blue:200.0/225 alpha:0.5];
    
        
       //自己的搜索图标
        NSString *path = [[NSBundle mainBundle] pathForResource:@"icon" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        [iView setFrame:CGRectMake(0.0, 0.0, 20.0, 20.0)];
        searchField.leftView = iView;
        NSLog(@"leftview = %@",searchField.leftView);
    }

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
