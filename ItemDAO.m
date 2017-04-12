//
//  ItemDAO.m
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "ItemDAO.h"

@implementation ItemDAO
+ (ItemDAO *)parseItemWithDictionary:(NSDictionary *)dict
{
    ItemDAO *__autoreleasing item = [[ItemDAO alloc] init];
    item.status = [dict objectForKey:@"status"];
    item.entity_id = [dict objectForKey:@"entity_id"];
    item.foreign_price = [dict objectForKey:@"foreign_price"];
    item.cid = [dict objectForKey:@"cid"];
    item.price = [dict objectForKey:@"price"];
    item.origin_source = [dict objectForKey:@"origin_source"];
    item.rank = [dict objectForKey:@"rank"];
    item.volume= [dict objectForKey:@"volume"];
    item.buy_link = [dict objectForKey:@"buy_link"];
    item.origin_id = [dict objectForKey:@"origin_id"];
    item.id = [dict objectForKey:@"id"];
    return  item;
}
@end
