//
//  article.m
//  GuoKu
//
//  Created by 张泉 on 15-11-5.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import "articleDAO.h"
#import "creatorDAO.h"
@implementation articleDAO : NSObject
+ (articleDAO *)parseArticleWithDictionary:(NSDictionary *)dict{
    
    articleDAO *__autoreleasing article = [[articleDAO alloc] init];
    article.read_count = [dict objectForKey:@"read_count"];
    article.pub_time =  [dict objectForKey:@"pub_time"];
    article.showcover = [dict objectForKey:@"showcover"];
    article.title = [dict objectForKey:@"title"];
    article.url = [dict objectForKey:@"url"];
    article.feed_read_count = [dict objectForKey:@"feed_read_count"];
    article.cover = [dict objectForKey:@"cover"];
    article.publish = [dict objectForKey:@"publish"];
    article.content = [dict objectForKey:@"content"];
    article.source = [dict objectForKey:@"source"];
    article.dig_count = [dict objectForKey:@"dig_count"];
    article.article_id = [dict objectForKey:@"article_id"];
    article.digest = [dict objectForKey:@"digest"];
    article.identity_code = [dict objectForKey:@"identity_code"];


    NSDictionary *creator = [dict objectForKey:@"creator"];
    article.creator = [creatorDAO parseCreatorWithDictionary:creator];
    
    article.tags = [dict objectForKey:@"tags"];
    return article;
}

@end
