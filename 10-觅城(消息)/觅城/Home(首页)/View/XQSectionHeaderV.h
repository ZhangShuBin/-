//
//  XQSectionHeaderV.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQHomeSectionItem;
@interface XQSectionHeaderV : UIView

/**
 *  从xib当中创建一个 sectionHeaderV
 *
 *  @return 创建的 sectionHeaderV
 */
+ (instancetype)sectionHeaderV;

@property (nonatomic, strong) XQHomeSectionItem *sectionItem;

@end
