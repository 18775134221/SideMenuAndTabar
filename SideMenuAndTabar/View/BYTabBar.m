//
//  IWTabBar.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "BYTabBar.h"
#import "LoginViewController.h"


// 是否需要中间特别加一个按钮
#define KmiddleButton 0

#define kLoginNotificationCenter @"kLoginNotificationCenter"

@interface BYTabBar()


@property (nonatomic, weak) UIButton *plusButton;
@property (nonatomic, weak) BYTabBarButton *selectedButton;
@end

@implementation BYTabBar
//@synthesize tabBarButtons;

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
#if KmiddleButton
        [self setupPlusButton];
#endif
        
    }
    return self;
}

/// 设置中间大按钮
- (void) setupPlusButton
{
    // 添加一个加号按钮
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"menu_home"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"menu_homefill"] forState:UIControlStateHighlighted];
    [plusButton setImage:[UIImage imageNamed:@"menu_home"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageNamed:@"menu_homefill"] forState:UIControlStateHighlighted];
    plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
    [plusButton addTarget:self action:@selector(plusButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusButton];
    self.plusButton = plusButton;
}

- (void)plusButtonClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedPlusButton:)]) {
        [self.delegate tabBarDidClickedPlusButton:self];
    }
}


- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 1.创建按钮
    BYTabBarButton *button = [[BYTabBarButton alloc] init];
    [self addSubview:button];
    // 添加按钮到数组中
    [self.tabBarButtons addObject:button];
    
    // 2.设置数据
    button.item = item;
    
    // 3.监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 4.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(BYTabBarButton *)button
{
    // 如果没有登录在这里拦截一下
    if (button.tag == 3) {
        
        NSString *content = [[NSUserDefaults standardUserDefaults]valueForKey:@"info"];
        if (content == nil) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kLoginNotificationCenter object:nil];
            // 如果没有登录，弹出登录，如果已经登录，跳转个人中心
            return;
        }

    }
    
    // 1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
#if KmiddleButton
    // 调整加号按钮的位置
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5 );
    
    // 按钮的frame数据
    CGFloat buttonH = h;
    CGFloat buttonW = w / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        // 1.取出按钮
        BYTabBarButton *button = self.tabBarButtons[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        if (index > 1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
    
#else
    // 按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    
    for (int index = 0; index<self.tabBarButtons.count; index++) {
        // 1.取出按钮
        BYTabBarButton *button = self.tabBarButtons[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
#endif
    

}
@end
