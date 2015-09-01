//
//  CZHBadgeButton.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/8/27.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "CZHBadgeButton.h"
#import "UIImage+CZHCustomImg.h"
@implementation CZHBadgeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundImage:[UIImage resizingImageWithName:@"main_badge"] forState:UIControlStateNormal];
        
        self.userInteractionEnabled = NO;
        [self.titleLabel setFont:[UIFont systemFontOfSize:11]];
 
    }
    
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue{
    
    _badgeValue = badgeValue;
    if (badgeValue) {
        self.hidden = NO ;
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateSelected];
    
        CGRect frame = self.frame;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        
        if (badgeValue.length >1) {
            
            CGSize badgeSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
            badgeW = badgeSize.width+10;
            
        }
        frame.size = CGSizeMake(badgeW, badgeH);
        self.frame = frame;
    }
    else{
        self.hidden = YES;
    }
}

@end
