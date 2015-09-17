//
//  CZHSurfaceScrollView.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHSurfaceScrollView.h"
#import "CZHCheckBox.h"

@interface CZHSurfaceScrollView()

@property (nonatomic,assign)NSInteger IVCount;

@end

@implementation CZHSurfaceScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
    }
    
    return self;
}

- (void)setUpImageView:(NSArray*)names imageCount:(NSInteger)IVCount{
    
    self.IVCount = IVCount;
    
    CGRect newFrame = self.frame;
    CGFloat newFrameW = newFrame.size.width;
    
    newFrame.size.width =newFrameW * self.IVCount;
    self.contentSize = newFrame.size;

}

+ (instancetype)initScrollViewFrame:(CGRect)svframe {

    return [[self alloc]initWithFrame:svframe];
    
}

@end
