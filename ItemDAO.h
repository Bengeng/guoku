//
//  ItemDAO.h
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemDAO : NSObject
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *entity_id;
@property (nonatomic, copy) NSString *foreign_price;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSNumber *price;
@property (nonatomic, copy) NSString *origin_source;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *volume;
@property (nonatomic, copy) NSString *buy_link;
@property (nonatomic, copy) NSString *origin_id;
@property (nonatomic, copy) NSString *id;
+ (ItemDAO *)parseItemWithDictionary:(NSDictionary *)dict;
@end
