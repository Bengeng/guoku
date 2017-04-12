//
//  GoodsViewController.h
//  GuoKu
//
//  Created by BEN on 16/4/28.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGUpgrateSwitch.h"
@interface GoodsViewController : UIViewController
@property (nonatomic, retain)     NSMutableArray   *allGoodsArray;
@property (nonatomic, retain)     UITableView      *goodsTabelView;
@property (nonatomic, retain)     YGUpgrateSwitch  *switchView;
@end
