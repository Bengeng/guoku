//
//  creator.h
//  GuoKu
//
//  Created by 张泉 on 15-11-3.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface creatorDAO : NSObject
@property (nonatomic, copy) NSString *is_censor;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *avatar_large;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *following_count;
@property (nonatomic, copy) NSString *fan_count;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *avatar_small;
@property (nonatomic, copy) NSString *is_active;
@property (nonatomic, copy) NSString *entity_node_count;
@property (nonatomic, copy) NSString *tag_count;
@property (nonatomic, copy) NSString *website;
@property (nonatomic, copy) NSString *like_count;
@property (nonatomic, copy) NSString *relation;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *email;
+ (creatorDAO *)parseCreatorWithDictionary:(NSDictionary *)dict;

@end
