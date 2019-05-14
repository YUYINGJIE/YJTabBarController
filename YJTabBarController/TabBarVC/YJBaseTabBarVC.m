//
//  YJBaseTabBarVC.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/13.
//  Copyright © 2019 YYJ. All rights reserved.
//



#import "YJBaseTabBarVC.h"
#import "YJBaseNavController.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface YJBaseTabBarVC ()<UITabBarControllerDelegate>
@property(nonatomic,strong)NSMutableArray*ViewControllers;
@end

@implementation YJBaseTabBarVC


+(void)initialize{
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor colorWithRed:83/255.0 green:83/255.0 blue:83/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = RGBACOLOR(223.0, 21.0, 18.0, 1.0);
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor=[UIColor whiteColor];
    self.delegate=self;
    self.ViewControllers=[NSMutableArray array];
    ViewController *VC =[[ViewController alloc]init];
    setupChildVC(VC, @"1", @"account_normal", @"account_highlight", self);
    FirstViewController *FirstVC =[[FirstViewController alloc]init];
    setupChildVC(FirstVC, @"2", @"account_normal", @"account_highlight", self);
    SecondViewController *SecondVC =[[SecondViewController alloc]init];
    setupChildVC(SecondVC, @"3", @"account_normal", @"account_highlight", self);
    NSLog(@"%@",self.viewControllers);
}

void setupChildVC(UIViewController *VC,NSString *title,NSString *ImageStr,NSString *SelectedImageStr,UITabBarController*TabBarVC){
    
    VC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"11 " image:imageNamedWithOriginal(ImageStr) selectedImage:imageNamedWithOriginal(SelectedImageStr)];
    VC.edgesForExtendedLayout =  UIRectEdgeNone;
    [VC.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    YJBaseNavController *nav = [[YJBaseNavController alloc] initWithRootViewController:VC];
    VC.navigationItem.title = title;
    [TabBarVC addChildViewController:nav];
    

}

UIImage *imageNamedWithOriginal(NSString *name) {
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}


#pragma mark - <UITabBarControllerDelegate>
- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {}
@end
