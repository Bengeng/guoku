//
//  YGSandBoxData.m
//  GuoKu
//
//  Created by BEN on 16/5/29.
//  Copyright © 2016年 庚杨. All rights reserved.
//

#import "YGSandBoxData.h"

@implementation YGSandBoxData
#pragma mark - 保存图片至沙盒
+ (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
{
    
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
    // 获取沙盒目录
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    // 将图片写入文件
    
    [imageData writeToFile:fullPath atomically:NO];
}

+ (void)saveString:(NSString *)currentString withName:(NSString *)stringName
{
    // 字符串写入沙盒
    // 在Documents下面创建一个文本路径，文本名称为 stringName
    NSString *txtPath = [NSHOMEDIRECTORY stringByAppendingPathComponent:stringName];
    
    // 字符串写入时执行的方法
    [currentString writeToFile:txtPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

// 字符串读取的方法
//NSString *resultStr = [NSString stringWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];


@end
