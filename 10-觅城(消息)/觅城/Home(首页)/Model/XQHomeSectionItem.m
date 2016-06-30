//
//  XQHomeItem.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQHomeSectionItem.h"
#import "MJExtension.h"


@implementation XQHomeSectionItem

+ (NSDictionary *)objectClassInArray {
    
    return @{
             @"body" : @"XQHomeCellItem"
             };
}

+ (instancetype)homeSectionItemWithDict:(NSDictionary *)dict {
    
    XQHomeSectionItem *item = [[self alloc] init];
    //将字典转成模型
    [item setKeyValues:dict];
    return item;
}

@end
