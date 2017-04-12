//
//  goodsDAO.h
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContentDAO.h"
@interface goodsDAO : NSObject
+ (goodsDAO *)parseGoodsWithDictionary:(NSDictionary *)dict;
@property (nonatomic, copy)NSString *post_time;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, retain)ContentDAO *content;
@end
