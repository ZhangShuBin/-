//
//  XQCityBtn.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/2.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQCityBtn.h"


@implementation XQCityBtn

//取消按钮高度状态
- (void)setHighlighted:(BOOL)highlighted {}


- (void)awakeFromNib {
    //设置圆角
    self.layer.cornerRadius = 10;
    //设置背景图片
    [self setImage:[UIImage imageNamed:@"city_down"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"city_up"] forState:UIControlStateSelected];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.x = (self.width - self.titleLabel.width) * 0.5;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 30;
}

@end
