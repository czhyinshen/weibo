//
//  UIImage+CZHCustomImg.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIImage+CZHCustomImg.h"

@implementation UIImage (CZHCustomImg)

+ (UIImage *)imageWithName:(NSString*)name{
    
    if (iOS7) {
        
        UIImage*image = [UIImage imageNamed:[name stringByAppendingString:@"_os7"]];
        if (image == nil) {
            return [UIImage imageNamed:name];
        }
        return image;
        
    }else{
        return [UIImage imageNamed:name];
    }
}

+ (UIImage*)resizingImageWithName:(NSString*)name{
    
    UIImage *image = [UIImage imageWithName:name];
   
    return [image stretchableImageWithLeftCapWidth:image.size.width *0.5 topCapHeight:image.size.height *0.5];
}

@end
