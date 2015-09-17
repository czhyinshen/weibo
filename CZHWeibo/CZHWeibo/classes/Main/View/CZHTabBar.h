//
//  CZHTabBarButon.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZHTabBar;

@protocol CZHTabBarDelegate <NSObject>
@optional

- (void)TabBar:(CZHTabBar*)tabBar diselectButtonItemFrom:(NSInteger)itemIndex to:(NSInteger)newItemIndex;
- (void)TabBarDiselectButtonItem:(CZHTabBar*)tabBar;
@end

@interface CZHTabBar : UIView

@property (nonatomic,weak)id<CZHTabBarDelegate> delegate;

- (void)addTabBarButtonWithItem:(UITabBarItem*)item;



@end
