//
//  IWTabBar.h
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYTabBarButton.h"

@class BYTabBar;

@protocol BYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(BYTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
- (void)tabBarDidClickedPlusButton:(BYTabBar *)tabBar;

@end

@interface BYTabBar : UIView

/**
 *  监听按钮点击
 */
- (void)buttonClick:(BYTabBarButton *)button;
@property (nonatomic, strong) NSMutableArray *tabBarButtons;
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<BYTabBarDelegate> delegate;

@end
