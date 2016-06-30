//
//  XQMessageItem.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQMessageItem.h"
#import "MJExtension.h"
@implementation XQMessageItem

+ (instancetype)messageWithDict:(NSDictionary *)dict {
    
    XQMessageItem *item =  [[self alloc] init];
    [item setKeyValues:dict];
    return item;
}

@end
