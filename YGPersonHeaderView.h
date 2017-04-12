//
//  YGPersonHeaderView.h
//  GuoKu
//
//  Created by BEN on 16/5/20.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGPersonHeaderView : UIView
@property (nonatomic, retain) UIImage   *headImage;
@property (nonatomic, copy)   NSString  *nickName;
@property (nonatomic, copy)   NSString  *imgaePath;
@property (nonatomic, weak)   id delegate;
@end

@protocol YGPersonHeaderViewDelegate <NSObject>
@required
- (void)ygPerson:(YGPersonHeaderView *)ygPerson  didEdit:(NSString *)editMaterial;
- (void)ygPerson:(YGPersonHeaderView *)ygPerson  didAttention:(NSString *)editMaterial;
- (void)ygPerson:(YGPersonHeaderView *)ygPerson  didFans:(NSString *)editMaterial;

@end