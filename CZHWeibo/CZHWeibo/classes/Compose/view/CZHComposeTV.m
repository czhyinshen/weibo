//
//  CZHComposeTV.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "CZHComposeTV.h"

@implementation CZHComposeTV


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]init];
        [pan addTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
    
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer*)panGR{
    [self resignFirstResponder];
}


@end
