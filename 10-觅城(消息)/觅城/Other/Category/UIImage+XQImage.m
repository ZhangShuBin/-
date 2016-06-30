//
//  UIImage+XQImage.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "UIImage+XQImage.h"

@implementation UIImage (XQImage)
/**
 *  根据图片名,返回一张不经过渲染的图片
 *
 *  @param imageName 图片名
 *
 *  @return 不经过渲染的图片
 */
+ (UIImage *)imageRenderNormalWithName:(NSString *)imageName {

    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}


@end
