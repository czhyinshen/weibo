//
//  CZHComposeTV.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "CZHComposeTV.h"

@interface CZHComposeTV()
@property (nonatomic,weak)UILabel *placeholderLabel;

@end

@implementation CZHComposeTV

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
        UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]init];
        [pan addTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        
        UILabel *placeholderLabel = [[UILabel alloc]init];
        placeholderLabel.numberOfLines = 0;
        self.placeholderLabel = placeholderLabel;
        placeholderLabel.hidden = YES;
        placeholderLabel.textColor = [UIColor grayColor];
        [self addSubview:placeholderLabel];

        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}


- (void)setPlaceholder:(NSString *)placeholder{
    
    _placeholder = placeholder;
    
    if (placeholder.length) {
        
        CGFloat placeholderX = 5;
        CGFloat placeholderY = 10;
        self.placeholderLabel.text = placeholder;
        
        CGSize placeholderSize = [self.placeholderLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width-2 * placeholderX, self.frame.size.height-2*placeholderY) options:0 attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor],NSFontAttributeName:self.placeholderLabel.font} context:nil].size;
        self.placeholderLabel.frame = CGRectMake(5, 10, placeholderSize.width,placeholderSize.height);
        
        self.placeholderLabel.hidden = NO;

    
    }else{
        self.placeholderLabel.hidden = YES;
    }

}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    self.placeholder =self.placeholder;
    
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)textDidChange{
    self.placeholderLabel.hidden =self.text.length;
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)pan:(UIPanGestureRecognizer*)panGR{
    [self resignFirstResponder];
}


@end
