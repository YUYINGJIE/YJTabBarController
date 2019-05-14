//
//  SecondViewController.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/13.
//  Copyright © 2019 YYJ. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "UIView+YJUiView.h"
#import "YJThirdViewController.h"

@interface SecondViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (copy, nonatomic) NSArray *titles;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"不隐藏Tabbar";
    self.edgesForExtendedLayout =  UIRectEdgeNone;
    [self.view addSubview:self.tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString*cellID = @"CellID";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        YJThirdViewController *ThirdVC = [[YJThirdViewController alloc]init];
        [self.navigationController pushViewController:ThirdVC animated:YES];
   
}

#pragma mark - Lazy loading
- (UITableView *)tableView {
    if (!_tableView) {
        CGFloat tabBarheight  =self.tabBarController.tabBar.height;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-kViewTopHeight-tabBarheight) style:UITableViewStylePlain];
        _tableView.tableFooterView=[UIView new];
    }
    return _tableView;
}
@end
