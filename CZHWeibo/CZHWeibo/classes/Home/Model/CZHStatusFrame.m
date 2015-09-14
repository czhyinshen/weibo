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
#import "UIImageView+WebCache.h"

@implementation CZHStatusFrame

-(void)setStatues:(CZHStatuses *)statues{
    _statues = statues;
    
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    //1.顶部视图
    CGFloat topViewW = cellW;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    CGFloat topViewH = 0;
    
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
    CGFloat TimeLabelY = CGRectGetMaxY(_nameLabelF) + CZHStatuCellBolder/2;
    _TimeLabelF= (CGRect){{TimeLabelX,TimeLabelY},TimeLabelSize};
    
    //6.来源
    CGSize sourceLabelSize = [self.statues.source sizeWithAttributes:@{NSFontAttributeName: CZHSourceFontSize}];
    CGFloat sourceLabelX = CGRectGetMaxX(_TimeLabelF)+CZHStatuCellBolder;
    CGFloat sourceLabelY = TimeLabelY;
    CGFloat sourceLabelW = topViewW - CGRectGetMaxX(_TimeLabelF)-2*CZHStatuCellBolder;
    _sourceLabelF = (CGRect){{sourceLabelX,sourceLabelY},{sourceLabelW,sourceLabelSize.height}};

    //7.微博正文内容
    CGFloat maxHeadMargin = MAX(CGRectGetMaxY(_TimeLabelF),CGRectGetMaxY(_iconViewF));
    CGFloat contentLabelMaxW = topViewW- 2*CZHStatuCellBolder;
    CGFloat contentLabelY = maxHeadMargin+CZHStatuCellBolder;
    CGFloat contentLabelX = CZHStatuCellBolder;
    CGSize  contentLabelSize = [self.statues.text boundingRectWithSize:CGSizeMake(contentLabelMaxW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:CZHContentFontSize} context:nil].size;
    _contentLabelF = (CGRect){{contentLabelX,contentLabelY},contentLabelSize};
    
    //8.配图视图
    
    if (self.statues.pic_urls.count != nil) {
        CGSize photoLabelSize = {100,100};
        CGFloat photoViewX = CZHStatuCellBolder;
        CGFloat photoViewY = CZHStatuCellBolder+CGRectGetMaxY(_contentLabelF);
        _photoViewF = (CGRect){{photoViewX,photoViewY},photoLabelSize};
        //topView高度
        topViewH = CGRectGetMaxY(_photoViewF)+CZHStatuCellBolder;
    }else{
        //topView高度
        topViewH = CGRectGetMaxY(_contentLabelF)+CZHStatuCellBolder;
    }
    
    //9.被转发微博
    if (self.statues.retweeted_status != nil) {
        //1.被转发微博视图
        CGFloat retweetViewW = topViewW-CZHStatuCellBolder;
        CGFloat retweetViewX = CZHStatuCellBolder/2;
        CGFloat retweetViewY = CGRectGetMaxY(_contentLabelF)+CZHStatuCellBolder;
        CGFloat retweetViewH = 0;
       
        //被转发微博用户昵称
        CGFloat retweetNameLabelX = CZHStatuCellBolder;
        CGFloat retweetNameLabelY = CZHStatuCellBolder;
        CGSize retweetNameLabelSize = [self.statues.retweeted_status.user.name sizeWithAttributes:@{NSFontAttributeName: CZHretweetNameFontSize}];
        _retweetedNameLabelF = (CGRect){{retweetNameLabelX,retweetNameLabelY},retweetNameLabelSize};
        
        //被转发微博用户正文
        CGFloat retweetContentLabelMaxW = retweetViewW- 2*CZHStatuCellBolder;
        CGFloat retweetContentLabelY = CGRectGetMaxY(_retweetedNameLabelF);
        CGFloat retweetContentLabelX = retweetNameLabelX;
        CGSize  retweetContentLabelSize = [self.statues.retweeted_status.text boundingRectWithSize:CGSizeMake(retweetContentLabelMaxW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:CZHRetweetContentFontSize} context:nil].size;
        _retweetedContentLabelF = (CGRect){{retweetContentLabelX,retweetContentLabelY},retweetContentLabelSize};
        
        //被转发微博高度
        retweetViewH = CGRectGetMaxY(_retweetedContentLabelF)+CZHStatuCellBolder;
        //被转发微博用户配图
        if (self.statues.retweeted_status.pic_urls.count) {
            CGSize retweetPhotoLabelSize = {100,100};
            CGFloat retweetPhotoViewX = retweetContentLabelX+CZHStatuCellBolder;
            CGFloat retweetPhotoViewY = CZHStatuCellBolder+CGRectGetMaxY(_retweetedContentLabelF);
            _retweetedPhotoViewF = (CGRect){{retweetPhotoViewX,retweetPhotoViewY},retweetPhotoLabelSize};
            
          
            //被转发微博高度
            retweetViewH = CGRectGetMaxY(_retweetedPhotoViewF)+CZHStatuCellBolder;
            
        }else{
            //topView高度
            retweetViewH = CGRectGetMaxY(_retweetedContentLabelF)+CZHStatuCellBolder;
        }
        _retweetedViewF = CGRectMake(retweetViewX, retweetViewY, retweetViewW, retweetViewH);
        
        if (self.statues.retweeted_status) {
            topViewH = CGRectGetMaxY(_retweetedViewF);
        }else{
            topViewH = CGRectGetMaxY(_contentLabelF);
        }
    }else{
        
    
    }
    //顶部视图框架
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    //1.工具栏frame
    CGFloat statusToolBarW = cellW;
    CGFloat statusToolBarX = 0;
    CGFloat statusToolBarY = CGRectGetMaxY(_topViewF)+CZHStatuCellBolder/2;
    CGFloat statusToolBarH = CZHStatusToolBarH;
    _statusToolBarF = CGRectMake(statusToolBarX, statusToolBarY, statusToolBarW, statusToolBarH);
    
    _cellHeight =  CGRectGetMaxY(_statusToolBarF)+CZHTableViewCellBolder;
}

@end
