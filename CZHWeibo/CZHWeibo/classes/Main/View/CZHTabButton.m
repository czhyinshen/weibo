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
#import "CZHBadgeButton.h"

#define CZHTabButtonImageRatio 0.6
#define CZHTabButtonImageColor [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1]
#define CZHTabButtonImageSelectedColor [UIColor colorWithRed:236.0/255.0 green:103.0/255.0 blue:0 alpha:1]

@interface CZHTabButton()

@property (nonatomic,strong)CZHBadgeButton *badgeButton;

@end

@implementation CZHTabButton

- (instancetype)initWithFrame:(CGRect)frame{
    [UIColor colorWithRed:117 green:117 blue:117 alpha:1];
    
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        
        [self setTitleColor:CZHTabButtonImageColor forState:UIControlStateNormal];
        [self setTitleColor:CZHTabButtonImageSelectedColor forState:UIControlStateSelected];
        
        CZHBadgeButton*badgebutton = [[CZHBadgeButton alloc]init];
        
        self.badgeButton = badgebutton;
        
        self.badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |UIViewAutoresizingFlexibleBottomMargin;
        
        [self addSubview:badgebutton];
       
    }
    
     return self;

}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * CZHTabButtonImageRatio;
    
    return CGRectMake(0, 0, imageW, imageH);

}

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];

    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)setHighlighted:(BOOL)highlighted{

}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * (1-CZHTabButtonImageRatio);
    
    CGFloat titleY = contentRect.size.height * CZHTabButtonImageRatio;
    return  CGRectMake(0, titleY, titleW, titleH);

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context{
    
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    self.badgeButton.badgeValue = self.item.badgeValue;
    
    CGRect frame = self.badgeButton.frame;
    
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width +5;
    
    CGFloat badgeY = 0;
    
    frame.origin = CGPointMake(badgeX, badgeY);
    
    self.badgeButton.frame = frame;

}




@end
