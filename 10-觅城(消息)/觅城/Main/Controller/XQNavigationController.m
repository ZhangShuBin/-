//
//  XQNavigationController.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQNavigationController.h"
#import "UIImage+XQImage.h"

@interface XQNavigationController ()

@end

@implementation XQNavigationController

+ (void)initialize {
    
    //获取当前类下的全局导航条
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    //设置导航条背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //设置左侧按钮
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageRenderNormalWithName:@"menuIcon"] style:0 target:self action:@selector(leftIconClick)];
    [super pushViewController:viewController animated:animated];
}

/**
 *  左侧按钮点击
 */
- (void)leftIconClick {
    
    if (self.leftMenuClick) {
        self.leftMenuClick();
    }
}

@end
