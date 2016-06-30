//
//  XQMessageCell.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/5.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XQMessageItem;
@interface XQMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backVConsH;

@property (weak, nonatomic) IBOutlet UILabel *meesageLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconHCons;

@property (nonatomic, strong) XQMessageItem *item;

@end
