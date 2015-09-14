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
@property (nonatomic,strong)NSArray  *statusesFrame;

@end

@implementation CZHHomeViewController

-(NSArray *)statuses{
    if (!_statusesFrame) {
        _statusesFrame = [NSArray array];
    }
    return _statusesFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUPBarbuttonItem];

    [self setUpTitleView];
    
    [self updateStatusData];
    
}


- (void)setUPBarbuttonItem{

    UIBarButtonItem* lefBtn = [UIBarButtonItem ButtonWithTitle:nil image:@"navigationbar_friendsearch" highlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:nil];
    self.navigationItem.leftBarButtonItem = lefBtn;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ButtonWithTitle:nil image:@"navigationbar_pop" highlightedImage:@"navigationbar_pop_highlighted" target:self action:nil];
    
    self.tableView.backgroundColor =  [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, CZHTableViewCellBolder, 0);
    
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

/**
 *  更新微博数据
 */
- (void)updateStatusData{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary*param = [NSMutableDictionary dictionary];
    param[@"access_token"] = [CZHAccountTool account].access_token;
    
    [mgr GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *statusArray = [CZHStatuses objectArrayWithKeyValuesArray:responseObject[@"statuses"] ];
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (CZHStatuses *status in statusArray) {
            
            CZHStatusFrame*statusesFrame = [[CZHStatusFrame alloc]init];
            statusesFrame.statues = status;
            
            [statusFrames addObject:statusesFrame];
        }
        self.statusesFrame = statusFrames;

        [self.tableView reloadData];
 
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
