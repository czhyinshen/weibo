//
//  CZHStatusesTableViewCell.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/11.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHStatusesTableViewCell.h"
#import "UIImageView+WebCache.h"

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


/*  微博的工具条*/
@property (nonatomic,weak)UIImageView *statusToolBar;


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
/**
 *  设置原创微博
 */
- (void)setUpOrigionalSubView{
    /*  顶部视图*/
     UIImageView*topView= [[UIImageView alloc]init];
    [self.contentView addSubview: topView];
    self.topView = topView;
    
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
    UIImageView*retweetedView= [[UIImageView alloc]init];
    [self.topView addSubview: retweetedView];
    self.retweetedView = retweetedView;
    
    /*  被转发微博的配图*/
    UILabel*retweetedNameLabel= [[UILabel alloc]init];
    [self.retweetedView addSubview: retweetedNameLabel];
    self.retweetedNameLabel = retweetedNameLabel;
    
    /*  被转发微博的内容*/
    UIImageView*retweetedPhotoView= [[UIImageView alloc]init];
    [self.retweetedView addSubview: retweetedPhotoView];
    self.retweetedPhotoView = retweetedPhotoView;
    
    /*  被转发微博的昵称*/
    UILabel*retweetedContentLabel= [[UILabel alloc]init];
    [self.retweetedView addSubview: retweetedContentLabel];
    self.retweetedContentLabel = retweetedContentLabel;
    
}

/**
 *  设置微博工具栏
 */
- (void)setUpStatuToolBar{
    UIImageView*statusToolBar= [[UIImageView alloc]init];
    [self.contentView addSubview: statusToolBar];
    self.statusToolBar = statusToolBar;
}

-(void)setStatusFrame:(CZHStatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    [self setUpOrigionalData];
    [self setUpRetweetData];
    
}

- (void)setUpOrigionalData{
    CZHStatuses*status = self.statusFrame.statues;
    CZHUser *user = status.user;
    
    self.topView.frame = self.statusFrame.topViewF;
    
    self.nameLabel.text = user.name;
    self.nameLabel.font = CZHNameLabelFontSize;
    self.nameLabel.frame = self.statusFrame.nameLabelF;
    
    self.iconView.frame = self.statusFrame.iconViewF;
    [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
    self.VipView.frame = self.statusFrame.VipViewF;
    
    if (user.isVIP) {
        self.VipView.hidden = NO;
        [self.VipView setImage:[UIImage imageWithName:@"common_icon_membership"]];
        self.VipView.frame = self.statusFrame.VipViewF;
        
    }else{
        self.VipView.hidden = YES;
    }
    
    
    self.TimeLabel.text = status.created_at;
    self.TimeLabel.font = CZHTimeLabelFontSize;
    self.TimeLabel.frame = self.statusFrame.TimeLabelF;
    
    self.sourceLabel.numberOfLines = 0;
    self.sourceLabel.text = status.source;
    self.sourceLabel.font = CZHSourceFontSize;
    self.sourceLabel.frame = self.statusFrame.sourceLabelF;
    
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = status.text;
    self.contentLabel.font = CZHContentFontSize;
    self.contentLabel.frame = self.statusFrame.contentLabelF;
    
    
    if ([NSURL URLWithString:status.thumbnail_pic]) {
        [self.photoView setImageWithURL:[NSURL URLWithString:status.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"common_card_middle_background_highlighted_os7"]];
        self.photoView.frame = self.statusFrame.photoViewF;
    }else{
        self.photoView.hidden = YES;
        self.photoView.frame = CGRectZero;
    }
    

}

- (void)setUpRetweetData{
    
}


@end
