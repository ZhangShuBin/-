//
//  XMGLeftView.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/2.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>


//1.定义协议
@class XQLeftView;
@protocol XQLeftViewDelegate <NSObject>

/**
 *  点击侧边按钮时调用
 *
 *  @param leftV    左侧视图
 *  @param curIndex 当前点击按钮的角标
 *  @param preIndex 上一个点击按钮的角标
 */
- (void)leftView:(XQLeftView *)leftV clickBtnIndex:(NSInteger)curIndex preBtnIndex:(NSInteger)preIndex;

@end


@interface XQLeftView : UIView
/**
 *  快速创建一个 XQLeftView
 *
 *  @return 创建好的 XQLeftView
 */
+ (instancetype)leftView;

/**
 *  代理属性
 */
@property (nonatomic, weak) id<XQLeftViewDelegate> delegate;

@end
