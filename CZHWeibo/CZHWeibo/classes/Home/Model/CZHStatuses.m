//
//  CZHStatuses.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHStatuses.h"

@implementation CZHStatuses

/**
 *  重写创建时间信息
 *
 *  @return 1.昨天    2.今天    3.这个小时内     4.刚刚    
            5.今年
 */
-(NSString *)created_at{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *creatDate = [dateFormatter dateFromString:_created_at];
    
    if (creatDate.isToday) {
        if (creatDate.isThisHour) {
            if (creatDate.dipersionCmpsNow.minute<=1) {
                return @"刚刚";
            }
            return [NSString stringWithFormat:@"%ld分钟前",creatDate.dipersionCmpsNow.minute];
        }
        return [NSString stringWithFormat:@"%ld小时前",creatDate.dipersionCmpsNow.hour];
        
    }else if (creatDate.isYesterday){
        if (creatDate.dateComponents.minute<10) {
            return [NSString stringWithFormat:@"昨天 %ld:0%ld",creatDate.dateComponents.hour,creatDate.dateComponents.minute];
        }
        return [NSString stringWithFormat:@"昨天 %ld:%ld",creatDate.dateComponents.hour,creatDate.dateComponents.minute];
        
    }else if (creatDate.isThisYear){
        return [NSString stringWithFormat:@"%ld-%ld %ld:%ld",creatDate.dateComponents.month,creatDate.dateComponents.day,creatDate.dateComponents.hour,creatDate.dateComponents.minute];
    }else{
        return [NSString stringWithFormat:@"%ld-%ld-%ld %ld:%ld",creatDate.dateComponents.year,creatDate.dateComponents.month,creatDate.dateComponents.day,creatDate.dateComponents.hour,creatDate.dateComponents.minute];
    } ;
}
/**
 *  重写来源信息
 *
 *  @return 来自XXXXX
 */
- (void)setSource:(NSString *)source{

    NSRange headRange = [source rangeOfString:@">"];
    NSString *str = [source substringFromIndex:headRange.location+1];
    NSRange tailRange = [str rangeOfString:@"</"];
    NSString *soruceStr = [str substringToIndex:tailRange.location];
    
    _source =  [NSString stringWithFormat:@"来自%@",soruceStr];
}


@end
