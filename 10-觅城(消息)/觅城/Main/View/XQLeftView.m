//
//  XMGLeftView.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/2.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQLeftView.h"
#import "XQCityBtn.h"
@interface XQLeftView()

//记录上一个选中的按钮

@property (weak, nonatomic) IBOutlet UIButton *preSelectBtn;


@end

@implementation XQLeftView
/**
 *  快速创建一个 XQLeftView
 *
 *  @return 创建好的 XQLeftView
 */
+ (instancetype)leftView {
    return  [[NSBundle mainBundle] loadNibNamed:@"XQLeftView" owner:nil options:nil][0];
}

- (IBAction)btnClick:(UIButton *)btn {
    
    //调用代理方法
    //判断代理属性对象有没有实现协议方法
    if ([self.delegate respondsToSelector:@selector(leftView:clickBtnIndex:preBtnIndex:)]) {
        //如果实现了,调用代理方法
        [self.delegate leftView:self clickBtnIndex:btn.tag preBtnIndex:self.preSelectBtn.tag];
    }
    
    //让上一个按钮取消选中
    self.preSelectBtn.selected = NO;
    //让当前按钮成为选中状态
    btn.selected = YES;
    //让当前按钮成为上一个选中的按钮
    self.preSelectBtn = btn;
    
   
    
}



@end
