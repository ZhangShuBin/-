//
//  XQHomeItem.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQHomeSectionItem : NSObject

/**
 *  headView的颜色
 */
@property (nonatomic, copy) NSString *color;
/**
 *  headView的标题
 */
@property (nonatomic, copy) NSString *tag_name;
/**
 *  headView的子标题
 */
@property (nonatomic, copy) NSString *section_count;
/**
 *  cell模型
 */
@property (nonatomic, strong) NSArray *body;

+ (instancetype)homeSectionItemWithDict:(NSDictionary *)dict;

@end
