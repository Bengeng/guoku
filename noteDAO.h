//
//  noteDAO.h
//  GuoKu
//
//  Created by 张泉 on 15-11-3.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "creatorDAO.h"
@interface noteDAO : NSObject
@property (nonatomic, copy) NSString *entity_id;
@property (nonatomic, copy) NSString *post_time;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSNumber *is_selected;
@property (nonatomic, copy) NSString *poke_already;
@property (nonatomic, copy) NSString *updared_time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *comment_count;
@property (nonatomic, copy) NSString *note_id;
@property (nonatomic, copy) NSString *poke_count;
@property (nonatomic, copy) NSString *created_time;
//
@property (nonatomic, retain)creatorDAO *creator;
+ (noteDAO *)parseNoteWithDictionary:(NSDictionary *)dict;
@end
