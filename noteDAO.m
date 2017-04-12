//
//  noteDAO.m
//  GuoKu
//
//  Created by 张泉 on 15-11-3.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "noteDAO.h"
#import "creatorDAO.h"
@implementation noteDAO
+ (noteDAO *)parseNoteWithDictionary:(NSDictionary *)dict
{
    noteDAO *__autoreleasing note = [[noteDAO alloc] init] ;
    note.entity_id = [dict objectForKey:@"entity_id"];
    note.post_time = [dict objectForKey:@"post_time"];
    note.user_id = [dict objectForKey:@"user_id"];
    note.is_selected = [dict objectForKey:@"is_selected"];
    note.poke_already = [dict objectForKey:@"poke_already"];
    note.updared_time = [dict objectForKey:@"updated_time"];
    note.content = [dict objectForKey:@"content"];
    note.comment_count = [dict objectForKey:@"comment_count"];
    note.note_id = [dict objectForKey:@"note_id"];
    note.poke_count = [dict objectForKey:@"poke_count"];
    note.created_time = [dict objectForKey:@"created_time"];
    //
    NSDictionary *cretorDict = [dict objectForKey:@"creator"];
    note.creator = [creatorDAO  parseCreatorWithDictionary:cretorDict];
    //
    return note;
    
}

@end
