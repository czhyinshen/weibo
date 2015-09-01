//
//  CZHHomeViewController.m
//  CZHWeibo
//
//  Created by zweiguo on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHHomeViewController.h"

@interface CZHHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CZHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
