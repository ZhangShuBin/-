//
//  XQHomeViewController.m
//  觅城
//
//  Created by 弓虽_子 on 16/6/3.
//  Copyright © 2016年 弓虽_子. All rights reserved.
//

#import "XQHomeViewController.h"
#import "XQHomeSectionItem.h"
#import "XQHomeCellItem.h"

#import "XQSectionHeaderV.h"
#import "XQHomeCell.h"





@interface XQHomeViewController ()<UITableViewDelegate, UITableViewDataSource>

//首页数据
@property (nonatomic, strong) NSArray *homeDataArray;

//附近view
@property (nonatomic, weak)UIView *nearView;
@property (nonatomic, weak)  UITableView *tableView;

@end

@implementation XQHomeViewController

/**
 *  懒加载附近View.
 */
- (UIView *)nearView {
    
    if (_nearView == nil) {
    
        UIView *nearV = [[UIView alloc] init];
        nearV.frame = self.view.bounds;
        [self.view addSubview:nearV];
        //添加imageV
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.image = [UIImage imageNamed:@"wnxBG"];
        imageV.frame = nearV.bounds;
        [nearV addSubview:imageV];
        _nearView = nearV;
    }
    return _nearView;
}

- (NSArray *)homeDataArray {
    if (_homeDataArray == nil) {
        //解析plist文件
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeDatas.plist" ofType:nil];
        //从plist文件中加载数据
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            //字典转模型
           XQHomeSectionItem *item = [XQHomeSectionItem homeSectionItemWithDict:dict];
            [tempArray addObject:item];
        }
        _homeDataArray = tempArray;
    }
    return _homeDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView setBackgroundColor:XQColor(51, 52, 53, 1)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
    //设置背景颜色
    [self.view setBackgroundColor:XQColor(51, 52, 53, 1)];
    //取消分隔线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置导航条视图
    [self setUpNav];
}
/**
 *  设置导航条视图
 */
- (void)setUpNav {
    //创建UISegmentedControl
    UISegmentedControl *segC = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"附近"]];
    //设置宽度
    segC.width = screenW * 0.5;
    //设置UISegmentedControl属性
    //设置主题颜色
    segC.tintColor = XQColor(26, 163, 146, 1);
    
    //设置文字属性
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],//文字颜色
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:16]//文字大小
                           };
    //设置正常状态下的文字属性
    [segC setTitleTextAttributes:dict forState:UIControlStateNormal];
    //设置选中状态下文字属性
    [segC setTitleTextAttributes:dict forState:UIControlStateSelected];
    //设置默认选中第一个.
    segC.selectedSegmentIndex = 0;
    //设置导航条视图
    self.navigationItem.titleView = segC;
    
    //标题
    [segC addTarget:self action:@selector(titleViewChange:) forControlEvents:UIControlEventValueChanged];
}
/**
 *  切换标题视图时调用
 */
- (void)titleViewChange:(UISegmentedControl *)segC {
    //选中附近
    if (segC.selectedSegmentIndex == 1) {
        [self nearView];
    }else {
        //移除附近
        [self.nearView removeFromSuperview];
    }
}
//共有多组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.homeDataArray.count;
}
//每一组有多少行.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   //取出当前所在的组模型
    XQHomeSectionItem *sectionItem = self.homeDataArray[section];
    //返回该组下,行模型的个数
    return sectionItem.body.count;
}

//每一行展示什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取出当前所在的组
    XQHomeSectionItem *sectionItem = self.homeDataArray[indexPath.section];
    //取出当前所在组的每一个行模型
    XQHomeCellItem *cellItem = sectionItem.body[indexPath.row];
    XQHomeCell *cell = [XQHomeCell cellWithTableView:tableView WithCellItem:cellItem];
    //清除背景色
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

//返回头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    //创建头部视图
    XQSectionHeaderV *headerV = [XQSectionHeaderV sectionHeaderV];
    //取出当前所在的组
    XQHomeSectionItem *sectionItem = self.homeDataArray[section];
    //传给XQSectionHeaderV让其展示
    headerV.sectionItem = sectionItem;
    return headerV;
}

//返回每一组头部视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}
//返回行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}

@end
