//
//  CZHSearchBar.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHSearchBar.h"
#import "UIImage+CZHCustomImg.h"
@implementation CZHSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)searchBar{
    
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:13]}];
        
        self.background = [UIImage resizingImageWithName:@"searchbar_textfield_background"];
        
        UIImageView *searchView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        
        searchView.contentMode = UIViewContentModeRight;
        
        self.leftView = searchView;
        
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.returnKeyType = UIReturnKeySearch;
        
        self.enablesReturnKeyAutomatically = YES;
        
        
        self.leftView.frame = CGRectMake(0, 0, 150, self.frame.size.height);
        
    }
    
    return self;
}


@end
