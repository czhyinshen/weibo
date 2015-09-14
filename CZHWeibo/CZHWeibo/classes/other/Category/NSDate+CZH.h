//
//  NSDate+CZH.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CZH)

- (BOOL)isToday;
- (BOOL)isThisYear;
- (BOOL)isThisHour;
- (BOOL)isYesterday;
- (NSDateComponents*)dipersionCmpsNow;
- (NSDateComponents*)dateComponents;

@end
