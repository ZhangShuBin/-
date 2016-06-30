//
//  DragerViewController.m
//  12-抽屉效果
//
//  Created by xiaomage on 16/5/13.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "DragerViewController.h"
#define screenW [UIScreen mainScreen].bounds.size.width

@interface DragerViewController ()


@end

@implementation DragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加子控件
    [self addView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainV addGestureRecognizer:pan];
    
    //添加点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.leftV addGestureRecognizer:tap];
}



- (void)tap {
    [UIView animateWithDuration:0.25 animations:^{
        //复位
        self.mainV.transform = CGAffineTransformIdentity;
        self.mainV.x = 0;
    }];
}



#define targetR screenW * 0.8
//打开
- (void)openLeft {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
    [self frameWithOffset: screenW * 0.72];
        
    } completion:nil];
}

//缩放
#define scaleR 0.25
//当拖动时调用
- (void)pan:(UIPanGestureRecognizer *)pan {
    
    //获取偏移量
    CGPoint transP = [pan translationInView:self.mainV];
    [self frameWithOffset:transP.x];
    
    CGFloat target = 0;
    //判断手势的状态
    if (pan.state == UIGestureRecognizerStateEnded) {
        //当MainV的x大于屏幕宽度一半时.定位到右侧
        if (self.mainV.frame.origin.x > screenW * 0.5 ) {
            //定位到右侧
            target = targetR;
        }
        //计算走的偏移量
        CGFloat offset = target - self.mainV.x;
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            [self frameWithOffset:offset];
            if (self.mainV.x <= 0) {
                self.mainV.transform = CGAffineTransformIdentity;
                self.mainV.x = 0;
            }
        } completion:nil];
        
    }
    
    
    //复位
    [pan setTranslation:CGPointZero inView:self.mainV];
    
}
#define maxY 50
//根据偏移量计算mainV的Frame
- (void)frameWithOffset:(CGFloat)offset {
    
        self.mainV.x += offset;
    
 

        if (self.mainV.x <= 0) {
            self.mainV.x = 0;
        }
        NSLog(@"%f",self.mainV.x);
        
        if (self.mainV.x > screenW * 0.8) {
            self.mainV.x = screenW * 0.8;
        }
        CGFloat res = self.mainV.x * scaleR / screenW * 0.8;
        //求出缩放比例
        CGFloat scale = 1 - res;
        //NSLog(@"scale = %f",scale);

        self.mainV.transform = CGAffineTransformMakeScale(scale, scale);

    
    
}
 //添加子控件
- (void)addView {
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.bounds];
    leftV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:leftV];
    self.leftV = leftV;

    UIView *mainV = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mainV];
    self.mainV = mainV;
    //添加阴影
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(-5, 0, mainV.width, mainV.height)];
    mainV.layer.shadowPath = path.CGPath;
    mainV.layer.shadowOpacity = 1;
    mainV.layer.shadowRadius = 10;

}

@end
