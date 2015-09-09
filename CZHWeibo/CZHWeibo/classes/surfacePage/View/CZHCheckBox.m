//
//  CZHCheckBox.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHCheckBox.h"

@implementation CZHCheckBox

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)checkBox{
    
    return [[self alloc]init];
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        
        [self setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        
        [self addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        
    }
    return self;
}

- (void)clickBtn:(UIButton*)btn{
    
    btn.selected = !btn.selected;
}


@end
