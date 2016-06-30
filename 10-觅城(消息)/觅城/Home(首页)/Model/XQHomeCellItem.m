//
//  XQHomeCellItem.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/4.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQHomeCellItem.h"

@implementation XQHomeCellItem

- (void)setImageURL:(NSString *)imageURL {
    _imageURL = imageURL;
    self.imageVURL = [NSURL URLWithString:imageURL];
}

@end
