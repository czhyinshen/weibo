//
//  CZHToobBarBtn.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "CZHComposeToolBarBtn.h"
#import "CZHComposeToolBar.h"

@interface CZHComposeToolBarBtn()

@end

@implementation CZHComposeToolBarBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (CZHComposeToolBarBtn*)toolbarBtnWithToolbarType:(NSInteger)type  {
    
    CZHComposeToolBarBtn *btn = [[CZHComposeToolBarBtn alloc]initWithToobarBtnTag:type];
    
    return btn;
}

- (instancetype)initWithToobarBtnTag:(NSInteger)tag{
    CZHComposeToolBarBtn *btn = [[CZHComposeToolBarBtn alloc]init];
    btn.tag = tag;
    [self CZHComposeToolBarSetBtnType:tag btn:btn];
    return btn;
}

- (void)CZHComposeToolBarSetBtnType:(NSInteger)toolbarBtnType btn:(CZHComposeToolBarBtn *)btn{
    switch (btn.tag) {
        case CZHComposeToolBarTypeCamera:
            [btn setImage:[UIImage imageWithName:@"compose_camerabutton_background"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageWithName:@"compose_camerabutton_background_highlighted"] forState:UIControlStateHighlighted];
            break;
        case CZHComposeToolBarTypePhotoAlumn:
            [btn setImage:[UIImage imageWithName:@"compose_toolbar_picture"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageWithName:@"compose_toolbar_picture_highlighted"] forState:UIControlStateHighlighted];
            break;
        case CZHComposeToolBarTypeTrend:
            [btn setImage:[UIImage imageWithName:@"compose_trendbutton_background"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageWithName:@"compose_trendbutton_background_highlighted"] forState:UIControlStateHighlighted];
            break;
        case CZHComposeToolBarTypeAccount:
            [btn setImage:[UIImage imageWithName:@"compose_mentionbutton_background"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageWithName:@"compose_mentionbutton_background_highlighted"] forState:UIControlStateHighlighted];
            break;
        case CZHComposeToolBarTypeEmoji:
            [btn setImage:[UIImage imageWithName:@"compose_emoticonbutton_background"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageWithName:@"compose_emoticonbutton_background_highlighted"] forState:UIControlStateHighlighted];
            break;
        default:
            break;
    }
}


@end
