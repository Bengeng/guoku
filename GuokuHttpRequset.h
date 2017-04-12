//
//  GuokuHttpRequset.h
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuokuHttpRequset : NSObject
+ (void)sendGoodsRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block;
+ (void)sendArticlesRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block;
+ (void)sendHotArticlesRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block;
+ (void)sendHotGoodsRequsetWithCompletionBlock:(void (^)( NSMutableArray *array))block;
@end
