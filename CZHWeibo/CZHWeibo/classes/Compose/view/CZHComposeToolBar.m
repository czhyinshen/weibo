//
//  CZHToolBar.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "CZHComposeToolBar.h"
#import "CZHComposeToolBarBtn.h"
@interface CZHComposeToolBar()

@end

@implementation CZHComposeToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (CZHComposeToolBar*)composeToolBar{
    return [[CZHComposeToolBar alloc]init];
}


- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        CGRect rect = [UIScreen mainScreen].bounds;
        CGFloat toobarX = 0;
        CGFloat toobarY = rect.size.height-CZHComposeToolbarH;
        CGFloat toobarW = rect.size.width;
        CGFloat toobarH = CZHComposeToolbarH;
        
        self.frame = CGRectMake(toobarX, toobarY, toobarW, toobarH);
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"compose_toolbar_background"]];
        
        [self setToolbarImage];
    }
    return self;
}

- (void)setToolbarImage{

    [self addBtnWith:CZHComposeToolBarTypeCamera];
    [self addBtnWith:CZHComposeToolBarTypePhotoAlumn];
    [self addBtnWith:CZHComposeToolBarTypeAccount];
    [self addBtnWith:CZHComposeToolBarTypeTrend];
    [self addBtnWith:CZHComposeToolBarTypeEmoji];

    
}

- (void)addBtnWith:(CZHComposeToolBarType)type {
    
    CZHComposeToolBarBtn *btn = [CZHComposeToolBarBtn toolbarBtnWithToolbarType:type ];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventAllTouchEvents];
    [self addSubview:btn];

}

- (void)clickBtn:(CZHComposeToolBarBtn*)btn{
    [self.delegate CZHComposeToolBar:self DidSelectedBtnType:btn.tag];
}

- (void)layoutSubviews{
    CGFloat composeToolbarBtnW = self.bounds.size.width/5;
    CGFloat composeToolbarBtnH = self.bounds.size.height;
    [super layoutSubviews];
    for (int i = 0; i<self.subviews.count; i++) {
        CZHComposeToolBarBtn *btn = self.subviews[i];
        btn.frame = CGRectMake(i*composeToolbarBtnW, 0, composeToolbarBtnW, composeToolbarBtnH);
        
    }
}
@end
