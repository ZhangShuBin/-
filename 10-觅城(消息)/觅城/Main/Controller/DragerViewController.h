//
//  DragerViewController.h
//  12-抽屉效果
//
//  Created by xiaomage on 16/5/13.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragerViewController : UIViewController

@property (nonatomic, weak)  UIView *mainV;
@property (nonatomic, weak)  UIView *leftV;

//恢复
- (void)tap;
//打开
- (void)openLeft;




@end
