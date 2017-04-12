//
//  MYTapGestureRecognizer.m
//  BaseEmaty01
//
//  Created by Ben-IOS on 15-11-11.
//  Copyright (c) 2015年 Ben. All rights reserved.
//

#import "MYTapGestureRecognizer.h"

@implementation MYTapGestureRecognizer
- (id)initWithTarget:(id)target action:(SEL)action  userInfo:(NSMutableDictionary *)dict
{
    self = [super initWithTarget:target action:action];
    if (self) {
        self.userdict = dict;
    }
    return self;
}
@end
