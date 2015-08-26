//
//  CZHTabBarButon.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHTabBar.h"
#import "UIImage+CZHCustomImg.h"
#import "CZHTabButton.h"

@interface CZHTabBar()

@property (nonatomic,strong)CZHTabButton *selectedButton;
@end

@implementation CZHTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (!iOS7) {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabBar_background"]];
        }
        
    }
    return self;
}

- (void)addTabBarButtonWithItem:(UITabBarItem*)item{
    
    CZHTabButton*button = [[CZHTabButton alloc]init];
    [self addSubview:button];
    
    button.item = item;
    
    [button setTitle:item.title forState:UIControlStateNormal];
    [button setImage:item.image forState:UIControlStateNormal];
    [button setImage:item.selectedImage forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count == 1) {
        [self buttonClicked:button];
    }
}

- (void)buttonClicked:(CZHTabButton*)btn{
    if ([self.delegate respondsToSelector:@selector(TabBar:diselectButtonItemFrom:to:)]) {
        [self.delegate TabBar:self diselectButtonItemFrom:self.selectedButton.tag to:btn.tag];
    }
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;

}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat buttonW = self.frame.size.width /self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    
    for (int index = 0; index< self.subviews.count; index++) {

        CZHTabButton*button = self.subviews[index];
        button.tag = index;
        CGFloat buttonX = index *buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
    }
}


@end
