//
//  XQMessageViewController.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/3.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQMessageViewController.h"

#import "XQMessageItem.h"
#import "XQMessageCell.h"

@interface XQMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak)  UITableView *tableView;

@property (nonatomic, strong) NSArray *messageArray;

@end

@implementation XQMessageViewController

- (NSArray *)messageArray {

    if (_messageArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MessageData.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        //字典转模型
        for (NSDictionary *dict in array) {
            //字典转模型
            XQMessageItem *item = [XQMessageItem messageWithDict:dict];
            [tempArray addObject:item];
        }
        _messageArray = tempArray;
        
    }
    return _messageArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XQColor(142, 142, 143, 1);
    //创建tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColor clearColor];
    //设置数据源代理
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

//返回当前行.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    XQMessageCell *cell = [XQMessageCell cellWithTableView:tableView];
    //设置数据
    XQMessageItem *item = self.messageArray[indexPath.row];
    cell.item = item;
    NSLog(@"%s",__func__);
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XQMessageCell *cell = [XQMessageCell cellWithTableView:tableView];
    XQMessageItem *item = self.messageArray[indexPath.row];
    cell.item = item;
    NSLog(@"%s",__func__);
    return item.cellH;
    
    
}
//
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


@end
