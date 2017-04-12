//
//  entity.m
//  GuoKu
//
//  Created by 张泉 on 15-11-3.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "entityDAO.h"
#import "ItemDAO.h"
@implementation entityDAO : NSObject
+ (entityDAO *)parseEntityWithDictionary:(NSDictionary *)dict
{
    entityDAO *__autoreleasing entity = [[entityDAO alloc] init];
    entity.detail_imagesArr = [NSMutableArray array];
    entity.item_id_listArr = [NSMutableArray array];
    entity.detail_imagesArr = [dict objectForKey:@"detail_images"];
    entity.entity_id = [dict objectForKey:@"entity_id"];
    entity.weight = [dict objectForKey:@"weight"];
    entity.note_count = [dict objectForKey:@"note_count"];
    entity.price = [dict objectForKey:@"price"];
    entity.intro = [dict objectForKey:@"intro"];
    entity.created_time = [dict objectForKey:@"created_time"];
    entity.old_category_id = [dict objectForKey:@"old_category_id"];
    entity.chief_image = [dict objectForKey:@"chief_image"];
    entity.entity_hash = [dict objectForKey:@"entity_hash"];
    entity.novus_time = [dict objectForKey:@"novus_time"];
    entity.title = [dict objectForKey:@"title"];
    entity.mark = [dict objectForKey:@"mark"];
    entity.brand = [dict objectForKey:@"brand"];
    entity.status = [dict objectForKey:@"status"];
    //
    entity.item_listArr = [NSMutableArray array];
    NSMutableArray *itemArray = [dict objectForKey:@"item_list"];
    for (NSDictionary *itemDict in itemArray) {
        ItemDAO *item = [ItemDAO parseItemWithDictionary:itemDict];
        [entity.item_listArr  addObject:item];
    }
    //
    entity.total_score = [dict objectForKey:@"total_score"];
    entity.item_id_listArr = [dict objectForKey:@"item_id_list"];
    entity.like_already = [dict objectForKey:@"like_already"];
    entity.old_root_category_id = [dict objectForKey:@"old_root_category_id"];
    entity.updated_time = [dict objectForKey:@"updated_time"];
    entity.creator_id = [dict objectForKey:@"creator_id"];
    entity.like_count = [dict objectForKey:@"like_count"];
    entity.category_id = [dict objectForKey:@"category_id"];
    return entity;
}
@end

