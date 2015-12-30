//
//  LeftMenuViewController.m
//  SideMenuAndTabar
//
//  Created by egood001 on 15/10/28.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

@interface LeftMenuViewController ()

@end

@implementation LeftMenuViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.slideOutAnimationEnabled = YES;
    
    return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 左侧菜单栏的跳转
 */
//- (void)push
//{
//    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
//                                                         withSlideOutAnimation:self.slideOutAnimationEnabled
//                                                                andCompletion:nil];
//}

@end
