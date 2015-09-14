//
//  CZHOriginalView.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHOriginalView.h"
#import "CZHPhoto.h"
@interface CZHOriginalView ()

/*  头像视图*/
@property (nonatomic,weak)UIImageView *iconView;
/*  会员视图*/
@property (nonatomic,weak)UIImageView *VipView;
/*  微博昵称*/
@property (nonatomic,weak)UILabel *nameLabel;
/*  微博时间*/
@property (nonatomic,weak)UILabel *TimeLabel;
/*  来源*/
@property (nonatomic,weak)UILabel *sourceLabel;
/*  配图视图*/
@property (nonatomic,weak)UIImageView *photoView;
/*  微博正文内容*/
@property (nonatomic,weak)UILabel * contentLabel;

/*  被转发微博视图*/
@property (nonatomic,strong)CZHRetweetView *retweetView;

@end
@implementation CZHOriginalView

- (instancetype)initWithFrame:(CGRect)frame{
   
    if (self = [super initWithFrame:frame]) {
     
        self.image = [UIImage resizingImageWithName:@"timeline_card_top_background"];
        self.highlightedImage = [UIImage resizingImageWithName:@"timeline_card_top_background_highlighted"];
        
        /*  头像视图*/
        UIImageView*iconView= [[UIImageView alloc]init];
        [self addSubview: iconView];
        self.iconView = iconView;
        
        /*  会员视图*/
        UIImageView*VipView= [[UIImageView alloc]init];
        [self addSubview: VipView];
        self.VipView = VipView;
        
        /*  微博昵称*/
        UILabel*nameLabel= [[UILabel alloc]init];
        [self addSubview: nameLabel];
        self.nameLabel = nameLabel;
        
        /*  微博时间*/
        UILabel*TimeLabel= [[UILabel alloc]init];
        [self addSubview: TimeLabel];
        self.TimeLabel = TimeLabel;
        
        /*  来源*/
        UILabel*sourceLabel= [[UILabel alloc]init];
        [self addSubview: sourceLabel];
        self.sourceLabel = sourceLabel;
        
        /*  配图视图*/
        UIImageView*photoView= [[UIImageView alloc]init];
        [self addSubview: photoView];
        self.photoView = photoView;
        
        /*  微博正文内容*/
        UILabel*contentLabel= [[UILabel alloc]init];
        [self addSubview: contentLabel];
        self.contentLabel = contentLabel;
        
        /*  被转发微博的View*/
        CZHRetweetView*retweetedView= [[CZHRetweetView alloc]init];
        [self addSubview: retweetedView];
        self.retweetView = retweetedView;

    }
    return self;
}

-(void)setStatusFrame:(CZHStatusFrame *)statusFrame{
   
    _statusFrame = statusFrame;
    CZHStatuses*status = statusFrame.statues;
    CZHUser *user = status.user;
    
    //微博顶视图
    self.frame = self.statusFrame.topViewF;
    self.image = [UIImage resizingImageWithName:@"common_card_top_background"];
    //微博昵称
    self.nameLabel.text = user.name;
    self.nameLabel.font = CZHNameLabelFontSize;
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.frame = self.statusFrame.nameLabelF;
    //微博头像
    self.iconView.frame = self.statusFrame.iconViewF;
    [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
    self.iconView.backgroundColor = [UIColor clearColor];
    
    //微博vip
    if (user.mbtype) {
        self.VipView.hidden = NO;
        [self.VipView setImage:[UIImage imageWithName:[NSString stringWithFormat:@"common_icon_membership_level%d",user.mbrank]]];
        self.VipView.backgroundColor = [UIColor clearColor];
        self.VipView.frame = self.statusFrame.VipViewF;
        
    }else{
        [self.VipView setImage:[UIImage imageWithName:[NSString stringWithFormat:@"common_icon_membership_expired"]]];
        self.VipView.hidden = YES;
    }
    
    //微博创建时间
    self.TimeLabel.text = status.created_at;
    self.TimeLabel.font = CZHTimeLabelFontSize;
    self.TimeLabel.backgroundColor = [UIColor clearColor];
    self.TimeLabel.frame = self.statusFrame.TimeLabelF;
    
    //每次都会设置frame 为了每次让status的时间的值可以实时更新到界面
    CGSize TimeLabelSize = [self.statusFrame.statues.created_at sizeWithAttributes:@{NSFontAttributeName: CZHTimeLabelFontSize}];
    CGFloat TimeLabelX = self.statusFrame.nameLabelF.origin.x;
    CGFloat TimeLabelY = CGRectGetMaxY(self.nameLabel.frame) + CZHStatuCellBolder/2;
    self.TimeLabel.textColor = [UIColor colorWithRed:240.0/255.0 green:66.0/255.0 blue:20.0/255.0 alpha:1];
    self.TimeLabel.frame= (CGRect){{TimeLabelX,TimeLabelY},TimeLabelSize};
    
    
    //微博来源
    self.sourceLabel.numberOfLines = 0;
    self.sourceLabel.text = status.source;
    self.sourceLabel.font = CZHSourceFontSize;
    self.sourceLabel.backgroundColor = [UIColor clearColor];
    self.sourceLabel.frame = self.statusFrame.sourceLabelF;
    //微博正文
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = status.text;
    self.contentLabel.font = CZHContentFontSize;
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.frame = self.statusFrame.contentLabelF;
    
    //微博配图
    if (status.pic_urls.count) {
        self.photoView.hidden = NO;
        CZHPhoto *photo = status.pic_urls[0];
        [self.photoView setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"common_card_middle_background_highlighted_os7"]];
        self.photoView.backgroundColor = [UIColor clearColor];
        self.photoView.frame = self.statusFrame.photoViewF;
    }else{
        self.photoView.hidden = YES;
        self.photoView.frame = CGRectZero;
    }
   
    //被转发微博数据
    self.retweetView.statusFrame = statusFrame;

}


@end
