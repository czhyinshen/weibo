//
//  CZHHomeViewController.m
//  CZHWeibo
//
//  Created by zweiguo on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHHomeViewController.h"
#import "CZHTitleBtn.h"
#import "AFNetworking.h"
#import "CZHAccountTool.h"
#import "CZHAccount.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "MJExtension.h"
#import "CZHUser.h"
#import "CZHStatuses.h"
#import "CZHStatusFrame.h"
#import "CZHStatusesTableViewCell.h"

#define titleBtnImageDownTag 0
#define titleBtnUpImageTag 1

@interface CZHHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray  *statusesFrame;

@end

@implementation CZHHomeViewController

-(NSMutableArray *)statuses{
    if (!_statusesFrame) {
        _statusesFrame = [NSMutableArray array];
    }
    return _statusesFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //刷新数据
    [self setUpRefreshController];
    
    [self setUPBarbuttonItem];

    [self setUpTitleView];
    
}

- (void)setUpRefreshController{
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    [refreshControl beginRefreshing];
    if(refreshControl.refreshing){
        refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"正在刷新" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:[UIColor grayColor]}];
    }
    
    [self refreshData:refreshControl];
}

- (void)refreshData:(UIRefreshControl*)refresh{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
   
    NSMutableDictionary*param = [NSMutableDictionary dictionary];
    param[@"access_token"] = [CZHAccountTool account].access_token;
    if (self.statusesFrame.count) {
        CZHStatusFrame *statusFrame = self.statusesFrame[0];
        param[@"since_id"] = statusFrame.statues.idstr;
    }
    
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *statusArray = [CZHStatuses objectArrayWithKeyValuesArray:responseObject[@"statuses"] ];
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (CZHStatuses *status in statusArray) {
            
            CZHStatusFrame*statusesFrame = [[CZHStatusFrame alloc]init];
            statusesFrame.statues = status;
            
            [statusFrames addObject:statusesFrame];
        }
        //将新微博添加到微博数组头
        NSMutableArray *tempArray = [NSMutableArray array];
        [tempArray addObjectsFromArray:statusFrames];
        [tempArray addObjectsFromArray: self.statusesFrame];
        self.statusesFrame = tempArray;
        
        [self.tableView reloadData];
        //停止刷新
        [refresh endRefreshing];
        
        [self showStatusMsgBtnWith:statusFrames.count];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //停止刷新
        [refresh endRefreshing];
    }];

}

/**
 *  展示更新微博数据量
 *
 *  @param count 微博数据量
 */
- (void)showStatusMsgBtnWith:(NSInteger)count{
    
    UIButton *StatusCountBtn = [[UIButton alloc]init];
    [StatusCountBtn setBackgroundImage:[UIImage resizingImageWithName:@"timeline_new_status_background"] forState:UIControlStateNormal];
    
    if (!count) {
        [StatusCountBtn setAttributedTitle:[[NSAttributedString alloc]initWithString:@"没有新微博" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor orangeColor]}] forState:UIControlStateNormal];
    }else{
        [StatusCountBtn setAttributedTitle:[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"更新了%ld条微博",count] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor orangeColor]}] forState:UIControlStateNormal];
    }
    //将按钮插到导航栏后面
    [self.navigationController.view insertSubview:StatusCountBtn belowSubview:self.navigationController.navigationBar];
    
   
    CGFloat btnH = 30;
    CGFloat btnX = 2;
    CGFloat btnW = self.view.frame.size.width-btnX*2;
    CGFloat btnY = 34;
    
    StatusCountBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    //动画展现微博数据量
    [UIView animateWithDuration:1 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
    
        StatusCountBtn.transform = CGAffineTransformMakeTranslation(0, 30);
   
    } completion:^(BOOL finished) {
      
        [UIView animateKeyframesWithDuration:1 delay:0.5 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            StatusCountBtn.transform = CGAffineTransformMakeTranslation(0, -30);
        } completion:nil];
        
    }];
}

- (void)setUPBarbuttonItem{

    UIBarButtonItem* lefBtn = [UIBarButtonItem ButtonWithTitle:nil image:@"navigationbar_friendsearch" highlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:nil];
    self.navigationItem.leftBarButtonItem = lefBtn;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ButtonWithTitle:nil image:@"navigationbar_pop" highlightedImage:@"navigationbar_pop_highlighted" target:self action:nil];
    
    self.tableView.backgroundColor =  [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, CZHTableViewCellBolder, 0);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setUpTitleView{
    CZHTitleBtn *titleBtn = [CZHTitleBtn titleBtn];
    
    titleBtn.frame = CGRectMake(0, 0, 100, 30);
    
    [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"dsdfas" forState:UIControlStateNormal];
    
    
    titleBtn.tag = titleBtnImageDownTag;
    [titleBtn setBackgroundImage:[UIImage resizingImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    
    [titleBtn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
}

- (void)clickTitleBtn:(UIButton *)titleBtn{
    if (titleBtn.tag == titleBtnImageDownTag) {
        [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        titleBtn.tag = titleBtnUpImageTag;
    }else{
        [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        titleBtn.tag = titleBtnImageDownTag;
    }

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statuses.count;
}

static NSString*cellIdentifier = @"Cell";
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CZHStatusesTableViewCell*cell = [CZHStatusesTableViewCell cellWithTableView:tableView];
    
    cell.statusFrame = self.statusesFrame[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CZHStatusFrame*statusFrame = self.statusesFrame[indexPath.row];
    
    return statusFrame.cellHeight;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
