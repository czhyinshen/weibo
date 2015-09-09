//
//  CZHAccount.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHAccount : NSObject<NSCoding>

@property (nonatomic,copy)NSString *access_token;
@property (nonatomic,assign)long long remind_in;
@property (nonatomic,assign)long long expires_in;
@property (nonatomic,assign)long long uid;

- (instancetype)initWithDic:(NSDictionary*)dic;
+ (instancetype)AccountWithDic:(NSDictionary*)dic;

@end
