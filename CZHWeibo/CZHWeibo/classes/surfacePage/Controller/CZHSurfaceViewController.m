//
//  CZHSurfaceViewController.m
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "CZHSurfaceViewController.h"
#import "CZHSurfaceScrollView.h"
#import "CZHTabBarController.h"
#import "CZHCheckBox.h"
#define CZHSurfaceViewImageViewCount 3

#define CZHColor(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface CZHSurfaceViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)CZHSurfaceScrollView *surVC;
@end

@implementation CZHSurfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpScrollView];
    
    
}

- (void)setUpScrollView{
    
    CZHSurfaceScrollView*SurSV = [CZHSurfaceScrollView initScrollViewFrame:self.view.frame];
    NSArray*names = @[@"new_feature_1",@"new_feature_2",@"new_feature_3"];
    
    [SurSV setUpImageView:names imageCount:CZHSurfaceViewImageViewCount];
    
    SurSV.delegate = self;
    
    CGRect frame = SurSV.frame;

    for (NSInteger i = 0; i < CZHSurfaceViewImageViewCount; i++) {
        
        UIImageView*imageView = [[UIImageView alloc]initWithImage:[UIImage resizingImageWithName:names[i]]];
        
        frame.origin.x = frame.size.width*i;
        
        imageView.frame = frame;
        
        [SurSV addSubview:imageView];
        
        if (i >= CZHSurfaceViewImageViewCount-1) {
            
            CZHCheckBox*btn = [CZHCheckBox checkBox];
            
            btn.center = CGPointMake(SurSV.frame.size.width/2+SurSV.frame.size.width *i , SurSV.frame.size.height*0.5);
            
            btn.bounds = (CGRect){CGPointZero,CGSizeMake(200, 50)};
            
            [btn setTitle:@"是否分享微博" forState:UIControlStateNormal];
            
            [SurSV addSubview:btn];
            
            [self setUpCheckBox:imageView];
        }
    }
    
    self.surVC = SurSV;
    
    [self.view addSubview:SurSV];
    [self addPageControlWithScrollView:SurSV];
}

/**
 *  添加pageControl
 *
 *  @param surSV
 */
- (void)addPageControlWithScrollView:(UIScrollView*)surSV{
    
    UIPageControl*pageControl = [[UIPageControl alloc]init];
    pageControl.pageIndicatorTintColor = CZHColor(189, 189, 189);
    pageControl.currentPageIndicatorTintColor = CZHColor(251,83,46);
    
    pageControl.center = CGPointMake(self.view.center.x, self.view.frame.size.height*0.95);
    pageControl.bounds = (CGRect){CGPointZero,CGSizeMake(200, 30)};
    pageControl.numberOfPages = CZHSurfaceViewImageViewCount;
    
    self.pageControl = pageControl;
    
    [self.view addSubview:pageControl];
    
}

/**
 *  设置checkBox
 *
 *  @param imageView checkBox添加到的imageView
 */
- (void)setUpCheckBox: (UIImageView*)imageView{
    
    imageView.userInteractionEnabled = YES;
    
    UIButton*btn =[[ UIButton alloc]init];
    btn.center = CGPointMake(imageView.frame.size.width/2, imageView.frame.size.height*0.6);
    btn.bounds = (CGRect){CGPointZero, CGSizeMake(200, 50)};

    [btn setTitle:@"开始微博" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:btn];
    
}

/**
 *  推出tabBar视图
 *
 *  @param btn
 */
- (void)start:(UIButton*)btn{
    
    CZHTabBarController* TBC = [[CZHTabBarController alloc]init];
    TBC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionOverrideInheritedDuration animations:^{
        
        [self presentViewController:TBC animated:YES completion:nil];
        
    } completion:nil];
    
    
    
}

/**
 *  设置pageControl随着滚动而改变
 *
 *  @param scrollView self.surVC
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    double page = (double)self.surVC.contentOffset.x/self.surVC.frame.size.width;
    self.pageControl.currentPage = (int)(page+0.5);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
