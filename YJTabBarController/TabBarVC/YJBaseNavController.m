//
//  YJBaseNavController.m
//  YJTabBarController
//
//  Created by 于英杰 on 2019/5/13.
//  Copyright © 2019 YYJ. All rights reserved.
//

#import "YJBaseNavController.h"
#import "UIView+YJUiView.h"
#import "YJtabBarTest.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface YJBaseNavController ()

@end

@implementation YJBaseNavController
+ (void)initialize
{
     //[[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [UINavigationBar appearance].barTintColor=[UIColor whiteColor];//
    [UIColor colorWithRed:(31/255.0) green:(193/255.0)  blue:(217/255.0) alpha:1.0];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (self.childViewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"fanhui-spxq"] forState:UIControlStateNormal];
        button.size = CGSizeMake(20, 30);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 0)];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        if ([viewController isKindOfClass:[FirstViewController class]] ||[viewController isKindOfClass:[SecondViewController class]]) {
            viewController.hidesBottomBarWhenPushed = NO;
        }
        else{
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
   
}


@end
