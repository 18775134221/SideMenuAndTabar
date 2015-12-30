//
//  AppDelegate.h
//  SideMenuAndTabar
//
//  Created by egood001 on 15/10/28.
//  Copyright (c) 2015年 hjq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BYTabBarViewController *bY;

//判断用户是否已经登录 (是否需要模态弹出)
-(BOOL)isLogin:(BOOL)isMode;

@end

