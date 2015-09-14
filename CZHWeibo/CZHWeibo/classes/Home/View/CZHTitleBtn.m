//
//  CZHTitleBtn.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHTitleBtn.h"
#define CZHTitleBtnimageWidth 30
@interface CZHTitleBtn()
{
    NSUInteger titleSizeW;
}
@end
@implementation CZHTitleBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)titleBtn{

    return [[self alloc]init];
}

- (instancetype)init{
    
    if (self = [super init]) {
      
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
//        if (self.titleLabel.text) {
//            [self setAttributedTitle:[[NSAttributedString alloc]initWithString:self.titleLabel.text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}] forState:UIControlStateNormal];
//        }
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    
    if (self.titleLabel.text) {
        [self setAttributedTitle:[[NSAttributedString alloc]initWithString:self.titleLabel.text attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}] forState:UIControlStateNormal];
      
        titleSizeW = [self.titleLabel.text lengthOfBytesUsingEncoding:NSUTF8StringEncoding]*8+35;
        
        if (titleSizeW < self.frame.size.width) {
            titleSizeW = self.frame.size.width;
        }
    }

}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleW = contentRect.size.width-CZHTitleBtnimageWidth;
    
    if (titleSizeW) {
    
        return CGRectMake(titleX, titleY, titleSizeW-CZHTitleBtnimageWidth, titleH);
    }
   
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleX = contentRect.size.width-CZHTitleBtnimageWidth;
    CGFloat titleY = 0;
    CGFloat titleW = CZHTitleBtnimageWidth;
    CGFloat titleH = contentRect.size.height;
    
    if (titleSizeW) {
    
        return CGRectMake(titleSizeW-CZHTitleBtnimageWidth, titleY, titleW, titleH);
    }
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y , titleSizeW, self.frame.size.height);
}
@end
