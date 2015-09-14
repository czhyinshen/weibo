//
//  CZHStatusesTableViewCell.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHStatusesTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "CZHStatusToolBar.h"
#import "CZHRetweetView.h"

@interface CZHStatusesTableViewCell()

/*  头像视图*/
@property (nonatomic,weak)UIImageView *iconView;
/*  顶部视图*/
@property (nonatomic,weak)UIImageView *topView;
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


/*  被转发微博的View*/
@property (nonatomic,weak)UIImageView *retweetedView;
/*  被转发微博的配图*/
@property (nonatomic,weak)UIImageView *retweetedPhotoView;
/*  被转发微博的内容*/
@property (nonatomic,weak)UILabel *retweetedContentLabel;
/*  被转发微博的昵称*/
@property (nonatomic,weak)UILabel *retweetedNameLabel;

/*  被转发微博视图*/
@property (nonatomic,strong)CZHRetweetView *retweetView;

/*  微博的工具条*/
@property (nonatomic,weak)CZHStatusToolBar *statusToolBar;


@end

@implementation CZHStatusesTableViewCell

+ (CZHStatusesTableViewCell*)cellWithTableView:(UITableView*)tableView{
    static NSString *ID = @"status";

    CZHStatusesTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
    
        cell = [[CZHStatusesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        //设置原创微博
        [self setUpOrigionalSubView];
        
        //设置转发微博
        [self setUpRetweetSubView];
        
        //设置微博工具栏
        [self setUpStatuToolBar];
        
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    frame.origin.y += 10;
    frame.size.height -= CZHTableViewCellBolder;
    
    [super setFrame:frame];

}
/**
 *  设置原创微博
 */
- (void)setUpOrigionalSubView{
    /*  顶部视图*/
     UIImageView*topView= [[UIImageView alloc]init];
    [self.contentView addSubview: topView];
    self.topView = topView;
    topView.image = [UIImage resizingImageWithName:@"timeline_card_top_background"];
    topView.highlightedImage = [UIImage resizingImageWithName:@"timeline_card_top_background_highlighted"];
    
    /*  头像视图*/
    UIImageView*iconView= [[UIImageView alloc]init];
    [self.topView addSubview: iconView];
    self.iconView = iconView;

   /*  会员视图*/
    UIImageView*VipView= [[UIImageView alloc]init];
    [self.topView addSubview: VipView];
    self.VipView = VipView;
    
    /*  微博昵称*/
    UILabel*nameLabel= [[UILabel alloc]init];
    [self.topView addSubview: nameLabel];
    self.nameLabel = nameLabel;
    
    /*  微博时间*/
    UILabel*TimeLabel= [[UILabel alloc]init];
    [self.topView addSubview: TimeLabel];
    self.TimeLabel = TimeLabel;
   
    /*  来源*/
    UILabel*sourceLabel= [[UILabel alloc]init];
    [self.topView addSubview: sourceLabel];
    self.sourceLabel = sourceLabel;
    
    /*  配图视图*/
    UIImageView*photoView= [[UIImageView alloc]init];
    [self.topView addSubview: photoView];
    self.photoView = photoView;
    
    /*  微博正文内容*/
    UILabel*contentLabel= [[UILabel alloc]init];
    [self.topView addSubview: contentLabel];
    self.contentLabel = contentLabel;


}

/**
 *  设置转发微博
 */
- (void)setUpRetweetSubView{
    
   /*  被转发微博的View*/
    CZHRetweetView*retweetedView= [[CZHRetweetView alloc]init];
    [self.topView addSubview: retweetedView];
    self.retweetedView = retweetedView;
    
     /*  被转发微博的昵称*/
    UILabel*retweetedNameLabel= [[UILabel alloc]init];
    [self.retweetedView addSubview: retweetedNameLabel];
    self.retweetedNameLabel = retweetedNameLabel;
    
    /*  被转发微博的内容*/
    UILabel*retweetedContentLabel= [[UILabel alloc]init];
    [self.retweetedView addSubview: retweetedContentLabel];
    self.retweetedContentLabel = retweetedContentLabel;
    
    /*  被转发微博的配图*/
    UIImageView*retweetedPhotoView= [[UIImageView alloc]init];
    [self.retweetedView addSubview: retweetedPhotoView];
    self.retweetedPhotoView = retweetedPhotoView;
    

    
}

/**
 *  设置微博工具栏
 */
- (void)setUpStatuToolBar{
    CZHStatusToolBar*statusToolBar= [[CZHStatusToolBar alloc]init];
    [self.contentView addSubview: statusToolBar];
    self.statusToolBar = statusToolBar;
}

-(void)setStatusFrame:(CZHStatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    [self setUpOrigionalData];
    [self setUpRetweetData];
    [self setUpStatusToolBar];
}

//原创微博数据
- (void)setUpOrigionalData{
    CZHStatuses*status = self.statusFrame.statues;
    CZHUser *user = status.user;
    //微博顶视图
    self.topView.frame = self.statusFrame.topViewF;
    self.topView.image = [UIImage resizingImageWithName:@"common_card_top_background"];
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
    if (status.bmiddle_pic) {
        self.photoView.hidden = NO;
        [self.photoView setImageWithURL:[NSURL URLWithString:status.bmiddle_pic] placeholderImage:[UIImage imageNamed:@"common_card_middle_background_highlighted_os7"]];
        self.photoView.backgroundColor = [UIColor clearColor];
        self.photoView.frame = self.statusFrame.photoViewF;
    }else{
        self.photoView.hidden = YES;
        self.photoView.frame = CGRectZero;
    }
    

}

- (void)setUpRetweetData{
    
    CZHStatuses*retweetstatus = self.statusFrame.statues.retweeted_status;
    CZHUser *user = retweetstatus.user;
    
    if (retweetstatus) {
        self.retweetedView.hidden = NO;
        //被转发微博视图
        self.retweetedView.frame = self.statusFrame.retweetedViewF;
        [self.retweetedView setImage:[UIImage resizingImageWithName:@"timeline_retweet_background" left:0.9 top:0.5]];
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
        
        self.retweetedView.hidden = YES;
    }
    
}

/**
 *  设置工具栏
*/
- (void)setUpStatusToolBar{
    self.statusToolBar.frame = self.statusFrame.statusToolBarF;
    self.statusToolBar.statuses = self.statusFrame.statues;
    
}


@end
