//
//  goodsDAO.m
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "goodsDAO.h"
#import "ContentDAO.h"
@implementation goodsDAO
+ (goodsDAO *)parseGoodsWithDictionary:(NSDictionary *)dict
{
    goodsDAO *__autoreleasing goods = [[goodsDAO alloc] init];
    goods.post_time = [dict objectForKey:@"post_time"];
    goods.type = [dict objectForKey:@"type"];
    NSDictionary *contentDict = [dict objectForKey:@"content"];
    goods.content = [ContentDAO parseContentWithDictionary:contentDict];
    return goods;
}
@end
