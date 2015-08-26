//
//  CZHTabButton.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHTabButton.h"

#define CZHTabButtonImageRatio 0.6
#define CZHTabButtonImageColor [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1]
#define CZHTabButtonImageSelectedColor [UIColor colorWithRed:236.0/255.0 green:103.0/255.0 blue:0 alpha:1]

@implementation CZHTabButton

- (instancetype)initWithFrame:(CGRect)frame{
    [UIColor colorWithRed:117 green:117 blue:117 alpha:1];
    
    self = [super initWithFrame:frame];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [self setTitleColor:CZHTabButtonImageColor forState:UIControlStateNormal];
    [self setTitleColor:CZHTabButtonImageSelectedColor forState:UIControlStateSelected];
    
    return self;
    
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * CZHTabButtonImageRatio;
    
    return CGRectMake(0, 0, imageW, imageH);

}

- (void)setHighlighted:(BOOL)highlighted{

}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * (1-CZHTabButtonImageRatio);
    
    CGFloat titleY = contentRect.size.height * CZHTabButtonImageRatio;
    return  CGRectMake(0, titleY, titleW, titleH);
    
}

@end
