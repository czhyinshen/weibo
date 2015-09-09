//
//  CZHAccountTool.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHAccountTool.h"

#define CZHDocumentDirectoryPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
#define  CZHFileName  @"acount.plsit"

@implementation CZHAccountTool
/**
 *  反归档用户信息
 *
 *  @return 用户
 */
+ (CZHAccount*)account{
    
    NSString *file = CZHDocumentDirectoryPath;
    NSString *filePath = [file stringByAppendingPathComponent:CZHFileName];
    CZHAccount*account = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return account;
    
}

/**
 *  归档用户信息
 *
 *  @param account 
 */
+ (void)saveAccount:(CZHAccount*)account{
    
    NSString *file = CZHDocumentDirectoryPath;
    
    NSString *filePath = [file stringByAppendingPathComponent:CZHFileName];

    [NSKeyedArchiver archiveRootObject:account toFile:filePath];

}

@end
