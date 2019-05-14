//
//  YJThirdViewController.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/14.
//  Copyright © 2019 YYJ. All rights reserved.
//

#import "YJThirdViewController.h"
#import "AppDelegate.h"
#import "UIView+YJUiView.h"

@interface YJThirdViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (copy, nonatomic) NSArray *titles;

@end

@implementation YJThirdViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title=@"隐藏了TabbarVC";
    self.view.backgroundColor = [UIColor redColor];
  //  self.tabBar.hidden=YES;
    //self.edgesForExtendedLayout = UIRectEdgeBottom;
  //  self.edgesForExtendedLayout=UIRectEdgeBottom;
    self.view.backgroundColor = [UIColor redColor];
    self.edgesForExtendedLayout =  UIRectEdgeNone;
 self.titles=@[@"基础图",@"自定义精度圈",@"百度搜索",@"搜索",@"基础图",@"自定义精度圈",@"百度搜索",@"搜索",@"基础图",@"自定义精度圈",@"百度搜索",@"搜索",@"基础图",@"自定义精度圈",@"百度搜索",@"搜索"];
    [self.view addSubview:self.tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*cellID = @"CellID";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text=self.titles[indexPath.row];
    return cell;
}

#pragma mark - Lazy loading
- (UITableView *)tableView {
    if (!_tableView) {
        CGFloat tabBarheight  =self.tabBar.height;

        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-kViewTopHeight) style:UITableViewStylePlain];
        _tableView.tableFooterView=[UIView new];
    }
    return _tableView;
}


@end
