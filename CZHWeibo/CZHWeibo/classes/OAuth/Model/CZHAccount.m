//
//  CZHAccount.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/9.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHAccount.h"

@implementation CZHAccount


+ (instancetype)AccountWithDic:(NSDictionary *)dic{

    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeInt64:self.uid forKey:@"uid"];

}

- (id)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super init]) {
 
        self.remind_in = [aDecoder decodeInt64ForKey:@"remind_in"];
        self.uid = [aDecoder decodeInt64ForKey:@"uid"];
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeInt64ForKey:@"expires_in"];
        
    }
    return self;
}
@end
