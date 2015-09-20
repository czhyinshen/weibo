//
//  CZHToolBar.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZHComposeToolBarBtn.h"
@class CZHComposeToolBar;

@protocol  CZHComposeToolBarDelegate<NSObject>

- (void)CZHComposeToolBar:(CZHComposeToolBar *)toolbar DidSelectedBtnType:(CZHComposeToolBarType)type;
@end

@interface CZHComposeToolBar : UIView

@property (nonatomic,strong)id<CZHComposeToolBarDelegate> delegate;

+ (CZHComposeToolBar*)composeToolBar;

@end
