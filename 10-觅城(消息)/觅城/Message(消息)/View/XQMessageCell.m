//
//  XQMessageCell.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQMessageCell.h"
#import "XQMessageItem.h"

@interface XQMessageCell()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation XQMessageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    XQMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XQMessageCell" owner:nil options:nil] lastObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

- (void)setItem:(XQMessageItem *)item {
    _item = item;
    
    self.dateLabel.text = item.date;
    self.meesageLabel.text = item.message;
    //通知Cell,更新布局->就可以知道 cell 的准确高度
    [self layoutIfNeeded];
    
    //获取label的紧凑高度
    CGSize labelSize = [self.meesageLabel systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    //计算Cell的高度.
    CGFloat cellH = self.meesageLabel.frame.origin.y + labelSize.height + self.iconHCons.constant;

    self.backVConsH.constant = cellH + 8;
    item.cellH = cellH + 10;
}

@end
