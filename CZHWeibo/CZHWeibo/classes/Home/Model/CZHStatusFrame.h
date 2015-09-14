//
//  CZHStatusFrame.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

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

#define CZHStatuCellBolder 10

#define  CZHTableViewCellBolder 10

#define  CZHStatusToolBarH 35

@class CZHStatuses;

@interface CZHStatusFrame : NSObject

@property (nonatomic,strong)CZHStatuses *statues;

/*  头像视图*/
@property (nonatomic,assign,readonly)CGRect  iconViewF;
/*  顶部视图*/
@property (nonatomic,assign,readonly)CGRect  topViewF;
/*  会员视图*/
@property (nonatomic,assign,readonly)CGRect  VipViewF;
/*  微博昵称*/
@property (nonatomic,assign,readonly)CGRect  nameLabelF;
/*  微博时间*/
@property (nonatomic,assign,readonly)CGRect  TimeLabelF;
/*  来源*/
@property (nonatomic,assign,readonly)CGRect  sourceLabelF;
/*  配图视图*/
@property (nonatomic,assign,readonly)CGRect  photoViewF;
/*  微博正文内容*/
@property (nonatomic,assign,readonly)CGRect   contentLabelF;


/*  被转发微博的View*/
@property (nonatomic,assign,readonly)CGRect  retweetedViewF;
/*  被转发微博的配图*/
@property (nonatomic,assign,readonly)CGRect  retweetedPhotoViewF;
/*  被转发微博的内容*/
@property (nonatomic,assign,readonly)CGRect  retweetedContentLabelF;
/*  被转发微博的昵称*/
@property (nonatomic,assign,readonly)CGRect  retweetedNameLabelF;


/*  微博的工具条*/
@property (nonatomic,assign,readonly)CGRect  statusToolBarF;

/*  Cell的高度*/
@property (nonatomic,assign,readonly)CGFloat cellHeight;
@end
