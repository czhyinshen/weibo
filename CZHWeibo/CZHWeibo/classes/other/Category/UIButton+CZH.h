//
//  UIButton+CZH.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CZH)


+ (UIButton*)ButtonWithTitle:(NSString*)title image:(NSString*)image highlightedImage:(NSString*)hi target:(id)target action:(SEL)action;

@end
