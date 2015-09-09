//
//  CZHAccountTool.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
// 用户工具类

#import <Foundation/Foundation.h>

@class CZHAccount;

@interface CZHAccountTool : NSObject


+ (CZHAccount*)account;
+ (void)saveAccount:(CZHAccount*)account;

@end
