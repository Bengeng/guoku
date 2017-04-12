//
//  YGSandBoxData.h
//  GuoKu
//
//  Created by BEN on 16/5/29.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGSandBoxData : NSObject
+ (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName;
+ (void)saveString:(NSString *)currentString withName:(NSString *)stringName;
@end

