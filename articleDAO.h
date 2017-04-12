//
//  article.h
//  GuoKu
//
//  Created by 张泉 on 15-11-5.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "creatorDAO.h"
// articleTags
@interface articleTags : NSObject

@end

// Main
@interface articleDAO: NSObject
+ (articleDAO *)parseArticleWithDictionary:(NSDictionary *)dict;
@property (nonatomic, copy)  NSString  *read_count;
@property (nonatomic, copy)  NSNumber  *pub_time;
@property (nonatomic, copy)  NSString  *showcover;
@property (nonatomic, copy)  NSString  *title;
@property (nonatomic, copy)  NSString  *url;
@property (nonatomic, copy)  NSString *feed_read_count;
@property (nonatomic, copy)  NSString  *cover;
@property (nonatomic, copy)  NSString  *publish;
@property (nonatomic, copy)  NSString  *content;
@property (nonatomic, copy)  NSString  *source;
@property (nonatomic, assign)NSNumber *dig_count;
@property (nonatomic, assign)NSNumber *article_id;
@property (nonatomic, copy)  NSString  *digest;
@property (nonatomic, copy)  NSString  *identity_code;

@property (nonatomic, strong) NSArray  *tags;

@property (nonatomic, strong) creatorDAO *creator;


@end











