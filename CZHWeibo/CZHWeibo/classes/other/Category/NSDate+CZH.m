//
//  NSDate+CZH.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NSDate+CZH.h"

@implementation NSDate (CZH)
/**
 *  判断是否是今天
 *
 *  @return
 */
- (BOOL)isToday{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    //获得当前时间年月日
    NSDate *nowDate = [NSDate date];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:nowDate];
    
    //获得创建时间年月日
    NSDate *creatDate = self;
    NSDateComponents *creatCmps = [calendar components:unit fromDate:creatDate];
    
    return creatCmps.year == nowCmps.year && creatCmps.month == nowCmps.month && creatCmps.day == nowCmps.day;
    
    
}
/**
 *  判断是否是这个小时
 *
 *  @return 创建时间与现在时间的小时差
 */
- (BOOL)isThisHour{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dipersionCmps = [calendar components:unit fromDate:[NSDate date] toDate:self options:NSCalendarWrapComponents];
    return dipersionCmps.hour <= 1;
    
}
/**
 *  判断是否是这一年
 *
 *  @return 创建时间
 */
- (BOOL)isThisYear{
    NSDateComponents *dipersionCmps = [self dipersionCmpsNow];
    return dipersionCmps.year == 0;
}

- (BOOL)isYesterday{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    //昨天日期
    NSDate *yesterdayDate = [NSDate dateWithTimeIntervalSinceNow:-24*60*60];
    NSDateComponents *yesterdayCmps = [calendar components:unit fromDate:yesterdayDate];
   
    //获得创建时间年月日
    NSDate *creatDate = self;
    NSDateComponents *creatCmps = [calendar components:unit fromDate:creatDate];
    
    return creatCmps.year == yesterdayCmps.year && creatCmps.month == yesterdayCmps.month && creatCmps.day == yesterdayCmps.day;
}

/**
 *  计算当前日历与目标日历的时间差
 *
 *  @return 当前日历与目标日历的时间差
 */
- (NSDateComponents*)dipersionCmpsNow{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth| NSCalendarUnitDay| NSCalendarUnitHour | NSCalendarUnitMinute
    | NSCalendarUnitSecond;
    
    NSDateComponents *dipersionCmps = [calendar components:unit fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    return dipersionCmps;
}

- (NSDateComponents*)dateComponents{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    int unit = NSCalendarUnitYear | NSCalendarUnitMonth| NSCalendarUnitDay| NSCalendarUnitHour | NSCalendarUnitMinute
    | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self];
    
}


@end
