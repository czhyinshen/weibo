//
//  CZHWeiboTool.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHWeiboTool.h"
#import "CZHOAuthViewController.h"
#import "CZHSurfaceViewController.h"
#import "CZHTabBarController.h"

@implementation CZHWeiboTool
/**
 *  判断选择跟控制器
 */
+ (void)ChooseRootController{
            
        NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
        NSString* lastVersionCode = [ud stringForKey:@"lastVersionCode"];
        NSString* currentVersionCode = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        
        if (![currentVersionCode isEqualToString:lastVersionCode]) {
            [UIApplication sharedApplication].keyWindow.rootViewController = [[CZHSurfaceViewController alloc]init];
            [ud setValue:currentVersionCode forKey:@"lastVersionCode"];
        }else{
            [UIApplication sharedApplication].keyWindow.rootViewController = [[CZHTabBarController alloc]init];
            
        }
    
}

@end
