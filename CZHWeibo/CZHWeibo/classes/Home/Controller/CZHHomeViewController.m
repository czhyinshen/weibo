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
#import "MJRefresh.h"
#import "UIScrollView+MJRefresh.h"


@interface CZHHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray  *statusesFrame;
@property (nonatomic,weak)CZHTitleBtn *titleBtn;
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
    
    [self setUpTitleView];
    
    [self setUPBarbuttonItem];

    [self setUserName:self.titleBtn];
}

- (void)setUpRefreshController{
    
    //下拉加载
    [self.tableView addHeaderWithTarget:self action:@selector(refreshHeader:)];
    self.tableView.headerRefreshingText = @"荫绅正在帮你刷新";
    self.tableView.headerPullToRefreshText = @"下拉帮你刷新";
    [self.tableView headerBeginRefreshing];
    
    //上拉加载
    [self.tableView addFooterWithTarget:self action:@selector(refreshFooter:)];
    [self.tableView footerBeginRefreshing];
    self.tableView.footerRefreshingText = @"荫绅正在帮你加载";
    self.tableView.footerPullToRefreshText = @"上拉帮你刷新";
    
    
}


- (void)refreshHeader:(UITableView *)tableView{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary*param = [NSMutableDictionary dictionary];
    param[@"access_token"] = [CZHAccountTool account].access_token;
    param[@"count"] = @10;
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
        [self.tableView headerEndRefreshing];
        
        [self showStatusMsgBtnWith:statusFrames.count];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //停止刷新
        [self.tableView headerEndRefreshing];
    }];
}

- (void)refreshFooter:(UITableView *)tableView{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary*param = [NSMutableDictionary dictionary];
    param[@"access_token"] = [CZHAccountTool account].access_token;
    param[@"count"] = @10;
    if (self.statusesFrame.count) {
        CZHStatusFrame *statusFrame = [self.statusesFrame lastObject];
        long long maxID = [statusFrame.statues.idstr longLongValue]-1;
        param[@"max_id"] = @(maxID);
    }
    
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *statusArray = [CZHStatuses objectArrayWithKeyValuesArray:responseObject[@"statuses"] ];
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (CZHStatuses *status in statusArray) {
            
            CZHStatusFrame*statusesFrame = [[CZHStatusFrame alloc]init];
            statusesFrame.statues = status;
            
            [statusFrames addObject:statusesFrame];
        }
        //将新微博添加到微博数组尾

        [self.statusesFrame addObjectsFromArray:statusFrames];
        
        [self.tableView reloadData];
        //停止刷新
        [self.tableView footerEndRefreshing];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //停止刷新
        [self.tableView footerEndRefreshing];
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
    CGFloat btnY = 64-btnH;
    
    StatusCountBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    //动画展现微博数据量
    [UIView animateWithDuration:1 delay:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
    
        StatusCountBtn.transform = CGAffineTransformMakeTranslation(0, btnH);
   
    } completion:^(BOOL finished) {
      
        [UIView animateKeyframesWithDuration:1 delay:0.5 options:UIViewKeyframeAnimationOptionBeginFromCurrentState animations:^{
            StatusCountBtn.transform = CGAffineTransformMakeTranslation(0, -btnH);
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

/**
 *  设置首页标题
 */
- (void)setUpTitleView{
    CZHTitleBtn *titleBtn = [CZHTitleBtn titleBtn];
    
    if ([CZHAccountTool account].name) {
        [titleBtn setTitle:[CZHAccountTool account].name forState:UIControlStateNormal];
    }else{
        [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    }
    [self setUserName:titleBtn];
    
    self.navigationItem.titleView = titleBtn;
}

/**
 *  获得用户昵称
 *
 *  @param btn 用户标题按钮
 */
- (void)setUserName:(CZHTitleBtn*)btn{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    NSMutableDictionary*param = [NSMutableDictionary dictionary];
    param[@"access_token"] = [CZHAccountTool account].access_token;
    param[@"uid"] = @([CZHAccountTool account].uid);
    
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        CZHUser *user = [CZHUser objectWithKeyValues:responseObject];
        [btn setTitle:user.name forState:UIControlStateNormal];
        //保存昵称
        CZHAccount*account = [CZHAccountTool account];
        account.name = user.name;
        [CZHAccountTool saveAccount:account];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

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
