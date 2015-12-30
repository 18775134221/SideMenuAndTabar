//
//  IWTabBarViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "BYTabBarViewController.h"
#import "BYNavigationController.h"

//#import "HomeViewController.h"
//#import "ShoppingCartViewController.h"
//#import "MessageController.h"
//#import "MenuViewController.h"
//#import "PlanController.h"
//#import "MyController.h"
#import "PersonalCeterViewController.h"
#import "LoginViewController.h"

#import "HomepageViewController.h"
#import "AppDelegate.h"

#define kLoginNotificationCenter @"kLoginNotificationCenter"

@interface BYTabBarViewController () <BYTabBarDelegate>
/**
 *  自定义的tabbar
 */

// 1.菜单
@property (nonatomic, strong) UIViewController *menuVC;
// 2.首页
@property (nonatomic, strong) UIViewController *homeVC;
// 3.咨询
@property (nonatomic, strong) UIViewController *referVC;
// 3.我的
@property (nonatomic, strong) UIViewController *myVC;
@end

@implementation BYTabBarViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // UIStatusBarStyleLightContent
    return UIStatusBarStyleDefault;
}
//- (UIViewController *)childViewControllerForStatusBarStyle
//{
//    return nil;
//}

/// 是否是要隐藏状态栏(重写)
//- (UIViewController *)childViewControllerForStatusBarHidden
//{
//    return nil;
//}

// 是否隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
    
    
//    // 定时检查未读数
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(checkUnreadCount) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //监听用户是否登录通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LogionAction:)
                                                 name:kLoginNotificationCenter object:nil];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    BYTabBar *customTabBar = [[BYTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;

}


/// 图片上的角标
- (void) checkUnreadCount
{
    self.homeVC.tabBarItem.badgeValue = @"200";
    
}

/**
 *  监听加号按钮点击（最中间那个（默认是不开出来的））
 */
- (void)tabBarDidClickedPlusButton:(BYTabBar *)tabBar
{
    
    NSLog(@"我被点击了");
//    IWComposeViewController *compose = [[IWComposeViewController alloc] init];
//    IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:compose];
//    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - tabbar的代理方法
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(BYTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
    if (0 == to) { // 首页刷新
        
    }
    if(2 == to)
    {
        NSLog(@"购物车刷新");
    }
    if (3 == to) {
        //[self LogionAction:nil];
    }

}

-(void)LogionAction:(NSNotification *)notification{
    
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    //loginViewController.IsMoed = YES;
    UINavigationController *nvController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    UIImage *nvigationImage = [UIImage imageNamed:@""];
    //[Common createImageWithColor:[Common hexStringToColor:@"#ffd900"]];
        
    [nvController.navigationBar setBackgroundImage:nvigationImage forBarMetrics:UIBarMetricsDefault];
        
    [self presentViewController:nvController animated:YES completion:nil];
        

    
}
/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.首页
     HomepageViewController *homeVC = [[HomepageViewController alloc] init];
    [self setupChildViewController:homeVC title:@"首页" tabBarTitle:@"首页" imageName:@"menu_home" selectedImageName:@"menu_homefill"];
    self.homeVC = homeVC;

    // 2.消息
    UIViewController *messgeVC = [[UIViewController alloc] init];
    [self setupChildViewController:messgeVC title:@"热销" tabBarTitle:@"热销" imageName:@"menu_hot" selectedImageName:@"menu_hotfill"];
    self.homeVC = messgeVC;

    // 3.预约设计
    UIViewController *referVC = [[UIViewController alloc] init];
    [self setupChildViewController:referVC title:@"购物车" tabBarTitle:@"购物车" imageName:@"menu_cart" selectedImageName:@"menu_cartfill"];
    self.referVC = referVC;

    // 4.我的
    PersonalCeterViewController *myVC = [[PersonalCeterViewController alloc] init];
    [self setupChildViewController:myVC title:@"我的" tabBarTitle:@"我的" imageName:@"menu_my" selectedImageName:@"menu_myfill"];
    self.myVC = myVC;
    
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title tabBarTitle:(NSString *)tabBarTitle imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.navigationItem.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.title = tabBarTitle;
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];

    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    // 2.包装一个导航控制器
    BYNavigationController *nav = [[BYNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
   


}

// 直接返回首页
- (void) goHome
{
    [self.customTabBar buttonClick:[self.customTabBar.tabBarButtons objectAtIndex:3]];
}

/*
 *1.从其它页面直接返回首页self.window.rootViewController = tabar;
 **/

@end
