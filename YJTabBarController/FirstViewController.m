//
//  FirstViewController.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/13.
//  Copyright © 2019 YYJ. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"
#import "YJThirdViewController.h"
#import "YJtabBarTest.h"
#import "UIView+YJUiView.h"
#import "SecondViewController.h"

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (copy, nonatomic) NSArray *titles;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"不隐藏Tabbar";
    self.edgesForExtendedLayout =  UIRectEdgeNone;
    self.view.backgroundColor = [UIColor redColor];
    self.titles=@[@"隐藏TabarVC",@"不隐藏TabarVC"];
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        YJThirdViewController *ThirdVC = [[YJThirdViewController alloc]init];
        [self.navigationController pushViewController:ThirdVC animated:YES];
    
    }
    else if(indexPath.row==1){
            SecondViewController *SecondVC = [[SecondViewController alloc]init];
            [self.navigationController pushViewController:SecondVC animated:YES];
    }
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
