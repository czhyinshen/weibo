//
//  UIButton+CZH.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIButton+CZH.h"

@implementation UIButton (CZH)


+ (UIButton*)ButtonWithTitle:(NSString*)title image:(NSString*)image highlightedImage:(NSString*)hi target:(id)target action:(SEL)action{
    
    UIButton*btn = [[UIButton alloc]init];
    
    if(image && hi){
        
        [btn setImage:[UIImage imageWithName:image] forState:UIControlStateNormal];
    
        [btn setImage:[UIImage imageWithName:hi] forState:UIControlStateHighlighted];
    }
    if (title) {
        
        [btn setAttributedTitle:[[NSAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}] forState:UIControlStateNormal];
        
        [btn setAttributedTitle:[[NSAttributedString alloc]initWithString:title attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor grayColor]}] forState:UIControlStateHighlighted];
    }
    
    btn.frame = CGRectMake(0, 0, 50, 50);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
}

@end
