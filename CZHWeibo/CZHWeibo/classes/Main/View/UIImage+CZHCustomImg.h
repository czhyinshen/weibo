//
//  UIImage+CZHCustomImg.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CZHCustomImg)

#define iOS7 [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0

+ (UIImage *)imageWithName:(NSString*)name;

@end
