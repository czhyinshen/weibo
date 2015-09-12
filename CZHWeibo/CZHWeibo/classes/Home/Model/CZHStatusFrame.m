//
//  CZHStatusFrame.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHStatusFrame.h"
#import "CZHStatuses.h"
#import "CZHUser.h"



#define CZHStatuCellBolder 5

@implementation CZHStatusFrame

-(void)setStatues:(CZHStatuses *)statues{
    _statues = statues;
    
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    //1.顶部视图
    CGFloat topViewW = cellW;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;

    
    //2.头像视图
    CGFloat iconViewWH = 35;
    CGFloat iconViewX = CZHStatuCellBolder;
    CGFloat iconViewY = CZHStatuCellBolder;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
   
    //3.微博昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF)+CZHStatuCellBolder;
    CGFloat nameLabelY = CZHStatuCellBolder;
    CGSize nameLabelSize = [self.statues.user.name sizeWithAttributes:@{NSFontAttributeName: CZHNameLabelFontSize}];
    _nameLabelF = (CGRect){{nameLabelX,nameLabelY},nameLabelSize};
    
    //4.会员视图

    CGFloat VipViewWH = 14;
    CGFloat VipViewX = CGRectGetMaxX(_nameLabelF)+CZHStatuCellBolder;
    CGFloat VipViewY = CZHStatuCellBolder;
    _VipViewF =(CGRect){{VipViewX,VipViewY},{VipViewWH,VipViewWH}};

    //5.微博时间
     CGSize TimeLabelSize = [self.statues.created_at sizeWithAttributes:@{NSFontAttributeName: CZHTimeLabelFontSize}];
    CGFloat TimeLabelX = nameLabelX;
    CGFloat TimeLabelY = CGRectGetMaxY(_nameLabelF) + CZHStatuCellBolder;
    _TimeLabelF= (CGRect){{TimeLabelX,TimeLabelY},TimeLabelSize};

    //6.来源
    CGSize sourceLabelSize = [self.statues.source sizeWithAttributes:@{NSFontAttributeName: CZHSourceFontSize}];
    CGFloat sourceLabelX = CGRectGetMaxX(_TimeLabelF)+CZHStatuCellBolder;
    CGFloat sourceLabelY = TimeLabelY;
    CGFloat sourceLabelW = topViewW - CGRectGetMaxX(_TimeLabelF)-2*CZHStatuCellBolder;
    _sourceLabelF = (CGRect){{sourceLabelX,sourceLabelY},{sourceLabelW,sourceLabelSize.height}};

    //8.微博正文内容
    CGFloat maxHeadMargin = MAX(CGRectGetMaxY(_TimeLabelF),CGRectGetMaxY(_iconViewF))+CZHStatuCellBolder;
    CGFloat contentLabelMaxW = topViewW- 2*CZHStatuCellBolder;
    CGFloat contentLabelY = maxHeadMargin+CZHStatuCellBolder;
    CGFloat contentLabelX = CZHStatuCellBolder;
    CGSize  contentLabelSize = [self.statues.text boundingRectWithSize:CGSizeMake(contentLabelMaxW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:CZHContentFontSize} context:nil].size;
    _contentLabelF = (CGRect){{contentLabelX,contentLabelY},contentLabelSize};
    
    //7.配图视图
    
    CGSize photoLabelSize = {50,50};
    CGFloat photoViewX = CZHStatuCellBolder;
    CGFloat photoViewY = CZHStatuCellBolder+CGRectGetMaxY(_contentLabelF);
    _photoViewF = (CGRect){{photoViewX,photoViewY},photoLabelSize};

    //topView高度
    CGFloat topViewH = CGRectGetMaxY(_photoViewF)+CZHStatuCellBolder;
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    if (self.statues.thumbnail_pic != nil) {
        _cellHeight =  topViewH;
    }else{
        _cellHeight = topViewH-50;
    }

}

@end
