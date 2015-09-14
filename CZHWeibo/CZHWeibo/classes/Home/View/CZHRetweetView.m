//
//  CZHRetweetView.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHRetweetView.h"
@interface CZHRetweetView ()
/*  被转发微博的配图*/
@property (nonatomic,weak)UIImageView *retweetedPhotoView;
/*  被转发微博的内容*/
@property (nonatomic,weak)UILabel *retweetedContentLabel;
/*  被转发微博的昵称*/
@property (nonatomic,weak)UILabel *retweetedNameLabel;
@end
@implementation CZHRetweetView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        //设置背景图片
        [self setImage:[UIImage resizingImageWithName:@"timeline_retweet_background" left:0.9 top:0.5]];
        
        /*  被转发微博的昵称*/
        UILabel*retweetedNameLabel= [[UILabel alloc]init];
        [self addSubview: retweetedNameLabel];
        self.retweetedNameLabel = retweetedNameLabel;
        
        /*  被转发微博的内容*/
        UILabel*retweetedContentLabel= [[UILabel alloc]init];
        [self addSubview: retweetedContentLabel];
        self.retweetedContentLabel = retweetedContentLabel;
        
        /*  被转发微博的配图*/
        UIImageView*retweetedPhotoView= [[UIImageView alloc]init];
        [self addSubview: retweetedPhotoView];
        self.retweetedPhotoView = retweetedPhotoView;
    }
    return self;
}

- (void)setStatusFrame:(CZHStatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    
    CZHStatuses*retweetstatus = statusFrame.statues.retweeted_status;
    CZHUser *user = retweetstatus.user;
    
    if (retweetstatus) {
        self.hidden = NO;
        //被转发微博视图
        self.frame = self.statusFrame.retweetedViewF;

        //被转发微博昵称
        self.retweetedNameLabel.text = user.name;
        self.retweetedNameLabel.numberOfLines = 0;
        self.retweetedNameLabel.font = CZHretweetNameFontSize;
        self.retweetedNameLabel.backgroundColor = [UIColor clearColor];
        self.retweetedNameLabel.frame = self.statusFrame.retweetedNameLabelF;
        
        //被转发微博正文
        self.retweetedContentLabel.text = retweetstatus.text;
        self.retweetedContentLabel.font = CZHRetweetContentFontSize;
        self.retweetedContentLabel.numberOfLines = 0;
        self.retweetedContentLabel.backgroundColor = [UIColor clearColor];
        self.retweetedContentLabel.frame = self.statusFrame.retweetedContentLabelF;
        
        //被转发微博配图
        if (retweetstatus.bmiddle_pic) {
            [self.retweetedPhotoView setImageWithURL:[NSURL URLWithString:retweetstatus.bmiddle_pic] placeholderImage:[UIImage imageWithName:@"common_card_middle_background_highlighted"]];
            self.retweetedPhotoView.frame = self.statusFrame.retweetedPhotoViewF;
            self.retweetedPhotoView.hidden = NO;
        }else{
            self.retweetedPhotoView.hidden = YES;
        }
    }else{
        
        self.hidden = YES;
    }
}


@end
