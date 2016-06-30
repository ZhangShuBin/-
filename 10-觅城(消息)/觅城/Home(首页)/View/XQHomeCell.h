//
//  XQHomeCell.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQHomeCellItem;
@interface XQHomeCell : UITableViewCell

/**
 *  创建一个Cell可复用的Cell
 *
 *  @param tableView tableView
 *  @param cellItem  行模型
 *
 *  @return 创建好的Cell;
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView WithCellItem:(XQHomeCellItem *)cellItem;

@end
