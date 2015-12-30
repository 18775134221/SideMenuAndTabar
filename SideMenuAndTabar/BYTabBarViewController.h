//
//  IWTabBarViewController.h
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYTabBar.h"
@interface BYTabBarViewController : UITabBarController
@property (nonatomic, weak) BYTabBar *customTabBar;
// 直接从其他页面返回首页
- (void) goHome;
@end
