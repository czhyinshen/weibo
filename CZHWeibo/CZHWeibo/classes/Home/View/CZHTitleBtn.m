//
//  CZHTitleBtn.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHTitleBtn.h"

#define CZHTitleBtnimageWidth 30
#define titleBtnImageDownTag 0
#define titleBtnUpImageTag 1

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

        [self setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage resizingImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        self.tag = titleBtnImageDownTag;
        [self addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickTitleBtn:(UIButton *)titleBtn{
    if (titleBtn.tag == titleBtnImageDownTag) {
        [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        titleBtn.tag = titleBtnUpImageTag;
    }else{
        [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        titleBtn.tag = titleBtnImageDownTag;
    }
    
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state{
   
    if (title) {
        [self setAttributedTitle:[[NSAttributedString alloc]initWithString:title attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}] forState:UIControlStateNormal];

        titleSizeW = [title boundingRectWithSize:CGSizeFromString(title) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.width;
        titleSizeW = titleSizeW+CZHTitleBtnimageWidth+10;
    }
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y , titleSizeW, 40);
    [super setTitle:title forState:state];
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleX = 5;
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;
    CGFloat titleW = self.frame.size.width-CZHTitleBtnimageWidth;

    return CGRectMake(titleX, titleY, titleW, titleH);

}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageX = self.frame.size.width-CZHTitleBtnimageWidth;
    CGFloat imageY = 0;
    CGFloat imageW = CZHTitleBtnimageWidth;
    CGFloat imageH = contentRect.size.height;
 
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
