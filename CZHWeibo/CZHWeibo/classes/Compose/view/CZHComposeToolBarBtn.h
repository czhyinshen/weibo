//
//  CZHToobBarBtn.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZHComposeToolBarBtn;

@interface CZHComposeToolBarBtn : UIButton

typedef enum CZHComposeToolBarType: NSUInteger{
    
    //相机
    CZHComposeToolBarTypeCamera,
    //相簿
    CZHComposeToolBarTypePhotoAlumn,
    //联系人
    CZHComposeToolBarTypeAccount,
    //颜文字
    CZHComposeToolBarTypeEmoji,
    //爱好
    CZHComposeToolBarTypeTrend
    
}CZHComposeToolBarType;

- (instancetype)initWithToobarBtnTag:(NSInteger)tag;


+ (CZHComposeToolBarBtn*)toolbarBtnWithToolbarType:(NSInteger)type ;

@end
