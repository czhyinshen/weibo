//
//  CZHTabButton.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHTabButton.h"
#import "UIImage+CZHCustomImg.h"
#import "CZHTabBar.h"

#define CZHTabButtonImageRatio 0.6
#define CZHTabButtonImageColor [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1]
#define CZHTabButtonImageSelectedColor [UIColor colorWithRed:236.0/255.0 green:103.0/255.0 blue:0 alpha:1]

@interface CZHTabButton()

@property (nonatomic,strong)UIButton *badgeButton;

@end

@implementation CZHTabButton

- (instancetype)initWithFrame:(CGRect)frame{
    [UIColor colorWithRed:117 green:117 blue:117 alpha:1];
    
    self = [super initWithFrame:frame];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    self.badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin;

    [self setTitleColor:CZHTabButtonImageColor forState:UIControlStateNormal];
    [self setTitleColor:CZHTabButtonImageSelectedColor forState:UIControlStateSelected];
    
    UIButton*badgebutton = [[UIButton alloc]init];
    self.badgeButton = badgebutton;
    
    self.badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin;
    
    [self addSubview:self.badgeButton];
    return self;

}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * CZHTabButtonImageRatio;
    
    return CGRectMake(0, 0, imageW, imageH);

}

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    [self bandgeWithBadgeValue:item.badgeValue];
}


- (void)bandgeWithBadgeValue:(NSString*)badgeValue{
    if (badgeValue) {
        [self.badgeButton setTitle:badgeValue forState:UIControlStateNormal];
        [self.badgeButton setBackgroundImage:[UIImage imageWithName:@"main_badge"] forState:UIControlStateNormal];
        
        self.badgeButton.userInteractionEnabled = NO;
        [self.badgeButton.titleLabel setFont:[UIFont systemFontOfSize:11]];
        CGRect frame = self.badgeButton.frame;
        CGFloat badgeW = self.badgeButton.currentBackgroundImage.size.width;
        CGFloat badgeH = self.badgeButton.currentBackgroundImage.size.height;
        CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width-30;
        CGFloat badgeY = 0;
        
        if (badgeValue.length >1) {
            CGSize badgeSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName:self.badgeButton.titleLabel.font}];
            badgeW = badgeSize.width+10;
            
        }
        frame.size = CGSizeMake(badgeW, badgeH);
        frame.origin = CGPointMake(badgeX, badgeY);
        
        self.badgeButton.frame = frame;
    }else{
        self.badgeButton.hidden = YES;
    }
    
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
