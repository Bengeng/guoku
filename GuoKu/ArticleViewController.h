//
//  ArticleViewController.h
//  GuoKu
//
//  Created by BEN on 16/4/28.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController
@property (nonatomic, retain)     NSMutableArray *allArticlesArray;
@property (nonatomic, retain)     UITableView *articlesTabelView;
@end
