//
//  CZH.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIBarButtonItem+CZH.h"
#import "UIImage+CZHCustomImg.h"
// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.

//0.账户信息与授权
#define CZHAppKey @"445140798"
#define CZHAppSecret  @"70687feab465788df3ccb839648d6117"     
#define CZHRequstURL   [NSString stringWithFormat: @"https://api.weibo.com/oauth2/authorize?client_id=%@&response_type=code&redirect_uri=%@",CZHAppKey,CZHRedirectURI]
#define CZHRedirectURI @"https://api.weibo.com/oauth2/default.html"


//1.tabBarButton颜色设置
//按钮
#define CZHTabButtonImageRatio 0.6
//tabBarBtn按钮颜色
#define CZHTabButtonImageColor [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1]
//tabBarBtn选中按钮颜色
#define CZHTabButtonImageSelectedColor [UIColor colorWithRed:236.0/255.0 green:103.0/255.0 blue:0 alpha:1]
//自定义颜色设置
#define CZHColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

//2.是否是四英寸
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

//3.新特性页面
#define CZHSurfaceViewImageViewCount 3

//4.home页面标题
#define CZHTitleBtnimageWidth 30
#define titleBtnImageDownTag 0
#define titleBtnUpImageTag 1

//5.Home页面中cell内的图片视图大小设置
#define CZHPhotoW 90
#define CZHPhotoH 90
#define CZHPhotoMargin 10

//6.Home中Cell的Frame设置

/*微博昵称字体*/
#define CZHNameLabelFontSize [UIFont systemFontOfSize:15]
/*微博时间字体*/
#define CZHTimeLabelFontSize [UIFont systemFontOfSize:12]
/*微博来源字体*/
#define CZHSourceFontSize CZHTimeLabelFontSize
/*微博内容字体*/
#define CZHContentFontSize [UIFont systemFontOfSize:14]

/*被转发微博昵称字体*/
#define CZHretweetNameFontSize [UIFont systemFontOfSize:14]
/*被转发微博内容字体*/
#define CZHRetweetContentFontSize [UIFont systemFontOfSize:14]

//Cell中控件的距离
#define CZHStatuCellBolder 10
//Cell与Cell之间距离
#define  CZHTableViewCellBolder 10
//微博工具栏高
#define  CZHStatusToolBarH 35


//7.是否是iOS7
#define iOS7 [[UIDevice currentDevice].systemVersion doubleValue] >= 7.0

//8.发微博工具栏
#define CZHComposeToolbarH 44
