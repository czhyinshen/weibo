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

    UINavigationBar*naviBar =[UINavigationBar appearance];
    NSDictionary*naviDic = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    
    [naviBar setTitleTextAttributes:naviDic];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    self.hidesBottomBarWhenPushed = YES;
    
    [super pushViewController:viewController  animated:animated];
}

@end
