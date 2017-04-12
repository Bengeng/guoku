//
//  ContentDAO.m
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "ContentDAO.h"
#import "noteDAO.h"
#import "entityDAO.h"
@implementation ContentDAO
+ (ContentDAO *)parseContentWithDictionary:(NSDictionary *)dict
{
    ContentDAO *__autoreleasing content = [[ContentDAO alloc] init];
    NSDictionary *noteDict = [dict objectForKey:@"note"];
    content.note = [noteDAO parseNoteWithDictionary:noteDict];
    
    NSDictionary *entityDict = [dict objectForKey:@"entity"];
    content.entity = [entityDAO parseEntityWithDictionary:entityDict];
    return content;
}
@end
