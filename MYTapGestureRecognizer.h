//
//  MYTapGestureRecognizer.h
//  BaseEmaty01
//
//  Created by Ben-IOS on 15-11-11.
//  Copyright (c) 2015年 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYTapGestureRecognizer : UITapGestureRecognizer
@property(nonatomic,retain) NSMutableDictionary *userdict;
- (id)initWithTarget:(id)target action:(SEL)action  userInfo:(NSDictionary *)dict;
@end
