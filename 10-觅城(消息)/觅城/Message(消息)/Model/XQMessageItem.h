//
//  XQMessageItem.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQMessageItem : NSObject
/**
 *  日期
 */
@property (nonatomic, copy) NSString *date;
/**
 *  信息
 */
@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) CGFloat cellH;

+ (instancetype)messageWithDict:(NSDictionary *)dict;

@end
