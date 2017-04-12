//
//  YGNavigationController.h
//  GuoKu
//
//  Created by BEN on 16/5/25.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGNavigationController : UIViewController
@property (nonatomic, copy) NSString *navigationTitle;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) BOOL  showSaveButton;

@end
@protocol YGNavigationDelegate <NSObject>
@required
- (void)ygPerson:(YGNavigationController *)ygPerson  backToBefore:(NSString *)backTitle;
@optional
- (void)ygPerson:(YGNavigationController *)ygPerson  saveButton:(NSString *)backTitle;
@end