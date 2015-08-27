//
//  CZHViewController.m
//  CZHWeibo
//
//  Created by zweiguo on 15/8/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHTabBarController.h"
#import "UIImage+CZHCustomImg.h"
@interface CZHTabBarController ()<CZHTabBarDelegate>

@property (nonatomic,weak)CZHTabBar *customTabBar;
@end

@implementation CZHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTabBar];
    // Do any additional setup after loading the view.
    [self setUpAllChirView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)setUpTabBar{
    
    CZHTabBar*customTabBar = [[CZHTabBar alloc]init];
   
    customTabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:customTabBar];
    
    self.customTabBar = customTabBar;
    
    self.customTabBar.delegate = self;
}

- (void)setUpAllChirView{
    
    CZHHomeViewController*homeVc = [[CZHHomeViewController alloc]init];
    homeVc.tabBarItem.badgeValue = @"10999";
    [self setUpChirViewWithVC:homeVc title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
    
    
    CZHMessageViewController*msgVc = [[CZHMessageViewController alloc]init];
    [self setUpChirViewWithVC:msgVc title:@"信息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    
    CZHDiscoverViewController*dicoverVc = [[CZHDiscoverViewController alloc]init];
    [self setUpChirViewWithVC:dicoverVc title:@"广场" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    
    CZHMeViewController*meVc = [[CZHMeViewController alloc]init];
    [self setUpChirViewWithVC:meVc title:@"我" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    
}

- (void)setUpChirViewWithVC:(UIViewController*)chirVC title:(NSString*)title image:(NSString*)image selectImage:(NSString*)selectImage{
  
    chirVC.title = title;
    
    chirVC.tabBarItem.image =[UIImage imageWithName: image];
    
    chirVC.tabBarItem.selectedImage = [[UIImage imageWithName:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   
    UINavigationController*navi = [[UINavigationController alloc]initWithRootViewController:chirVC];
    
    [self addChildViewController:navi];
    
    [self.customTabBar addTabBarButtonWithItem:chirVC.tabBarItem];
    
}

- (void)TabBar:(CZHTabBar *)tabBar diselectButtonItemFrom:(NSInteger)itemIndex to:(NSInteger)newItemIndex{
    self.selectedIndex = newItemIndex;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
