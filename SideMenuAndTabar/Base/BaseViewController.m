//
//  BaseViewController.m
//  SideMenuAndTabar
//
//  Created by egood001 on 15/11/3.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import "BaseViewController.h"
#import "SlideNavigationController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self initBackLayer];
}

//初始化返回布局
- (void) initBackLayer
{
    UIView *backView = [self getBackView];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backView];
    self.navigationItem.leftBarButtonItem = backButtonItem;
}

//获取返回布局
- (UIView *) getBackView
{
    UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back:)];
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,50, 44)];
    backView.userInteractionEnabled = YES;
    backView.tag = 1;
    backView.backgroundColor = [UIColor redColor];
    [backView addGestureRecognizer:backTap];
    
    //返回
    NSString *backPathString = [[NSBundle mainBundle] pathForResource:@"back" ofType:@"png"];
    UIImage *backImage = [[UIImage alloc] initWithContentsOfFile:backPathString];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.tag = 100;
    backImageView.userInteractionEnabled = YES;
    [backImageView setFrame:CGRectMake(0, (44 - 23) / 2,23, 23)]; //0.85
    
    //backView.backgroundColor = [UIColor clearColor];
    [backView  addSubview:backImageView];
    
    return backView;
}

//返回上一级
- (void) back:(UITapGestureRecognizer *) tap
{
    if(tap.state==UIGestureRecognizerStateEnded)
    {
        [self goBack:tap];
    }
}

//返回上一级, 可供子类重写
- (void) goBack:(UITapGestureRecognizer *)tap
{
    //[[SliderView sharedSlider] closeSideBar];
    //[self clearHUD];
    [[SlideNavigationController sharedInstance] leftMenuSelected:tap.view];
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
