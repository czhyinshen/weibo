//
//  CZHStatusToolBar.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHStatusToolBar.h"
@interface CZHStatusToolBar()

@property (nonatomic,strong)NSMutableArray *dividers;
@property (nonatomic,strong)NSMutableArray *btns;

@property (nonatomic,weak)UIButton *retweetBtn;
@property (nonatomic,weak)UIButton *commentBtn;
@property (nonatomic,weak)UIButton *attitudesBtn;

@end
@implementation CZHStatusToolBar

-(NSMutableArray *)btns{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

-(NSMutableArray *)dividers{
    if (_dividers == nil) {
        _dividers = [NSMutableArray array];
    }
    return _dividers;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizingImageWithName:@"timeline_card_bottom_background"];
      
        self.retweetBtn = [self setUpBtnWith:@"转发" Img:@"timeline_icon_retweet" bgimg:@"timeline_card_leftbottom_highlighted"];
        self.commentBtn = [self setUpBtnWith:@"评论" Img:@"timeline_icon_comment" bgimg:@"timeline_card_rightbottom_highlighted"];
        self.attitudesBtn = [self setUpBtnWith:@"赞" Img:@"timeline_icon_unlike" bgimg:@"timeline_card_middlebottom_highlighted"];

      
        [self setUpDivider];
        [self setUpDivider];
    };
    
    return self;
}

- (UIButton*)setUpBtnWith:(NSString *)title Img:(NSString*)img bgimg:(NSString*)bgImg{
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageWithName:img] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizingImageWithName:bgImg] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0,5,0,0);
    btn.adjustsImageWhenDisabled = NO;
    [self.btns addObject:btn];
    [self addSubview:btn];
    
    return btn;
    
}

- (void)setUpDivider{
    UIImageView *divider = [[UIImageView alloc]init];
    [divider setImage:[UIImage imageWithName:@"timeline_card_bottom_line"]];
    [self.dividers addObject:divider];
    [self addSubview: divider];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger btnsCount = self.btns.count;
    CGFloat divierW = 2;
    CGFloat btnW = self.frame.size.width/btnsCount-2;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnY = 0;
    
    NSInteger dividerCount = self.dividers.count;
    
    for (int i = 0;i<btnsCount;i++) {
        CGFloat btnX = i*(btnW+divierW);
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }
    
    for (int j = 0; j<dividerCount; j++) {
        UIButton *btn = self.btns[j];
        CGFloat dividerX = CGRectGetMaxX(btn.frame);
        UIImageView*divider = self.dividers[j];
        divider.frame = CGRectMake(dividerX, btnY, divierW, btnH);
    }
}

- (void)setStatuses:(CZHStatuses *)statuses{
    _statuses = statuses;
    
    [self setUpBtn:self.retweetBtn OriginalTitle:@"转发" repostCount:statuses.reposts_count ];
    [self setUpBtn:self.commentBtn OriginalTitle:@"评论" repostCount:statuses.comments_count ];
    [self setUpBtn:self.attitudesBtn OriginalTitle:@"赞" repostCount:statuses.attitudes_count ];


    
}

- (NSString *)setUpBtnFormatWith:(NSInteger)count{
    
    double allCount = 0;
    
    if (count>=10000) {
    
        allCount  = (double)count/10000.0;
        NSString* allCountStr = [NSString stringWithFormat:@"%.1f万",allCount];
        allCountStr = [allCountStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
        return allCountStr;
    }
    return [NSString stringWithFormat:@"%ld",count];
}

- (void) setUpBtn:(UIButton *)btn OriginalTitle:(NSString*)title repostCount:(NSUInteger)rpCount{
    
    if (rpCount) {
        
        NSString *rpCountStr = [self setUpBtnFormatWith:rpCount];
        
        [btn setTitle:rpCountStr forState:UIControlStateNormal];
  
    }else{
        
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
}


@end
