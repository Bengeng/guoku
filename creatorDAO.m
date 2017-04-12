//
//  creator.m
//  GuoKu
//
//  Created by 张泉 on 15-11-3.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "creatorDAO.h"
#import "creatorDAO.h"
@implementation creatorDAO : NSObject
+ (creatorDAO *)parseCreatorWithDictionary:(NSDictionary *)dict
{
    creatorDAO *__autoreleasing creator = [[creatorDAO alloc] init];
    creator.is_censor = [dict objectForKey:@"is_censor"];
    creator.bio = [dict objectForKey:@"bio"];
    creator.avatar_large = [dict objectForKey:@"avatar_large"];
    creator.user_id = [dict objectForKey:@"user_id"];
    creator.following_count = [dict objectForKey:@"following_count"];
    creator.fan_count = [dict objectForKey:@"fan_count"];
    creator.city = [dict objectForKey:@"city"];
    creator.gender= [dict objectForKey:@"gender"];
    creator.avatar_small = [dict objectForKey:@"avatar_small"];
    creator.is_active = [dict objectForKey:@"is_active"];
    creator.entity_node_count = [dict objectForKey:@"entity_note_count"];
    creator.tag_count = [dict objectForKey:@"tag_count"];
    creator.website = [dict objectForKey:@"website"];
    creator.like_count = [dict objectForKey:@"like_count"];
    creator.relation = [dict objectForKey:@"relation"];
    creator.location = [dict objectForKey:@"location"];
    creator.nickname = [dict objectForKey:@"nickname"];
    creator.email = [dict objectForKey:@"email"];
    return creator;
}
@end
