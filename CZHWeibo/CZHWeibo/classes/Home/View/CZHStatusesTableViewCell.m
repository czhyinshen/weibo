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
#import "CZHOriginalView.h"
#import "CZHStatuses.h"
#import "CZHStatusFrame.h"

@interface CZHStatusesTableViewCell()

/*  原创微博视图*/
@property (nonatomic,strong)CZHOriginalView *OriginalView;

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
        self.backgroundColor =[UIColor clearColor];
        //设置原创微博
        [self setUpOrigionalSubView];
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
     CZHOriginalView*topView= [[CZHOriginalView alloc]init];
    [self.contentView addSubview: topView];
    self.OriginalView = topView;
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
    [self setUpStatusToolBar];
}

//原创微博数据
- (void)setUpOrigionalData{
    self.OriginalView.statusFrame = self.statusFrame;
}


/**
 *  设置工具栏
*/
- (void)setUpStatusToolBar{
    self.statusToolBar.frame = self.statusFrame.statusToolBarF;
    self.statusToolBar.statuses = self.statusFrame.statues;
}


@end
