//
//  XQHomeCell.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQHomeCell.h"
#import "XQHomeCellItem.h"
#import "UIImageView+WebCache.h"

@interface XQHomeCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *lookTimesBtn;
@property (weak, nonatomic) IBOutlet UIImageView *foodImageV;

@end

@implementation XQHomeCell


/**si
 *  创建一个Cell可复用的Cell
 *
 *  @param tableView tableView
 *  @param cellItem  行模型
 *
 *  @return 创建好的Cell;
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView WithCellItem:(XQHomeCellItem *)cellItem {
    
    //创建Cell
    static NSString *ID  = @"homeCellID";
    XQHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XQHomeCell" owner:nil options:nil][0];
    }
    //取消cell选中样式
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    //设置数据
    cell.nameLabel.text = cellItem.section_title;
    cell.subTitleLabel.text = cellItem.poi_name;
    //把字符串转换成URL
    [cell.foodImageV sd_setImageWithURL:cellItem.imageVURL placeholderImage:[UIImage imageNamed:@"contentViewNoImages"]];
    return cell;
}


@end
