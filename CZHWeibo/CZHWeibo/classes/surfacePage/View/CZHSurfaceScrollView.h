//
//  CZHSurfaceScrollView.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZHSurfaceScrollView : UIScrollView


+ (instancetype)initScrollViewFrame:(CGRect)svframe ;
- (void)setUpImageView:(NSArray*)names imageCount:(NSInteger)IVCount;

@end
