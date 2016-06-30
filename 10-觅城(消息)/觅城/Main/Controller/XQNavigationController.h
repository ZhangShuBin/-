//
//  XQNavigationController.h
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XQNavigationController : UINavigationController

@property (nonatomic, copy) void(^leftMenuClick)();

@end
