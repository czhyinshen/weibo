//
//  CZHPhotosView.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZHPhotosView : UIImageView
/**
 *  需要展示的图片
 */
@property (nonatomic,strong)NSArray  *photos;

/**
 *  根据图片数量返回视图尺寸
 *
 *  @param count 图片数量
 *
 *  @return 视图尺寸
 */
- (CGSize)photoSizeWithPhotoCount:(NSInteger)count;

@end
