//
//  ViewController.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/13.
//  Copyright © 2019 YYJ. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "FirstViewController.h"
#import "YJtabBarTest.h"
#import "UIView+YJUiView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (copy, nonatomic) NSArray *titles;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    self.titles=@[@"不隐藏TabarVC",@"跳到新的TabarVC"];
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
        FirstViewController *FirstVC = [[FirstViewController alloc]init];
        [self.navigationController pushViewController:FirstVC animated:YES];
    }
    else if(indexPath.row==1){
        
        YJtabBarTest *tabBarVC = [[YJtabBarTest alloc]init];
        [self.navigationController pushViewController:tabBarVC animated:YES];
    }
    else if (indexPath.row==2){
        
    }
    
    else if (indexPath.row==3){
        
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
