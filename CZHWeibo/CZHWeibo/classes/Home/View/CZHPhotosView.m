//
//  CZHPhotosView.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHPhotosView.h"
#import "MJPhotoBrowser.h"
#import "MJPhotoView.h"
#import "CZHPhotoView.h"
#import "MJPhoto.h"
#import "CZHPhoto.h"

@implementation CZHPhotosView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        for (int i = 0; i<9; i++) {
            CZHPhotoView *photoView = [[CZHPhotoView alloc]init];
            photoView.tag = i;
            photoView.userInteractionEnabled = YES;
            
            [photoView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photoTap:)]];
            [self addSubview:photoView];
            
        }
    }
    return self;
}

- (void)photoTap:(UIGestureRecognizer*)rgnizer{
 
    NSInteger count = self.photos.count;
    
    // 1.封装图片数据
    NSMutableArray *myphotos = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++) {
        // 一个MJPhoto对应一张显示的图片
        MJPhoto *mjphoto = [[MJPhoto alloc] init];
        
        mjphoto.srcImageView = self.subviews[i]; // 来源于哪个UIImageView
        
        CZHPhoto *photo = self.photos[i];
        NSString *photoUrl = [photo.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        mjphoto.url = [NSURL URLWithString:photoUrl]; // 图片路径
        
        [myphotos addObject:mjphoto];
    }
    
    // 2.显示相册
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    browser.currentPhotoIndex = rgnizer.view.tag; // 弹出相册时显示的第一张图片是？
    browser.photos = myphotos; // 设置所有的图片
    [browser show];
}

-(CGSize)photoSizeWithPhotoCount:(NSInteger)count{
    
    NSInteger maxColumns = (count == 4)?2:3;

    //总行数，保证图片数不足也可以组成一行
    NSInteger rowsCount = (count+maxColumns-1)/maxColumns;
    
    NSInteger colsCount = (count>maxColumns)?maxColumns:count;
    
    CGFloat photoW = colsCount*CZHPhotoW + CZHPhotoMargin*(colsCount-1);
    CGFloat photoH = (rowsCount-1)*CZHPhotoMargin + CZHPhotoH*rowsCount;
    
    
    return CGSizeMake(photoW, photoH);

}

-(void)setPhotos:(NSArray *)photos{
    
    _photos = photos;
    NSInteger count = photos.count;
    
    for (int i = 0; i<self.subviews.count; i++) {
        
        CZHPhotoView *photoView = self.subviews[i];
        if (i<count) {
            
            photoView.hidden = NO;
            /**
             *  传递模型数据
             */
            photoView.photo = photos[i];
            
            //根据图片数量来布局
            NSInteger maxColumn = (photos.count == 4) ? 2 : 3;
            NSInteger col = i%maxColumn;
            NSInteger row = i/maxColumn;
            CGFloat photoViewX = (CZHPhotoMargin + CZHPhotoW)*col;
            CGFloat photoViewY = (CZHPhotoH +CZHPhotoMargin)*row;
            CGFloat photoViewW = CZHPhotoW;
            CGFloat photoViewH = CZHPhotoH;
           
            photoView.frame = CGRectMake(photoViewX, photoViewY, photoViewW, photoViewH);
            if (photos.count == 1) {
                photoView.contentMode =  UIViewContentModeScaleAspectFit;
                photoView.clipsToBounds = NO;
            }else{
                photoView.contentMode =  UIViewContentModeScaleAspectFill;
                photoView.clipsToBounds = YES;
            }
        }else{
            photoView.hidden = YES;
        }
    }
}

@end
