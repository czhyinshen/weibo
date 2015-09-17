//
//  UIImage+CZHCustomImg.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CZHCustomImg)


+ (UIImage *)imageWithName:(NSString*)name;

+ (UIImage*)resizingImageWithName:(NSString*)name;

+ (UIImage*)resizingImageWithName:(NSString*)name left:(CGFloat)left top:(CGFloat)top;

@end
