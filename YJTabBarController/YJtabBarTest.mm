//
//  YJtabBarTest.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/14.
//  Copyright © 2019 YYJ. All rights reserved.
//



#import "YJtabBarTest.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "YJBaseNavController.h"
#import "AppDelegate.h"
#import "UIView+YJUiView.h"

@interface YJtabBarTest ()<UITabBarControllerDelegate>

@end

@implementation YJtabBarTest

+(void)initialize{
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor groupTableViewBackgroundColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = RGBACOLOR(20.0, 21.0, 18.0, 1.0);
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.delegate=self;
    
    FirstViewController *FirstVC =[[FirstViewController alloc]init];
    setupChildVC(FirstVC, @"4", @"account_normal", @"account_highlight", self);
    
    SecondViewController *SecondVC =[[SecondViewController alloc]init];
    setupChildVC(SecondVC, @"5", @"account_normal", @"account_highlight", self);
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}
#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {}

-(void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}
void setupChildVC(UIViewController *VC,NSString *title,NSString *ImageStr,NSString *SelectedImageStr,UITabBarController*TabBarVC){
    
    VC.navigationItem.title = title;
    VC.tabBarItem.title = title;
    VC.tabBarItem.image =  imageNamedWithOriginal(ImageStr);
    VC.tabBarItem.selectedImage = imageNamedWithOriginal(SelectedImageStr);
    VC.edgesForExtendedLayout =  UIRectEdgeNone;
    [VC.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    YJBaseNavController *nav = [[YJBaseNavController alloc] initWithRootViewController:VC];
    VC.navigationItem.title = title;
    [TabBarVC addChildViewController:nav];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"fanhui-spxq"] forState:UIControlStateNormal];
    button.size = CGSizeMake(20, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 0)];
    [button addTarget:TabBarVC action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    VC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
}

UIImage *imageNamedWithOriginal(NSString *name) {
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}


@end
