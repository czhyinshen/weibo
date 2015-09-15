//
//  CZHPhotoView.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHPhotoView.h"
#import "CZHPhoto.h"
#import "UIImageView+WebCache.h"


@interface CZHPhotoView()
@property (nonatomic,weak)UIImageView *gifView;

@end

@implementation CZHPhotoView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        UIImageView *gifView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"timeline_image_gif"]];
        
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}

-(void)setPhoto:(CZHPhoto *)photo{
    _photo = photo;

    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@"thumbnail"];
                       
    [self setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.frame.size.width, self.frame.size.height);
    
}
@end
