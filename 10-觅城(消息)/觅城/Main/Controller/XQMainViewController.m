//
//  XMGMainViewController.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/2.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQMainViewController.h"
#import "XQLeftView.h"

#import "XQDiscoverViewController.h"
#import "XQHomeViewController.h"
#import "XQMessageViewController.h"
#import "XQSettingViewController.h"

#import "XQNavigationController.h"


@interface XQMainViewController ()<XQLeftViewDelegate>

@end

@implementation XQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置侧边视图
    [self setUpLeftView];
    //添加子控制器
    [self addChildVC];
}

//添加视图
- (void)setUpLeftView {
    //添加左侧视图
    XQLeftView *leftView = [XQLeftView leftView];
    leftView.frame = self.leftV.bounds;
    leftView.delegate = self;
    [self.leftV addSubview:leftView];
    
}

//添加子控制器
- (void)addChildVC{
    
    //所有的控制器名称
    NSArray *childArray = @[@"XQHomeViewController",@"XQDiscoverViewController",@"XQMessageViewController", @"XQSettingViewController"];
    
    //遍历所有的的控制器.
    for (NSString *className in childArray) {
        //将字符串转换成类名
        UIViewController *vc = [[NSClassFromString(className) alloc] init];
        XQNavigationController *nav = [[XQNavigationController alloc] initWithRootViewController:vc];
        nav.leftMenuClick = ^{
            //打开左侧按钮.
            [self openLeft];
        };
        [self addChildViewController:nav];
    }
    //取出第一个子控控制器.设置为默认显示的控制器
    UIViewController *homeVC = self.childViewControllers[0];
    //设置homeVC的尺寸大小和MainV的一样大
    //homeVC.view.frame = self.mainV.bounds;
    //把默认选中第一个控制器的View添加到mainV当中
    [self.mainV addSubview:homeVC.view];
    
}

/**
 *  点击侧边按钮时调用
 *
 *  @param leftV    左侧视图
 *  @param curIndex 当前点击按钮的角标
 *  @param preIndex 上一个点击按钮的角标
 */
- (void)leftView:(XQLeftView *)leftV clickBtnIndex:(NSInteger)curIndex preBtnIndex:(NSInteger)preIndex {

    //获取上一个控制器
    UIViewController *preVC = self.childViewControllers[preIndex];
    //移出上一个控制器的View
    [preVC.view removeFromSuperview];

    //取出当前选中的控制器
    UIViewController *curVC = self.childViewControllers[curIndex];
    curVC.view.frame = self.mainV.bounds;
    //把当前的控制器的View添加到主视图
    [self.mainV addSubview:curVC.view];

    //抽屉复位
    [self tap];
}



@end
