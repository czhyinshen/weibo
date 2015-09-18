//
//  CZHNavigationController.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHNavigationController.h"

@interface CZHNavigationController ()

@end

@implementation CZHNavigationController

+ (void)initialize{
    
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    self.hidesBottomBarWhenPushed = YES;
    
    [super pushViewController:viewController  animated:animated];
}


/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置背景
    if (!iOS7) {
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    
    // 设置文字属性
    NSDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs = @{NSFontAttributeName :[UIFont systemFontOfSize: 15],NSForegroundColorAttributeName:CZHTabButtonImageSelectedColor};
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];

}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    // 设置背景
    if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    
    // 设置标题属性
    NSDictionary *textAttrs = [NSMutableDictionary dictionary];
     textAttrs = @{NSFontAttributeName :[UIFont systemFontOfSize: 19],NSForegroundColorAttributeName:[UIColor blackColor]};
    [navBar setTitleTextAttributes:textAttrs];
}

@end
