//
//  ContentDAO.h
//  GuoKu
//
//  Created by 张泉 on 15-11-4.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "noteDAO.h"
#import "entityDAO.h"
@interface ContentDAO : NSObject
+ (ContentDAO *)parseContentWithDictionary:(NSDictionary *)dict;
@property (nonatomic, retain) noteDAO   *note;
@property (nonatomic, retain) entityDAO *entity;
@end
