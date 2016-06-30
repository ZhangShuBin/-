//
//  XQHomeCellItem.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQHomeCellItem : NSObject
/**
 *  标题
 */
@property (nonatomic, copy) NSString *section_title;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString *imageURL;
/**
 *  浏览次数
 */
@property (nonatomic, copy) NSString *fav_count;
/**
 *  底部名称
 */
@property (nonatomic, copy) NSString *poi_name;

/**
 *  图片地址
 */
@property (nonatomic, strong) NSURL *imageVURL;


@end
