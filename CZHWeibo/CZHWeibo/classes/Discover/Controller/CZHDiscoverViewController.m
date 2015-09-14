//
//  CZHDiscoverViewController.m
//  CZHWeibo
//
//  Created by zweiguo on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHDiscoverViewController.h"
#import "UIBarButtonItem+CZH.h"
#import "CZHSearchBar.h"

@interface CZHDiscoverViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation CZHDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CZHSearchBar*searchBar = [CZHSearchBar searchBar];
    
    searchBar.delegate = self;
    
    searchBar.frame = CGRectMake(0, 0, 300, 30);
    
    self.navigationItem.titleView = searchBar;
    
   
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.navigationItem.titleView resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    textField.leftView.frame = CGRectMake(0, 0, 30, textField.frame.size.height);
    
    textField.leftView.contentMode = UIViewContentModeCenter;
    
    
    return YES;
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    textField.leftView.contentMode = UIViewContentModeRight;
    textField.leftView.frame = CGRectMake(0, 0, 150, textField.frame.size.height);
    
}


@end
