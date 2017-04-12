//
//  entity.h
//  GuoKu
//
//  Created by 张泉 on 15-11-3.
//  Copyright (c) 2015年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemDAO.h"
@interface entityDAO : NSObject
@property (nonatomic, retain) NSMutableArray *detail_imagesArr;
@property (nonatomic, copy) NSString *entity_id;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *note_count;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *created_time;
@property (nonatomic, copy) NSString *old_category_id;
@property (nonatomic, copy) NSString *chief_image;
@property (nonatomic, copy) NSString *entity_hash;
@property (nonatomic, copy) NSString *score_count;
@property (nonatomic, copy) NSString *novus_time;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *mark;
@property (nonatomic, copy) NSString *brand;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, retain) NSMutableArray *item_listArr;
@property (nonatomic, copy) NSString *total_score;
@property (nonatomic, retain) NSMutableArray *item_id_listArr;
@property (nonatomic, copy) NSString *mark_value;
@property (nonatomic, copy) NSString *like_already;
@property (nonatomic, copy) NSString *old_root_category_id;
@property (nonatomic, copy) NSString *updated_time;
@property (nonatomic, copy) NSString *creator_id;
@property (nonatomic, copy) NSNumber *like_count;
@property (nonatomic, copy) NSString *category_id;




+ (entityDAO *)parseEntityWithDictionary:(NSDictionary *)dict;
@end
