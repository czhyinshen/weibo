//
//  CZHHomeViewController.m
//  CZHWeibo
//
//  Created by zweiguo on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHHomeViewController.h"
#import "CZHTitleBtn.h"
#define titleBtnImageDownTag 0
#define titleBtnUpImageTag 1

@interface CZHHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CZHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton* lefBtn = [UIButton ButtonWithTitle:nil image:@"navigationbar_friendsearch" highlightedImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(personal)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:lefBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[UIButton ButtonWithTitle:nil image:@"navigationbar_pop" highlightedImage:@"navigationbar_pop_highlighted" target:self action:@selector(scan)]];

    CZHTitleBtn *titleBtn = [CZHTitleBtn titleBtn];
    
    titleBtn.frame = CGRectMake(0, 0, 100, 30);
    
    [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setTitle:@"dsdfas" forState:UIControlStateNormal];
    
   
    titleBtn.tag = titleBtnImageDownTag;
    [titleBtn setBackgroundImage:[UIImage resizingImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];

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

- (void)personal{

}

- (void)scan{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

static NSString*cellIdentifier = @"Cell";
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"hehe";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
