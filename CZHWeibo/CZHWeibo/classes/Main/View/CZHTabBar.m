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
@property (nonatomic,strong)NSMutableArray *tabBarButtons;
@property (nonatomic,strong)UIButton *addBtn;
@end

@implementation CZHTabBar

-(NSMutableArray *)tabBarButtons{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
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
        
        UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageWithName:@"tabBar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [btn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        btn.bounds = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);
        
        [self addSubview:btn];
        self.addBtn = btn;
       
    
    }
    return self;
}

- (void)addTabBarButtonWithItem:(UITabBarItem*)item{
    
    CZHTabButton*button = [[CZHTabButton alloc]init];
    
    [self addSubview:button];
    
    [self.tabBarButtons addObject:button];
    
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
    
    self.addBtn.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    
    [super layoutSubviews];
    CGFloat buttonW = self.frame.size.width /self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;

    for (int index = 0; index< self.tabBarButtons.count; index++) {
        
        CGFloat buttonX = index *buttonW;
        
        CZHTabButton*button = self.tabBarButtons[index];
        
        if (index> 1) {
        
            buttonX += buttonW;
        }
        
        button.tag = index;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
    }
}


@end
