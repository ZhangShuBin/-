//
//  XQSectionHeaderV.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQSectionHeaderV.h"
#import "XQHomeSectionItem.h"

#import "UIColor+XQColor.h"

@interface XQSectionHeaderV()
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  精品数据
 */
@property (weak, nonatomic) IBOutlet UILabel *numLabel;


@end

@implementation XQSectionHeaderV

/**
 *  从xib当中创建一个 sectionHeaderV
 *
 *  @return 创建的 sectionHeaderV
 */
+ (instancetype)sectionHeaderV {
    return [[[NSBundle mainBundle] loadNibNamed:@"XQSectionHeaderV" owner:nil options:nil] lastObject];
}


- (void)setSectionItem:(XQHomeSectionItem *)sectionItem {
    _sectionItem = sectionItem;
    //设置数据
    self.titleLabel.text = sectionItem.tag_name;
    self.numLabel.text = [NSString stringWithFormat:@"%@",sectionItem.section_count];
    //设置背景色
    self.backgroundColor = [UIColor colorWithHexString:sectionItem.color alpha:1];
}

@end
