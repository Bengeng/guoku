//
//  GuokuHttpRequset.m
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
/*
   try push
 */
 

#import "GuokuHttpRequset.h"
#import "AFNetworking.h"
#import "goodsDAO.h"
#import "articleDAO.h"
@implementation GuokuHttpRequset
#pragma mark   ---请求首页商品列表
+ (void)sendGoodsRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block
{
    NSString *urlString = @"http://api.guoku.com/mobile/v4/selection/?count=30&timestamp=1446191163&rcat=0&session=c85c36b620aa5cbcfcc936459e131feb&sign=733dc6966949fc044dd181fb3c56aa28&api_key=0b19c2b93687347e95c6b6f5cc91bb87";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    //GET请求
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *goodsInfoArray = [[NSMutableArray alloc] init];
         
         NSMutableArray *goodsAllArray = responseObject;
         
         for (NSDictionary *goodsDict in goodsAllArray) {
             goodsDAO *goodsInfo = [goodsDAO parseGoodsWithDictionary:goodsDict];
             [goodsInfoArray addObject:goodsInfo];
         }
         block(goodsInfoArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"----请求首页商品列表 失败");
     }];
   
}
#pragma mark ---请求首页图文列表
+ (void)sendArticlesRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block
{
    NSString *urlString =@"http://api.guoku.com/mobile/v4/articles/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&page=2&session=86415d6d508bbaa03ffbffd613448118&sign=b1917d37cc984e5c39769a0172a47ed5&size=20&timestamp=1464971305.845615";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *articlesInfoArray = [[NSMutableArray alloc] init];
         NSMutableArray *articlesArray = responseObject;
         for (NSDictionary *articleDict in articlesArray)
         {
             articleDAO *article = [articleDAO  parseArticleWithDictionary:articleDict];
             [articlesInfoArray addObject:article];
         }
         block(articlesInfoArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"----请求首页图文列表 失败");
     }];

}
#pragma mark ---请求热门图文

+ (void)sendHotArticlesRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block{
    
    NSString *urlString =@"http://api.guoku.com/mobile/v4/category/1/articles/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&page=1&session=86415d6d508bbaa03ffbffd613448118&sign=ce5854f606b5c0f5d10cb46080d9a046";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *hotArticlesInfoArray = [[NSMutableArray alloc] init];
         NSMutableDictionary *articlesDic = responseObject;
         hotArticlesInfoArray = [articlesDic objectForKey:@"articles"];
         for (NSDictionary *articleDict in hotArticlesInfoArray)
         {
             articleDAO *article = [articleDAO  parseArticleWithDictionary:articleDict];
             [hotArticlesInfoArray  addObject:article];
         }
         block(hotArticlesInfoArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"----failure");
     }];

}
+ (void)sendHotGoodsRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block{
    
    NSString *urlString = @"http://api.guoku.com/mobile/v4/selection/?api_key=0b19c2b93687347e95c6b6f5cc91bb87&count=30&rcat=0&session=86415d6d508bbaa03ffbffd613448118&sign=36453d52e6a1b79592f470597728cb57&timestamp=1464971299.425282";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //GET请求
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSMutableArray *goodsInfoArray = [[NSMutableArray alloc] init];
         
         NSMutableArray *goodsAllArray = responseObject;
         
         for (NSDictionary *goodsDict in goodsAllArray) {
             goodsDAO *goodsInfo = [goodsDAO parseGoodsWithDictionary:goodsDict];
             [goodsInfoArray addObject:goodsInfo];
         }
         
         block(goodsInfoArray);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"----failure");
     }];
    

}

@end
